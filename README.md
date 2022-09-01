# UIViewInvalidates

This is a reverse-engineered implementation of iOS 15's [`@Invalidating`](https://developer.apple.com/documentation/uikit/uiview/invalidating) but for earlier versions of iOS.

Apple's implementation would additionally include initializers accepting 6 through 10 invalidation parameters, even though there are only a total of 5 invalidations provided. This is due to their usage of a script to generate initializers for types that wish to use variadic generics. Presumably once support for variadic generics has been implemented within Swift this would be massively simplified. This repository foregoes including the additional initializers since there are only 5 possible invalidations and invoking an invalidation multiple times would be pointless.

## Example usage

```swift
class MyView: UIView {
    @Invalidates(.display) var badgeColor: UIColor = .red

    @Invalidates(.display, .layout) var badgePosition: UIRectEdge = [.top, .bottom]
}
```
