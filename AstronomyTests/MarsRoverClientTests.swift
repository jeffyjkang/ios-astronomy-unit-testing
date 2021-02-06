//
//  MarsRoverClientTests.swift
//  AstronomyTests
//
//  Created by Jeff Kang on 2/5/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class MarsRoverClientTests: XCTestCase {
    
    func testFetchMarsRover() {
        let mock = MockLoader()
        mock.data = validRoverJSON
        
        let client = MarsRoverClient(networkLoader: mock)
        let resultsExpectation = expectation(description: "Fetch Mars Rover")
        
        client.fetchMarsRover(named: "Curiosity") { (rover, error) in
            
            XCTAssertEqual("Curiosity", rover?.name)
            XCTAssert(rover?.maxSol == 10)
            resultsExpectation.fulfill()
        }
        wait(for: [resultsExpectation], timeout: 2.0)
    }
    
    func testFetchPhotos() {
        let mockRover = MockLoader()
        mockRover.data = validRoverJSON
        
        let mockPhotos = MockLoader()
        mockPhotos.data = validSol1JSON

        let clientRover = MarsRoverClient(networkLoader: mockRover)
        let roverExpectation = expectation(description: "Fetch Mars Rover")
        
        let clientPhotos = MarsRoverClient(networkLoader: mockPhotos)
        let photosExpectation = expectation(description: "Fetch Photos")

        var marsRover: MarsRover?

        clientRover.fetchMarsRover(named: "Curiosity") { (rover, error) in
            marsRover = rover
            roverExpectation.fulfill()
        }
        wait(for: [roverExpectation], timeout: 2.0)
        

        if let marsRover = marsRover {
            clientPhotos.fetchPhotos(from: marsRover, onSol: 1) { (photos, error) in
                XCTAssertEqual(4477, photos?[0].id)
                XCTAssert(photos?[0].sol == 1)
                photosExpectation.fulfill()
            }
            wait(for: [photosExpectation], timeout: 2.0)
        } else {
            print("Error, no Mars Rover")
        }
    }
}
