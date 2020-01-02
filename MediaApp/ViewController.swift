//
//  ViewController.swift
//  MediaApp
//
//  Created by R Shantha Kumar on 11/28/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
      var imageString:[String]!
    
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var contentView: UIView!
    
    var button:UIButton!
    var movieName:UILabel!
    var allArray = [UIButton()]
     var allmovies = [UILabel()]
   
  
    var serverData = [Movie]()
    
    var urlRequestObj:URLRequest!
    var dataTaskObj:URLSessionDataTask!
    
    var image1String:String!
    
    var audioSongs:AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    
    
 
    @IBAction func loadData(_ sender: UIButton) {
      
//    REMOVING EXITANCE  DETAILS
        
        for y in allArray{
           
                y.removeFromSuperview()
            
        }
        
        for v in allmovies{
            
            v.removeFromSuperview()
            
        }
        
        
        
        SingletonFormsData.shared.images = [UIImage]()
        SingletonFormsData.shared.story = [String]()
        SingletonFormsData.shared.songs = [[String]]()
        SingletonFormsData.shared.songTitle = [[String]]()
        
        
      serverData = mediaData()
    
//   LOOP FOR WHOLE DATA
        
      for v in 0...serverData.count-1{
      
            stackView.spacing = 20
        
             imageString = serverData[v].posters!
            let string1 = imageString.joined(separator: "")
            var strig2 = "https://www.brninfotech.com/tws/ "
            image1String = "%20"
            let newString = strig2.replacingOccurrences(of: " ", with: string1, options: .literal, range: nil)
            let newString2 = newString.replacingOccurrences(of: " ", with: image1String, options: .literal, range: nil)
    
             let url  = URL(string: newString2)
             let data = try! Data(contentsOf: url!)
            
            
        let image = UIImage(data: data)
        
        
//        POSTERS
        
        button = UIButton()
        button.setBackgroundImage(image,for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 200).isActive = true
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
        button.tag = v
        stackView.addArrangedSubview(button)
        SingletonFormsData.shared.images.append(image!)
    
        let stories = serverData[v].story ?? "DATA NOT AVAILABLE"
        SingletonFormsData.shared.story.append(stories)
        allArray.append(button)
        button.addTarget(self, action: #selector(media), for: UIControl.Event.touchUpInside)
        
       
      //movie nameS
                    
        movieName = UILabel()
        movieName.frame = CGRect(x: 5, y: 150, width: 355, height: 40)
        allmovies.append(movieName)
        movieName.text = serverData[v].title
        stackView.addArrangedSubview(movieName)
        
         
        
        // song names
        var songName = serverData[v].songs ?? ["DATA NOT AVAILABLE"]
        var names = [String]()
        SingletonFormsData.shared.songsNames.append(songName)
    
        
      //video data
        
        let video = serverData[v].trailers as!  [String]
        
        var videoclub:String!
        var trialer:String!
    
        
        for v in video{
         videoclub = strig2.replacingOccurrences(of: " ", with: v)
            let v = "%20"
            
           trialer = videoclub.replacingOccurrences(of: " ", with: v)
          
            
        }
       
        SingletonFormsData.shared.videoData.append(trialer)
        
//        actors
        
        //let actor = serverData[v].actors
        
        
        SingletonFormsData.shared.actors.append(serverData[v].actors!)
        
        
       
        
        
      //audio
        
    
        let audio = serverData[v].songs ?? ["DATA NOT AVAILABLE"]
        
        
       
        
        let strig6 = "https://www.brninfotech.com/tws/"
        
        var allSongsUrlInString = [String]()
        
       
        names = [String]()
        
        
       
        
        
        for x in audio
        {
             if (x.count != 0){
                let replace = "%20"
            let ith = " "
    
            let urlData = x.replacingOccurrences(of: ith, with: replace)
            
            allSongsUrlInString.append(strig6 + urlData)
            
            
            if let index =  (x.range(of: "-")?.upperBound)
                    {
                        names.append(String(x.suffix(from: index)))
                        
                    }
            
        
        }
        }
        
        SingletonFormsData.shared.songTitle.append(names)
    
        
        //TOTAL AUDIOSONG DATA APPENDING TO SINGLETON CLASS
        
        
        
        SingletonFormsData.shared.songs.append(allSongsUrlInString)
      
        
     
        }
        
        
        }
    

    
  //EVENT OF POSTER DATA
  
    @objc func media(obj:UIButton){
        
        
             let target = storyboard?.instantiateViewController(withIdentifier: "svc") as! SeocndViewController
      
        
        target.datas = serverData
        
             SingletonFormsData.shared.selectedButton = obj.tag
    
            present(target, animated: true, completion: nil)
     
        }
        
        
//MEDIA DATA GETTING FROM SERVER
    
func mediaData() -> [Movie]
{
   var convewrtedData:[Movie]?
    
   let url = "https://www.brninfotech.com/tws/MovieDetails2.php?mediaType=movies"
    
    urlRequestObj = URLRequest(url: URL(string: url)!)
    
    urlRequestObj?.httpMethod = "GET"
    
    let dataTask = URLSession.shared.dataTask(with: urlRequestObj!) { (data, connectionDetails, error) in
        
        
        
        do{
            let decoder = JSONDecoder()
            
        
             convewrtedData = try! decoder.decode([Movie].self, from: data!)
            
            print(convewrtedData?[0].actors as Any)
            
            
            
        }catch{
            
            print("error")
        }
     
    }
    dataTask.resume()
    
    while convewrtedData == nil {
        
    }
    return convewrtedData!
    

    
    
//   /SERVER DATA SAVING IN SINGLETON CLASS
    
    
    
    
}
    
    
    

    
    
    
}









