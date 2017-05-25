//
//  SecondViewController.swift
//  My Music Player
//
//  Created by Patricia on 5/19/17.
//  Copyright © 2017 Patricia Figueroa. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    @IBOutlet weak var LABEL: UILabel!          // song title
    @IBOutlet weak var MyImage: UIImageView!    // album cover
    
    @IBAction func play(_ sender: Any)           //play button
    {
        if audioPlayer.isPlaying == false
        {
            audioPlayer.play()
        }
    }
    
    @IBAction func pause(_ sender: Any)    //pause button
    {
        if audioPlayer.isPlaying
        {
        audioPlayer.pause()
        }
    }
    
    @IBAction func prev(_ sender: Any)     // prev button, need to know what song is playing from the array 
    {
    }
    @IBAction func next(_ sender: Any)   // next button
    {
        PlayThis(thisOne: songs[SongPlaying+1])
    }
    
    @IBAction func slider(_ sender: UISlider)   // slider to adjust the volume 
    {
        
        audioPlayer.volume = sender.value 
    }
    
    func PlayThis (thisOne:String)
    {
        do
        {
            // find path to song by using the song name
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".m4a")
            // want the name that the user taps on to display on the cells
            // access it by checking against the array
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)   // want the content of the audio path to take the content and put it in the audio player
            audioPlayer.play()
            
        }
        catch
        {
            print("ERROR!")
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

