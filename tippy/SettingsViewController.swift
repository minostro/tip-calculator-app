//
//  SettingsViewController.swift
//  tippy
//
//  Created by Milton Inostroza on 8/8/17.
//  Copyright © 2017 Milton Inostroza. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!
    var userDefaults: UserDefaults
    
    required init?(coder aDecoder: NSCoder) {
        self.userDefaults = UserDefaults.standard
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tipPorcentageIndex = self.userDefaults.integer(forKey: "default_tip_porcentage")
        tipSegmentedControl.selectedSegmentIndex = tipPorcentageIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func onValueChanged(_ sender: AnyObject) {
        self.userDefaults.set(tipSegmentedControl.selectedSegmentIndex, forKey:"default_tip_porcentage")
        self.userDefaults.synchronize()
    }

    @IBAction func onTouchDown(_ sender: Any) {
        let bounds = tipSegmentedControl.bounds
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            self.tipSegmentedControl.bounds = CGRect(x: bounds.origin.x - 10, y: bounds.origin.y, width: bounds.size.width + 20, height: bounds.size.height)}) { (success:Bool) in
                if success {
                    self.tipSegmentedControl.bounds = bounds
                }
        }
    }
}
