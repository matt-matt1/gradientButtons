//struct GradientUI {
//    var text = "Hello, World!"
//}
/*
#if canImport(AppKit)
import AppKit

//class GradientButton: NSButton {

// https://www.advancedswift.com/flat-nsbutton-in-swift/
/// Button With A Solid Background and Rounded Corners
@IBDesignable
class FlatButton: NSButton {
	@IBInspectable var backgroundColor: NSColor = NSColor.white//.blue
	@IBInspectable var cornerRadius: CGFloat = 5
	@IBInspectable var imageName: String = "NSActionTemplate"
	@IBInspectable var dxPadding: CGFloat = 10
	@IBInspectable var dyPadding: CGFloat = 10

	@IBInspectable var horizontalMargins: CGFloat = 20
	@IBInspectable var verticalMargins: CGFloat = 10
	@IBInspectable var titleColor: NSColor = NSColor(white: 0.05, alpha: 1)//NSColor.white
	@IBInspectable var borderColor = NSColor.black
	@IBInspectable var borderWidth: CGFloat = 0.5
//	var colorsAndLocations: (NSColor, CGFloat)... = nsc
	/// Angle of gradient (degrees from horzion)
	@IBInspectable var gradientAngle: CGFloat = 90
//		view.translatesAutoresizingMaskIntoConstraints = false
	override var intrinsicContentSize: NSSize {
		var size = super.intrinsicContentSize
		size.width += self.horizontalMargins
		size.height += self.verticalMargins
		return size
	}

//	override var layer: CALayer? {
//		get	{	return CAGradientLayer? 	}
//	}
	
	override func draw(_ dirtyRect: NSRect) {
		self.wantsLayer = true
		self.isBordered = false
//		let context = NSGraphicsContext.current?.cgContext
//		context?.saveGState()
//		context?.addPath(CGPath(roundedRect: dirtyRect, cornerWidth: self.cornerRadius, cornerHeight: self.cornerRadius, transform: nil))
		let path = NSBezierPath(roundedRect: dirtyRect, xRadius: self.cornerRadius, yRadius: self.cornerRadius)
		if let gradient = NSGradient(colorsAndLocations: (NSColor.blue, 0.0), (NSColor.cyan, 1.0)) {
			gradient.draw(in: path, angle: gradientAngle/*Constants.pieChartGradientAngle*/)
		}
//		context?.drawPath(using: CGPathDrawingMode.stroke)
//		context?.restoreGState()
		attributedTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor : self.titleColor/*NSColor(white: 0.05, alpha: 1)*/, NSAttributedString.Key.font : self.font ?? NSFont.boldSystemFont(ofSize: 13)])
		self.layer?.cornerRadius = self.cornerRadius
		self.layer?.borderColor = self.borderColor.cgColor
		self.layer?.borderWidth = self.borderWidth
		if isHighlighted {
			layer?.backgroundColor =  backgroundColor.blended(withFraction: 0.2, of: .black)?.cgColor
		} else {
			layer?.backgroundColor = backgroundColor.cgColor
		}
		if #available(OSX 10.12, *) {
			imagePosition = .imageLeading
		} else {
			// Fallback on earlier versions
		}
		image = NSImage(named: imageName)
		let originalBounds = self.bounds
		defer { self.bounds = originalBounds }
		self.bounds = originalBounds.insetBy(
			dx: dxPadding, dy: dyPadding
		)
		
		super.draw(dirtyRect)
	}
	
}
#endif
*/
#if canImport(UIKit)
import UIKit


@IBDesignable
class GradientButton: UIButton {
	public override class var layerClass: AnyClass {
		get {	return CAGradientLayer.self 	}
	}
	private var gradientLayer: CAGradientLayer {
		get { 	return layer as! CAGradientLayer 	}
	}
	
	@IBInspectable public var colors: [UIColor] = [.white] { 	didSet { updateColors() } 	}
	
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


private extension GradientButton {
	func updateColors() {
		gradientLayer.colors = colors.map {  $0.cgColor 	}
	}
}
#endif
