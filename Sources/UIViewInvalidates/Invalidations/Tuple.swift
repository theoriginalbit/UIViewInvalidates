import UIKit

public extension UIView.Invalidation {
    /// A change that invalidates a combination of factors covered by the other invalidation types.
    ///
    /// The system uses this type when a change invalidates multiple aspects of a view. Use a tuple of the static values defined in `UIViewInvalidates` when more than one invalidation type applies to a change.
    ///
    /// In iOS 15 this is `UIView.Invalidations.Tuple`
    struct Tuple<Invalidation1, Invalidation2>: UIViewInvalidates where Invalidation1: UIViewInvalidates, Invalidation2: UIViewInvalidates {
        private let invalidation1: Invalidation1
        private let invalidation2: Invalidation2

        /// Creates an invalidation structure with multiple invalidations.
        public init(_ invalidation1: Invalidation1, _ invalidation2: Invalidation2) {
            self.invalidation1 = invalidation1
            self.invalidation2 = invalidation2
        }

        public func invalidate(view: UIView) {
            invalidation1.invalidate(view: view)
            invalidation2.invalidate(view: view)
        }
    }
}
