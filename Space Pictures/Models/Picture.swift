//
//  Media
//  Space Pictures
//
//  Created by John Clema on 4/5/18.
//  Copyright © 2018 John Clema. All rights reserved.
//

import Foundation
import CoreData
import UIKit


@objc(Picture)
public class Picture: NSManagedObject {
    convenience init(dictionary: [String: AnyObject], context: NSManagedObjectContext) {
        if let ent = NSEntityDescription.entity(forEntityName: type(of: self).entityName(), in: context) {
            self.init(entity: ent, insertInto: context)
            self.title = dictionary[NASAAPODClient.ResponseKeys.Title] as? String
            self.explanation = dictionary[NASAAPODClient.ResponseKeys.Explanation] as? String
            self.dateString = dictionary[NASAAPODClient.ResponseKeys.Date] as? String
            self.urlString = dictionary[NASAAPODClient.ResponseKeys.URL] as? String
            self.hdURLString = dictionary[NASAAPODClient.ResponseKeys.HDURL] as? String
            self.copyright = dictionary[NASAAPODClient.ResponseKeys.Copyright] as? String
            self.mediaType = dictionary[NASAAPODClient.ResponseKeys.MediaType] as? String
            if let key = dictionary["resource"] {
                self.imageSet = key[NASAAPODClient.ResponseKeys.MediaType] as? String
            }
        } else {
            fatalError("Unable to find Entity Name")
        }
    }
}
