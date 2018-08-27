////
////  Gradients.swift
////  wallet
////
////  Created by Thongpak on 20/8/2561 BE.
////  Copyright © 2561 thongpak. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//extension UIColor {
//    convenience init(_ hex: UInt) {
//        self.init(
//            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(hex & 0x0000FF) / 255.0,
//            alpha: CGFloat(1.0)
//        )
//    }
//}
//
//typealias GradientType = (x: CGPoint, y: CGPoint)
//
//enum GradientPoint {
//    case leftRight
//    case rightLeft
//    case topBottom
//    case bottomTop
//    case topLeftBottomRight
//    case bottomRightTopLeft
//    case topRightBottomLeft
//    case bottomLeftTopRight
//
//    func draw() -> GradientType {
//        switch self {
//        case .leftRight:
//            return (x: CGPoint(x: 0, y: 0.5), y: CGPoint(x: 1, y: 0.5))
//        case .rightLeft:
//            return (x: CGPoint(x: 1, y: 0.5), y: CGPoint(x: 0, y: 0.5))
//        case .topBottom:
//            return (x: CGPoint(x: 0.5, y: 0), y: CGPoint(x: 0.5, y: 1))
//        case .bottomTop:
//            return (x: CGPoint(x: 0.5, y: 1), y: CGPoint(x: 0.5, y: 0))
//        case .topLeftBottomRight:
//            return (x: CGPoint(x: 0, y: 0), y: CGPoint(x: 1, y: 1))
//        case .bottomRightTopLeft:
//            return (x: CGPoint(x: 1, y: 1), y: CGPoint(x: 0, y: 0))
//        case .topRightBottomLeft:
//            return (x: CGPoint(x: 1, y: 0), y: CGPoint(x: 0, y: 1))
//        case .bottomLeftTopRight:
//            return (x: CGPoint(x: 0, y: 1), y: CGPoint(x: 1, y: 0))
//        }
//    }
//}
//
//class GradientLayer : CAGradientLayer {
//    var gradient: GradientType? {
//        didSet {
//            startPoint = gradient?.x ?? CGPoint.zero
//            endPoint = gradient?.y ?? CGPoint.zero
//        }
//    }
//}
//
//class GradientView: UIView {
//    override public class var layerClass: Swift.AnyClass {
//        get {
//            return GradientLayer.self
//        }
//    }
//}
//
//protocol GradientViewProvider {
//    associatedtype GradientViewType
//}
//
//extension GradientViewProvider where Self: UIView {
//    var gradientLayer: Self.GradientViewType {
//        return layer as! Self.GradientViewType
//    }
//}
//
//extension UIView: GradientViewProvider {
//    typealias GradientViewType = GradientLayer
//}
