//
//  Dashboard.swift
//  Praxis
//
//  Created by Lauren Barker on 10/19/15.
//  Copyright © 2015 Lauren Barker. All rights reserved.
//

import UIKit

class Dashboard: UIViewController {
    var titleToDisplay = "No goals.\nClick 'Add Goal' to make some!"
    
    @IBOutlet weak var titleView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleView.text = titleToDisplay
        print("titleToDisplay: " + titleToDisplay)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
