//
//  LoginViewController.swift
//  CUNY-smb
//
//  Created by Vincent Liu on 4/29/17.
//  Copyright © 2017 InsertNameHere. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    let yourAttributes : [String: Any] = [
        NSFontAttributeName : UIFont.systemFont(ofSize: 15),
        NSForegroundColorAttributeName : UIColor.white,
        NSUnderlineStyleAttributeName : NSUnderlineStyle.styleSingle.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.password.delegate = self
        textFieldLayout()
        loginButton.layer.cornerRadius = 15.0
        loginButton.layer.masksToBounds = true
        
        let attributedString = NSMutableAttributedString(string: "Sign Up",
                                                         attributes: yourAttributes)
        signUpButton.setAttributedTitle(attributedString, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        password.resignFirstResponder()
        return true;
    }
    
    func textFieldLayout() {
        let bottomLine = CALayer()
        let bottomLine2 = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: username.frame.height - 1 , width: username.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        username.borderStyle = UITextBorderStyle.none
        username.layer.addSublayer(bottomLine)
        username.textColor = UIColor.white
        
        bottomLine2.frame = CGRect(x: 0.0, y: password.frame.height - 1 , width: password.frame.width, height: 1.0)
        bottomLine2.backgroundColor = UIColor.white.cgColor
        password.borderStyle = UITextBorderStyle.none
        password.layer.addSublayer(bottomLine2)
        password.textColor = UIColor.white
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue is CustomSegue {
            (segue as! CustomSegue).animationType = .cornerRotate
        }
    }
    

}
