import UIKit

public extension UIView.Invalidation {
    /// A change that requires the system to redraw a view’s content.
    ///
    /// In iOS 15 this is `UIView.Invalidations.Display`
    struct Display: UIViewInvalidates {
        public func invalidate(view: UIView) {
            view.setNeedsDisplay()
        }
    }
}

public extension UIViewInvalidates where Self == UIView.Invalidation.Display {
    /// A change that requires the system to redraw a view’s content.
    ///
    /// Use this invalidation type to call `setNeedsDisplay()` when a change in property value should cause the system to redraw the containing view’s content.
    static var display: Self {
        Self()
    }
}
