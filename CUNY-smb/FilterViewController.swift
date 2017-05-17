//
//  FilterViewController.swift
//  CUNY-smb
//
//  Created by Vincent Liu on 4/29/17.
//  Copyright © 2017 InsertNameHere. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var filterView: UIView!
    @IBOutlet var agePicker: UIPickerView!
    @IBOutlet var schoolPicker: UIPickerView!
    @IBOutlet var genderPicker: UIPickerView!
    
    var agePickerOptions = ["18-21", "22-25", "26-29", "30-33", "34-37", "38-40"]
    var schoolPickerOptions = ["Baruch", "Brooklyn", "City", "CSI", "BMCC"]
    var genderPickerOptions = ["Male", "Female", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showAnimate()
        filterView.layer.cornerRadius = 15.0
        filterView.clipsToBounds = true
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePopup(_ Sender: AnyObject) {
        self.removeAnimate()
        
    }
    
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return agePickerOptions.count
        } else if pickerView.tag == 2 {
            return schoolPickerOptions.count
        } else {
            return genderPickerOptions.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return "\(agePickerOptions[row])"
        } else if pickerView.tag == 2 {
            return "\(schoolPickerOptions[row])"
        } else {
            return "\(genderPickerOptions[row])"
        }
    }

}
