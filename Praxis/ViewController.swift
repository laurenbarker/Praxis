//
//  ViewController.swift
//  Praxis
//
//  Created by Lauren Barker on 10/19/15.
//  Copyright © 2015 Lauren Barker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var goalField: UITextField!
    @IBOutlet weak var unitField: UITextField!
    @IBOutlet weak var incrementField: UITextField!
    @IBOutlet weak var intervalField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showNameSegue") {
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

