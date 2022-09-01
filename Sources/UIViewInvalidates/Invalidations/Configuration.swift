import UIKit

public extension UIView.Invalidation {
    /// A change that invalidates a view’s configuration.
    ///
    /// In iOS 15 this is `UIView.Invalidations.Configuration`
    struct Configuration: UIViewInvalidates {
        /// Creates a configuration invalidation structure.
        public init() {}

        public func invalidate(view: UIView) {
            switch view {
            case let button as UIButton:
                if #available(iOS 15.0, *) {
                    button.setNeedsUpdateConfiguration()
                }
            case let cell as UICollectionViewCell:
                if #available(iOS 14.0, *) {
                    cell.setNeedsUpdateConfiguration()
                }
            case let cell as UITableViewCell:
                if #available(iOS 14.0, *) {
                    cell.setNeedsUpdateConfiguration()
                }
            case let view as UITableViewHeaderFooterView:
                if #available(iOS 14.0, *) {
                    view.setNeedsUpdateConfiguration()
                }
            default:
                break // Unhandled type. If legitimate missed report on GitHub.
            }
        }
    }
}

public extension UIViewInvalidates where Self == UIView.Invalidation.Configuration {
    /// A change that invalidates a view’s configuration.
    ///
    /// Use this invalidation type to call setNeedsUpdateConfiguration() when a change in property value should cause the containing view to update the configuration.
    ///
    /// - Note: You only use this invalidation type on `UIView` subclasses that support a configuration pattern, using `setNeedsUpdateConfiguration()` and `updateConfiguration()` pattern. For example, use this type on `UIButton`, `UICollectionViewCell`, `UITableViewCell`, or `UITableViewHeaderFooterView`. This type has no effect on `UIView` subclasses that don’t use a configuration pattern.
    static var configuration: Self {
        Self()
    }
}
