//
//  IndustryIdentifiers.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import Foundation


public class IndustryIdentifiers {
	public var type : String?
	public var identifier : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let industryIdentifiers_list = IndustryIdentifiers.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of IndustryIdentifiers Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [IndustryIdentifiers]
    {
        var models:[IndustryIdentifiers] = []
        for item in array
        {
            models.append(IndustryIdentifiers(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let industryIdentifiers = IndustryIdentifiers(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: IndustryIdentifiers Instance.
*/
	required public init?(dictionary: NSDictionary) {

		type = dictionary["type"] as? String
		identifier = dictionary["identifier"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.type, forKey: "type")
		dictionary.setValue(self.identifier, forKey: "identifier")

		return dictionary
	}

}
