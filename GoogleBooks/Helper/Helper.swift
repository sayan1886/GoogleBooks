//
//  Helper.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import UIKit

//https://www.googleapis.com/books/v1/volumes?q=book&maxResults=10&startIndex=0&orderBy=newest
//https://developers.google.com/books/docs/v1/reference/volumes/list

enum CompletionStatus : String {
    case Success = "Success"
    case Failure = "Failure"
}

enum ReadStatus : String {
    case Pending = "Pending"
    case Read = "Read"
}

enum BookFliter : Int {
    case All
    case TopRated
}

enum DataFetchStatus : Int {
    case Started = 1001
    case Completed = 1002
}

class Helper {

    public static let API_BASE_URL = "https://www.googleapis.com/books/v1/volumes" as String
    
    public static let QUERY_KEY = "q" as String
    public static let QUERY_VALUE = "book" as String
    
    public static let MAX_RESULT_KEY = "maxResults" as String
    public static let MAX_RESULT_VALUE = 10 as Int
    
    public static let START_INDEX_KEY = "startIndex" as String
    public static func START_INDEX_VALUE (PAGE : Int) -> Int{
        return PAGE * MAX_RESULT_VALUE
    }
    
    public static let ORDER_BY_KEY = "orderBy" as String
    public static let ORDER_BY_VALUE = "newest" as String
    
}

extension UIImageView {
    func downloadImageFrom(link:String, contentMode: UIViewContentMode) {
        URLSession.shared.dataTask( with: NSURL(string:link)! as URL, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) }
            }
        }).resume()
    }
}

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

public extension UISearchBar {
    
    public func setTextColor(color: UIColor) {
        let svs = subviews.flatMap { $0.subviews }
        guard let tf = (svs.filter { $0 is UITextField }).first as? UITextField else { return }
        tf.textColor = color
    }
}
