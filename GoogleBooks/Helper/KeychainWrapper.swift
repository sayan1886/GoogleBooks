//
//  KeychainWrapper.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import UIKit

class KeychainWrapper: NSObject {
    class func save(key: String, data: NSData) -> OSStatus {
        let query = [
            kSecClass as String       : kSecClassGenericPassword as String,
            kSecAttrAccount as String : key,
            kSecValueData as String   : data ] as [String : Any]
        
        SecItemDelete(query as CFDictionary)
        
        return SecItemAdd(query as CFDictionary, nil)
        
    }
    
    class func load(key: String) -> NSData? {
        let query = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String : key,
            kSecReturnData as String  : kCFBooleanTrue,
            kSecMatchLimit as String  : kSecMatchLimitOne ] as [String : Any]
        
        var dataTypeRef:AnyObject? = nil
        
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == noErr {
            return (dataTypeRef! as! NSData)
        }
        else {
            return nil
        }
        
        
    }
    
    class func stringToNSData(string : String)->NSData {
        let _Data = (string as NSString).data(using: String.Encoding.utf8.rawValue)
        return _Data! as NSData
    }
    
    
    class func NSDataToString(data: NSData)->String {
        let returned_string : String = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)! as String
        return returned_string
    }
    
    class func CreateUniqueID() -> String {
        let uuid: CFUUID = CFUUIDCreate(nil)
        let cfStr:CFString = CFUUIDCreateString(nil, uuid)
        
        let nsTypeString = cfStr as NSString
        let swiftString:String = nsTypeString as String
        return swiftString
    }
}
