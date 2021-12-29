//
//  Dish+CoreDataProperties.swift
//  groceryApp
//
//  Created by mac on 26/12/2021.
//  Copyright © 2021 Thomas Shamoian. All rights reserved.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var name: String?
    @NSManaged public var picture: String?
    @NSManaged public var duration: Double
    @NSManaged public var ingredients: String?

}
