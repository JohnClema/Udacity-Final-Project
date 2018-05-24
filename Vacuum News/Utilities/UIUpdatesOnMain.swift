//
//  UIUpdatesOnMain.swift
//  Vacuum News
//
//  Created by John Clema on 23/5/18.
//  Copyright © 2018 John Clema. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(updates: @escaping () -> Void) {
    DispatchQueue.main.async() {
        updates()
    }
}
