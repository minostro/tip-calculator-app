//
//  ViewController.swift
//  tippy
//
//  Created by Milton Inostroza on 8/8/17.
//  Copyright © 2017 Milton Inostroza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!

    let TIP_PERCENTAGES = [0.18, 0.2, 0.25]
    var userDefaults: UserDefaults
    var lastActive : NSDate?

    required init?(coder aDecoder: NSCoder) {
        self.userDefaults = UserDefaults.standard
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tipPorcentageIndex = self.userDefaults.integer(forKey: "default_tip_porcentage")
        tipSegmentedControl.selectedSegmentIndex = tipPorcentageIndex
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let tipPorcentageIndex = self.userDefaults.integer(forKey: "default_tip_porcentage")
        tipSegmentedControl.selectedSegmentIndex = tipPorcentageIndex
        onBillChange(tipSegmentedControl)
        billTextField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onBillChange(_ sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]
        let billAmount = Double(billTextField.text!) ?? 0
        let tipAmount = billAmount * tipPercentages[tipSegmentedControl.selectedSegmentIndex]
        let totalAmount = billAmount + tipAmount
        
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
    }
    
    func willResignActive() {
        lastActive = NSDate()
    }
    
    func enterForeground() {
        let seconds = lastActive!.timeIntervalSinceNow * -1
        if (seconds > 60*10) {
            billTextField.text = ""
        }
    }
}
