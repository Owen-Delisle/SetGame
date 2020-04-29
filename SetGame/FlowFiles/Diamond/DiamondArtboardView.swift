// Made With Flow.
//
// DO NOT MODIFY, your changes will be lost when this file is regenerated.
//

import UIKit

@IBDesignable
public class DiamondArtboardView: UIView {
    public struct Defaults {
        public static let size = CGSize(width: 75, height: 25)
        public static let backgroundColor = UIColor(red: 0.557, green: 0.835, blue: 0.965, alpha: 1)
    }

    public var path2: ShapeView!

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
            createPath2()
        }
    }

    private func createPath2() {
        path2 = ShapeView(frame: CGRect(x: 38.43, y: 12.5, width: 67.9, height: 22.62))
        path2.backgroundColor = UIColor.clear
        path2.layer.shadowOffset = CGSize(width: 0, height: 0)
        path2.layer.shadowColor = UIColor.clear.cgColor
        path2.layer.shadowOpacity = 1
        path2.layer.position = CGPoint(x: 38.43, y: 12.5)
        path2.layer.bounds = CGRect(x: 0, y: 0, width: 67.9, height: 22.62)
        path2.layer.masksToBounds = false
        path2.shapeLayer.fillRule = CAShapeLayerFillRule.evenOdd
        path2.shapeLayer.strokeColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 0).cgColor
        path2.shapeLayer.fillColor = UIColor(red: 0.976, green: 0.059, blue: 0.443, alpha: 1).cgColor
        path2.shapeLayer.lineDashPattern = []
        path2.shapeLayer.lineDashPhase = 0
        path2.shapeLayer.lineWidth = 1
        path2.shapeLayer.path = CGPathCreateWithSVGString("M-0.002,11.31l33.021,-11.31 34.879,11.31 -33.95,11.31 -33.95,-11.31zM-0.002,11.31")!

    }

    private func addSubviews() {
        addSubview(path2)
    }
}
