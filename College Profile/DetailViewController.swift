//
//  DetailViewController.swift
//  College Profile
//
//  Created by Garrett Haufschild on 1/20/16.
//  Copyright © 2016 Swag Productions. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController//, UIImagePickerControllerDelegate, UINavigationControllerDelegate 
{

    var college: College = College()
    //var chosenImage: UIImage
    //var imagePicker: UIImagePickerController
    
    
    @IBOutlet weak var schoolNameTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var enrollmentTF: UITextField!
    @IBOutlet weak var actTF: UITextField!
    @IBOutlet weak var colorsTF: UITextField!
    @IBOutlet weak var schoolImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        schoolNameTF.text = college.name
        locationTF.text = college.location
        enrollmentTF.text = String(college.enrollment)
        actTF.text = String(college.act)
        colorsTF.text = college.colors
        schoolImage.image = college.image
    }
    
    @IBAction func saveTapped(sender: UIBarButtonItem) {
        college.name = schoolNameTF.text!
        college.location = locationTF.text!
        college.enrollment = Int(enrollmentTF.text!)!
        college.act = Int(actTF.text!)!
        college.colors = colorsTF.text!
        //college.image = schoolImage.image
    }
    
    

}
