//
//  Items.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import Foundation

public class Items {
	public var kind : String?
	public var id : String?
	public var etag : String?
	public var selfLink : String?
	public var volumeInfo : VolumeInfo?
	public var saleInfo : SaleInfo?
	public var accessInfo : AccessInfo?
	public var searchInfo : SearchInfo?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let items_list = Items.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Items Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Items]
    {
        var models:[Items] = []
        for item in array
        {
            models.append(Items(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let items = Items(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Items Instance.
*/
	required public init?(dictionary: NSDictionary) {

		kind = dictionary["kind"] as? String
		id = dictionary["id"] as? String
		etag = dictionary["etag"] as? String
		selfLink = dictionary["selfLink"] as? String
		if (dictionary["volumeInfo"] != nil) { volumeInfo = VolumeInfo(dictionary: dictionary["volumeInfo"] as! NSDictionary) }
		if (dictionary["saleInfo"] != nil) { saleInfo = SaleInfo(dictionary: dictionary["saleInfo"] as! NSDictionary) }
		if (dictionary["accessInfo"] != nil) { accessInfo = AccessInfo(dictionary: dictionary["accessInfo"] as! NSDictionary) }
		if (dictionary["searchInfo"] != nil) { searchInfo = SearchInfo(dictionary: dictionary["searchInfo"] as! NSDictionary) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.kind, forKey: "kind")
		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.etag, forKey: "etag")
		dictionary.setValue(self.selfLink, forKey: "selfLink")
		dictionary.setValue(self.volumeInfo?.dictionaryRepresentation(), forKey: "volumeInfo")
		dictionary.setValue(self.saleInfo?.dictionaryRepresentation(), forKey: "saleInfo")
		dictionary.setValue(self.accessInfo?.dictionaryRepresentation(), forKey: "accessInfo")
		dictionary.setValue(self.searchInfo?.dictionaryRepresentation(), forKey: "searchInfo")

		return dictionary
	}

}
