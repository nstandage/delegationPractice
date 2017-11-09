//
//  ModelViewController.swift
//  Delegation Practice
//
//  Created by Nathan Standage on 10/30/17.
//  Copyright © 2017 Nathan Standage. All rights reserved.
//

import UIKit

protocol changeTextDelegate: class {
   func changeTextTo(_ text: String)
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
    
    @IBAction func changeLabelButton() {
       

        if let delegate = delegate, let text = textField.text {
            delegate.changeTextTo(text)

        } else {
            delegate?.changeTextTo("BOO!")

        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
