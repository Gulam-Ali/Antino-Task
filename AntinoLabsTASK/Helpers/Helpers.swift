//
//  Helpers.swift
//  AntinoLabsTASK
//
//  Created by gulam ali on 27/04/20.
//  Copyright © 2020 gulam ali. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


//MARK: >>>>> To check internet

class connectivity{
    
    class var isconnectedToInternet:Bool{
        return NetworkReachabilityManager()?.isReachable ?? false

    }
    
}

//MARK:>>>>> Helper/Common used functions

class CommonFuncs: NSObject {

    
    //MARK:>>> Alert with ok btn to dismiss
    class func AlertWithOK(msg:String,vc:UIViewController){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        vc.present(alert, animated: true, completion: nil)
    }
    
    class func NoInternetAlert(vc:UIViewController){
        let alert = UIAlertController(title: "No Internet !!", message: "Found network problem, Please check your data or wifi connection", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        vc.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK:>>>>. Loaders
   class func showLoader(vc:UIViewController){
       let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

       let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
       loadingIndicator.hidesWhenStopped = true
       loadingIndicator.style = UIActivityIndicatorView.Style.gray
       loadingIndicator.startAnimating();

       alert.view.addSubview(loadingIndicator)
           vc.present(alert, animated: true, completion: nil)
   }
   
   class func stopLoader(vc:UIViewController){
       vc.dismiss(animated: false, completion: nil)
   }
   
    
    
 
}
