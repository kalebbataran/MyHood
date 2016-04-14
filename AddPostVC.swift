//
//  AddPostVC.swift
//  MyHoodApp
//
//  Created by Kaleb Bataran on 4/13/16.
//  Copyright © 2016 kaydot. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	@IBOutlet weak var postImg: UIImageView!
	@IBOutlet weak var titleFld: UITextField!
	@IBOutlet weak var descFld: UITextField!

	var imagePicker: UIImagePickerController!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		
    }

	@IBAction func cancelBtnPressed(sender: AnyObject) {
		
		dismissViewControllerAnimated(true, completion: nil)
	}

	@IBAction func addPicBtnPressed(sender: UIButton!) {
		sender.setTitle("", forState: .Normal)
		
		presentViewController(imagePicker, animated: true, completion: nil)
	}
	
	@IBAction func addPostBtnPressed(sender: AnyObject) {
		if let img = postImg.image, let title = titleFld.text, let desc = descFld.text {
			
			let post = Post(imgPath: DataService.instance.saveImage(img), title: title, description: desc)
			DataService.instance.addPost(post)
			
		}
		dismissViewControllerAnimated(true, completion: nil)
		
	}
	
	func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
		
		imagePicker.dismissViewControllerAnimated(true, completion: nil)
		postImg.image = image
		
	}
	
}
