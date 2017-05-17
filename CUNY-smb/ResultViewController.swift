//
//  ResultViewController.swift
//  CUNY-smb
//
//  Created by Vincent Liu on 4/29/17.
//  Copyright © 2017 InsertNameHere. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var mainScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let firstView: FirstResultViewController = FirstResultViewController(nibName: "FirstResultViewController", bundle: nil)
        self.addChildViewController(firstView)
        self.mainScrollView.addSubview(firstView.view)
        firstView.didMove(toParentViewController: self)
        
        let secondView: SecondResultViewController = SecondResultViewController(nibName: "SecondResultViewController", bundle: nil)
        self.addChildViewController(secondView)
        self.mainScrollView.addSubview(secondView.view)
        secondView.didMove(toParentViewController: self)
        
        var secondViewFrame: CGRect = secondView.view.frame
        secondViewFrame.origin.x = self.view.frame.width
        secondView.view.frame = secondViewFrame

        let thirdView: ThirdResultViewController = ThirdResultViewController(nibName: "ThirdResultViewController", bundle: nil)
        self.addChildViewController(thirdView)
        self.mainScrollView.addSubview(thirdView.view)
        thirdView.didMove(toParentViewController: self)
        
        var thirdViewFrame: CGRect = thirdView.view.frame
        thirdViewFrame.origin.x = self.view.frame.width * 2
        thirdView.view.frame = thirdViewFrame
        
        let fourthView: FourthResultViewController = FourthResultViewController(nibName: "FourthResultViewController", bundle: nil)
        self.addChildViewController(fourthView)
        self.mainScrollView.addSubview(fourthView.view)
        fourthView.didMove(toParentViewController: self)
        
        var fourthViewFrame: CGRect = fourthView.view.frame
        fourthViewFrame.origin.x = self.view.frame.width * 3
        fourthView.view.frame = fourthViewFrame
        
        let fifthView: FifthResultViewController = FifthResultViewController(nibName: "FifthResultViewController", bundle: nil)
        self.addChildViewController(fifthView)
        self.mainScrollView.addSubview(fifthView.view)
        fifthView.didMove(toParentViewController: self)
        
        var fifthViewFrame: CGRect = fifthView.view.frame
        fifthViewFrame.origin.x = self.view.frame.width * 4
        fifthView.view.frame = fifthViewFrame
        
        // Set the scrollview size
        self.mainScrollView.contentSize = CGSize(width: self.view.frame.width * 5, height: self.view.frame.height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Profile page button
    @IBAction func showPopup(_ sender: AnyObject) {
        let popOverVC = UIStoryboard(name: "results", bundle: nil).instantiateViewController(withIdentifier: "minglePad") as! FilterViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }

}
