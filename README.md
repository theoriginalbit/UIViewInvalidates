# UIViewInvalidates

This is a reverse-engineered implementation of iOS 15's [`@Invalidating`](https://developer.apple.com/documentation/uikit/uiview/invalidating) but for earlier versions of iOS. 

> [!NOTE]
> One key difference is that the Apple implementation provides multiple initializers accepting 1 through to 10 invalidation parameters, even though there are only 5 possible invalidations; presumably this is because they use a script to generate initializers for types that wish to use variadic generics. This implementation uses the "new" Swift parameter packs and variadic generics to reduce on the boilerplate.

## Example usage

```swift
class MyView: UIView {
    @Invalidates(.display) var badgeColor: UIColor = .red

    @Invalidates(.display, .layout) var badgePosition: UIRectEdge = [.top, .bottom]
}
```
