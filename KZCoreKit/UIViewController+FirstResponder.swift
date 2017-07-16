//
//  UIViewController+FirstResponder.swift
//  KZiOSCoreKit
//
//  Created by Shane Whitehead on 9/7/17.
//  Copyright © 2017 Shane Whitehead. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
	
	public var currentFirstResponder: UIResponder? {
		return view.currentFirstResponder
	}
	
	public var isParentOfFirstResponder: Bool {
		return view.isParentOfFirstResponder
	}
	
	public func resignCurrentResponder() -> Bool {
		return view.resignCurrentResponder()
	}
}
