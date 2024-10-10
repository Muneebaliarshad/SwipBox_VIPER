//
//  MovieList_UITests.swift
//  Swipbox_VIPERUITests
//
//  Created by Muneeb Ali on 10/10/2024.
//

import XCTest

final class MovieList_UITests: XCTestCase {
    
    //MARK: - Variables
    let app = XCUIApplication()
    
    // MARK: - Default Methods
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    
    func test_GivenCollectionView_WhenItLaunch_ThenItemsShouldExist() {
        app.launch()
        let cell2 = getCollectionViewCell(ofIndex: 2)
        _ = getImageView(name: "contentImageView")
        _ = getLabel(name: "persentageLabel")
        _ = getLabel(name: "movieTitleLabel")
        _ = getLabel(name: "dateLabel")
        cell2.tap()
    }
    
    func test_GivenCollectionView_WhenItAppear_ThenItMoveToDetailScreen() {
        app.launch()
        let cell2 = getCollectionViewCell(ofIndex: 2)
        cell2.tap()
    }
    
    func test_GivenCollectionViewCell_WhenItAppear_ThenItemsShouldExist() {
        test_GivenCollectionView_WhenItAppear_ThenItMoveToDetailScreen()
        _ = getImageView(name: "bannerImageView")
        _ = getImageView(name: "dataImageView")
        _ = getLabel(name: "titleLabel")
        _ = getLabel(name: "yearLabel")
        _ = getLabel(name: "persentageLabel")
        _ = getLabel(name: "overviewLabel")
        _ = getLabel(name: "budgetLabel")
        _ = getLabel(name: "revenueLabel")
    }
    
    func getCollectionView() -> XCUIElement {
        let collectionView = app.collectionViews["moviesCollectionView"]
        _ = collectionView.waitForExistence(timeout: 3)
        XCTAssertTrue(collectionView.exists)
        return collectionView
    }
    
    func getCollectionViewCell(ofIndex: Int) -> XCUIElement {
        let collectionViewCell = getCollectionView().cells["cell_\(ofIndex)"]
        XCTAssertTrue(collectionViewCell.exists)
        return collectionViewCell
    }
    
    func getImageView(name: String) -> XCUIElement {
        let imageView = app.images[name]
        XCTAssertTrue(imageView.exists)
        return imageView
    }
    
    func getLabel(name: String) -> XCUIElement {
        let label = app.staticTexts[name]
        XCTAssertTrue(label.exists)
        return label
    }
}
