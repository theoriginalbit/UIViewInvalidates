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

		XCTAssertEqual(view.setNeedsUpdateConfigurationCallCount, 1)
		XCTAssertEqual(view.setNeedsUpdateConstraintsCallCount, 0)
        XCTAssertEqual(view.setNeedsDisplayCallCount, 1)
        XCTAssertEqual(view.invalidateIntrinsicContentSizeCallCount, 1)
		XCTAssertEqual(view.setNeedsLayoutCallCount, 0)
    }

    func testConstraints() {
        final class View: TestView {
            @Invalidates(.constraints) var customProperty = ""
        }

        let view = View()
        testInitialState(view)

        view.customProperty = "Hello, tests!"

		XCTAssertEqual(view.setNeedsUpdateConfigurationCallCount, 0)
		XCTAssertEqual(view.setNeedsUpdateConstraintsCallCount, 1)
        XCTAssertEqual(view.setNeedsDisplayCallCount, 1)
		XCTAssertEqual(view.invalidateIntrinsicContentSizeCallCount, 1)
		XCTAssertEqual(view.setNeedsLayoutCallCount, 0)
    }

    func testDisplay() {
        final class View: TestView {
            @Invalidates(.display) var customProperty = ""
        }

        let view = View()
        testInitialState(view)

        view.customProperty = "Hello, tests!"

		XCTAssertEqual(view.setNeedsUpdateConfigurationCallCount, 0)
		XCTAssertEqual(view.setNeedsUpdateConstraintsCallCount, 0)
        XCTAssertEqual(view.setNeedsDisplayCallCount, 2)
		XCTAssertEqual(view.invalidateIntrinsicContentSizeCallCount, 1)
		XCTAssertEqual(view.setNeedsLayoutCallCount, 0)
    }

    func testIntrinsicContentSize() {
        final class View: TestView {
            @Invalidates(.intrinsicContentSize) var customProperty = ""
        }

        let view = View()
        testInitialState(view)

        view.customProperty = "Hello, tests!"

		XCTAssertEqual(view.setNeedsUpdateConfigurationCallCount, 0)
		XCTAssertEqual(view.setNeedsUpdateConstraintsCallCount, 0)
        XCTAssertEqual(view.setNeedsDisplayCallCount, 1)
		XCTAssertEqual(view.invalidateIntrinsicContentSizeCallCount, 2)
		XCTAssertEqual(view.setNeedsLayoutCallCount, 0)
    }

    func testLayout() {
        final class View: TestView {
            @Invalidates(.layout) var customProperty = ""
        }

        let view = View()
        testInitialState(view)

        view.customProperty = "Hello, tests!"

		XCTAssertEqual(view.setNeedsUpdateConfigurationCallCount, 0)
		XCTAssertEqual(view.setNeedsUpdateConstraintsCallCount, 0)
		XCTAssertEqual(view.setNeedsDisplayCallCount, 1)
		XCTAssertEqual(view.invalidateIntrinsicContentSizeCallCount, 1)
		XCTAssertEqual(view.setNeedsLayoutCallCount, 1)
    }

    func testBothDisplayAndLayout() {
        final class View: TestView {
            @Invalidates(.display, .layout) var customProperty = ""
        }

        let view = View()
        testInitialState(view)

        view.customProperty = "Hello, tests!"

		XCTAssertEqual(view.setNeedsUpdateConfigurationCallCount, 0)
		XCTAssertEqual(view.setNeedsUpdateConstraintsCallCount, 0)
        XCTAssertEqual(view.setNeedsDisplayCallCount, 2)
		XCTAssertEqual(view.invalidateIntrinsicContentSizeCallCount, 1)
		XCTAssertEqual(view.setNeedsLayoutCallCount, 1)
    }

    func testMoreThanFiveInvalidations() {
        final class View: TestView {
            @Invalidates(.display, .layout, .constraints, .intrinsicContentSize, .display, .layout)
            var customProperty = ""
        }

        let view = View()
        view.customProperty = "Hello, tests!"

        XCTAssertEqual(view.setNeedsDisplayCallCount, 3) // initial, +2 in @Invalidates
        XCTAssertEqual(view.setNeedsLayoutCallCount, 2)
        XCTAssertEqual(view.setNeedsUpdateConstraintsCallCount, 1)
		XCTAssertEqual(view.invalidateIntrinsicContentSizeCallCount, 2) // initial, +1 in @Invalidates
    }
}

private extension InvalidatesTests {
    func testInitialState<View: TestView>(_ view: View) {
        XCTAssertEqual(view.setNeedsUpdateConfigurationCallCount, 0)
        XCTAssertEqual(view.setNeedsUpdateConstraintsCallCount, 0)
        XCTAssertEqual(view.setNeedsDisplayCallCount, 1)
		XCTAssertEqual(view.invalidateIntrinsicContentSizeCallCount, 1)
        XCTAssertEqual(view.setNeedsLayoutCallCount, 0)
    }
}
