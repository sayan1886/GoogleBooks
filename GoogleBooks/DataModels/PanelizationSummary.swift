//
//  PanelizationSummary.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import Foundation


public class PanelizationSummary {
	public var containsEpubBubbles : String?
	public var containsImageBubbles : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let panelizationSummary_list = PanelizationSummary.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of PanelizationSummary Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [PanelizationSummary]
    {
        var models:[PanelizationSummary] = []
        for item in array
        {
            models.append(PanelizationSummary(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let panelizationSummary = PanelizationSummary(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: PanelizationSummary Instance.
*/
	required public init?(dictionary: NSDictionary) {

		containsEpubBubbles = dictionary["containsEpubBubbles"] as? String
		containsImageBubbles = dictionary["containsImageBubbles"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.containsEpubBubbles, forKey: "containsEpubBubbles")
		dictionary.setValue(self.containsImageBubbles, forKey: "containsImageBubbles")

		return dictionary
	}

}
