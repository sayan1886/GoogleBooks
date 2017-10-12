//
//  Books.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import Foundation

public class Books {
	public var kind : String?
	public var totalItems : Int?
	public var items : Array<Items>?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let json4Swift_Base_list = Json4Swift_Base.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Json4Swift_Base Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Books]
    {
        var models:[Books] = []
        for item in array
        {
            models.append(Books(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Json4Swift_Base Instance.
*/
	required public init?(dictionary: NSDictionary) {

		kind = dictionary["kind"] as? String
		totalItems = dictionary["totalItems"] as? Int
        if (dictionary["items"] != nil) { items = Items.modelsFromDictionaryArray(array: dictionary["items"] as! NSArray) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.kind, forKey: "kind")
		dictionary.setValue(self.totalItems, forKey: "totalItems")

		return dictionary
	}

}
