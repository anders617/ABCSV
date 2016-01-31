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
    
    func testInsertion() {
        let csv = ABCSV(fromMatrix: [
                [1,2,3,4,5]
            ])
        csv.insertRow(["a","b","c","d","e"], atIndex: 1)
        print(csv)
        XCTAssert(csv.content == [
                [1,2,3,4,5],
                ["a","b","c","d","e"]
            ],
            "Insertion failed.")
    }
    
    func testMatrixInit() {
        let csv = ABCSV(fromMatrix: [
                [1,2,3,4,5],
                ["a","b","c","d","e"]
            ])
        XCTAssert(csv.content == [
                [1,2,3,4,5],
                ["a","b","c","d","e"]
            ],
            "Matrix init failed")
    }
    
    func testMultipleInitialization() {
        var csvs:[ABCSV] = []
        let text = "1,2,3,4,5\na,b,c,d,e\n\n5,4,3,2,1\ne,d,c,b,a"
        csvs = ABCSV.fromText(text, range: nil)
        let expected1:ABMatrix<ABCSVCell> = [
            [1,2,3,4,5],
            ["a","b","c","d","e"]
        ]
        let expected2:ABMatrix<ABCSVCell> = [
            [5,4,3,2,1],
            ["e","d","c","b","a"]
        ]
        XCTAssert(csvs[0].content == expected1, "Failed Multiple Initialization")
        XCTAssert(csvs[1].content == expected2, "Failed Multiple Initialization")
    }
    
    func testEmptyInit() {
        let test = ABCSV()
        XCTAssert(test.content == [[.Empty]], "no param init failed")
    }
    
    func testRowColumnInit() {
        let test = ABCSV(rowCount: 3, columnCount: 3, withValue: 4)
        XCTAssert(test.content == ABMatrix<ABCSVCell>(rowCount: 3,
                columnCount: 3,
                withValue: .Integer(contents: 4)),
            "rowCount:columnCount:withValue init failed")
    }
    
    func testHeaderInit() {
        let test = ABCSV(
            withHeaders: ["First", "Second", "Third"])
        XCTAssert(test.content ==
            [
                [.Header(contents: "First"), .Header(contents: "Second"), .Header(contents: "Third")]
            ],
            "headers init failed")
    }
    
    func testStringInit() {
        let test = ABCSV(fromString: "Head1,Head2,Head3\nCell1,Cell2,Cell3")
        XCTAssert(test.content == [
                ["Head1", "Head2", "Head3"],
                ["Cell1", "Cell2", "Cell3"]
            ]
            , "String init failed.")
    }
}
