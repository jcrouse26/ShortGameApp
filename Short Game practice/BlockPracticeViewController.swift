//
//  BlockPracticeViewController.swift
//  Short Game practice
//
//  Created by Jason Crouse on 2/15/16.
//  Copyright © 2016 Jason Crouse. All rights reserved.
//

import UIKit

class BlockPracticeViewController: UIViewController {

    //var timerCount = totalTime / 10
    var timerRunning = false
    var timer = NSTimer()
    var practiceHasBegun = false
    
    @IBOutlet var countDownLabel: UILabel!
    
    func counting() {
        timerCount -= 1
        if timerCount % 60 < 10 {
            countDownLabel.text = String(timerCount / 60) + ":0" + String(timerCount % 60)
        } else {
            countDownLabel.text = String(timerCount / 60) + ":" + String(timerCount % 60)
        }
    }
    @IBOutlet weak var timerButton: UIButton!
    
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if practiceHasBegun == false {
            timerButton.setTitle("Begin", forState: .Normal)
        }
        if timerCount % 60 < 10 {
            countDownLabel.text = String(timerCount / 60) + ":0" + String(timerCount % 60)
        } else {
            countDownLabel.text = String(timerCount / 60) + ":" + String(timerCount % 60)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
