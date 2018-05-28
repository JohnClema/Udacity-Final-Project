//
//  PictureOfTheDayTableViewCell.swift
//  Vacuum News
//
//  Created by John Clema on 23/5/18.
//  Copyright © 2018 John Clema. All rights reserved.
//

import UIKit

class PictureOfTheDayCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "cell"
    
    @IBOutlet weak var pictureOfTheDay: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var gradientView: UIView!


}

