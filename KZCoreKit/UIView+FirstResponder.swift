//
//  UIView+FirstResponder.swift
//  ASDStoryBoard
//
//  Created by Shane Whitehead on 8/7/17.
//  Copyright © 2017 Shane Whitehead. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
	
	public var currentFirstResponder: UIResponder? {
		if self.isFirstResponder {
			return self
		}
		
		for view in self.subviews {
			if let responder = view.currentFirstResponder {
				return responder
			}
		}
		
		return nil
	}
	
	public var isParentOfFirstResponder: Bool {
		return currentFirstResponder != nil
	}
	
	public func resignCurrentResponder() -> Bool {
		if let responder = currentFirstResponder {
			return responder.resignFirstResponder()
		}
		return true
	}
}

