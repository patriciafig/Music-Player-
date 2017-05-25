//
//  SecondViewController.swift
//  My Music Player
//
//  Created by Patricia on 5/19/17.
//  Copyright © 2017 Patricia Figueroa. All rights reserved.
//

import UIKit

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
    }
    
    @IBAction func slider(_ sender: UISlider)   // slider to adjust the volume 
    {
        
        audioPlayer.volume = sender.value 
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

