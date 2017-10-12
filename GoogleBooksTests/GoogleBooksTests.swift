//
//  GoogleBooksTests.swift
//  GoogleBooksTests
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import XCTest
@testable import GoogleBooks

class GoogleBooksTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAppManager () {
        let expec = expectation(description: "Get some Books!")
        let client = AppManager.sharedInstance
        
        client.getAllBooksFromRemote { (status :Dictionary<String, Any>) in
            let downloadStatus = status["status"] as! String
            if downloadStatus == CompletionStatus.Success.rawValue {
                //let publisher = client.getBookPublishersNameForId(id: "xwtDDAAAQBAJ")
//                let book = client.getBookById(id: "xwtDDAAAQBAJ") as Items
//                client.loadTopRatedBooks();
                let books : [Items] = AppManager.sharedInstance.getBooks(query: "LO") as! [Items]
                print(books[0].volumeInfo?.title)
                expec.fulfill()
            }
            else {
                XCTFail("Expected books to succeed, but it failed. ?")
            }
        }
        waitForExpectations(timeout : 10, handler: nil)
    }
    
    func testGetReadStatusForBookIdFalse() {
        let status = AppManager.sharedInstance.getReadStatusForBookId(id: "abcd1235");
        XCTAssertEqual(status, ReadStatus.Pending)
    }
    
    func testSetReadStatusForBookId() {
        let status = AppManager.sharedInstance.setReadStatusForBookId(status: ReadStatus.Read, id: "abcd1234")
        //noErr = 0
        XCTAssertEqual(0, status)
    }
    
    func testGetReadStatusForBookIdTrue() {
        let status = AppManager.sharedInstance.getReadStatusForBookId(id: "abcd1234");
        XCTAssertEqual(status, ReadStatus.Read)
    }
        
    
}
