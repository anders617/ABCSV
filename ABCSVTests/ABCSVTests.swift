//
//  ABCSVTests.swift
//  ABCSV
//
//  Created by Anders Boberg on 1/9/16.
//  Copyright © 2016 Anders boberg. All rights reserved.
//

import XCTest
@testable import ABCSV
import ABMatrices

class ABCSVTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitialization() {
        var testCSV = ABCSV()
        XCTAssert(testCSV.content == [[.Empty]], "no param init failed")
        testCSV = ABCSV(rowCount: 3, columnCount: 3, withValue: .Integer(contents: 4))
        XCTAssert(testCSV.content == ABMatrix<ABCSVCell>(rowCount: 3, columnCount: 3, withValue: .Integer(contents: 4)), "rowCount:columnCount:withValue init failed")
        testCSV = ABCSV(withHeaders: [.Text(contents: "First"), .Text(contents: "Second"), .Text(contents: "Third")])
        XCTAssert(testCSV.content == [[.Header(contents: "First"), .Header(contents: "Second"), .Header(contents: "Third")]], "headers init failed")
    }

}
