//
//  NetworkDataLoader.swift
//  Astronomy
//
//  Created by Jeff Kang on 2/5/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    func loadData(with request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
    
    func loadData(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void )
}
