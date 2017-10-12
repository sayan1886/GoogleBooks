//
//  Epub.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import Foundation


public class Epub {
	public var isAvailable : String?
	public var downloadLink : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let epub_list = Epub.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Epub Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Epub]
    {
        var models:[Epub] = []
        for item in array
        {
            models.append(Epub(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let epub = Epub(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Epub Instance.
*/
	required public init?(dictionary: NSDictionary) {

		isAvailable = dictionary["isAvailable"] as? String
		downloadLink = dictionary["downloadLink"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.isAvailable, forKey: "isAvailable")
		dictionary.setValue(self.downloadLink, forKey: "downloadLink")

		return dictionary
	}

}
