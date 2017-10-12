//
//  Pdf.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import Foundation


public class Pdf {
	public var isAvailable : String?
	public var downloadLink : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let pdf_list = Pdf.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Pdf Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Pdf]
    {
        var models:[Pdf] = []
        for item in array
        {
            models.append(Pdf(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let pdf = Pdf(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Pdf Instance.
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
