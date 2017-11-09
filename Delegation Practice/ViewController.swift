//
//  ViewController.swift
//  Delegation Practice
//
//  Created by Nathan Standage on 10/30/17.
//  Copyright © 2017 Nathan Standage. All rights reserved.
//

import UIKit

class ViewController: UIViewController, changeTextDelegate {


    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "Press Go to change my text."
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func changeTextTo(_ text: String, withNewColor: Bool = false) {
        changeColor(withNewColor)
        textLabel.text = text

    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueModal" {
            
            guard let modalVC = segue.destination as? ModelViewController else {
                print("FATAL ERROR BRO!")
                return
            }
            
            modalVC.delegate = self
            
        }
    }
    
    func changeColor(_ newColor: Bool) {
        
        if newColor == true {
            textLabel.textColor = UIColor.red
        } else {
            textLabel.textColor = UIColor.black
        }
        
    }

}

