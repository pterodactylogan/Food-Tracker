//
//  TestTests.swift
//  TestTests
//
//  Created by Logan Swanson on 3/8/17.
//  Copyright © 2017 Logan Swanson. All rights reserved.
//

import XCTest
@testable import Test

class TestTests: XCTestCase {
    //MARK: meal class tests
    
    //confirm the meal initializer returns a meal object when passed valid parameters
    func testMealInitializationSucceeds(){
        //zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        //highest positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    //confirm that the meal initializer returns nil when passed a negative rating
    func testMealInitializationFails(){
        //negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        //rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large", photo:nil, rating:6)
        XCTAssertNil(largeRatingMeal)
        
        //empty string
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
    }
    
}
