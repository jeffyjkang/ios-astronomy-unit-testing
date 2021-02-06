//
//  MockLoader.swift
//  AstronomyTests
//
//  Created by Jeff Kang on 2/5/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import Foundation

@testable import Astronomy

class MockLoader: NetworkDataLoader {
    
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    func loadData(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(self.data, self.response, self.error)
        }
    }
    
    func loadData(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(self.data, self.response, self.error)
        }
    }
    
}
