//
//  RatingControl.swift
//  Test
//
//  Created by Logan Swanson on 3/18/17.
//  Copyright © 2017 Logan Swanson. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK: Properties
    @IBInspectable var starSize: CGSize=CGSize(width:44.0, height: 44.0){
    didSet{
        setUpButtons()
    }
    }
    
    @IBInspectable var starCount: Int = 5{
    didSet{
        setUpButtons()
    }
    }
    private var ratingButtons = [UIButton]()
    var rating = 0{
        didSet{
            updateButtonSelectionStates()
        }
    }
    
    
    //MARK: initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButtons()
    }

    required init(coder: NSCoder){
        super.init(coder: coder)
        setUpButtons()
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton){
        guard let index = ratingButtons.index(of: button) else{
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        //calculate the rating of the selected button
        let selectedRating = index+1
        if selectedRating ==  rating{
            //if the selected star represents the current rating, reset the rating to 0
            rating=0
        }else{
            //otherwise set the rating to the selected star
            rating=selectedRating
        }
    }
    
    //MARK: Private Methods
    private func setUpButtons(){
        //clear any existing buttons
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        //Load button images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for index in 0..<starCount{
            //create the button
            let button = UIButton()
            
            //set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            //add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            //Set the accessibility label
            button.accessibilityLabel = "Set \(index+1) star rating"
            
            //Set up the button action
            button.addTarget(self, action:
                #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            //add the button to the stack
            addArrangedSubview(button)
            
            //add the new button to the rating button array
            ratingButtons.append(button)
            
            updateButtonSelectionStates()
        }
    }
    
    private func updateButtonSelectionStates(){
        for(index,button) in ratingButtons.enumerated(){
            //if the index of a button is less than the rating, that button should be selected
            button.isSelected = index<rating
            
            //set the hint string for the currently selected star
            let hintString: String?
            if rating == index+1{
                hintString="tap to reset the rating to zero"
            }else{
                hintString = nil
            }
            
            //calculate the value string
            let valueString: String
            switch(rating){
            case 0:
                valueString = "no rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            
            //assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
}
