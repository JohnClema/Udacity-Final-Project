//
//  NASAAPODClient.swift
//  Vacuum News
//
//  Created by John Clema on 3/5/18.
//  Copyright © 2018 John Clema. All rights reserved.
//

import Foundation
import CoreData

class NASAAPODClient {
    var session = URLSession.shared
    
    class func sharedInstance() -> NASAAPODClient {
        struct Singleton {
            static var sharedInstance = NASAAPODClient()
        }
        return Singleton.sharedInstance
    }
    
   
    
    func taskForGETMethod(parameters: [String: AnyObject], parseJSON: Bool, completionHandlerForGET: @escaping (_ result: Any?, _ error: Error?) -> Void) -> URLSessionDataTask {
        var params = parameters
        params.merge(dict: [URLKeys.APIKey: URLValues.NASAAPIKey as AnyObject])
        
        var url: URL = self.apodURLFromParameters(parameters: params)
        let request = URLRequest(url: url)
        
        /* 4. Make the request */
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            func sendError(_ error: String) {
                print(error)
                let userInfo = [NSLocalizedDescriptionKey : error]
                completionHandlerForGET(nil, NSError(domain: "taskForGETMethod", code: 1, userInfo: userInfo))
            }
            
            /* GUARD: Was there an error? */
            guard (error == nil) else {
                sendError("There was an error with your request: \(String(describing: error))")
                return
            }
            
            /* GUARD: Did we get a successful 2XX response? */
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode , statusCode >= 200 && statusCode <= 299 else {
                sendError("Your request returned a status code other than 2xx!")
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                sendError("No data was returned by the request!")
                return
            }
            
            /* 5/6. Parse the data and use the data (happens in completion handler) */
            if parseJSON {
                self.convertDataWithCompletionHandler(data, completionHandlerForConvertData: completionHandlerForGET)
            } else {
                completionHandlerForGET(data as AnyObject?, nil)
            }
        })
        
        /* 7. Start the request */
        task.resume()
        
        return task
    }
    
    func apodURLFromParameters(parameters: [String:AnyObject]) -> URL {
        
        let components = NSURLComponents()
        components.scheme = NASAAPODClient.Constants.ApiScheme
        components.host = NASAAPODClient.Constants.ApiHost
        components.path = NASAAPODClient.Constants.ApiPath
        components.queryItems = [NSURLQueryItem]() as [URLQueryItem]
        
        for (key, value) in parameters {
            let queryItem = NSURLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem as URLQueryItem)
        }
        
        return components.url!
    }
    
    // given raw JSON, return a usable Foundation object
    fileprivate func convertDataWithCompletionHandler(_ data: Data, completionHandlerForConvertData: (_ result: Any?, _ error: NSError?) -> Void) {
        
        var parsedResult: Any!
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        } catch {
            let userInfo = [NSLocalizedDescriptionKey : "Could not parse the data as JSON: '\(data)'"]
            completionHandlerForConvertData(nil, NSError(domain: "convertDataWithCompletionHandler", code: 1, userInfo: userInfo))
        }
        
        completionHandlerForConvertData(parsedResult, nil)
    }
}
