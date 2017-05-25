//
//  FirstViewController.swift
//  My Music Player
//
//  Created by Patricia on 5/19/17.
//  Copyright © 2017 Patricia Figueroa. All rights reserved.
//

import UIKit
import AVFoundation    // TO WORK WITH AUDIO

// global array to save songs 

var songs:[String] = []
var audioPlayer = AVAudioPlayer()  // to access audio
var SongPlaying = 0


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return songs.count
    }                                                       //creating cells
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell (style: .default, reuseIdentifier: "cell")   // identifier name in main storyboard 
        cell.textLabel?.text = songs [indexPath.row]
        
        return cell
    }
    
   //need to recognize when the user taps on a certain cell 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        do
        {
        // find path to song by using the song name 
            let audioPath = Bundle.main.path(forResource: songs[indexPath.row], ofType: ".m4a")
            // want the name that the user taps on to display on the cells
            // access it by checking against the array
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)   // want the content of the audio path to take the content and put it in the audio player
            audioPlayer.play()
            SongPlaying = indexPath.row    // keeps track of the song that is playing, necessary for PREV button
        }
        catch
        {
            print("ERROR!")
        }
    }
 

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //call function to get the song name 
        GetSongName()
    }
    override func didReceiveMemoryWarning()
        // load song names in a table view 
    
    {
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
                    let findString = mySong.components(separatedBy: "/")   // get array filled with "/" to get location of the songs
                    mySong = findString[findString.count-1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".m4a", with: "")
                   // print (mySong)
                    songs.append(mySong)
                }
           }
            
            myTableView.reloadData()
        }
        
        catch
        {
        
        }
        
        
    }
    
    
    
}

