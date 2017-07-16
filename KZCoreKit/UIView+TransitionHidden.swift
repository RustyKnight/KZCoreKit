//
//  UIView+TransitionHidden.swift
//  ASDStoryBoard
//
//  Created by Shane Whitehead on 8/7/17.
//  Copyright © 2017 Shane Whitehead. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
	public func transition(toVisible visible: Bool, animated: Bool = true, withDuration duration: TimeInterval = 0.5) {
		if animated {
			if visible && isHidden {
				alpha = 0
			}
			UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
				if !visible {
					self.alpha = 0
				} else {
					self.isHidden = !visible
					self.alpha = 1
				}
			}, completion: { (completed) in
				self.isHidden = !visible
				self.alpha = 1
			})
		} else {
			isHidden = !visible
		}
	}
}
