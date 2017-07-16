//
//  UIColor+Blend.swift
//  ASDStoryBoard
//
//  Created by Shane Whitehead on 8/7/17.
//  Copyright © 2017 Shane Whitehead. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
	
	public var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 0
		
		getRed(&r, green: &g, blue: &b, alpha: &a)
		
		return (r, g, b, a)
	}
	
	public class func lerp(from: CGFloat, to: CGFloat, alpha: CGFloat) -> CGFloat {
		return (1 - alpha) * from + alpha * to
	}
	
	public func blend(with color: UIColor) -> UIColor {
		return UIColor.blend(self, with: color, by: 0.5)
	}
	
	public func blend(with color: UIColor, by ratio: Double) -> UIColor {
		return UIColor.blend(self, with: color, by: ratio)
	}
	
	public class func blend(_ from: UIColor, with: UIColor, by amount: Double) -> UIColor {
		let fromComponents = from.components
		let toComponents = with.components
		
		let redAmount = lerp(from: fromComponents.red,
		                     to: toComponents.red,
		                     alpha: CGFloat(amount))
		let greenAmount = lerp(from: fromComponents.green,
		                       to: toComponents.green,
		                       alpha: CGFloat(amount))
		let blueAmount = lerp(from: fromComponents.blue,
		                      to: toComponents.blue,
		                      alpha: CGFloat(amount))
		
		let color = UIColor(red: redAmount,
		                    green: greenAmount,
		                    blue: blueAmount,
		                    alpha: 1)
		
		return color
	}
	
	public func darken(by amount: Double) -> UIColor {
		return blend(with: UIColor.black, by: amount)
	}
	
	public func brighten(by amount: Double) -> UIColor {
		return blend(with: UIColor.white, by: amount)
	}
	
	/**
	Return a modified color using the brightness factor provided
	
	:param: factor brightness factor
	:returns: modified color
	*/
	public func withBrightness(ofFactor factor: CGFloat) -> UIColor {
		var hue: CGFloat = 0
		var saturation: CGFloat = 0
		var brightness: CGFloat = 0
		var alpha: CGFloat = 0
		
		if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
			return UIColor(hue: hue, saturation: saturation, brightness: brightness * factor, alpha: alpha)
		} else {
			return self
		}
	}
	
	public func with(alpha: Double) -> UIColor {
		let rgb = cgColor.components
		return UIColor(red: rgb![0],
		               green: rgb![0],
		               blue: rgb![0],
		               alpha: alpha.toCGFloat)
	}
	
	public func invert() -> UIColor {
		let rgb = cgColor.components
		let alpha = cgColor.alpha
		return UIColor(red: 1.0 - rgb![0], green: 1.0 - rgb![0], blue: 1.0 - rgb![0], alpha: alpha)
	}
	
	static public func blend(_ colors: [UIColor], progress: Double) -> UIColor {
		let count = Double(colors.count) - 1
		
		var startIndex = min(max(floor(count * progress), 0.0), count)
		if startIndex == count {
			startIndex -= 1
		}
		let endIndex = startIndex + 1
		
		let startColor = colors[Int(startIndex)]
		let endColor = colors[Int(endIndex)]
		
		let maxRange = (1.0 / count)
		let value = (maxRange * startIndex) - progress
		let weight = abs(value / maxRange)
		
		return startColor.blend(with: endColor, by: weight)
	}
}

/**
This takes the idea of blending colors a little further.  It allows you to provide an array of
colors AND and array of normalised points.  Each index of the normalized points represents the same
index of a color, where the color would be considered to be "fully" active.

This allows you to blend a non-linear series of colors based on a given progress/fraction
*/
public extension UIColor {
	
	public enum ColorBlendError: Error {
		case colorFractionMismatch
	}
	
	internal static func fractionIndicies(from fractions: [Double], at progress: Double) -> (from: Int, to: Int) {
		var startPoint = 0
		while startPoint < fractions.count && fractions[startPoint] <= progress {
			startPoint += 1
		}
		if startPoint >= fractions.count {
			startPoint = fractions.count - 1
		}
		
		return (from: startPoint - 1, to: startPoint)
	}
	
	public static func blendOf(colors: [UIColor], using fractions: [Double], at progress: Double) throws -> UIColor {
		guard fractions.count == colors.count else {
			throw ColorBlendError.colorFractionMismatch
		}
		
		let indicies = fractionIndicies(from: fractions, at: progress)
		let range = (from: fractions[indicies.from], to: fractions[indicies.to])
		let colors = (from: colors[indicies.from], to: colors[indicies.to])
		
		// Normalise the progress value
		let max = range.to - range.from
		let value = progress - range.from
		let normalisedProgress = value / max
		
		return blend([colors.from, colors.to], progress: normalisedProgress)
	}
	
}

