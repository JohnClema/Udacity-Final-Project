//
//  DictionaryExtension.swift
//  Space Pictures
//
//  Created by John Clema on 3/5/18.
//  Copyright © 2018 John Clema. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
