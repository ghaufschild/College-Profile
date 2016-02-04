//
//  DetailViewController.swift
//  College Profile
//
//  Created by Garrett Haufschild on 1/20/16.
//  Copyright © 2016 Swag Productions. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    var college: College = College()
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var schoolNameTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var enrollmentTF: UITextField!
    @IBOutlet weak var actTF: UITextField!
    @IBOutlet weak var colorsTF: UITextField!
    @IBOutlet weak var websiteURLTF: UITextField!
    @IBOutlet weak var schoolImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        schoolNameTF.text = college.name
        locationTF.text = college.location
        enrollmentTF.text = String(college.enrollment)
        actTF.text = String(college.act)
        colorsTF.text = college.colors
        websiteURLTF.text = college.website
        schoolImage.image = college.image
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.schoolImage.image = selectedImage
        }
    }
    
    @IBAction func saveTapped(sender: UIBarButtonItem) {
        college.name = schoolNameTF.text!
        college.location = locationTF.text!
        college.enrollment = Int(enrollmentTF.text!)!
        college.act = Int(actTF.text!)!
        college.colors = colorsTF.text!
        college.website = websiteURLTF.text!
        college.image = schoolImage.image
    }
    
    @IBAction func onGoTapped(sender: UIButton) {
        let url = NSURL(string: websiteURLTF.text!)
        let svc = SFSafariViewController(URL: url!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }
    
    @IBAction func onCameraTapped(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera)
        {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func onLibraryTapped(sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    

}
