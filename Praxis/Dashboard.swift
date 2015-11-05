//
//  Dashboard.swift
//  Praxis
//
//  Created by Lauren Barker on 10/19/15.
//  Copyright © 2015 Lauren Barker. All rights reserved.
//

import UIKit
import CoreData

class Dashboard: UIViewController {
    var titleToDisplay = "No goals.\nClick 'Add Goal' to make some!"
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    @IBOutlet weak var titleView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadGoal()
        
        
        titleView.text = titleToDisplay
        print("titleToDisplay: " + titleToDisplay)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true;
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.resignFirstResponder()
        super.viewWillDisappear(animated)
        
    }
    
    // load from memory
    func loadGoal() -> Int {
        
        /* Create the fetch request first */
        let fetchRequest = NSFetchRequest(entityName: "Goal")
        
        /* And execute the fetch request on the context */
        do{
            let goals = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Goal]
            var goalCount = 0
            for goal in goals{
                goalCount += 1
                
                print("Title = \(goal.title)")
                print("Goal = \(goal.goal)")
                print("Unit = \(goal.unit)")
                print("Increment = \(goal.increment)")
                print("Interval = \(goal.interval)")
                
                titleToDisplay = goal.title + " " + String(goal.goal) + " " + goal.unit + " " + String(goal.increment) + " " + goal.interval + "\n"
                
            }
            print("Goal count = \(goalCount)")
            return goalCount
        } catch let error as NSError{
            print(error)
            return 0
        }
    }
    
    override func motionEnded(motion: UIEventSubtype,
        withEvent event: UIEvent?) {
            
            if motion == .MotionShake{
                
                //Comment: to terminate app, do not use exit(0) bc that is logged as a crash.
                
                UIControl().sendAction(Selector("suspend"), to: UIApplication.sharedApplication(), forEvent: nil)
            }
            
            
            
    }

}
