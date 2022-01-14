//
//  ViewController.swift
//  PreWork
//
//  Created by Luis Mora on 1/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet public weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // sets the title in the navigation bar
        self.title = "Tip Calculator"
        
        // setting default tips int User Defaults
        UserDefaults.standard.set(0.15, forKey: "tip1")
        UserDefaults.standard.set(0.18, forKey: "tip2")
        UserDefaults.standard.set(0.20, forKey: "tip3")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        //updating the segment control titles with the new tips
        tipControl.setTitle(String(Int(UserDefaults.standard.double(forKey: "tip1")*100)) + "%", forSegmentAt: 0)
        tipControl.setTitle(String(Int(UserDefaults.standard.double(forKey: "tip2")*100)) + "%", forSegmentAt: 1)
        tipControl.setTitle(String(Int(UserDefaults.standard.double(forKey: "tip3")*100)) + "%", forSegmentAt: 2)

    }
    
    //function to calculat tip when selected segment value changes
    @IBAction func calculateTip(_ sender: Any) {
        //get bil amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        //updating tip percentage values
        let tipPercentages = [UserDefaults.standard.double(forKey: "tip1"),UserDefaults.standard.double(forKey: "tip2"),UserDefaults.standard.double(forKey: "tip3")]

        //get total tip by multiplying tip * tipPercentage
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

