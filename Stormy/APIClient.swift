//
//  APIClient.swift
//  Stormy
//
//  Created by Paul Jackson on 10/7/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation

typealias JSON = [String : AnyObject]
typealias JSONTaskCompletion = (JSON?, NSHTTPURLResponse? , NSError?) -> Void
typealias JSONTask = NSURLSessionDataTask

protocol APIClient {
    var configuration: NSURLSessionConfiguration { get }
    var session: NSURLSession { get }
    
    init(config: NSURLSessionConfiguration)
    
    func JSONTaskWithRequest(request: NSURLRequest, completion: JSONTaskCompletion) -> JSONTask
}
