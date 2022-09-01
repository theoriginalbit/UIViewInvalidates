import UIKit

/// A property wrapper that notifies the system that a property value change has invalidated an aspect of the containing view.
///
/// See [Apple Docs](https://developer.apple.com/documentation/uikit/uiview/invalidating) for more details.
@propertyWrapper public struct Invalidates<Value, InvalidationType> where InvalidationType: UIViewInvalidates {
    public static subscript<Instance: UIView>(
        _enclosingInstance instance: Instance,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<Instance, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<Instance, Self>
    ) -> Value {
        get { instance[keyPath: storageKeyPath].wrappedValue }
        set {
            instance[keyPath: storageKeyPath].wrappedValue = newValue
            instance[keyPath: storageKeyPath].invalidation.invalidate(view: instance)
        }
    }

    public let invalidation: InvalidationType

    public var wrappedValue: Value

    public init(wrappedValue: Value, _ invalidation: InvalidationType) {
        self.wrappedValue = wrappedValue
        self.invalidation = invalidation
    }

    public init<InvalidationType1, InvalidationType2>(
        wrappedValue: Value,
        _ invalidation1: InvalidationType1,
        _ invalidation2: InvalidationType2
    ) where InvalidationType == UIView.Invalidation.Tuple<InvalidationType1, InvalidationType2>, InvalidationType1: UIViewInvalidates, InvalidationType2: UIViewInvalidates
    {
        self.wrappedValue = wrappedValue
        invalidation = UIView.Invalidation.Tuple(
            invalidation1,
            invalidation2
        )
    }

    public init<InvalidationType1, InvalidationType2, InvalidationType3>(
        wrappedValue: Value,
        _ invalidation1: InvalidationType1,
        _ invalidation2: InvalidationType2,
        _ invalidation3: InvalidationType3
    ) where InvalidationType == UIView.Invalidation.Tuple<InvalidationType1, UIView.Invalidation.Tuple<InvalidationType2, InvalidationType3>>, InvalidationType1: UIViewInvalidates, InvalidationType2: UIViewInvalidates, InvalidationType3: UIViewInvalidates
    {
        self.wrappedValue = wrappedValue
        invalidation = UIView.Invalidation.Tuple(
            invalidation1,
            UIView.Invalidation.Tuple(
                invalidation2,
                invalidation3
            )
        )
    }

    public init<InvalidationType1, InvalidationType2, InvalidationType3, InvalidationType4>(
        wrappedValue: Value,
        _ invalidation1: InvalidationType1,
        _ invalidation2: InvalidationType2,
        _ invalidation3: InvalidationType3,
        _ invalidation4: InvalidationType4
    ) where InvalidationType == UIView.Invalidation.Tuple<InvalidationType1, UIView.Invalidation.Tuple<InvalidationType2, UIView.Invalidation.Tuple<InvalidationType3, InvalidationType4>>>, InvalidationType1: UIViewInvalidates, InvalidationType2: UIViewInvalidates, InvalidationType3: UIViewInvalidates, InvalidationType4: UIViewInvalidates
    {
        self.wrappedValue = wrappedValue
        invalidation = UIView.Invalidation.Tuple(
            invalidation1,
            UIView.Invalidation.Tuple(
                invalidation2,
                UIView.Invalidation.Tuple(
                    invalidation3,
                    invalidation4
                )
            )
        )
    }

    public init<InvalidationType1, InvalidationType2, InvalidationType3, InvalidationType4, InvalidationType5>(
        wrappedValue: Value,
        _ invalidation1: InvalidationType1,
        _ invalidation2: InvalidationType2,
        _ invalidation3: InvalidationType3,
        _ invalidation4: InvalidationType4,
        _ invalidation5: InvalidationType5
    ) where InvalidationType == UIView.Invalidation.Tuple<InvalidationType1, UIView.Invalidation.Tuple<InvalidationType2, UIView.Invalidation.Tuple<InvalidationType3, UIView.Invalidation.Tuple<InvalidationType4, InvalidationType5>>>>, InvalidationType1: UIViewInvalidates, InvalidationType2: UIViewInvalidates, InvalidationType3: UIViewInvalidates, InvalidationType4: UIViewInvalidates, InvalidationType5: UIViewInvalidates
    {
        self.wrappedValue = wrappedValue
        invalidation = UIView.Invalidation.Tuple(
            invalidation1,
            UIView.Invalidation.Tuple(
                invalidation2,
                UIView.Invalidation.Tuple(
                    invalidation3,
                    UIView.Invalidation.Tuple(
                        invalidation4,
                        invalidation5
                    )
                )
            )
        )
    }
}
