//
//  RandomPracticeViewController.swift
//  Short Game practice
//
//  Created by Jason Crouse on 2/15/16.
//  Copyright © 2016 Jason Crouse. All rights reserved.
//
import AVFoundation
import UIKit
import MediaPlayer

class RandomPracticeViewController: UIViewController, AVAudioPlayerDelegate {
    
    // MARK: - Variables
    
    // Speech
    let speechSynthesizer = AVSpeechSynthesizer()
    
    // Remote Control
    var testPlayer: AVAudioPlayer? = nil
    
    // Timer
    var timerCount = totalTime * 8 / 10
    var timerRunning = false
    var timer = NSTimer()
    var practiceHasBegun = Bool()
    
    @IBOutlet var countDownLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    
    // MARK: - Methods and Functions
    
    // Timer
    
    func counting() {
        timerCount -= 1
        let minutes = timerCount / 60
        let seconds = timerCount % 60
        if seconds < 10 {
            countDownLabel.text = String(minutes) + ":" + "0" + String(seconds)
        } else {
            countDownLabel.text = String(minutes) + ":" + String(seconds)
        }
    }
    
    // Remote Control
    
    func loadSound(filename: NSString) -> AVAudioPlayer {
        let url = NSBundle.mainBundle().URLForResource(filename as String, withExtension: "caf")
        var error: NSError? = nil
        let player = AVAudioPlayer(contentsOfURL: url!)
        if error != nil {
            print("Error loading \(url): \(error?.localizedDescription)")
        } else {
            player.prepareToPlay()
        }
        return player
    }
    
    
    
    @IBAction func startButton(sender: AnyObject) {
        
        if timerRunning == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "counting", userInfo: nil, repeats: true)
            timerRunning = true
            timerButton.setTitle("Pause", forState: .Normal)
        } else {
            timerRunning = false
            timerButton.setTitle("Resume", forState: .Normal)
            timer.invalidate()
        }
        practiceHasBegun = true
        
    }
   
    // Generate Shots
    
    var min = 0
    var max = 1
    
    @IBOutlet weak var yardsLabel: UILabel!
    @IBOutlet weak var lieTypeLabel: UILabel!
    
    
    @IBAction func generateButton(sender: AnyObject) {
        let numYards = Int(arc4random_uniform((UInt32(max) - UInt32(min)) + 1)) + min
        yardsLabel.text = String(numYards)
        var randomLie = arc4random_uniform(4)
        
        // MY APP WILL CRASH IF SOME FUCKING IDIOT TURNS OFF ALL THE LIES
        
        while lieTypeOn[String(lieTypes[Int(randomLie)])] == false {
            randomLie = arc4random_uniform(4)
        }
        
        lieTypeLabel.text = lieTypes[Int(randomLie)]
        
        // Attempt to do audio shit
        
        let speechUtterance = AVSpeechUtterance(string: String(numYards) + "yards, from the " + lieTypes[Int(randomLie)])
        
        speechSynthesizer.speakUtterance(speechUtterance)
        
    }
    
    
    // Transition from Settings Page
    @IBAction func unwindToRandomPractice(unwindSeugue: UIStoryboardSegue) {
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let minutes = timerCount / 60
        let seconds = timerCount % 60
        if seconds < 10 {
            countDownLabel.text = String(minutes) + ":" + "0" + String(seconds)
        } else {
            countDownLabel.text = String(minutes) + ":" + String(seconds)
        }
        
        if timerRunning == true {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "counting", userInfo: nil, repeats: true)
            timerButton.setTitle("Pause", forState: .Normal)
        } else {
            timerButton.setTitle("Resume", forState: .Normal)
            timer.invalidate()
            
        }
        
        if practiceHasBegun == false {
            timerButton.setTitle("Begin Practice", forState: .Normal)
        }
        // Headphones
        self.testPlayer
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let DestViewController : SettingsViewController = segue.destinationViewController as? SettingsViewController {
            DestViewController.minYards = min
            DestViewController.maxYards = max
            DestViewController.time = timerCount
            DestViewController.timerRunning = timerRunning
            DestViewController.practiceHasBegun = practiceHasBegun
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}








