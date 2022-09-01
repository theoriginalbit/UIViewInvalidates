import UIKit

public extension UIView.Invalidation {
    /// A change that invalidates the layout of the containing view’s subviews.
    ///
    /// In iOS 15 this is `UIView.Invalidations.Layout`
    struct Layout: UIViewInvalidates {
        public func invalidate(view: UIView) {
            view.setNeedsLayout()
        }
    }
}

public extension UIViewInvalidates where Self == UIView.Invalidation.Layout {
    /// A change that invalidates the layout of the containing view’s subviews.
    ///
    /// Use this invalidation type to call `setNeedsLayout()` when a change in property value should cause an update to the layout of the containing view’s subviews.
    static var layout: Self {
        Self()
    }
}
