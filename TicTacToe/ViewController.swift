//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kishor Reddy on 15/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    //    Outlets goes here
    //    first-row
    @IBOutlet weak var rc11: UIButton!
    @IBOutlet weak var rc12: UIButton!
    @IBOutlet weak var rc13: UIButton!
    //    Second-row
    @IBOutlet weak var rc21: UIButton!
    @IBOutlet weak var rc22: UIButton!
    @IBOutlet weak var rc23: UIButton!
    //    Third-row
    @IBOutlet weak var rc31: UIButton!
    @IBOutlet weak var rc32: UIButton!
    @IBOutlet weak var rc33: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func gameActions(_ sender: UIButton) {
        //  TODO:  All Clickable actions here
    }
}

