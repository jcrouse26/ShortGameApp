//
//  ViewController.swift
//  Short Game practice
//
//  Created by Jason Crouse on 2/14/16.
//  Copyright © 2016 Jason Crouse. All rights reserved.
//

import UIKit
var totalTime = 45 * 60

class ViewController: UIViewController {
    
    @IBOutlet weak var totalPracticeTime: UILabel!
    
    @IBAction func timeStepper(sender: UIStepper) {
        totalPracticeTime.text = String(Int(sender.value))
        totalTime = Int(sender.value) * 60
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : BlockPracticeViewController = segue.destinationViewController as! BlockPracticeViewController
        DestViewController.timerCount = totalTime / 10
        
    }

}

