//
//  UIViewController+Alert.swift
//  ASDStoryBoard
//
//  Created by Shane Whitehead on 8/7/17.
//  Copyright © 2017 Shane Whitehead. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
	
	public var isOnScreen: Bool {
		return self.isViewLoaded && view.window != nil
	}
	
	public func alert(titled: String? = nil,
	           message: String,
	           actions: [UIAlertAction]? = nil,
	           completion: ((()) -> Void)? = nil) {
		guard Thread.isMainThread else {
			onMainThread {
				self.alert(titled: titled, message: message, actions: actions, completion: completion)
			}
			return
		}
		let alertController = UIAlertController(title: titled,
		                                        message: message,
		                                        preferredStyle: .alert)
		if let actions = actions {
			actions.forEach({ (action) in
				alertController.addAction(action)
			})
		}
		self.present(alertController,
		             animated: true,
		             completion: completion)
	}

	public func alert(titled: String? = nil,
	           message: String,
	           okAction: ((_ action: UIAlertAction) -> Void)? = nil,
	           cancelAction: ((_ action: UIAlertAction) -> Void)? = nil,
	           completion: ((()) -> Void)? = nil) {
		guard Thread.isMainThread else {
			onMainThread {
				self.alert(titled: titled,
				           message: message,
				           okAction: okAction,
				           cancelAction: cancelAction,
				           completion: completion)
			}
			return
		}
		
		let actions: [UIAlertAction] = [
			UIAlertAction(title: "general.ok".localized,
			              style: .default,
			              handler: okAction),
			UIAlertAction(title: "general.cancel".localized,
			              style: .cancel,
			              handler: cancelAction),
			]
		
		alert(titled: titled, message: message, actions: actions, completion: completion)
	}
}
