//
//  Constants.swift
//  Vacuum News
//
//  Created by John Clema on 30/4/18.
//  Copyright © 2018 John Clema. All rights reserved.
//

import Foundation

extension NASAAPODClient {
    struct Constants {
        static let ApiScheme = "https"
        static let ApiHost = "api.nasa.gov"
        static let ApiPath = "/planetary/apod"
    }
    
    struct URLKeys {
        static let APIKey = "api_key"
        static let ConceptTags = "concept_tags"
        static let StartDate = "start_date"
        static let EndDate = "end_date"
    }
    
    struct URLValues {
        static let NASAAPIKey = "SCCHBWmxn7hk2agcSCucrgRWx6mIiddUbcdvqasF"
        static let ConceptTags = "True"
    }
    
    struct ResponseKeys {
        static let ServiceVersion = "service_version"
        static let Title = "title"
        static let Date = "date"
        static let Explanation = "explanation"
        static let URL = "url"
        static let HDURL = "hdurl"
        static let MediaType = "media_type"
        static let ImageSet = "image_set"
        static let Copyright = "copyright"
    }
}

