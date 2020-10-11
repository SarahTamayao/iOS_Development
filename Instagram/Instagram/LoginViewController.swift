//
//  LoginViewController.swift
//  Instagram
//
//  Created by LINNI on 10/10/20.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginUsername: LoginTextField!
    @IBOutlet weak var loginPassword: LoginTextField!
    
    @IBAction func onLogin(_ sender: Any) {
        let username = loginUsername.text!
        let password = loginPassword.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) {
            (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Log in failed: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    @IBAction func onRegister(_ sender: Any) {
        let user = PFUser()
        user.username = loginUsername.text
        user.password = loginPassword.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Sign up failed: \(String(describing: error?.localizedDescription))")
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 5
        loginUsername.layer.cornerRadius = 5
        loginPassword.layer.cornerRadius = 5

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
