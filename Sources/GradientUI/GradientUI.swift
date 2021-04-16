//struct GradientUI {
//    var text = "Hello, World!"
//}

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
