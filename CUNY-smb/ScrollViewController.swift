//
//  ScrollViewController.swift
//  CUNY-smb
//
//  Created by Vincent Liu on 4/29/17.
//  Copyright © 2017 InsertNameHere. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var mainScrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainScrollView.delegate = self
        
        // Add the main view to the scrollview
        let firstView: FirstViewController = FirstViewController(nibName: "FirstViewController", bundle: nil)
        self.addChildViewController(firstView)
        self.mainScrollView.addSubview(firstView.view)
        firstView.didMove(toParentViewController: self)
        
        // Add the right view
        let secondView: SecondViewController = SecondViewController(nibName: "SecondViewController", bundle: nil)
        self.addChildViewController(secondView)
        self.mainScrollView.addSubview(secondView.view)
        secondView.didMove(toParentViewController: self)
        
        var secondViewFrame: CGRect = secondView.view.frame
        secondViewFrame.origin.x = self.view.frame.width
        secondView.view.frame = secondViewFrame
        
        // Add the left view
        let thirdView: ThirdViewController = ThirdViewController(nibName: "ThirdViewController", bundle: nil)
        self.addChildViewController(thirdView)
        self.mainScrollView.addSubview(thirdView.view)
        thirdView.didMove(toParentViewController: self)
        
        var thirdViewFrame: CGRect = thirdView.view.frame
        thirdViewFrame.origin.x = self.view.frame.width * 2
        thirdView.view.frame = thirdViewFrame
        
        // Set the scrollview size
        self.mainScrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.height)
        pageControl.addTarget(self, action: Selector(("changePage:")), for: UIControlEvents.valueChanged)
    }
    
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * mainScrollView.frame.size.width
        mainScrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
