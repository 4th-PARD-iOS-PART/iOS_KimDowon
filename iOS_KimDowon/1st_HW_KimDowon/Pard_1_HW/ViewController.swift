//
//  ViewController.swift
//  Pard_1_HW
//
//  Created by 김도원 on 9/8/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var Label: UILabel!
    @IBAction func ACbutton(_ sender: Any) {
    }
    @IBAction func Percent(_ sender: Any) {
    }
    @IBAction func divide(_ sender: Any) {
    }
    @IBAction func seven(_ sender: Any) {
    }
    @IBAction func eight(_ sender: Any) {
    }
    @IBAction func nine(_ sender: Any) {
    }
    @IBAction func four(_ sender: Any) {
    }
    @IBAction func five(_ sender: Any) {
    }
    @IBAction func six(_ sender: Any) {
    }
    @IBAction func one(_ sender: Any) {
    }
    @IBAction func two(_ sender: Any) {
    }
    @IBAction func three(_ sender: Any) {
    }
    @IBAction func zero(_ sender: Any) {
    }
    @IBAction func point(_ sender: Any) {
    }
    @IBAction func equal(_ sender: Any) {
    }
    @IBAction func add(_ sender: Any) {
    }
    @IBAction func minus(_ sender: Any) {
    }
    @IBAction func multiply(_ sender: Any) {
    }
    @IBAction func ButtonClicked(_ sender: UIButton) {
        if let buttonText = sender.titleLabel?.text {
            if buttonText == "." {
                if Label.text?.contains(".") == true{
                    return
                }

            }
            Label.text = (Label.text ?? "") + buttonText
        }
    }

}
