//
//  APIRestClient.swift
//  ledger-wallet-ios
//
//  Created by Nicolas Bigot on 15/07/15.
//  Copyright (c) 2015 Ledger. All rights reserved.
//

import Foundation

class APIRestClient: BaseRestClient {
    
    private enum HeaderFields: String {
        case Platform = "X-Ledger-Platform"
        case Environment = "X-Ledger-Environment"
        case Locale = "X-Ledger-Locale"
    }
    
    var authenticated = false {
        didSet {
            // TODO: update http header fields with auth token
        }
    }
    
    // MARK: - Requests management
    
    func get(path: String, parameters: HTTPClient.Task.Parameters? = nil, encoding: HTTPClient.Task.Encoding = .URL, completionHandler: HTTPClient.Task.CompletionHandler) -> HTTPClient.DataTask {
        return httpClient.get(baseURLWithPath(path), parameters: parameters, encoding: encoding, completionHandler: completionHandler)
    }
    
    func post(path: String, parameters: HTTPClient.Task.Parameters? = nil, encoding: HTTPClient.Task.Encoding = .JSON, completionHandler: HTTPClient.Task.CompletionHandler) -> HTTPClient.DataTask {
        return httpClient.post(baseURLWithPath(path), parameters: parameters, encoding: encoding, completionHandler: completionHandler)
    }
    
    func head(path: String, parameters: HTTPClient.Task.Parameters? = nil, encoding: HTTPClient.Task.Encoding = .URL, completionHandler: HTTPClient.Task.CompletionHandler) -> HTTPClient.DataTask {
        return httpClient.head(baseURLWithPath(path), parameters: parameters, encoding: encoding, completionHandler: completionHandler)
    }
    
    func delete(path: String, parameters: HTTPClient.Task.Parameters? = nil, encoding: HTTPClient.Task.Encoding = .URL, completionHandler: HTTPClient.Task.CompletionHandler) -> HTTPClient.DataTask {
        return httpClient.delete(baseURLWithPath(path), parameters: parameters, encoding: encoding, completionHandler: completionHandler)
    }
    
    func put(path: String, parameters: HTTPClient.Task.Parameters? = nil, encoding: HTTPClient.Task.Encoding = .JSON, completionHandler: HTTPClient.Task.CompletionHandler) -> HTTPClient.DataTask {
        return httpClient.put(baseURLWithPath(path), parameters: parameters, encoding: encoding, completionHandler: completionHandler)
    }
    
    // MARK: - Configuration
    
    override func preferredBaseURL() -> String {
        return LedgerAPIBaseURL
    }
    
    // MARK: - Initialization
    
    override init() {
        super.init()
        
        // add default Ledger HTTP header fields
        self.httpClient.additionalHeaders = [
            HeaderFields.Platform.rawValue: "ios",
            HeaderFields.Environment.rawValue: ApplicationManager.sharedInstance.isInDebug ? "dev" : "prod",
            HeaderFields.Locale.rawValue: NSLocale.currentLocale().localeIdentifier
        ]
    }
    
}