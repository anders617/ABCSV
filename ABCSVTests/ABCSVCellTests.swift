//
//  ABCSVTests.swift
//  ABCSVTests
//
//  Created by Anders Boberg on 1/4/16.
//  Copyright © 2016 Anders boberg. All rights reserved.
//

import XCTest
@testable import ABCSV

class ABCSVCellTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCSVCell() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var cell:ABCSVCell = .Text(contents: "Text")
        XCTAssert(cell.value as! String == "Text", "CSVCell Text Test")
        cell = .Integer(contents: 1)
        XCTAssert(cell.value as! Int == 1, "CSVCell Integer Test")
        cell = .Decimal(contents: 1.1)
        XCTAssert(cell.value as! Double == 1.1, "CSVCell Decimal Test")
        let date = NSDate()
        cell = .Date(contents: date)
        XCTAssert(cell.value as! NSDate == date, "CSVCell Date Test")
        cell = .Header(contents: "Header")
        XCTAssert(cell.value as! String == "Header", "CSVCell Header Test")
    }
}
