//
//  DetailsViewController.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var bookImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorsLabel: UILabel!
    
    @IBOutlet weak var publisherLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var ratingView: RatingView!
    
    @IBOutlet weak var previewButton: UIButton!
    
    var readStatus : ReadStatus!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Details"
        
         self.readStatus = AppManager.sharedInstance.getReadStatusForBookId(id: AppManager.sharedInstance.selectedId)
        
        var title : String = "Read"
        if readStatus == .Read {
            title = "Pending"
        }
        
        let markAsReadButton : UIBarButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.done, target: self, action: #selector(onMarkAsRead(button:)))
        
        self.navigationItem.rightBarButtonItem = markAsReadButton
        
        let id = AppManager.sharedInstance.selectedId;
        
        // Do any additional setup after loading the view.
        self.titleLabel.text = AppManager.sharedInstance.getBookTitleForId(id: id)
        self.authorsLabel.text = AppManager.sharedInstance.getBookAuthorsNameForId(id: id)
        self.publisherLabel.text = AppManager.sharedInstance.getBookPublishersNameForId(id: id)
        self.ratingView.rating = AppManager.sharedInstance.getBookAverageRatingForId(id: id)
        self.descriptionTextView.text = AppManager.sharedInstance.getBookDescriptionForId(id: id)
        self.bookImageView.downloadImageFrom(link: AppManager.sharedInstance.getBookThumbnailForId(id: id), contentMode: UIViewContentMode.scaleAspectFit)
        if AppManager.sharedInstance.getBookPreviewForId(id: id) == "" {
            self.previewButton.isHidden = true;
        }
        
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        self.descriptionTextView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func onMarkAsRead(button: UIBarButtonItem) {
        var title = "Read"
        if self.readStatus == .Read{
            self.readStatus = .Pending
            title = "Read"
        }
        else{
            self.readStatus = .Read
            title = "Pending"
        }
        let status = AppManager.sharedInstance.setReadStatusForBookId(status: self.readStatus, id: AppManager.sharedInstance.selectedId)
        if status == 0 {
            button.title = title
        }
        else{
            //show alert
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
