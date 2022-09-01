import UIKit

class TestView: UIButton {
    var setNeedsUpdateConfigurationCalled = false

    @available(iOS 15.0, *)
    override func setNeedsUpdateConfiguration() {
        super.setNeedsUpdateConfiguration()
        setNeedsUpdateConfigurationCalled = true
    }

    var setNeedsUpdateConstraintsCalled = false
    
    override func setNeedsUpdateConstraints() {
        super.setNeedsUpdateConstraints()
        setNeedsUpdateConstraintsCalled = true
    }

    var setNeedsDisplayCallCount = 0 // called on init, so can't be tracked with a bool
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        setNeedsDisplayCallCount += 1
    }

    var invalidateIntrinsicContentSizeCalled = false
    
    override func invalidateIntrinsicContentSize() {
        super.invalidateIntrinsicContentSize()
        invalidateIntrinsicContentSizeCalled = true
    }

    var setNeedsLayoutCalled = false
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        setNeedsLayoutCalled = true
    }
}
