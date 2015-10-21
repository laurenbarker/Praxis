//
//  ViewController.swift
//  Praxis
//
//  Created by Lauren Barker on 10/19/15.
//  Copyright © 2015 Lauren Barker. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UIScrollViewDelegate {

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
        let leftConstraint = NSLayoutConstraint(item:self.contentView,
            attribute: NSLayoutAttribute.Leading,
            relatedBy:NSLayoutRelation.init(rawValue: 0)!,
            toItem:self.view,
            attribute: NSLayoutAttribute.Leading,
            multiplier:1.0,
            constant:0
        );
        
        self.view.addConstraint(leftConstraint);
//
//        let rightConstraint = NSLayoutConstraint(item:self.contentView,
//            attribute:NSLayoutAttribute.Trailing,
//            relatedBy:NSLayoutRelation.init(rawValue: 0)!,
//            toItem:self.view,
//            attribute: NSLayoutAttribute.Trailing,
//            multiplier:1.0,
//            constant:0
//        );
//        
//        self.view.addConstraint(rightConstraint);
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showTitleSegue") {
            if let svc = segue.destinationViewController as? Dashboard {
                svc.titleToDisplay = titleField.text!
                
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    @IBAction func addGoalAction(sender: UIButton) {
        // Creating a mutable object to add to the goal
        let goal = Goal()
        
        goal.EXTRA_TITLE = titleField.text!
        goal.GOAL_TEXT = goalField.text!
        goal.EXTRA_UNIT = unitField.text!
        goal.EXTRA_INCREMENT = (incrementField.text! as NSString).doubleValue
        goal.EXTRA_INTERVAL = intervalField.text!
        
        
        // Saving the newly created goal
//        let store = CNContactStore()
//        let saveRequest = CNSaveRequest()
//        saveRequest.addContact(goal, toContainerWithIdentifier:nil)
//        try! store.executeSaveRequest(saveRequest)
        
        
        
    }


}

