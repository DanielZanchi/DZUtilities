//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 22/11/21.
//

#if canImport(UIKit)
import UIKit

extension UIView {
    
    public func addRadius(of radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    public func addRadius(of radius: CGFloat, to CACornersMask: CACornerMask) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [CACornersMask]
    }
    
    public func addBorder(ofColor borderColor: UIColor = .black, borderWidth: CGFloat = 1) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    public func addFullRadius() {
        self.addRadius(of: self.frame.height / 2)
    }
    
    public func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    public func addDefaultShadowAndFullRadius() {
        self.addRadius(of: self.frame.height / 2)
        self.addShadow(offset: CGSize(width: 0, height: 0),
                       color: .black,
                       opacity: 0.4,
                       radius: 6)
    }
    
    public func addShadowAndCorner(_ radius: CGFloat = 8) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 1
        self.layer.masksToBounds = false
    }
    
    public func addLineDashedStroke(pattern: [NSNumber]? = [4, 4], radius: CGFloat, color: CGColor, lineWidh: CGFloat = 3) {
        let borderLayer = CAShapeLayer()
        borderLayer.name = "lineDashedStroke"
        borderLayer.strokeColor = color
        borderLayer.lineWidth = lineWidh
        borderLayer.lineDashPattern = pattern
        borderLayer.frame = bounds
        borderLayer.fillColor = nil
        borderLayer.lineCap = .round
        borderLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        
        layer.addSublayer(borderLayer)
    }
    
    public func removeLineDashedStroke() {
        self.layer.sublayers?
            .filter { $0.name == "lineDashedStroke" }
            .forEach { $0.removeFromSuperlayer() }
    }
}

extension UIView {
    public func addGesture(selector: Selector, target: Any?) {
        let tapGesture = UITapGestureRecognizer(target: target, action: selector)
        self.addGestureRecognizer(tapGesture)
    }
}

extension UIView {
    
    public func asImage(withScale scale: CGFloat = UIScreen.main.scale) -> UIImage? {
        let format = UIGraphicsImageRendererFormat()
        format.scale = scale
        let renderer = UIGraphicsImageRenderer(bounds: bounds, format: format)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}


//MARK:- Constraints
extension UIView {
    
    public func sameConstraints(as view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    public func sameConstraints(as view: UIView, minus: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: minus).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -minus).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: minus).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -minus).isActive = true
    }
    
    public func centerInSuperView() {
        if let superview = self.superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        }
    }
    
    public func makeSize(width: CGFloat, height: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true

    }
}


//MARK:- Animations
extension UIView {
    
    public func tapBounce() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseInOut, animations: {
                self.transform = CGAffineTransform(scaleX: 0.84, y: 0.84)
            }) { (_) in
                UIView.animate(withDuration: 0.7, delay: 0.05, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
                        self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                })
            }
        }
    }
    
}

extension UIView {
    
    public func applyGradient(colors: [UIColor]) -> Void {
        self.applyGradient(colors: colors, locations: nil)
    }
    
    public func applyGradient(colors: [UIColor], locations: Location?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.cornerRadius = self.layer.cornerRadius
        gradient.colors = colors.map { $0.cgColor }
        
        switch locations {
        case .fromTopRightToBottomLeft:
            gradient.startPoint = CGPoint(x: 1, y: 0)
            gradient.endPoint = CGPoint(x: 0, y: 1)
        case .fromTopToBottom:
            gradient.startPoint = CGPoint(x: 0.5, y: 0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1)
        default:
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 0, y: 1)
        }
        self.layer.insertSublayer(gradient, at: 0)
        
        
        if let button = self as? UIButton, let imageView = button.imageView {
            button.bringSubviewToFront(imageView)
        }
    }
    
    public enum Location {
        case fromTopToBottom
        case fromTopRightToBottomLeft
    }
    
}
#endif
