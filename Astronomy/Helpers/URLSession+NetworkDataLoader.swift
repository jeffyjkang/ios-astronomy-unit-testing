//
//  URLSession+NetworkDataLoader.swift
//  Astronomy
//
//  Created by Jeff Kang on 2/5/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import Foundation

extension URLSession: NetworkDataLoader {
    func loadData(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }.resume()
    }
    
    func loadData(with request: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }.resume()
    }
}
