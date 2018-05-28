//
//  PictureOfTheDayDetailViewController.swift
//  Vacuum News
//
//  Created by John Clema on 25/5/18.
//  Copyright © 2018 John Clema. All rights reserved.
//

import UIKit

class PictureOfTheDayDetailViewController: UIViewController, UIScrollViewDelegate {

    var picture: Picture?
    var scrollView: UIScrollView?
    var headerImageView: UIImageView?
    var titleLabel: UILabel?
    var datePublishedLabel: UILabel?
    var explanatonLabel: UILabel?
    var copyrightLabel: UILabel?
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    convenience init(picture: Picture) {
        self.init(nibName: nil, bundle: nil)
        self.picture = picture
        
        self.scrollView = UIScrollView(frame: self.view.bounds)
        self.headerImageView = UIImageView(frame: CGRect(x: 0, y:0, width: self.view.bounds.width, height:400))
        self.headerImageView?.contentMode = .scaleAspectFill
        self.headerImageView?.clipsToBounds = true
        self.headerImageView?.sd_setImage(with: URL(string: picture.urlString!), completed: { (image, wrror, cache, url) in
            self.headerImageView?.image = image
        })
        self.scrollView?.addSubview(self.headerImageView!)

        self.titleLabel = UILabel(frame: CGRect(x: 10, y:410, width: self.view.bounds.width - 20, height:60))
        self.titleLabel?.textColor = .black
        self.titleLabel?.numberOfLines = 0;
        self.titleLabel?.text = self.picture?.title
        self.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 24)
        self.titleLabel?.sizeToFit()
        self.scrollView?.addSubview(self.titleLabel!)
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        let date: Date = dateformatter.date(from: picture.dateString!)!
        dateformatter.dateFormat = "dd/MM/yyyy"
        let pictureDate = dateformatter.string(from: date as Date)

        
        self.datePublishedLabel = UILabel(frame: CGRect(x: 10, y: self.titleLabel!.frame.size.height + self.titleLabel!.frame.origin.y + 10, width: self.view.bounds.width - 20, height:60))
        self.datePublishedLabel?.textColor = .black
        self.datePublishedLabel?.numberOfLines = 0;
        self.datePublishedLabel?.text = pictureDate
        self.datePublishedLabel?.font = UIFont(name: "Helvetica", size: 14)
        self.datePublishedLabel?.sizeToFit()
        self.scrollView?.addSubview(self.datePublishedLabel!)
        
        self.explanatonLabel = UILabel(frame: CGRect(x: 10, y: self.datePublishedLabel!.frame.size.height + self.datePublishedLabel!.frame.origin.y + 10, width: self.view.bounds.width  - 20, height:60))
        self.explanatonLabel?.textColor = .black
        self.explanatonLabel?.numberOfLines = 0;
        self.explanatonLabel?.text = self.picture?.explanation
        self.explanatonLabel?.font = UIFont(name: "Helvetica", size: 14)
        self.explanatonLabel?.sizeToFit()
        self.scrollView?.addSubview(self.explanatonLabel!)
        
        if (picture.copyright != nil) {
            self.copyrightLabel = UILabel(frame: CGRect(x: 10, y: self.explanatonLabel!.frame.size.height + self.explanatonLabel!.frame.origin.y + 10, width: self.view.bounds.width  - 20, height:60))
            self.copyrightLabel?.textColor = .black
            self.copyrightLabel?.numberOfLines = 0;
            self.copyrightLabel?.text = "Copyright: " + String(describing: self.picture!.copyright!)
            self.copyrightLabel?.font = UIFont(name: "Helvetica", size: 14)
            self.copyrightLabel?.sizeToFit()
            self.scrollView?.addSubview(self.copyrightLabel!)
        }
        
        self.scrollView?.delegate = self
        self.scrollView?.isScrollEnabled = true
        self.scrollView?.bounces = true

        var contentHeight: CGFloat
        if (picture.copyright != nil) {
            contentHeight = self.copyrightLabel!.frame.size.height + self.headerImageView!.frame.size.height + self.datePublishedLabel!.frame.size.height + self.explanatonLabel!.frame.size.height + self.titleLabel!.frame.size.height + 50
        } else {
            contentHeight = self.headerImageView!.frame.size.height + self.datePublishedLabel!.frame.size.height + self.explanatonLabel!.frame.size.height + self.titleLabel!.frame.size.height + 40

        }
        self.scrollView?.contentSize = CGSize(width: self.view.frame.width, height: contentHeight)

        
        self.view.addSubview(scrollView!)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    
}
