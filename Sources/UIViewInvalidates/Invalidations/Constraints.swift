import UIKit

public extension UIView.Invalidation {
    /// A change that invalidates a view’s constraints.
    ///
    /// In iOS 15 this is `UIView.Invalidations.Constraints`
    struct Constraints: UIViewInvalidates {
        public func invalidate(view: UIView) {
            view.setNeedsUpdateConstraints()
        }
    }
}

public extension UIViewInvalidates where Self == UIView.Invalidation.Constraints {
    /// A change that invalidates a view’s constraints.
    ///
    /// Use this invalidation type to call `setNeedsUpdateConstraints()` when a change in property value should cause the containing view to update constraints.
    static var constraints: Self {
        Self()
    }
}
