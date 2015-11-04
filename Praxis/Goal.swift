//
//  Goal.swift
//  Praxis
//
//  Created by Lauren Barker on 10/20/15.
//  Copyright © 2015 Lauren Barker. All rights reserved.
//

import Foundation
import CoreData

@objc(Goal)
class Goal: NSManagedObject {
    
    @NSManaged var title: String;
    @NSManaged var goal: NSNumber;
    @NSManaged var unit: String;
    @NSManaged var increment: NSNumber;
    @NSManaged var interval: String;
    
}
