import UIKit

/// A property wrapper that notifies the system that a property value change has invalidated an aspect of the containing view.
///
/// See [Apple Docs](https://developer.apple.com/documentation/uikit/uiview/invalidating) for more details.
@propertyWrapper public struct Invalidates<Value> {
    public static subscript<Instance: UIView>(
        _enclosingInstance instance: Instance,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<Instance, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<Instance, Self>
    ) -> Value {
        get { instance[keyPath: storageKeyPath].wrappedValue }
        set {
            instance[keyPath: storageKeyPath].wrappedValue = newValue
            for invalidate in instance[keyPath: storageKeyPath].invalidations {
                invalidate(instance)
            }
        }
    }

	/// - Note: Array of the ``UIViewInvalidates/invalidate(view:)`` function pointers
	///			to avoid needing to store as `[any UIViewInvalidates]`. Luckily the protocol
	///			is only a single function contract so can be represented like this as it is largely
	///			valueless once declared.
    private let invalidations: [(UIView) -> Void]

    public var wrappedValue: Value

    public init<FirstInvalidation, each AdditionalInvalidation>(
        wrappedValue: Value,
        _ firstInvalidation: FirstInvalidation,
        _ additionalInvalidations: repeat each AdditionalInvalidation
    ) where FirstInvalidation: UIViewInvalidates, repeat each AdditionalInvalidation: UIViewInvalidates {
        self.wrappedValue = wrappedValue
        var invalidations: [(UIView) -> Void] = [
            firstInvalidation.invalidate(view:)
        ]
        repeat invalidations.append((each additionalInvalidations).invalidate(view:))
        self.invalidations = invalidations
    }
}
