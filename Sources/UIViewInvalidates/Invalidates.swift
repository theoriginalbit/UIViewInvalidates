import UIKit

/// A property wrapper that notifies the system that a property value change has invalidated an aspect of the containing view.
///
/// See [Apple Docs](https://developer.apple.com/documentation/uikit/uiview/invalidating) for more details.
@available(iOS 17, *)
@propertyWrapper public struct Invalidates<Value, each InvalidationType> where repeat each InvalidationType: UIViewInvalidates {
    public static subscript<Instance: UIView>(
        _enclosingInstance instance: Instance,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<Instance, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<Instance, Self>
    ) -> Value {
        get { instance[keyPath: storageKeyPath].wrappedValue }
        set {
            var propertyWrapperInstance = instance[keyPath: storageKeyPath]
            propertyWrapperInstance.wrappedValue = newValue
            (each propertyWrapperInstance.invalidation).invalidate(view: instance)
        }
    }

    public let invalidation: (repeat each InvalidationType)

    public var wrappedValue: Value

    public init(wrappedValue: Value, _ invalidation: repeat each InvalidationType) {
        self.wrappedValue = wrappedValue
        self.invalidation = (repeat each invalidation)
    }
}
