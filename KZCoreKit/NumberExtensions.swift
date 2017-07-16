//
//  NumberExtensions.swift
//  ASDStoryBoard
//
//  Created by Shane Whitehead on 8/7/17.
//  Copyright © 2017 Shane Whitehead. All rights reserved.
//

import Foundation
import UIKit

public extension Int {
	public var toRadians: Double {
		return Double(self) * Double.pi / 180
	}
	public var toDegrees: Double {
		return Double(self) * 180 / Double.pi
	}
}

public extension Double {
	public var toRadians: Double {
		return self * Double.pi / 180
	}
	public var toDegrees: Double {
		return self * 180 / Double.pi
	}
	public var toCGFloat: CGFloat {
		return CGFloat(self)
	}
	public var toFloat: Float {
		return Float(self)
	}
}

public extension CGFloat {
	public var toDouble: Double {
		return Double(self)
	}
	public var toRadians: CGFloat {
		return CGFloat(toDouble * .pi / 180)
	}
	public var toDegrees: CGFloat {
		return CGFloat(toDouble * 180 / .pi)
	}
}

public extension Float {
	public var toDouble: Double {
		return Double(self)
	}
	public var toRadians: Float {
		return Float(toDouble * .pi / 180)
	}
	public var toDegrees: Float {
		return Float(toDouble * 180 / .pi)
	}
	public var toCGFloat: CGFloat {
		return CGFloat(self)
	}
}
