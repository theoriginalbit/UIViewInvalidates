import UIKit

public extension UIView.Invalidation {
    /// A change that invalidates a view’s intrinsic size.
    ///
    /// In iOS 15 this is `UIView.Invalidations.IntrinsicContentSize`
    struct IntrinsicContentSize: UIViewInvalidates {
        public func invalidate(view: UIView) {
            view.invalidateIntrinsicContentSize()
        }
    }
}

public extension UIViewInvalidates where Self == UIView.Invalidation.IntrinsicContentSize {
    /// A change that invalidates a view’s intrinsic size.
    ///
    /// Use this type of invalidation type to call `invalidateIntrinsicContentSize()` when a change in property value invalidates the containing view’s intrinsic content size. When you use this type, the constraint-based layout system accounts for the change the next time it updates the layout.
    static var intrinsicContentSize: Self {
        Self()
    }
}
