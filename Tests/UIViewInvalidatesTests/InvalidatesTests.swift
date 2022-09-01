@testable import UIViewInvalidates
import XCTest

final class InvalidatesTests: XCTestCase {
    func testConfiguration() {
        final class View: TestView {
            @Invalidates(.configuration) var customProperty = ""
        }

        let view = View()
        testInitialState(view)

        view.customProperty = "Hello, tests!"

        XCTAssertTrue(view.setNeedsUpdateConfigurationCalled)
        XCTAssertFalse(view.setNeedsUpdateConstraintsCalled)
        XCTAssertEqual(view.setNeedsDisplayCallCount, 1)
        XCTAssertFalse(view.invalidateIntrinsicContentSizeCalled)
        XCTAssertFalse(view.setNeedsLayoutCalled)
    }

    func testConstraints() {
        final class View: TestView {
            @Invalidates(.constraints) var customProperty = ""
        }

        let view = View()
        testInitialState(view)

        view.customProperty = "Hello, tests!"

        XCTAssertFalse(view.setNeedsUpdateConfigurationCalled)
        XCTAssertTrue(view.setNeedsUpdateConstraintsCalled)
        XCTAssertEqual(view.setNeedsDisplayCallCount, 1)
        XCTAssertFalse(view.invalidateIntrinsicContentSizeCalled)
        XCTAssertFalse(view.setNeedsLayoutCalled)
    }

    func testDisplay() {
        final class View: TestView {
            @Invalidates(.display) var customProperty = ""
        }

        let view = View()
        testInitialState(view)

        view.customProperty = "Hello, tests!"

        XCTAssertFalse(view.setNeedsUpdateConfigurationCalled)
        XCTAssertFalse(view.setNeedsUpdateConstraintsCalled)
        XCTAssertEqual(view.setNeedsDisplayCallCount, 2)
        XCTAssertFalse(view.invalidateIntrinsicContentSizeCalled)
        XCTAssertFalse(view.setNeedsLayoutCalled)
    }

    func testIntrinsicContentSize() {
        final class View: TestView {
            @Invalidates(.intrinsicContentSize) var customProperty = ""
        }

        let view = View()
        testInitialState(view)

        view.customProperty = "Hello, tests!"

        XCTAssertFalse(view.setNeedsUpdateConfigurationCalled)
        XCTAssertFalse(view.setNeedsUpdateConstraintsCalled)
        XCTAssertEqual(view.setNeedsDisplayCallCount, 1)
        XCTAssertTrue(view.invalidateIntrinsicContentSizeCalled)
        XCTAssertFalse(view.setNeedsLayoutCalled)
    }

    func testLayout() {
        final class View: TestView {
            @Invalidates(.layout) var customProperty = ""
        }

        let view = View()
        testInitialState(view)

        view.customProperty = "Hello, tests!"

        XCTAssertFalse(view.setNeedsUpdateConfigurationCalled)
        XCTAssertFalse(view.setNeedsUpdateConstraintsCalled)
        XCTAssertEqual(view.setNeedsDisplayCallCount, 1)
        XCTAssertFalse(view.invalidateIntrinsicContentSizeCalled)
        XCTAssertTrue(view.setNeedsLayoutCalled)
    }

    func testBothDisplayAndLayout() {
        final class View: TestView {
            @Invalidates(.display, .layout) var customProperty = ""
        }

        let view = View()
        testInitialState(view)

        view.customProperty = "Hello, tests!"

        // Validate the Tuple signature
        for property in Mirror(reflecting: view).children where property.label == "_customProperty" {
            XCTAssertTrue(property.value is Invalidates<String, UIView.Invalidation.Tuple<UIView.Invalidation.Display, UIView.Invalidation.Layout>>)
        }

        XCTAssertFalse(view.setNeedsUpdateConfigurationCalled)
        XCTAssertFalse(view.setNeedsUpdateConstraintsCalled)
        XCTAssertEqual(view.setNeedsDisplayCallCount, 2)
        XCTAssertFalse(view.invalidateIntrinsicContentSizeCalled)
        XCTAssertTrue(view.setNeedsLayoutCalled)
    }
}

private extension InvalidatesTests {
    func testInitialState<View: TestView>(_ view: View) {
        XCTAssertFalse(view.setNeedsUpdateConfigurationCalled)
        XCTAssertFalse(view.setNeedsUpdateConstraintsCalled)
        XCTAssertEqual(view.setNeedsDisplayCallCount, 1)
        XCTAssertFalse(view.invalidateIntrinsicContentSizeCalled)
        XCTAssertFalse(view.setNeedsLayoutCalled)
    }
}
