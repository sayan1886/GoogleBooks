//
//  LaodingViewController.swift
//  GoogleBooks
//
//  Created by Sayan Chatterjee on 11/10/17.
//  Copyright © 2017 Sayan Chatterjee. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        AppManager.sharedInstance.getAllBooksFromRemote { (status :Dictionary<String, Any>) in
            DispatchQueue.main.async {
                let downloadStatus = status["status"] as! String
                if downloadStatus == CompletionStatus.Success.rawValue {
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "NavController") as! UINavigationController
                    UIApplication.shared.keyWindow?.rootViewController = viewController
                }
                else {
                    //Show alert
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func transitionedToHome(_ sender: Any) {
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
