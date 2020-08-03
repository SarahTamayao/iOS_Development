//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Linni on 2020/8/2.
//  Copyright © 2020 CodePath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipPctLevelOne: UITextField!
    @IBOutlet weak var tipPctLevelTwo: UITextField!
    @IBOutlet weak var tipPctLevelThree: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func updateTipPct(_ sender: Any) {

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
