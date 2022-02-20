//
//  meowiftTests.swift
//  meowiftTests
//
//  Created by Deniz Demirci on 19/02/2022.
//

import XCTest
@testable import meowift

class meowiftTests: XCTestCase {

    override func setUp() {}
        
    override func tearDown() {
        subscriptions = []
    }
    
    var subscriptions = Set<AnyCancellable>()
        
    func test_getting_breeds_success() {
        let result = Result<[Breed], APIError>.success([Breed.example1()])
            
        let fetcher = BreedFetcher(service: APIMockService(result: result))
            
        let promise = expectation(description: "getting breeds")
            
        fetcher.$breeds.sink { breeds in
            if breeds.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
            
        
        wait(for: [promise], timeout: 2)
    }
        
        
    func test_loading_error() {
           
        let result = Result<[Breed], APIError>.failure(APIError.badURL)
        let fetcher = BreedFetcher(service: APIMockService(result: result))
             
        let promise = expectation(description: "show error message")
        fetcher.$breeds.sink { breeds in
            if !breeds.isEmpty {
                XCTFail()
            }
        }.store(in: &subscriptions)
            
            
        fetcher.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
            
        wait(for: [promise], timeout: 2)
            
    }

}
