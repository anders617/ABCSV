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
    
    func testLiteralInit() {
        var cell:ABCSVCell
        cell = "test"
        XCTAssert(cell == .Text(contents: "test"), "String literal init failed")
        cell = 10
        XCTAssert(cell == .Integer(contents: 10), "Integer literal init failed")
        cell = 10.0
        XCTAssert(cell == .Decimal(contents: 10.0), "Floating point literal init failed")
        cell = nil
        XCTAssert(cell == .Empty, "Nil literal init failed")
    }
    
    func testTextInit() {
        let cell = ABCSVCell.Text(contents: "test")
        XCTAssert(cell.value as! String == "test", "CSVCell text init failed")
        XCTAssert(cell.isHeader == false, "CSVCell text init failed")
        XCTAssert(cell.typeDescription == "Text", "CSVCell text init failed")
    }
    
    func testIntegerInit() {
        let cell = ABCSVCell.Integer(contents: 10)
        XCTAssert(cell.value as! Int == 10, "CSVCell text init failed")
        XCTAssert(cell.isHeader == false, "CSVCell text init failed")
        XCTAssert(cell.typeDescription == "Integer", "CSVCell text init failed")
    }
    
    func testDecimalInit() {
        let cell = ABCSVCell.Decimal(contents: 10.0)
        XCTAssert(cell.value as! Double == 10.0, "CSVCell text init failed")
        XCTAssert(cell.isHeader == false, "CSVCell text init failed")
        XCTAssert(cell.typeDescription == "Decimal", "CSVCell text init failed")
    }
    
    func testDateInit() {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let cell = ABCSVCell.Date(contents: formatter.dateFromString("2016-01-29")!)
        XCTAssert(cell.value as! NSDate == formatter.dateFromString("2016-01-29")!,
            "CSVCell text init failed")
        XCTAssert(cell.isHeader == false, "CSVCell text init failed")
        XCTAssert(cell.typeDescription == "Date", "CSVCell text init failed")
    }
    
    func testHeaderInit() {
        let cell = ABCSVCell.Header(contents: "test")
        XCTAssert(cell.value as! String == "test", "CSVCell text init failed")
        XCTAssert(cell.isHeader == true, "CSVCell text init failed")
        XCTAssert(cell.typeDescription == "Header", "CSVCell text init failed")
    }
}
