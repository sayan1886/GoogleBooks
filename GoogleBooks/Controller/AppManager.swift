//
//  AppManager.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import UIKit

class AppManager: NSObject {
    
    private var allBooks: Books!
    
    private var topRatedBooks : Books!
    
    private var books : Books!
    
    public var filter : BookFliter!
    
    private var query : String
    
    public var selectedId : String
    
    private var page : Int

    public static let sharedInstance = AppManager()
    
    private override init() {
        self.allBooks = Books(dictionary: [:])
        self.allBooks.items = [Items]()
        self.topRatedBooks = Books(dictionary: [:])
        self.filter = BookFliter.All
        self.query = ""
        self.selectedId = ""
        self.page = 0;
    }
    
    public func setSearchQuery (query : String) {
        self.query = query
        self.toggleBookView()
    }
    
    public func getSearchQuery () -> String {
        return query
    }
    
    public func isSearching () -> Bool {
        return self.query.count > 0
    }
    
    public func getAllBooksFromRemote(completion : @escaping (_ status : Dictionary<String , Any>) -> Void) {
    NetworkManager.sharedInstance.getDataFromURL(
        urlString: Helper.API_BASE_URL, params: [Helper.QUERY_KEY : Helper.QUERY_VALUE,
                                                 Helper.MAX_RESULT_KEY : String(Helper.MAX_RESULT_VALUE),
                                                Helper.START_INDEX_KEY : String(Helper.START_INDEX_VALUE(PAGE: self.page)),
                                                Helper.ORDER_BY_KEY : Helper.ORDER_BY_VALUE],
                 sucess: { (response : Data!, msg : String) in
                    do{
                        let data = try JSONSerialization.jsonObject(with: response, options: JSONSerialization.ReadingOptions.allowFragments);
                        let books = Books.init(dictionary: data as! NSDictionary);
                        
                        self.allBooks.kind = books?.kind
                        self.allBooks.totalItems = books?.totalItems
                        self.allBooks.items?.append(contentsOf: (books?.items)! as Array)
                        
                        self.toggleBookView()
                        completion(["status" : CompletionStatus.Success.rawValue, "msg" : msg]);
                        self.page += 1;
                    }
                    catch {
                        completion(["status" : CompletionStatus.Success.rawValue, "msg" : "Parsing Error"]);
                    }
                } , failure: { (error : Error, msg : String) in
                    completion(["status" : CompletionStatus.Failure.rawValue, "msg" : error.localizedDescription]);
            })
    }
    
    private func loadTopRatedBooks() {
        topRatedBooks.items = [Items]();
        for book in self.allBooks.items!{
            let rating = book.volumeInfo?.averageRating
            if rating != nil{
                if Int(rating!) > Int(3.5)  {
                    topRatedBooks.items?.append(book);
                }
            }
        }
    }
    
    public func toggleBookView() {
        if self.filter == BookFliter.All {
            self.books = self.isSearching() ? self.getBooks(query: self.query) : self.allBooks
        }
        else {
            self.loadTopRatedBooks();
            self.books = self.isSearching() ? self.getBooks(query: self.query) :self.topRatedBooks;
        }
    }
    
    public func getNumberOfBooksDownloaded () -> Int{
        var count = 0;
        if self.books != nil {
            count = (self.books.items?.count)!;
        }
        return count;
    }
    
    public func getBookTitleForId(id : String) -> String {
        let book = getBookById(id: id) as Items
        if (book.volumeInfo?.title) != nil {
            return (book.volumeInfo?.title)!
        } else {
            return "";
        }
    }
    
    public func getBookIdForIndex(index : Int) -> String {
        let book = getBookForIndex(index: index) as Items
        if (book.id) != nil {
            return (book.id)!
        } else {
            return "";
        }
    }
    
    public func getBookReadStatusForId(id : String) -> ReadStatus{
        return self.getReadStatusForBookId(id: id)
    }
    
    public func getBookAuthorsNameForId(id : String) -> String {
        let book = getBookById(id: id) as Items
        var authorNames : String = ""
        if let authors = (book.volumeInfo?.authors) {
            authorNames = authors.joined(separator:", ")
        }
        return authorNames
    }
    
    public func getBookPublishersNameForId(id : String) -> String {
        let book = getBookById(id: id) as Items
        if (book.volumeInfo?.publisher) != nil {
            return (book.volumeInfo?.publisher)!
        } else {
            return "";
        }
    }
    
    public func getBookAverageRatingForId(id : String) -> Double {
        let book = getBookById(id: id) as Items
        if (book.volumeInfo?.averageRating) != nil {
            return (book.volumeInfo?.averageRating)!
        } else {
            return 1;
        }
    }
    
    public func getBookThumbnailForId(id : String) -> String {
        let book = getBookById(id: id) as Items
        if (book.volumeInfo?.imageLinks?.thumbnail) != nil {
            return (book.volumeInfo?.imageLinks?.thumbnail)!
        } else {
            return "";
        }
    }
    
    public func getBookDescriptionForId(id : String) -> String {
        let book = getBookById(id: id) as Items
        if (book.volumeInfo?.description) != nil {
            return (book.volumeInfo?.description)!
        } else {
            return "";
        }
    }
    
    public func getBookPreviewForId(id : String) -> String {
        let book = getBookById(id: id) as Items
        if (book.volumeInfo?.previewLink) != nil {
            return (book.volumeInfo?.previewLink)!
        } else {
            return "";
        }
    }
    
    private func getBookForIndex(index : Int) -> Items{
        let book = self.books.items?[index];
        return book!;
    }
    
    private func getBookById(id : String) -> Items {
        let book  = self.books.items?.filter{$0.id == id}
        return book![0];
    }
    
    private func getBooks(query : String) -> Books {
        var books : Books?
        if self.filter == BookFliter.All {
            books = self.allBooks
        }
        else {
            books = topRatedBooks
        }
        
        let items  = books?.items?.filter{($0.volumeInfo?.title?.lowercased().contains(query.lowercased()))!}
        let filteredBooks = Books(dictionary: [:])
        filteredBooks?.items = items
        return filteredBooks!;
    }
    
    public func setReadStatusForBookId (status : ReadStatus, id : String) -> OSStatus{
        let result = KeychainWrapper.save(key: id, data: KeychainWrapper.stringToNSData(string: status.rawValue))
        
        return result;
    }
    
    public func getReadStatusForBookId (id : String) -> ReadStatus {
        var readStatus = ReadStatus.Pending
        if let keychainData : NSData = KeychainWrapper.load(key: id){
            let status = KeychainWrapper.NSDataToString(data: keychainData)
            readStatus = ReadStatus(rawValue : status)!
        }
        return readStatus;
    }
}
