//
//  String+Bool.swift
//  ASDStoryBoard
//
//  Created by Shane Whitehead on 8/7/17.
//  Copyright © 2017 Shane Whitehead. All rights reserved.
//

import Foundation

public extension String {
	
	public var toBool: Bool {
		switch lowercased() {
		case "true", "yes", "1":
			return true
		case "false", "no", "0":
			return false
		default:
			return false
		}
	}
	
}
