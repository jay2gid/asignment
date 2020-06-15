//
//  wynkTests.swift
//  wynkTests
//
//  Created by Python on 6/12/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import XCTest
@testable import wynk

class wynkTests: XCTestCase {

    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        
    }

    func testCoredata() {
        
        AppUtility.coreData.addSearchString(value: "test")
        let value = AppUtility.coreData.checkIfItemExist(keyword: "test")
        XCTAssertTrue(value == true, "pass")
        
        
        // test values
        AppUtility.coreData.addSearchString(value: "test")
        let boolean = AppUtility.coreData.checkIfItemExist(keyword: "test")
        XCTAssertTrue(boolean == true, "pass")
        
        // test searching
        var arrStrings = AppUtility.coreData.getValues(str: "test")
        XCTAssertTrue(arrStrings.count == 1, "pass")
        
        // test searching
        AppUtility.coreData.addSearchString(value: "test1")
        arrStrings = AppUtility.coreData.getValues(str: "")
        XCTAssertTrue(arrStrings.count > 2, "pass")
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
