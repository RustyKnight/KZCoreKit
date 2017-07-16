//
//  String+Drop.swift
//  ASDStoryBoard
//
//  Created by Shane Whitehead on 8/7/17.
//  Copyright © 2017 Shane Whitehead. All rights reserved.
//

import Foundation

public extension String {
	
	public func dropFirst(_ chars: Int = 1) -> String {
		return String(characters.dropFirst(chars))
	}
	
	public func dropLast(_ chars: Int = 1) -> String {
		return String(characters.dropLast(chars))
	}
}
