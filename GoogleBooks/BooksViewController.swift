//
//  ViewController.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 10/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController {

    @IBOutlet weak var bookTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var dataFetchStatus : DataFetchStatus!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.searchBar.setTextColor(color: UIColor.white)
        self.dataFetchStatus = .Completed
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.bookTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toggleFilter(_ sender: UIBarButtonItem) {
        if AppManager.sharedInstance.filter == BookFliter.All {
            AppManager.sharedInstance.filter = BookFliter.TopRated
            sender.title = "Top";
        }
        else{
            AppManager.sharedInstance.filter = BookFliter.All
            sender.title = "All";
        }
        AppManager.sharedInstance.toggleBookView()
        self.bookTableView.reloadData()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let numberOfRows = self.bookTableView.numberOfRows(inSection: 0)
        if self.lastIndexPath() == IndexPath.init(row: numberOfRows - 1, section: 0) {
//            print("last Index path")
            if AppManager.sharedInstance.filter == BookFliter.All  && AppManager.sharedInstance.isSearching() == false{
                self.dataFetchStatus = .Started
                self.bookTableView.reloadData()
                AppManager.sharedInstance.getAllBooksFromRemote { (status :Dictionary<String, Any>) in
                    DispatchQueue.main.async {
                        self.dataFetchStatus = .Completed
                        let downloadStatus = status["status"] as! String
                        if downloadStatus == CompletionStatus.Success.rawValue {
                           self.bookTableView.reloadData()
                        }
                        else{
                            print(status["msg"] as! String)
                        }
                    }
                }
            }
        }
    }

}

extension BooksViewController : UISearchBarDelegate {
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        AppManager.sharedInstance.setSearchQuery(query: searchText);
        self.bookTableView.reloadData()
    }
}

extension BooksViewController : UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        var rows = AppManager.sharedInstance.getNumberOfBooksDownloaded();
        if self.dataFetchStatus == .Started {
            rows += 1
        }
        return rows
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell!
        if indexPath.row < AppManager.sharedInstance.getNumberOfBooksDownloaded(){
            let identifier = "BookCell";
            cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! BooksTableViewCell
            (cell as! BooksTableViewCell).setupCell(id: AppManager.sharedInstance.getBookIdForIndex(index: indexPath.row))
        }
        else{
            let identifier = "LoaderCell";
            cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! LoaderTableViewCell
        }
        return cell;
    }
}

extension BooksViewController : UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = 50.0
        if indexPath.row < AppManager.sharedInstance.getNumberOfBooksDownloaded() {
            height = 200.0;
        }
        return CGFloat(height);
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < AppManager.sharedInstance.getNumberOfBooksDownloaded() {
            AppManager.sharedInstance.selectedId = AppManager.sharedInstance.getBookIdForIndex(index: indexPath.row)
        }
    }
    
    private func lastIndexPath() -> IndexPath? {
        var indexPath : IndexPath? = nil
        let visibleRows : Array = self.bookTableView.visibleCells;
        if let lastVisibleCell : UITableViewCell = visibleRows.last {
            indexPath = self.bookTableView.indexPath(for: lastVisibleCell)
        }
        return indexPath
    }
}

