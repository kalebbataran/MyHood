//
//  DataService.swift
//  MyHoodApp
//
//  Created by Kaleb Bataran on 4/13/16.
//  Copyright © 2016 kaydot. All rights reserved.
//

import Foundation
import UIKit

class DataService {
	
	static let instance = DataService()
	private var _currentPosts = [Post]()
	
	let KEY_POSTS = "posts"
	
	var currentPosts: [Post] {
		return _currentPosts
	}
	
	func savePosts() {
		
		let postsData = NSKeyedArchiver.archivedDataWithRootObject(_currentPosts)
		NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: KEY_POSTS)
		NSUserDefaults.standardUserDefaults().synchronize()
		
	}
	
	func loadPosts() {
		
		if let postsData = NSUserDefaults.standardUserDefaults().objectForKey(KEY_POSTS) as? NSData {
			
			if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [Post] {
				
				_currentPosts = postsArray
			}
		}
		
		NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "postsLoaded", object: nil))
	}
	
	func addPost(post: Post) {
		
		_currentPosts.append(post)
		savePosts()
		loadPosts()
		
	}
	
	func saveImage(image: UIImage) -> String {
		let imgData = UIImagePNGRepresentation(image)
		let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
		let fullPath = documentsPathForFileName(imgPath)
		
		imgData?.writeToFile(fullPath, atomically: true)
		return imgPath
	}
	
	func imageForPath(path: String) -> UIImage? {
		
		let fullPath = documentsPathForFileName(path)
		let image = UIImage(named: fullPath)
		
		return image
	}
	
	func documentsPathForFileName(name: String) -> String {
		
		let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
		let fullPath = paths[0] as NSString
		return fullPath.stringByAppendingPathComponent(name)
		
	}
	
}
