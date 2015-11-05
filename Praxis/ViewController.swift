//
//  ViewController.swift
//  Praxis
//
//  Created by Lauren Barker on 10/19/15.
//  Copyright © 2015 Lauren Barker. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class ViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    @IBOutlet weak var foreground: UIScrollView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var goalField: UITextField!
    @IBOutlet weak var unitField: UITextField!
    @IBOutlet weak var incrementField: UITextField!
    @IBOutlet weak var intervalField: UITextField!
    @IBOutlet weak var contentView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        foreground.delegate = self
        
        self.titleField.delegate = self
        self.goalField.delegate = self
        self.unitField.delegate = self
        self.incrementField.delegate = self
        self.intervalField.delegate = self
        
        
        let widthConstraint = NSLayoutConstraint(item:self.contentView,
            attribute: NSLayoutAttribute.Width,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self.view,
            attribute: NSLayoutAttribute.Width,
            multiplier:1.0,
            constant:0
        );
        
        self.view.addConstraint(widthConstraint);
        
        let leftConstraint = NSLayoutConstraint(item:self.contentView,
            attribute: NSLayoutAttribute.Left,
            relatedBy:NSLayoutRelation.init(rawValue: 0)!,
            toItem:self.view,
            attribute: NSLayoutAttribute.Left,
            multiplier:1.0,
            constant:0
        );
        
        self.view.addConstraint(leftConstraint);

        let rightConstraint = NSLayoutConstraint(item:self.contentView,
            attribute:NSLayoutAttribute.Right,
            relatedBy:NSLayoutRelation.init(rawValue: 0)!,
            toItem:self.view,
            attribute: NSLayoutAttribute.Right,
            multiplier:1.0,
            constant:0
        );
        
        self.view.addConstraint(rightConstraint);
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showTitleSegue") {
            
            createNewGoalWithTitle(titleField.text!, goal: Double(goalField.text!)!, unit: unitField.text!, increment: Double(incrementField.text!)!, interval: intervalField.text!)
            
            if let svc = segue.destinationViewController as? GoalTableViewController {
                //svc.titleToDisplay = titleField.text!
                
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    
    func createNewGoalWithTitle(title: String,
        goal :Double,
        unit: String,
        increment: Double,
        interval: String) -> Bool{
            
            let newGoal =
            NSEntityDescription.insertNewObjectForEntityForName("Goal",
                inManagedObjectContext: managedObjectContext) as! Praxis.Goal
            
            (newGoal.title, newGoal.goal, newGoal.unit, newGoal.increment, newGoal.interval) =
                (title, goal, unit, increment, interval)
            
            do{
                try managedObjectContext.save()
            } catch let error as NSError{
                print("Failed to save the new goal. Error = \(error)")
            }
            print("Saved")
            
            return false
            
    }
    
    @IBAction func addGoalAction(sender: AnyObject!) {
        
        createNewGoalWithTitle(titleField.text!, goal: Double(goalField.text!)!, unit: unitField.text!, increment: Double(incrementField.text!)!, interval: intervalField.text!)
        
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
    
    override func motionEnded(motion: UIEventSubtype,
        withEvent event: UIEvent?) {
            
            if motion == .MotionShake{
                
                ////  Comment: used code below to test shake-motion event.
                //                let controller = UIAlertController(title: "Shake",
                //                    message: "The device is shaken",
                //                    preferredStyle: .Alert)
                //
                //                controller.addAction(UIAlertAction(title: "OK",
                //                    style: .Default,
                //                    handler: nil))
                //
                //                presentViewController(controller, animated: true, completion: nil)
                //
                //            }
                
                
                //Comment: to terminate app, do not use exit(0) bc that is logged as a crash.
                UIControl().sendAction(Selector("suspend"), to: UIApplication.sharedApplication(),
                    forEvent: nil)
            }
    }

}

