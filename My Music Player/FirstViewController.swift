//
//  FirstViewController.swift
//  My Music Player
//
//  Created by Patricia on 5/19/17.
//  Copyright © 2017 Patricia Figueroa. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //call function
        GetSongName()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // instead of making an array with all the songs we want to be able to have the application search for a song and display it in the table view, for this I created a function
    
    func GetSongName()   //get the song name from the folder
    {
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        // loop through all of the items in the songs folder having the URL to the directory
        do
            // access the files under the URL and store it in a constant
        {
            let songPath =  try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for song in songPath
            {
                var mySong = song .absoluteString   // loops through a song 
                if mySong.contains(".m4a")
                {
                print (mySong)
                
                }
            }
        }
        
        catch
        {
        
        }
        
        
    }
    
    
    
}

