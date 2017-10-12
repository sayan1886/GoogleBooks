//
//  PreviewBookViewController.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 11/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import UIKit

class PreviewBookViewController: UIViewController {
    
    @IBOutlet weak var previewWebView: UIWebView!
    
    @IBOutlet weak var busyIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Preview"
        
        self.previewWebView.loadRequest(URLRequest.init(url: URL(string : AppManager.sharedInstance.getBookPreviewForId(id: AppManager.sharedInstance.selectedId))!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PreviewBookViewController : UIWebViewDelegate {
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        
        self.busyIndicator.stopAnimating();
        
    }
}
