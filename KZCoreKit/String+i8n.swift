//
//  String+i8n.swift
//  ASDStoryBoard
//
//  Created by Shane Whitehead on 8/7/17.
//  Copyright © 2017 Shane Whitehead. All rights reserved.
//

import Foundation

public extension String {
	
	/// Localized String
	public var localized: String {
		return NSLocalizedString(
			self,
			tableName: nil,
			bundle: Bundle.main,
			value: "",
			comment: "")
	}
	
	public func localizedFor(_ type: AnyClass) -> String {
		let bundle = Bundle(for: type)
		return NSLocalizedString(
			self,
			tableName: nil,
			bundle: bundle,
			value: "",
			comment: "")
	}
}
