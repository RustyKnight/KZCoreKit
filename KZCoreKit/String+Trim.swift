//
//  String+Trim.swift
//  ASDStoryBoard
//
//  Created by Shane Whitehead on 8/7/17.
//  Copyright © 2017 Shane Whitehead. All rights reserved.
//

import Foundation

public extension String {
	/// Trims the string of all white space and new line characters
	public var trimming: String {
		return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
	}
	
	public var isEmptyWhenTrimmed: Bool {
		return trimming.characters.count == 0
	}
	
}
