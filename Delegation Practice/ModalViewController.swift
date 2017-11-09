//
//  ModelViewController.swift
//  Delegation Practice
//
//  Created by Nathan Standage on 10/30/17.
//  Copyright © 2017 Nathan Standage. All rights reserved.
//

import UIKit

protocol changeTextDelegate: class {
    func changeTextTo(_ text: String, withNewColor: Bool)
}


class ModelViewController: UIViewController {

    weak var delegate: changeTextDelegate?
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
       textField.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doneEditing() {
        changeLabelButton()
    }
    @IBAction func changeLabelButton() {

        if let delegate = delegate, let text = textField.text {
            
            if textField.text != "" {
               delegate.changeTextTo(text, withNewColor: false)
            } else {
                delegate.changeTextTo("Please enter text next time.", withNewColor:  true)
            }
        }
        
        self.dismiss(animated: true, completion: nil)
    }


}
