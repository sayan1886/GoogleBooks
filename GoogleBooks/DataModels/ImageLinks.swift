//
//  ImageLinks.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import Foundation


public class ImageLinks {
	public var smallThumbnail : String?
	public var thumbnail : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let imageLinks_list = ImageLinks.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of ImageLinks Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [ImageLinks]
    {
        var models:[ImageLinks] = []
        for item in array
        {
            models.append(ImageLinks(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let imageLinks = ImageLinks(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: ImageLinks Instance.
*/
	required public init?(dictionary: NSDictionary) {

		smallThumbnail = dictionary["smallThumbnail"] as? String
		thumbnail = dictionary["thumbnail"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.smallThumbnail, forKey: "smallThumbnail")
		dictionary.setValue(self.thumbnail, forKey: "thumbnail")

		return dictionary
	}

}
