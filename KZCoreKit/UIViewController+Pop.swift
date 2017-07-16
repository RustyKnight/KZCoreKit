//
//  UIViewController+Pop.swift
//  KZiOSCoreKit
//
//  Created by Shane Whitehead on 9/7/17.
//  Copyright © 2017 Shane Whitehead. All rights reserved.
//

import Foundation
import UIKit

public enum PopTo {
	case root
	case previous
	case none
}

public extension UIViewController {
	
	public func popTo(_ popTo: PopTo) {
		switch popTo {
		case .none: break
		case .previous: _ = self.navigationController?.popViewController(animated: true)
		case .root: _ = self.navigationController?.popToRootViewController(animated: true)
		}
	}
	
}
