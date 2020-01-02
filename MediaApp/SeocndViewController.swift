//
//  SeocndViewController.swift
//  MediaApp
//
//  Created by R Shantha Kumar on 11/28/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class SeocndViewController: UIViewController {
    
    

    var posterView:UIImageView!
    var storyView:UITextView!
    var songLbl:UILabel!
    var audioSongs:AVPlayer = AVPlayer()
    var trailers:AVPlayerViewController!
    var allButton = [UIButton]()
    var allvideo = [UIButton]()
    
    
    
    var datas = [Movie]()
    
    @IBOutlet weak var stackView2: UIStackView!
    
    @IBOutlet weak var stackView3: UIStackView!
    
    @IBOutlet weak var stackView4: UIStackView!
    
    @IBOutlet weak var stackView5: UIStackView!
    
//    GOING PREVIOUS SCREEN
    
   @IBAction func back(_ sender: UIButton)
   {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
       data()
       
    }
    
   
    
    
    
    
 var allmovies = [UILabel()]
    
    
//DISPLAYING DATA IN VIEW
    
    
    func data(){
        
        
        SingletonFormsData.shared.movieName = [String]()
        
        
        
        stackView2.spacing = 30
        
        
    var movieName:String!
    var actorName:String!
      
        for v in 0...datas.count-1{
            
            
            
            movieName = datas[v].title as! String
            SingletonFormsData.shared.movieName.append(movieName)
        }
        
    
        
        
        var movieNam = UILabel()
        movieNam.translatesAutoresizingMaskIntoConstraints = false
        movieNam.heightAnchor.constraint(equalToConstant: 80).isActive = true
        movieNam.textAlignment = .center
        movieNam.text = SingletonFormsData.shared.movieName[SingletonFormsData.shared.selectedButton!] as! String
        stackView2.addArrangedSubview(movieNam)
       
        
        
     
        posterView = UIImageView()
        posterView.translatesAutoresizingMaskIntoConstraints = false
        posterView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        posterView.image = SingletonFormsData.shared.images[SingletonFormsData.shared.selectedButton!]
        stackView2.addArrangedSubview(posterView)
        
        var story = UILabel()
        story.translatesAutoresizingMaskIntoConstraints = false
        story.heightAnchor.constraint(equalToConstant: 40).isActive = true
        story.text = "story"
        stackView2.addArrangedSubview(story)
        
        
        storyView = UITextView()
        storyView.text! = SingletonFormsData.shared.story[SingletonFormsData.shared.selectedButton!]
       storyView.translatesAutoresizingMaskIntoConstraints = false
        storyView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        storyView.backgroundColor = UIColor.clear
        storyView.isEditable = false
        stackView2.addArrangedSubview(storyView)
        
         var actor = UILabel()
         actor.translatesAutoresizingMaskIntoConstraints = false
         actor.heightAnchor.constraint(equalToConstant: 50).isActive = true
         actor.text = "actors"
         stackView2.addArrangedSubview(actor)
        
        
        
        
        
        for x in SingletonFormsData.shared.actors[SingletonFormsData.shared.selectedButton!]
        {
            
           
            
            let label = UILabel()
            label.text = ""
            label.textAlignment = .center
            stackView2.addArrangedSubview(label)
            label.text =  x + "\n"
        }
        
        
        
//        for x in 0...SingletonFormsData.shared.actors[SingletonFormsData.shared.selectedButton!].count-1
//            {
//
//                var actorName = UILabel()
//                              actorName.translatesAutoresizingMaskIntoConstraints = false
//                              actorName.heightAnchor.constraint(equalToConstant: 50).isActive = true
//                              actorName.textAlignment = .center
//                       actorName.text = SingletonFormsData.shared.actors[SingletonFormsData.shared.selectedButton!] as! String
//                               stackView2.addArrangedSubview(actorName)
//
//            }
        
        
        
        
        
        
        
       
        
       
//      let audioSongsd = try!AVAudioPlayer(contentsOf:URL(string:SingletonFormsData.shared.songss[SingletonFormsData.shared.selectedButton!] as?       String ?? "rtyrtyrtyr")!)
//       audioSongs = AVPlayer(url: URL())
        
        var trailer = UILabel()
        trailer.translatesAutoresizingMaskIntoConstraints = false
        trailer.heightAnchor.constraint(equalToConstant: 40).isActive = true
        trailer.text = "trailer"
        stackView2.addArrangedSubview(trailer)
        
        let videoButton = UIButton()
        videoButton.addTarget(self, action: #selector(videoButton(button:)), for: UIControl.Event.touchUpInside)
        videoButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        videoButton.setBackgroundImage(SingletonFormsData.shared.images[SingletonFormsData.shared.selectedButton!],for: UIControl.State.normal)
        videoButton.backgroundColor = .blue
        videoButton.setTitle("play", for: UIControl.State.normal)
        
        stackView2.addArrangedSubview(videoButton)
        
        var song = UILabel()
                      song.translatesAutoresizingMaskIntoConstraints = false
                      song.heightAnchor.constraint(equalToConstant: 40).isActive = true
                      song.text = "songs"
                      stackView2.addArrangedSubview(song)
        
       
        
//        LOOPS FOR INVINDUAL SONGS
        
        stackView4.spacing = 30
        stackView3.spacing = 30
        
       
        
        
        if SingletonFormsData.shared.songs[SingletonFormsData.shared.selectedButton!].count != 0{
        
        for x in 0...SingletonFormsData.shared.songs[SingletonFormsData.shared.selectedButton!].count-1
        {
        
            let button = UIButton()
            
            button.addTarget(self, action: #selector(playAndPause(button:)), for: UIControl.Event.touchUpInside)
            button.backgroundColor = .red
            button.setImage(UIImage(named: "play.png"), for: UIControl.State.normal)
            button.tag = x
            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
            button.setTitle("PLAY", for: UIControl.State.normal)
            
            allButton.append(button)
    
            
            stackView4.addArrangedSubview(button)
            
        }
        }
        
        for x in SingletonFormsData.shared.songTitle[SingletonFormsData.shared.selectedButton!]
            {
                
                
                
            
                let buttond = UILabel()
                buttond.text = ""
                
                buttond.heightAnchor.constraint(equalToConstant: 50).isActive = true
                buttond.text =   "\(x)"
                stackView3.addArrangedSubview(buttond)
        
            }
            
        print(SingletonFormsData.shared.songTitle[SingletonFormsData.shared.selectedButton!])
        
        
        
        
        
        
        
        
        
        

    } 
    
//    EVENT FOR VIDEO BUTTON
    
    
    @objc func videoButton(button:UIButton){
        
        let video:AVPlayer!
        
        video = AVPlayer(url: URL(string: SingletonFormsData.shared.videoData[SingletonFormsData.shared.selectedButton!])!)
        
        let videoPlayer = AVPlayerViewController()

        videoPlayer.player = video
        
        video.play()
        
        present(videoPlayer, animated: true) {
            
        }

    }
    
    
    
    
    
//    EVENT FOR AUDIO BUTTON
    
    @objc func playAndPause(button:UIButton)
        
    {
        var audio:AVPlayer!
        
        SingletonFormsData.shared.buttonTapped = button.tag
        
       let audiod =       SingletonFormsData.shared.songs[SingletonFormsData.shared.selectedButton!][SingletonFormsData.shared.buttonTapped!]
        
        
        print(audiod)
        
        var vieplayer = AVPlayerViewController()
        
        
        let data = AVPlayer(url: URL(string: audiod)!)
        
        
            
                vieplayer.player = data
        
                 data.play()
        
        

        
        
    }


}
