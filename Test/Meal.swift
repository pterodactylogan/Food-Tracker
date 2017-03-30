//
//  Meal.swift
//  Test
//
//  Created by Logan Swanson on 3/28/17.
//  Copyright © 2017 Logan Swanson. All rights reserved.
//

import UIKit

class Meal{
    
    //MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int){
        //initialization should fail if there is no name or the rating is negative
        if name.isEmpty || rating<0{
            return nil
        }
        //initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
}
