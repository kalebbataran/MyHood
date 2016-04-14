//
//  Post.swift
//  MyHoodApp
//
//  Created by Kaleb Bataran on 4/12/16.
//  Copyright © 2016 kaydot. All rights reserved.
//

import Foundation

class Post: NSObject, NSCoding {
	
	private var _postImgPath: String!
	private var _postTitle: String!
	private var _postDesc: String!
	
	var imgPath: String {
		return _postImgPath
	}
	
	var title: String {
		return _postTitle
	}
	
	var desc: String {
		return _postDesc 
	}
	
	init(imgPath:String, title: String, description: String) {
		
		self._postImgPath = imgPath
		self._postTitle = title
		self._postDesc = description
		
	}
	
	override init() {
		
	}
	
	//
	//have to decode/encode for custom class
	//
	
	required convenience init?(coder aDecoder: NSCoder) {
		
		self.init()
		self._postImgPath = aDecoder.decodeObjectForKey("imgPath") as? String
		self._postTitle = aDecoder.decodeObjectForKey("title") as? String
		self._postDesc = aDecoder.decodeObjectForKey("desc") as? String
		
	}
	
	
	func encodeWithCoder(aCoder: NSCoder) {
		
		aCoder.encodeObject(self._postImgPath, forKey: "imgPath")
		aCoder.encodeObject(self._postTitle, forKey: "title")
		aCoder.encodeObject(self._postDesc, forKey: "desc")
		
	}
	
}