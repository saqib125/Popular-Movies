//
//  PopularMoviesTest.swift
//  testingPopularMoviesData
//
//  Created by Saqib Siddique on 14/12/2023.
//

import XCTest

class PopularMoviesTests: XCTestCase {
    var app: XCUIApplication!

        override func setUp() {
            super.setUp()
            continueAfterFailure = false
            app = XCUIApplication()
            app.launch()
        }

        override func tearDown() {
            app = nil
            super.tearDown()
        }

        func testPopularMovieListAndDetailDisplay() {
            // Scroll to the bottom of the Popular Movie List
            let lastCell = app.collectionViews.cells.element(boundBy: app.collectionViews.cells.count - 1)
            XCTAssertTrue(lastCell.waitForExistence(timeout: 50))
            lastCell.swipeUp()

            // Tap on the last movie card to navigate to the detail view
            lastCell.tap()

            // Check if the Movie Detail View is displayed
            XCTAssertTrue(app.staticTexts["Movie Detail Title"].waitForExistence(timeout: 25))

            // Scroll through the Movie Detail View
            let detailScrollView = app.scrollViews.firstMatch
            XCTAssertTrue(detailScrollView.waitForExistence(timeout: 25))
            detailScrollView.swipeUp()
        }
}
