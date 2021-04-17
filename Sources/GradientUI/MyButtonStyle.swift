//
//  MyButtonStyle.swift
//  
//
//  Created by Yuma Technical Inc. on 2021-04-17.
//

#if canImport(AppKit)
import AppKit


enum MyButtonStyle {
	case delete, normal, custom(backgroundColor: NSColor?, borderColor: NSColor?, borderThickness: CGFloat?, cornerRadius: CGFloat? , shadowColor: NSColor?, shadowOffset: CGSize?, shadowOpacity: Float?, shadowRadius: CGFloat?, titleColor: NSColor?, titleColorHighlighted: NSColor?, titleFont: NSFont?, titleShadowColor: CGColor?, titleShadowOffset: CGSize?, titleShadowRadius: CGFloat?, titleShadowOpacity: Float?)
	case action
	
	var backgroundColor: NSColor {
		switch self {
			case .delete:
				return NSColor.red.withAlphaComponent(0.75)
			case .normal:
				return NSColor.blue//.My.blueApple
			case .custom(let backgroundColor, _, _, _, _, _, _, _, _, _, _, _, _, _, _):
				return backgroundColor ?? NSColor.blue//.My.blueApple
			case .action:
				return NSColor.blue//.My.blueApple
		}
	}
	var borderColor: NSColor {
		switch self {
			case .delete:
				return NSColor.red
			case .normal:
				return NSColor.blue
			case .custom(_, let borderColor, _, _, _, _, _, _, _, _, _, _, _, _, _):
				return borderColor ?? NSColor.blue
			case .action:
				return NSColor.blue
		}
	}
	var borderThickness: CGFloat {
		switch self {
			case .delete:
				return 2
			case .normal:
				return 0.5
			case .custom(_, _, let borderThickness, _, _, _, _, _, _, _, _, _, _, _, _):
				return borderThickness ?? 0.5
			case .action:
				return 0.5
		}
	}
	var cornerRadius: CGFloat {
		switch self {
			case .delete:
				return 5
			case .normal:
				return 5
			case .custom(_, _, _, let cornerRadius, _, _, _, _, _, _, _, _, _, _, _):
				return cornerRadius ?? 5
			case .action:
				return 5
		}
	}
	var shadowColor: NSColor {
		switch self {
			case .delete:
				return NSColor.darkGray
			case .normal:
				return NSColor.darkGray
			case .custom(_, _, _, _, let shadowColor, _, _, _, _, _, _, _, _, _, _):
				return shadowColor ?? NSColor.darkGray
			case .action:
				return NSColor.darkGray
		}
	}
	var shadowOffset: CGSize {
		switch self {
			case .delete:
				return CGSize(width: 2, height: 2)
			case .normal:
				return CGSize(width: 2, height: 3)
			case .custom(_, _, _, _, _, let shadowOffset, _, _, _, _, _, _, _, _, _):
				return shadowOffset ?? CGSize(width: 2, height: 2)
			case .action:
				return CGSize(width: 2, height: 3)
		}
	}
	var shadowOpacity: Float {
		switch self {
			case .delete:
				return 0.8
			case .normal:
				return 0.8
			case .custom(_, _, _, _, _, _, let shadowOpacity, _, _, _, _, _, _, _, _):
				return shadowOpacity ?? 0.8
			case .action:
				return 0.8
		}
	}
	var shadowRadius: CGFloat {
		switch self {
			case .delete:
				return 2
			case .normal:
				return 2
			case .custom(_, _, _, _, _, _, _, let shadowRadius, _, _, _, _, _, _, _):
				return shadowRadius ?? 2
			case .action:
				return 2
		}
	}
	var titleColor: NSColor {
		switch self {
			case .delete:
				return NSColor.yellow.withAlphaComponent(0.75)
			case .normal:
				return NSColor.white
			case .custom(_, _, _, _, _, _, _, _, let titleColor, _, _, _, _, _, _):
				return titleColor ?? NSColor.white
			case .action:
				return NSColor.white
		}
	}
	var titleColorHighlighted: NSColor {
		switch self {
			case .delete:
				return NSColor.white
			case .normal:
				return NSColor.white
			case .custom(_, _, _, _, _, _, _, _, _, let titleColorHighlighted, _, _, _, _, _):
				return titleColorHighlighted ?? NSColor.white
			case .action:
				return NSColor.white
		}
	}
	var titleFont: NSFont {
		switch self {
			case .delete:
				return NSFont.boldSystemFont(ofSize: 17)
			case .normal:
				return NSFont.boldSystemFont(ofSize: 17)
			case .custom(_, _, _, _, _, _, _, _, _, _, let titleFont, _, _, _, _):
				return titleFont ?? NSFont.boldSystemFont(ofSize: 17)
			case .action:
				return NSFont.boldSystemFont(ofSize: 18)
		}
	}
	var titleShadowColor: CGColor {
		switch self {
			case .delete:
				return NSColor.darkGray.withAlphaComponent(0.75).cgColor
			case .normal:
				return NSColor.darkGray.withAlphaComponent(0.75).cgColor
			case .custom(_, _, _, _, _, _, _, _, _, _, _, let titleShadowColor, _, _, _):
				return titleShadowColor ?? NSColor.darkGray.withAlphaComponent(0.75).cgColor
			case .action:
				return NSColor.darkGray.withAlphaComponent(0.8).cgColor
		}
	}
	var titleShadowOffset: CGSize {
		switch self {
			case .delete:
				return CGSize(width: 2, height: 2)
			case .normal:
				return CGSize(width: 2, height: 2)
			case .custom(_, _, _, _, _, _, _, _, _, _, _, _, let titleShadowOffset, _, _):
				return titleShadowOffset ?? CGSize(width: 2, height: 2)
			case .action:
				return CGSize(width: 0, height: 0)
		}
	}
	var titleShadowRadius: CGFloat {
		switch self {
			case .delete:
				return 2
			case .normal:
				return 2
			case .custom(_, _, _, _, _, _, _, _, _, _, _, _, _, let titleShadowRadius, _):
				return titleShadowRadius ?? 2
			case .action:
				return 2
		}
	}
	var titleShadowOpacity: Float {
		switch self {
			case .delete:
				return 0.5
			case .normal:
				return 0.5
			case .custom(_, _, _, _, _, _, _, _, _, _, _, _, _, _, let titleShadowOpacity):
				return titleShadowOpacity ?? 0.5
			case .action:
				return 0.8
		}
	}
}
#endif
