//
//  BillTextField.swift
//  tippy
//
//  Created by Milton Inostroza on 8/9/17.
//  Copyright © 2017 Milton Inostroza. All rights reserved.
//

import UIKit

class BillTextField: UITextField, UITextFieldDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let new_value = super.text! + string
        return new_value.characters.filter({ (char:Character) -> Bool in
            char == "."
        }).count <= 1
    }
   
}
