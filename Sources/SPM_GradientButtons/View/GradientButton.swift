//
//  GradientButton.swift
//  Planets
//
//  Created by Yuma Technical Inc. on 2021-04-11.
//  Copyright © 2021 Yuma Technical Inc. All rights reserved.
//

import UIKit


/*if NSClassFromString("GradientButton") == nil {*/
@IBDesignable
class GradientButton: UIButton {
	public override class var layerClass: AnyClass {
		get {	return CAGradientLayer.self 	}
	}
	private var gradientLayer: CAGradientLayer {
		get { 	return layer as! CAGradientLayer 	}
	}
	
	@IBInspectable public var colors: [UIColor] = [.white] { 	didSet { updateColors() } 	}
//	@IBInspectable public var startColor: UIColor = .white { 	didSet { updateColors() } 	}
//	@IBInspectable public var endColor: UIColor = .red     { 	didSet { updateColors() } 	}
	
	// expose startPoint and endPoint to IB
//	@IBInspectable var startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0) {
//		didSet { gradientLayer.startPoint = startPoint }
//	}
//	@IBInspectable var endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0) {
//		didSet { gradientLayer.endPoint = endPoint }
//	}
//	@IBInspectable public var startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0) {
//		get { 	return gradientLayer.startPoint 		}
//		set { 	gradientLayer.startPoint = newValue 	}
//	}
//
//	@IBInspectable public var endPoint: CGPoint {
//		get { 	return gradientLayer.endPoint 		}
//		set { 	gradientLayer.endPoint = newValue 	}
//	}
	
	// while we're at it, let's expose a few more layer properties so we can easily adjust them in IB
	
	@IBInspectable public var cornerRadius: CGFloat {
		get { 	return layer.cornerRadius 		}
		set { 	layer.cornerRadius = newValue 	}
	}
	
	@IBInspectable public var borderWidth: CGFloat {
		get { 	return layer.borderWidth 		}
		set { 	layer.borderWidth = newValue 	}
	}
	
	@IBInspectable public var borderColor: UIColor? {
		get { 	return layer.borderColor.flatMap { 	UIColor(cgColor: $0) } 	}
		set { 	layer.borderColor = newValue?.cgColor 	}
	}
	
	// init methods
	
	public override init(frame: CGRect = .zero) {
		super.init(frame: frame)
		updateColors()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		updateColors()
	}
}

/*}*/

private extension GradientButton {
	func updateColors() {
		//		gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
		gradientLayer.colors = colors.map {  $0.cgColor 	}
	}
}
