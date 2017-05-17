//
//  SearchViewController.swift
//  CUNY-smb
//
//  Created by Vincent Liu on 4/29/17.
//  Copyright © 2017 InsertNameHere. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    let interactor = Interactor()
    @IBOutlet var searchMingle: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchMingle.showsScopeBar = true
        searchMingle.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchMingle.resignFirstResponder()
        self.performSegue(withIdentifier: "results", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Profile page button
    @IBAction func showPopup(_ sender: AnyObject) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "filters") as! FilterViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    // Side Menu button
    @IBAction func openSideMenu(_ sender: AnyObject) {
        performSegue(withIdentifier: "SideMenu", sender: nil)
    }
    
    // Side Menu pan gesture present interaction
    @IBAction func edgePanGesture(sender: UIScreenEdgePanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        let progress = MenuHelper.calculateProgress(
            translationInView: translation,
            viewBounds: view.bounds,
            direction: .Right
        )
        
        MenuHelper.mapGestureStateToInteractor(
            gestureState: sender.state,
            progress: progress,
            interactor: interactor){
                performSegue(withIdentifier: "SideMenu", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SideMenu" {
            if let destinationViewController = segue.destination as? ProfileViewController {
                destinationViewController.transitioningDelegate = self as UIViewControllerTransitioningDelegate
                destinationViewController.interactor = interactor
            }
        }
        if segue.identifier == "results" {
            if segue is CustomSegue {
                (segue as! CustomSegue).animationType = .growScale
            }
        }
    }
}

// Adds the presentation animation to Transitioning delegate
extension SearchViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentMenuAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissMenuAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}

