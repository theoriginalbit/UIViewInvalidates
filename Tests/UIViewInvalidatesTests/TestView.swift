import UIKit

class TestView: UIButton {
	var setNeedsUpdateConfigurationCallCount = 0

    @available(iOS 15.0, *)
    override func setNeedsUpdateConfiguration() {
        super.setNeedsUpdateConfiguration()
		setNeedsUpdateConfigurationCallCount += 1
    }

	var setNeedsUpdateConstraintsCallCount = 0

    override func setNeedsUpdateConstraints() {
        super.setNeedsUpdateConstraints()
		setNeedsUpdateConstraintsCallCount += 1
    }

	/// - Note: called on init so consider when testing
    var setNeedsDisplayCallCount = 0
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        setNeedsDisplayCallCount += 1
    }

	/// - Note: called on init so consider when testing
    var invalidateIntrinsicContentSizeCallCount = 0

    override func invalidateIntrinsicContentSize() {
        super.invalidateIntrinsicContentSize()
        invalidateIntrinsicContentSizeCallCount += 1
    }

	var setNeedsLayoutCallCount = 0

    override func setNeedsLayout() {
        super.setNeedsLayout()
        setNeedsLayoutCallCount += 1
    }
}
