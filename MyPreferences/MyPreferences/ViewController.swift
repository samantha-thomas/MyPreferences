//
//  ViewController.swift
//  MyPreferences
//
//  Created by Samantha Thomas on 10/25/19.
//  Copyright © 2019 Samantha Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    //Outlets
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var dateSelector: UIDatePicker!
    
    //Added outlets.
    @IBOutlet weak var txtMiddleName: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    
    //Actions
    @IBAction func btnSave(_ sender: Any)
    {
        //Gotten from exercise assignment.
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(self.txtFullName.text, forKey: "fullname")
        defaults.set(self.txtEmail.text, forKey: "email")
        
        //Added.
        defaults.set(self.txtMiddleName.text, forKey: "middlename")
        defaults.set(self.txtPhone.text, forKey: "phone")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
        let newDate = dateFormatter.string(from:dateSelector.date) //pass Date here
        defaults.set(newDate, forKey: "bdate")
        print(dateSelector.date.description)
        defaults.synchronize()
        clear()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Gotten from execise app assignment on GitHub.
        let defaults: UserDefaults = UserDefaults.standard
        if defaults.string(forKey: "fullname") != nil
        {
              txtFullName.text = defaults.string(forKey: "fullname")
        }
        if defaults.string(forKey: "email") != nil
        {
            txtEmail.text = defaults.string(forKey: "email")
        }
        if defaults.string(forKey: "bdate") != nil
        {
            let bdate  = defaults.string(forKey: "bdate")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy" //Your date format
            let date = dateFormatter.date(from: bdate!) //according to date format your date string
            dateSelector.setDate(date!, animated: true)
        }
        
        //Added.
        if defaults.string(forKey: "middlename") != nil
        {
            txtPhone.text = defaults.string(forKey: "middlename")
        }
        if defaults.string(forKey: "phone") != nil
        {
            txtPhone.text = defaults.string(forKey: "phone")
        }
    }
    
    //Gotten from exercise assignment.
    func clear()
    {
        txtFullName.resignFirstResponder()
        txtEmail.resignFirstResponder()
        
        //Added.
        txtMiddleName.resignFirstResponder()
        txtPhone.resignFirstResponder()
        
     }
}

