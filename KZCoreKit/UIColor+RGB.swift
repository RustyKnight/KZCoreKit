//
//  UIColor+RGB.swift
//  ASDStoryBoard
//
//  Created by Shane Whitehead on 8/7/17.
//  Copyright © 2017 Shane Whitehead. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
	
	/**
	Initializes a UIColor
	
	- parameter colorCode: String
	- parameter alpha:     Float
	
	*/
	public convenience init(colorCode: String, alpha: Float = 1.0) {
		let scanner = Scanner(string: colorCode)
		var color: UInt32 = 0
		_ = scanner.scanHexInt32(&color)
		let intValue = Int(color)
		let mask = 0x000000FF
		let r = CGFloat((intValue >> 16) & mask) / 255.0
		let g = CGFloat((intValue >> 8) & mask) / 255.0
		let b = CGFloat((intValue) & mask) / 255.0
		
		self.init(red: r, green: g, blue: b, alpha: CGFloat(alpha))
	}
}
