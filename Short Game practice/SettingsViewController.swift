//
//  SettingsViewController.swift
//  Short Game practice
//
//  Created by Jason Crouse on 2/19/16.
//  Copyright © 2016 Jason Crouse. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    // Variables for passing info
    var time = Int()
    var timerRunning = Bool()
    
    var minYards = 0
    var maxYards = 1
    
    var practiceHasBegun = false
    
    // FUNCTIONALITY
    
    // Navigation
    @IBAction func done(sender: AnyObject) {
    }
    
    // Yardage Selection
    @IBOutlet weak var minYardsLabel: UILabel!
    @IBOutlet weak var maxYardsLabel: UILabel!
    @IBAction func minYardsSlider(sender: UISlider) {
        minYardsLabel.text = "\(Int(sender.value))"
        minYards = Int(sender.value)
    }
    @IBAction func maxYardsSlider(sender: UISlider) {
        maxYardsLabel.text = String(Int(sender.value))
        maxYards = Int(sender.value)
    }
    
    
    // Yardage Selection Sliders
    @IBOutlet weak var minSlider: UISlider!
    @IBOutlet weak var maxSlider: UISlider!
    
    // Lie Toggle Switches
    @IBOutlet weak var lightRough: UISwitch!
    @IBOutlet weak var deepRough: UISwitch!
    @IBOutlet weak var fairway: UISwitch!
    @IBOutlet weak var bunker: UISwitch!
    
    
    @IBAction func lightRoughSwitch(sender: UISwitch) {
        if lightRough.on == false {
            lieTypeOn["light rough"] = false
        }
    }
    @IBAction func deepRoughSwitch(sender: AnyObject) {
        if deepRough.on == false {
            lieTypeOn["deep rough"] = false
        }
    }
    @IBAction func fairwaySwitch(sender: AnyObject) {
        if fairway.on == false {
            lieTypeOn["fairway"] = false
        }
    }
    @IBAction func bunkerSwitch(sender: AnyObject) {
        if bunker.on == false {
            lieTypeOn["bunker"] = false
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        minSlider.value = Float(minYards)
        maxSlider.value = Float(maxYards)
        minYardsLabel.text = String(minYards)
        maxYardsLabel.text = String(maxYards)
        lightRough.on = lieTypeOn["light rough"]!
        deepRough.on = lieTypeOn["deep rough"]!
        fairway.on = lieTypeOn["fairway"]!
        bunker.on = lieTypeOn["bunker"]!

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/*
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
*/
  
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : RandomPracticeViewController = segue.destinationViewController as! RandomPracticeViewController
        DestViewController.min = minYards
        DestViewController.max = maxYards
        DestViewController.timerCount = time
        DestViewController.timerRunning = timerRunning
        //DestViewController.lightRoughOn = lightRoughOn
        //DestViewController.deepRoughOn = deepRoughOn
        //DestViewController.fairwayOn = fairwayOn
        //DestViewController.bunkerOn = bunkerOn
        DestViewController.practiceHasBegun = practiceHasBegun
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
