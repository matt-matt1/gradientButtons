//
//  MyButton.swift
//  
//
//  Created by Yuma Technical Inc. on 2021-04-17.
//

#if canImport(AppKit)
import AppKit


@IBDesignable
class GradientButton: NSButton {
	@IBInspectable var backgroundColor: NSColor = NSColor.blue
	@IBInspectable var cornerRadius: CGFloat = 5
	@IBInspectable var imageName: String? //= "NSActionTemplate"
	@IBInspectable var dxPadding: CGFloat = 10
	@IBInspectable var dyPadding: CGFloat = 10
	
	@IBInspectable var titleColor: NSColor = NSColor(white: 0.05, alpha: 1)
	/// If no border is required, set borderWidth to 0
	@IBInspectable var borderColor: NSColor? //= NSColor.black
	/// If no border is required, set borderColor will be ignored
	@IBInspectable var borderWidth: CGFloat = 0//0.5
	/// Array of gradient colors and locations
	var colorsAndLocations: [(NSColor, CGFloat)] = [(NSColor.blue.blended(withFraction: 0.6, of: NSColor.white)!, 0.0), (NSColor.blue, 1.0)]
	/// If colorsAndLocations is not used this array will be used along with the locations array
	let colors = [NSColor.cyan, NSColor.blue]
	/// If colorsAndLocations is not used this array will be used along with the colors array
	let locations: [CGFloat] = [0.0, 1.0]
	/// Angle of gradient (degrees from horzion)
	@IBInspectable var gradientAngle: CGFloat = 90
	/// Shadow for title
	@IBInspectable var titleShadowColor: NSColor?
	@IBInspectable var titleShadowOffset: CGSize = CGSize.zero
	@IBInspectable var titleShadowOpacity: CGFloat = 0
	@IBInspectable var titleShadowRadius: CGFloat = 0
	/// Drop-shadow
	@IBInspectable var shadowColor: CGColor?
	@IBInspectable var shadowOffset: CGSize = CGSize.zero
	@IBInspectable var shadowOpacity: Float = 0
	@IBInspectable var shadowRadius: CGFloat = 0
	
	override func draw(_ dirtyRect: NSRect) {
		self.wantsLayer = true
		self.isBordered = false
		
		self.layer?.cornerRadius = self.cornerRadius
		let context = NSGraphicsContext.current?.cgContext
		if shadowRadius > 0 {
			self.layer?.masksToBounds = false
			self.layer?.shadowColor = shadowColor
			self.layer?.shadowPath = CGPath(roundedRect: dirtyRect, cornerWidth: self.cornerRadius, cornerHeight: self.cornerRadius, transform: nil)
			self.layer?.shadowOffset = shadowOffset
			self.layer?.shadowOpacity = shadowOpacity
			self.layer?.shadowRadius = shadowRadius
		}
		if titleShadowRadius > 0, var color = titleShadowColor {
			if titleShadowOpacity > 0 {
				color = color.withAlphaComponent(titleShadowOpacity)
			}
			context?.setShadow(offset: titleShadowOffset, blur: titleShadowRadius, color: color.cgColor)
		}
		let path = NSBezierPath(roundedRect: dirtyRect, xRadius: self.cornerRadius, yRadius: self.cornerRadius)
		if let gradient = NSGradient(colors: colorsAndLocations.map{$0.0}, atLocations: colorsAndLocations.map{$0.1}, colorSpace: NSColorSpace.genericRGB) ?? NSGradient(colors: colors, atLocations: locations, colorSpace: NSColorSpace.genericRGB) {
			gradient.draw(in: path, angle: gradientAngle)
		}
		attributedTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor : self.titleColor, NSAttributedString.Key.font : self.font ?? NSFont.boldSystemFont(ofSize: 13)])
		if let color = self.borderColor {
			self.layer?.borderColor = color.cgColor
		}
		self.layer?.borderWidth = self.borderWidth
		if #available(OSX 10.12, *) {
			imagePosition = .imageLeading
		} else {
			// Fallback on earlier versions
		}
		if let imageName = imageName {
			if !imageName.isEmpty {
				image = NSImage(named: imageName)
			}
		}
		let originalBounds = self.bounds
		defer { self.bounds = originalBounds }
		self.bounds = originalBounds.insetBy(
			dx: dxPadding, dy: dyPadding
		)
		
		super.draw(dirtyRect)
	}
	
}
#endif
