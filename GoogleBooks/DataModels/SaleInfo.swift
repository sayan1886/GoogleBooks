//
//  SaleInfo.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import Foundation

public class SaleInfo {
	public var country : String?
	public var saleability : String?
	public var isEbook : String?
	public var buyLink : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let saleInfo_list = SaleInfo.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of SaleInfo Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [SaleInfo]
    {
        var models:[SaleInfo] = []
        for item in array
        {
            models.append(SaleInfo(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let saleInfo = SaleInfo(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: SaleInfo Instance.
*/
	required public init?(dictionary: NSDictionary) {

		country = dictionary["country"] as? String
		saleability = dictionary["saleability"] as? String
		isEbook = dictionary["isEbook"] as? String
		buyLink = dictionary["buyLink"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.country, forKey: "country")
		dictionary.setValue(self.saleability, forKey: "saleability")
		dictionary.setValue(self.isEbook, forKey: "isEbook")
		dictionary.setValue(self.buyLink, forKey: "buyLink")

		return dictionary
	}

}
