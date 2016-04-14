//
//  circularImg.swift
//  MyHoodApp
//
//  Created by Kaleb Bataran on 4/13/16.
//  Copyright © 2016 kaydot. All rights reserved.
//

import UIKit

class circularImg: UIImageView {

	override func awakeFromNib() {
		layer.cornerRadius = frame.size.width / 2
		clipsToBounds = true
	}

}
