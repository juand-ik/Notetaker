//
//  NoteTakerViewController.swift
//  NoteTaker
//
//  Created by Juan de Dios Torres on 11/05/16.
//  Copyright © 2016 Juan de Dios Torres. All rights reserved.
//

import UIKit
import AVFoundation

class NoteTakerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!
 
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        cell.textLabel!.text = "xD"
        return cell
    }
    
    
    // A function that grabs any audio file path and creates the audio player
    
    func getAudioPlayerFile(file: String, type: String) -> AVAudioPlayer
    {
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        var audioPlayer:AVAudioPlayer?
        
        do
        {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        }
        catch let audioPlayerError as NSError
        {
            print("Failed to initialize player error: \(audioPlayerError.localizedDescription)")
        }
        return audioPlayer!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        audioPlayer = getAudioPlayerFile("startRecordSound", type: "m4a")
        audioPlayer.play()
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}

