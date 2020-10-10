//
//  LoginViewController.swift
//  Instagram
//
//  Created by LINNI on 10/10/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginUsername: LoginTextField!
    @IBOutlet weak var loginPassword: LoginTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 5
        loginUsername.layer.cornerRadius = 5
        loginPassword.layer.cornerRadius = 5
//        loginUsername.size.height = 100
//        loginButton.
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
