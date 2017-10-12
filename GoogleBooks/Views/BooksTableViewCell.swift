//
//  BooksTableViewCell.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

    @IBOutlet weak var bookTitleLabel: UILabel!
    
    @IBOutlet weak var bookAuthorLabel: UILabel!
    
    @IBOutlet weak var bookPublisherLabel: UILabel!
    
    @IBOutlet var bookRatingView: RatingView!
    
    @IBOutlet weak var bookReadStatus: UILabel!
    
    @IBOutlet weak var bookImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func setupCell(id: String) {
        self.bookTitleLabel.text = AppManager.sharedInstance.getBookTitleForId(id: id)
        self.bookAuthorLabel.text = AppManager.sharedInstance.getBookAuthorsNameForId(id: id)
        self.bookPublisherLabel.text = AppManager.sharedInstance.getBookPublishersNameForId(id: id)
        self.bookRatingView.rating = AppManager.sharedInstance.getBookAverageRatingForId(id: id)
        self.bookReadStatus.text = AppManager.sharedInstance.getBookReadStatusForId(id: id).rawValue
        self.bookImageView.downloadImageFrom(link: AppManager.sharedInstance.getBookThumbnailForId(id: id), contentMode: UIViewContentMode.scaleAspectFit)
    }
}

class LoaderTableViewCell: UITableViewCell {
    
}
