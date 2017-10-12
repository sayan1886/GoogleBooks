//
//  ReadingModes.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import Foundation


public class ReadingModes {
	public var text : String?
	public var image : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let readingModes_list = ReadingModes.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of ReadingModes Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [ReadingModes]
    {
        var models:[ReadingModes] = []
        for item in array
        {
            models.append(ReadingModes(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let readingModes = ReadingModes(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: ReadingModes Instance.
*/
	required public init?(dictionary: NSDictionary) {

		text = dictionary["text"] as? String
		image = dictionary["image"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.text, forKey: "text")
		dictionary.setValue(self.image, forKey: "image")

		return dictionary
	}

}
