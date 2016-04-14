//
//  ViewController.swift
//  MyHoodApp
//
//  Created by Kaleb Bataran on 4/4/16.
//  Copyright © 2016 kaydot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		
		DataService.instance.loadPosts()
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(onPostsLoaded), name: "postsLoaded", object: nil)
		
		
	}

	func onPostsLoaded() {
		tableView.reloadData()
	}
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		
		return 1
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let post = DataService.instance.currentPosts[indexPath.row]
		if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
			cell.configureCell(post)
			return cell
			
		} else {
			let cell = PostCell()
			cell.configureCell(post)
			return cell
		}
		
	
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		
		return 79.5
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return DataService.instance.currentPosts.count
	}
	


}

