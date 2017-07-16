//
//  UIViewController+RootViewController.swift
//  KZiOSCoreKit
//
//  Created by Shane Whitehead on 9/7/17.
//  Copyright © 2017 Shane Whitehead. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
	public var rootViewController: UIViewController? {
		guard let delegate = UIApplication.shared.delegate else {
			return nil
		}
		guard let window = delegate.window else {
			return nil
		}
		return window!.rootViewController
	}
}

