//
//  String+Replace.swift
//  ASDStoryBoard
//
//  Created by Shane Whitehead on 8/7/17.
//  Copyright © 2017 Shane Whitehead. All rights reserved.
//

import Foundation

public extension String {
	
	public func replace(_ string: String, replacement: String) -> String {
		return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
	}
	
	public func removeWhitespace() -> String {
		return self.replace(" ", replacement: "")
	}
	
	public var decimalCharactersOnly: String {
		return components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: "")
	}
}
