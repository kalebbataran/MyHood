//
//  PostCell.swift
//  MyHoodApp
//
//  Created by Kaleb Bataran on 4/12/16.
//  Copyright © 2016 kaydot. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
	
	@IBOutlet weak var cellImg: UIImageView!
	@IBOutlet weak var cellTitleLbl: UILabel!
	@IBOutlet weak var cellDescLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	func configureCell(post: Post) {
		
		cellTitleLbl.text = post.title
		cellDescLbl.text = post.desc
		cellImg.image = DataService.instance.imageForPath(post.imgPath)
		
	}

}
