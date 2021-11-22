//
//  File.swift
//  
//
//  Created by Daniel Zanchi on 22/11/21.
//

import UIKit

extension UIView {
    
    func addRadius(of radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    func addBorder(ofColor borderColor: UIColor = .black, borderWidth: CGFloat = 1) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    func addFullRadius() {
        self.addRadius(of: self.frame.height / 2)
    }
    
    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    func addDefaultShadowAndFullRadius() {
        self.addRadius(of: self.frame.height / 2)
        self.addShadow(offset: CGSize(width: 0, height: 0),
                       color: .black,
                       opacity: 0.4,
                       radius: 6)
    }
    
    func addShadowAndCorner(_ radius: CGFloat = 8) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 1
        self.layer.masksToBounds = false
    }
    
    func addLineDashedStroke(pattern: [NSNumber]? = [4, 4], radius: CGFloat, color: CGColor, lineWidh: CGFloat = 3) {
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
    
    func removeLineDashedStroke() {
        self.layer.sublayers?
            .filter { $0.name == "lineDashedStroke" }
            .forEach { $0.removeFromSuperlayer() }
    }
}

extension UIView {
    func addGesture(selector: Selector, target: UIViewController) {
        let tapGesture = UITapGestureRecognizer(target: target, action: selector)
        self.addGestureRecognizer(tapGesture)
    }
}

extension UIView {
    
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
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
    
    func sameConstraints(as view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func centerInSuperView() {
        if let superview = self.superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        }
    }
    
    func makeSize(width: CGFloat, height: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true

    }
}


//MARK:- Animations
extension UIView {
    
    func tapBounce() {
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
    
    func applyGradient(colors: [UIColor]) -> Void {
        self.applyGradient(colors: colors, locations: nil)
    }
    
    func applyGradient(colors: [UIColor], locations: Location?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.cornerRadius = self.layer.cornerRadius
        gradient.colors = colors.map { $0.cgColor }
        
        switch locations {
        case .fromTopRightToBottomLeft:
            gradient.startPoint = CGPoint(x: 1, y: 0)
            gradient.endPoint = CGPoint(x: 0, y: 1)
        default:
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 0, y: 1)
        }
        self.layer.insertSublayer(gradient, at: 0)
        
        
        if let button = self as? UIButton, let imageView = button.imageView {
            button.bringSubviewToFront(imageView)
        }
    }
    
    enum Location {
        case fromTopRightToBottomLeft
    }
    
}

