//
//  GoalTableViewController.swift
//  Praxis
//
//  Created by Lauren Barker on 11/4/15.
//  Copyright © 2015 Lauren Barker. All rights reserved.
//

import UIKit
import CoreData

class GoalTableViewController: UITableViewController{
    @IBOutlet weak var goalTableView: UITableView!
    
    var goalArray = [Goal]()
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(GoalTableViewCell.self, forCellReuseIdentifier: "GoalTableViewCell")
        
        loadGoal()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalArray.count
    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cellIdentifier = "GoalTableViewCell"
//        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! GoalTableViewCell
//        
//        let goal = goalArray[indexPath.row]
//        
//        print("Loading goals...")
//        let stupid = goal.valueForKey("title")
//        print(stupid as! String)
//        
//        if let unwrappedTitle = goal.valueForKey("title") {
//            if let test = cell.titleDisplay {
//                
//                test.text = unwrappedTitle as? String
//            }
//        } else {
//            print("Unwrapping failed")
//        }
    
//        if let unwrappedGoal = goal.valueForKey("goal") as AnyObject? as? String {
//            if let test = cell.goalDisplay {
//                test.text = unwrappedGoal
//            }
//        } else {
//            print("Unwrapping failed")
//        }
        
//        if let unwrappedUnit = goal.valueForKey("unit") {
//            cell.unitDisplay.text = unwrappedUnit as! String
//        } else {
//            print("Unwrapping failed")
//        }
//        print(cell.titleDisplay)

//        return cell
//    }

    // load from memory
    func loadGoal() {
        
        /* Create the fetch request first */
        let fetchRequest = NSFetchRequest(entityName: "Goal")
        
        /* And execute the fetch request on the context */
        do{
            let goals = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Goal]
            var goalCount = 0

            for goal in goals{
                goalCount += 1
                goalArray.append(goal);
                
            }
            print("Goal count = \(goalCount)")
            print(goalArray[0])

        } catch let error as NSError{
            print(error)
        }
    }

}
