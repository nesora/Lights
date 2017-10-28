//
//  LogInViewController.swift
//  Lights
//
//  Created by Boyan Krastev on 10/16/17.
//  Copyright © 2017 Boyan Krastev. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController : UIViewController {
    
    var user : String?
    var password : String?
    var deviceArray = [Device]()
    
    @IBOutlet weak var userNameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func login(_ sender: UIButton) {
        
        if ( userNameInput.text?.isEmpty ?? true || passwordInput.text?.isEmpty ?? true ) {
            alertForNotSelectedIcon()
        } else {
            user = userNameInput.text
            password = passwordInput.text
            if let checkedUser = user , let userPassword = password {
                Authorization.authorizationInstance.authorizationRequest(userName: checkedUser, userPassword: userPassword) { (arrResponse) in
                    self.deviceArray = arrResponse ?? []
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue" {
            if let destinationVC = segue.destination as? LightsViewController {
                destinationVC.devices = deviceArray
            }
        }
    }
    
    func alertForNotSelectedIcon() {
        let alert = UIAlertController(title: "Warning", message: "Please fill the username and password fields", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
