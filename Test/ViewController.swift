//
//  ViewController.swift
//  Test
//
//  Created by Logan Swanson on 3/8/17.
//  Copyright © 2017 Logan Swanson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: properties

    @IBOutlet weak var nameTextFeild: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }

}

