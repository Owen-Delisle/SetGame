// Made With Flow.
//
// DO NOT MODIFY, your changes will be lost when this file is regenerated.
//

import UIKit

@IBDesignable
public class SquiggleArtboardView: UIView {
    public struct Defaults {
        public static let size = CGSize(width: 75, height: 25)
        public static let backgroundColor = UIColor(red: 0.557, green: 0.835, blue: 0.965, alpha: 1)
    }

    public var path: ShapeView!

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
            createPath()
        }
    }

    private func createPath() {
        path = ShapeView(frame: CGRect(x: 37.47, y: 12.5, width: 65.42, height: 20.83))
        path.backgroundColor = UIColor.clear
        path.layer.shadowOffset = CGSize(width: 0, height: 0)
        path.layer.shadowColor = UIColor.clear.cgColor
        path.layer.shadowOpacity = 1
        path.layer.position = CGPoint(x: 37.47, y: 12.5)
        path.layer.bounds = CGRect(x: 0, y: 0, width: 65.42, height: 20.83)
        path.layer.masksToBounds = false
        path.shapeLayer.fillRule = CAShapeLayerFillRule.evenOdd
        path.shapeLayer.strokeColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 0.016).cgColor
        path.shapeLayer.fillColor = UIColor(red: 0.976, green: 0.059, blue: 0.443, alpha: 1).cgColor
        path.shapeLayer.lineDashPattern = []
        path.shapeLayer.lineDashPhase = 0
        path.shapeLayer.lineWidth = 1
        path.shapeLayer.path = CGPathCreateWithSVGString("M2.246,20.83c0,0,-2.677,-6.193,-2.166,-8.778 0.511,-2.586,5.119,-6.154,5.119,-6.154 0,0,2.736,-3.121,4.692,-4.168 1.956,-1.047,6.326,-1.73,6.326,-1.73l15.524,5.898 9.298,4.517 16.445,-7.142c0,0,3.889,1.576,5.399,2.625 1.511,1.049,2.534,2.883,2.534,2.883l-2.534,6.876 -5.399,5.174 -16.445,0 -18.866,-7.106 -3.632,5.583 -8.65,1.523 -7.646,0zM2.246,20.83")!

    }

    private func addSubviews() {
        addSubview(path)
    }
}
