//
//  PickImageViewController.swift
//  ImageScrollView
//
//  Created by Matthew Benjamin on 5/10/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class PickImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    private var selectedImage: UIImage?

    @IBOutlet weak var imageHolder: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func imagePickedButtonClicked(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        imagePicker .dismissViewControllerAnimated(true, completion: nil)
        imageHolder.image=info[UIImagePickerControllerOriginalImage] as? UIImage
        selectedImage = imageHolder.image!
        performSegueWithIdentifier("mySegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mySegue" {
            
            if let nextViewController = segue.destinationViewController as? ScrollViewController {
                if let sImage = selectedImage{
                nextViewController.image = sImage
                }
                
            }
        }
        
    }

}
