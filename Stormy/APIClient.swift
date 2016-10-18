//
//  APIClient.swift
//  Stormy
//
//  Created by Paul Jackson on 10/7/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation

// Add three letter prefixes to name to prevent collosions
public let COMNetworkingErrorDomain = "com.companyName.Stromy.NetworkingError"
public let MissingHTTPResponseError: Int = 10

typealias JSON = [String : AnyObject]
typealias JSONTaskCompletion = (JSON?, NSHTTPURLResponse? , NSError?) -> Void
typealias JSONTask = NSURLSessionDataTask

enum APIResult<T> {
    case Success(T)
    // Can use Swift error type and Obj-C NSError type
    case Failure(ErrorType)
}

protocol APIClient {
    var configuration: NSURLSessionConfiguration { get }
    var session: NSURLSession { get }
    
    init(config: NSURLSessionConfiguration)
    
    // Take a request object containing the URL that we want to fetch data from
    func JSONTaskWithRequest(request: NSURLRequest, completion: JSONTaskCompletion) -> JSONTask
    
    // 
    func fetch<T>(request: NSURLRequest, parse: JSON -> T?, completion: APIResult<T> -> Void)
}

extension APIClient {
    func JSONTaskWithRequest(request: NSURLRequest, completion: JSONTaskCompletion) -> JSONTask {
        let task = session.dataTaskWithRequest(request) { data, response, error in
        }
        guard let HTTPResponse = response as? NSHTTPURLResponse else {
            let userInfo = [ NSLocalizedDescriptionKey: NSLocalizedString("Missing HTTP Response", comment: "") ]
            
            let error = NSError(domain: COMNetworkingErrorDomain, code: MissingHTTPResponseError, userInfo: userInfo)
            
            completion(nil, nil, error)
            
            return
        }
        return task
    }
}
