import UIKit

/// Implements a type of invalidation that can occur on a view that requires an update.
///
/// In iOS 15 this is `UIViewInvalidating`
public protocol UIViewInvalidates {
    /// Indicates to the system that an aspect of a view is invalid and triggers the necessary update.
    ///
    /// - Parameter view: The view that requires invalidating.
    func invalidate(view: UIView)
}
