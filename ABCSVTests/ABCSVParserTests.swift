//
//  ABCSVParserTests.swift
//  ABCSV
//
//  Created by Anders Boberg on 2/19/16.
//  Copyright © 2016 Anders boberg. All rights reserved.
//

import XCTest
import ABCSV

class TestParserDelegate: ABCSVParserDelegate {
    var csvResult:[[String]] = []
    
    func csvParserDidEndDocument() {
        //print("Ended Document")
    }
    
    func csvParserDidStartDocument() {
        //print("Began Document")
        csvResult.removeAll()
    }
    
    func csvParser(parser: ABCSVParser, didStartRow row: Int) {
        csvResult.append([])
        //print("Beginning row \(row)")
    }
    
    func csvParser(parser: ABCSVParser, didEndRow row:Int, columnCount: Int) {
        //print("Ending row \(row)")
    }
    
    func csvParser(parser: ABCSVParser, foundCell contents: String, row: Int, column: Int) {
        csvResult[row].append(contents)
    }
}

class ABCSVParserTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testParser() {
        let text = try! String(contentsOfFile: "/Users/Anders/Downloads/companylist.csv")
        let parseDelegate = TestParserDelegate()
        let parser = ABCSVParser(contents: text)
        parser.delegate = parseDelegate
        self.measureBlock {
            parser.parse()
        }
        print(parseDelegate.csvResult)
    }

}
