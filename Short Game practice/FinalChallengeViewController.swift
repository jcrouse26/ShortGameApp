//
//  FinalChallengeViewController.swift
//  Short Game practice
//
//  Created by Jason Crouse on 2/25/16.
//  Copyright © 2016 Jason Crouse. All rights reserved.
//

import UIKit

class FinalChallengeViewController: UIViewController {
    
    

    @IBOutlet weak var attemptsLabel: UILabel!
    
    @IBAction func attemptsStepper(sender: UIStepper) {
        attemptsLabel.text = String(Int(sender.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
