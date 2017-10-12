//
//  AccessInfo.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import Foundation


public class AccessInfo {
	public var country : String?
	public var viewability : String?
	public var embeddable : String?
	public var publicDomain : String?
	public var textToSpeechPermission : String?
	public var epub : Epub?
	public var pdf : Pdf?
	public var webReaderLink : String?
	public var accessViewStatus : String?
	public var quoteSharingAllowed : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let accessInfo_list = AccessInfo.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of AccessInfo Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [AccessInfo]
    {
        var models:[AccessInfo] = []
        for item in array
        {
            models.append(AccessInfo(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let accessInfo = AccessInfo(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: AccessInfo Instance.
*/
	required public init?(dictionary: NSDictionary) {

		country = dictionary["country"] as? String
		viewability = dictionary["viewability"] as? String
		embeddable = dictionary["embeddable"] as? String
		publicDomain = dictionary["publicDomain"] as? String
		textToSpeechPermission = dictionary["textToSpeechPermission"] as? String
		if (dictionary["epub"] != nil) { epub = Epub(dictionary: dictionary["epub"] as! NSDictionary) }
		if (dictionary["pdf"] != nil) { pdf = Pdf(dictionary: dictionary["pdf"] as! NSDictionary) }
		webReaderLink = dictionary["webReaderLink"] as? String
		accessViewStatus = dictionary["accessViewStatus"] as? String
		quoteSharingAllowed = dictionary["quoteSharingAllowed"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.country, forKey: "country")
		dictionary.setValue(self.viewability, forKey: "viewability")
		dictionary.setValue(self.embeddable, forKey: "embeddable")
		dictionary.setValue(self.publicDomain, forKey: "publicDomain")
		dictionary.setValue(self.textToSpeechPermission, forKey: "textToSpeechPermission")
		dictionary.setValue(self.epub?.dictionaryRepresentation(), forKey: "epub")
		dictionary.setValue(self.pdf?.dictionaryRepresentation(), forKey: "pdf")
		dictionary.setValue(self.webReaderLink, forKey: "webReaderLink")
		dictionary.setValue(self.accessViewStatus, forKey: "accessViewStatus")
		dictionary.setValue(self.quoteSharingAllowed, forKey: "quoteSharingAllowed")

		return dictionary
	}

}
