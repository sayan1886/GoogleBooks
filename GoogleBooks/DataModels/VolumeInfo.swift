//
//  VolumeInfo.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import Foundation

public class VolumeInfo {
	public var title : String?
	public var authors : Array<String>?
    public var publisher : String?
	public var publishedDate : Int?
	public var description : String?
	public var industryIdentifiers : Array<IndustryIdentifiers>?
	public var readingModes : ReadingModes?
	public var pageCount : Int?
	public var printType : String?
	public var averageRating : Double?
	public var ratingsCount : Int?
	public var maturityRating : String?
	public var allowAnonLogging : String?
	public var contentVersion : String?
	public var panelizationSummary : PanelizationSummary?
	public var imageLinks : ImageLinks?
	public var language : String?
	public var previewLink : String?
	public var infoLink : String?
	public var canonicalVolumeLink : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let volumeInfo_list = VolumeInfo.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of VolumeInfo Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [VolumeInfo]
    {
        var models:[VolumeInfo] = []
        for item in array
        {
            models.append(VolumeInfo(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let volumeInfo = VolumeInfo(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: VolumeInfo Instance.
*/
	required public init?(dictionary: NSDictionary) {

		title = dictionary["title"] as? String
        if (dictionary["authors"] != nil) { authors = dictionary["authors"] as? Array }
        publisher = dictionary["publisher"] as? String
		publishedDate = dictionary["publishedDate"] as? Int
		description = dictionary["description"] as? String
        if (dictionary["industryIdentifiers"] != nil) { industryIdentifiers = dictionary["industryIdentifiers"] as? Array }
		if (dictionary["readingModes"] != nil) { readingModes = ReadingModes(dictionary: dictionary["readingModes"] as! NSDictionary) }
		pageCount = dictionary["pageCount"] as? Int
		printType = dictionary["printType"] as? String
		averageRating = dictionary["averageRating"] as? Double
		ratingsCount = dictionary["ratingsCount"] as? Int
		maturityRating = dictionary["maturityRating"] as? String
		allowAnonLogging = dictionary["allowAnonLogging"] as? String
		contentVersion = dictionary["contentVersion"] as? String
		if (dictionary["panelizationSummary"] != nil) { panelizationSummary = PanelizationSummary(dictionary: dictionary["panelizationSummary"] as! NSDictionary) }
		if (dictionary["imageLinks"] != nil) { imageLinks = ImageLinks(dictionary: dictionary["imageLinks"] as! NSDictionary) }
		language = dictionary["language"] as? String
		previewLink = dictionary["previewLink"] as? String
		infoLink = dictionary["infoLink"] as? String
		canonicalVolumeLink = dictionary["canonicalVolumeLink"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.publisher, forKey: "publisher")
		dictionary.setValue(self.publishedDate, forKey: "publishedDate")
		dictionary.setValue(self.description, forKey: "description")
		dictionary.setValue(self.readingModes?.dictionaryRepresentation(), forKey: "readingModes")
		dictionary.setValue(self.pageCount, forKey: "pageCount")
		dictionary.setValue(self.printType, forKey: "printType")
		dictionary.setValue(self.averageRating, forKey: "averageRating")
		dictionary.setValue(self.ratingsCount, forKey: "ratingsCount")
		dictionary.setValue(self.maturityRating, forKey: "maturityRating")
		dictionary.setValue(self.allowAnonLogging, forKey: "allowAnonLogging")
		dictionary.setValue(self.contentVersion, forKey: "contentVersion")
		dictionary.setValue(self.panelizationSummary?.dictionaryRepresentation(), forKey: "panelizationSummary")
		dictionary.setValue(self.imageLinks?.dictionaryRepresentation(), forKey: "imageLinks")
		dictionary.setValue(self.language, forKey: "language")
		dictionary.setValue(self.previewLink, forKey: "previewLink")
		dictionary.setValue(self.infoLink, forKey: "infoLink")
		dictionary.setValue(self.canonicalVolumeLink, forKey: "canonicalVolumeLink")

		return dictionary
	}

}
