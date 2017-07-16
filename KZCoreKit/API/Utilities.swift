//
//  Utilities.swift
//  ASDStoryBoard
//
//  Created by Shane Whitehead on 8/7/17.
//  Copyright © 2017 Shane Whitehead. All rights reserved.
//

import Foundation

public func onMainThread(_ call: @escaping () -> Void) {
	guard !Thread.isMainThread else {
		call()
		return
	}
	DispatchQueue.main.async {
		call()
	}
}

public func onMainThreadLater(_ call: @escaping () -> Void) {
	DispatchQueue.main.async {
		call()
	}
}
