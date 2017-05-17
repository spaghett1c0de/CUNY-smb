//
//  FirstResultViewController.swift
//  CUNY-smb
//
//  Created by Vincent Liu on 4/29/17.
//  Copyright © 2017 InsertNameHere. All rights reserved.
//

import UIKit

class FirstResultViewController: UIViewController {

    @IBOutlet var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.layer.cornerRadius = 10.0
        profileImage.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func minglePad(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "minglePad")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func backToSearch(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "mingle")
        self.present(controller, animated: true, completion: nil)
    }
    
    
}
