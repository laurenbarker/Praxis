//
//  Goal.swift
//  Praxis
//
//  Created by Lauren Barker on 10/20/15.
//  Copyright © 2015 Lauren Barker. All rights reserved.
//

import Foundation

class Goal {
    var EXTRA_TITLE: String = "";
    var EXTRA_GOAL: Double = 0.0;
    var EXTRA_UNIT: String = "";
    var EXTRA_INCREMENT: Double = 0.0;
    var EXTRA_INTERVAL: String = "";
    var GOAL_TEXT: String = "";
    var EXTRA_CURRENT: Double = 0.0;
    var DESCRIPTION: String = "";
    
    //CONSTRUCTORS
    init(){
        self.EXTRA_TITLE = "";
        self.EXTRA_GOAL = 0.0;
        self.EXTRA_UNIT = "";
        self.EXTRA_INCREMENT = 0.0;
        self.EXTRA_INTERVAL = "";
        self.EXTRA_CURRENT = 0.0;
        self.DESCRIPTION = "";
        self.GOAL_TEXT = "";
    
    }
    
    init(EXTRA_TITLE: String, EXTRA_GOAL: Double, EXTRA_UNIT: String, EXTRA_INCREMENT: Double, EXTRA_INTERVAL: String){
        self.EXTRA_TITLE = EXTRA_TITLE;
        self.EXTRA_GOAL = EXTRA_GOAL;
        self.EXTRA_UNIT = EXTRA_UNIT;
        self.EXTRA_INCREMENT = EXTRA_INCREMENT;
        self.EXTRA_INTERVAL = EXTRA_INTERVAL;
        self.EXTRA_CURRENT = 0.0;
        self.DESCRIPTION = "";
        self.GOAL_TEXT = "";
    }
    
}
