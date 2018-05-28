//
//  NASAAPODConvenience.swift
//  Vacuum News
//
//  Created by John Clema on 3/5/18.
//  Copyright © 2018 John Clema. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension NASAAPODClient {
    var sharedStack: CoreDataStackManager {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.dataStack
    }
    
    var sharedContext: NSManagedObjectContext {
        return sharedStack.context
    }
    
    func picturesFromResults(results: [[String:AnyObject]]) {
        
        for result in results {
            if (result[ResponseKeys.MediaType] as! String == "image") {
                let picture = Picture(dictionary: result, context: self.sharedContext)
                self.sharedContext.insert(picture)
                self.sharedStack.save()
            }
        }
    }
    
    // NB: Concept Tags are currently turned off in NASA's service
    func getPhotos(startDate: Date, endDate: Date, conceptTags: Bool = false, completionHandlerForPictures: @escaping (_ success: Bool, _ error: Error?) -> Void){
        let startDateString = format(date: startDate)
        let endDateString = format(date: endDate)
        let conceptTagsValueString = conceptTags ? "True" : "False"
        let parameters = [URLKeys.StartDate: startDateString as AnyObject,
                          URLKeys.EndDate: endDateString as AnyObject,
                          URLKeys.ConceptTags: conceptTagsValueString as AnyObject]
        let _ = taskForGETMethod(parameters: parameters, parseJSON: true) { (result, error) in
            if (error != nil) {
                completionHandlerForPictures(false, error)
            } else {
//                print("\(String(describing: jsonArray)), \(String(describing: error))")
                if let results = result as? [[String: AnyObject]] {
                    self.picturesFromResults(results: results)
                    completionHandlerForPictures(true, nil)
                }
                else {
                    completionHandlerForPictures(false, error)
                }
            }
        }
    }
    
    // Format dates to the String value required for the APOD API
    private func format(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.string(from: date)
    }
}
