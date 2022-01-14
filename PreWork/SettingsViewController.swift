//
//  SettingsViewController.swift
//  PreWork
//
//  Created by Luis Mora on 1/12/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tip1: UITextField!
    @IBOutlet weak var tip2: UITextField!
    @IBOutlet weak var tip3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Hide Keyboard when tapping background
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    //converting text field into double for percentage
    var tip1Dec: Double? {
        if (tip1.text == nil){
            return 0
        }
        return Double(tip1.text!)!/100
    }
    //converting text field into double for percentage
    var tip2Dec: Double? {
        if (tip2.text == nil){
            return 0
        }
            return Double(tip2.text!)!/100
    }
    //converting text field into double for percentage
    var tip3Dec: Double? {
        if (tip3.text == nil){
            return 0
        }
        return Double(tip3.text!)!/100
    }
    
    @IBAction func updateTips(){

        // setting the tip one in user defaults to the text field
        UserDefaults.standard.set(tip1Dec, forKey: "tip1")
        // setting the tip one in user defaults to the text field
        UserDefaults.standard.set(tip2Dec, forKey: "tip2")
        // setting the tip one in user defaults to the text field
        UserDefaults.standard.set(tip3Dec, forKey: "tip3")
        
        // Force UserDefaults to save.
        UserDefaults.standard.synchronize()
        
    }

}
