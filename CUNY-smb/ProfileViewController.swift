//
//  ProfileViewController.swift
//  CUNY-smb
//
//  Created by Vincent Liu on 4/29/17.
//  Copyright © 2017 InsertNameHere. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var interactor:Interactor? = nil
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
    
    // Side Menu pan gesture dismiss interaction
    @IBAction func handleGesture(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        
        let progress = MenuHelper.calculateProgress(
            translationInView: translation,
            viewBounds: view.bounds,
            direction: .Left
        )
        
        MenuHelper.mapGestureStateToInteractor(
            gestureState: sender.state,
            progress: progress,
            interactor: interactor){
                
                self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func closeSideMenu(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
