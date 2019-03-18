//
//  ViewController.swift
//  ChemistHelper
//
//  Created by MATTEW MA on 6/3/19.
//  Copyright © 2019 Mathhew MA. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         Do any additional setup after loading the view, typically from a nib.
        let dataBase = DataBase()
        if dataBase.hasLogin() {
            self.performSegue(withIdentifier: "goToDash", sender: self)
        }
    }
    
}

