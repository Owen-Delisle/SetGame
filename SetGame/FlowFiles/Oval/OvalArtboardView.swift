// Made With Flow.
//
// DO NOT MODIFY, your changes will be lost when this file is regenerated.
//

import UIKit

@IBDesignable
public class OvalArtboardView: UIView {
    public struct Defaults {
        public static let size = CGSize(width: 50, height: 25)
        public static let backgroundColor = UIColor(red: 0.557, green: 0.835, blue: 0.965, alpha: 1)
    }

    public var rectangle: ShapeView!

    public override var intrinsicContentSize: CGSize {
        return Defaults.size
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = Defaults.backgroundColor
        createViews()
        addSubviews()
        //scale(to: frame.size)
    }

    /// Scales `self` and its subviews to `size`.
    ///
    /// - Parameter size: The size `self` is scaled to.
    ///
    /// UIKit specifies: "In iOS 8.0 and later, the transform property does not affect Auto Layout. Auto layout
    /// calculates a view's alignment rectangle based on its untransformed frame."
    ///
    /// see: https://developer.apple.com/documentation/uikit/uiview/1622459-transform
    ///
    /// If there are any constraints in IB affecting the frame of `self`, this method will have consequences on
    /// layout / rendering. To properly scale an animation, you will have to position the view manually.
    public func scale(to size: CGSize) {
        let x = size.width / Defaults.size.width
        let y = size.height / Defaults.size.height
        transform = CGAffineTransform(scaleX: x, y: y)
    }

    private func createViews() {
        CATransaction.suppressAnimations {
            createRectangle()
        }
    }

    private func createRectangle() {
        rectangle = ShapeView(frame: CGRect(x: 25.13, y: 13.1, width: 46.3, height: 17.56))
        rectangle.backgroundColor = UIColor.clear
        rectangle.layer.shadowOffset = CGSize(width: 0, height: 0)
        rectangle.layer.shadowColor = UIColor.clear.cgColor
        rectangle.layer.shadowOpacity = 1
        rectangle.layer.position = CGPoint(x: 25.13, y: 13.1)
        rectangle.layer.bounds = CGRect(x: 0, y: 0, width: 46.3, height: 17.56)
        rectangle.layer.masksToBounds = false
        rectangle.shapeLayer.fillRule = CAShapeLayerFillRule.evenOdd
        rectangle.shapeLayer.strokeColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 0).cgColor
        rectangle.shapeLayer.fillColor = UIColor(red: 0.976, green: 0.059, blue: 0.443, alpha: 1).cgColor
        rectangle.shapeLayer.lineDashPattern = []
        rectangle.shapeLayer.lineDashPhase = 0
        rectangle.shapeLayer.lineWidth = 1
        rectangle.shapeLayer.path = CGPathCreateWithSVGString("M-0,8.78c-0,-4.817,3.963,-8.78,8.78,-8.78l28.74,0c4.817,0,8.78,3.963,8.78,8.78l0,0c0,4.817,-3.963,8.78,-8.78,8.78l-28.74,0c-4.817,0,-8.78,-3.963,-8.78,-8.78 -0,-0,0,-0,0,-0l0,-0zM-0,8.78")!

    }

    private func addSubviews() {
        addSubview(rectangle)
    }
}
