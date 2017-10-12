//
//  SearchInfo.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import Foundation


public class SearchInfo {
	public var textSnippet : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let searchInfo_list = SearchInfo.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of SearchInfo Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [SearchInfo]
    {
        var models:[SearchInfo] = []
        for item in array
        {
            models.append(SearchInfo(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let searchInfo = SearchInfo(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: SearchInfo Instance.
*/
	required public init?(dictionary: NSDictionary) {

		textSnippet = dictionary["textSnippet"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.textSnippet, forKey: "textSnippet")

		return dictionary
	}

}
