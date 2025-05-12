//
//  RepoToTests.swift
//  RepoToTests
//
//  Created by Haejin Park on 5/13/25.
//

import XCTest

@testable import RepoTo

final class URLHandlerTests: XCTestCase {

    func testURLHandler_parsesURLCorrectly() {
        let viewModel = ReportViewModel()
        let handler = URLHandler(viewModel: viewModel)
        let url = URL(string: "repoTo://link?loc=3&reloc=3")!

        handler.urlHandler(url)

        XCTAssertEqual(viewModel.source, .link)
        XCTAssertEqual(viewModel.selectedLocation, LocationType(loc: 3))
        XCTAssertEqual(viewModel.selectedReportLocation, .toilet3)
    }
}
