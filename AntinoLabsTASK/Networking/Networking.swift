//
//  Networking.swift
//  AntinoLabsTASK
//
//  Created by gulam ali on 27/04/20.
//  Copyright © 2020 gulam ali. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class networking: NSObject {

    class func MakeRequest<T: Decodable>(Url:String,Param:[String:Any]?,vc:UIViewController,completion:@escaping (_ String: [T]) -> ()){
        
        CommonFuncs.showLoader(vc: vc)
        
        if connectivity.isconnectedToInternet{
            print("Connected to internet")
           // ProgressHUD.show()
            guard let myUrl = URL(string: Url) else{ return}

            AF.request(myUrl, method: .get, parameters: Param).responseJSON { (closureResponse) in
                
                print(closureResponse)
                
                switch closureResponse.result{
                    
                case .success:
                    print("succeess")
                    CommonFuncs.stopLoader(vc: vc)
                        do{
                            let data = try JSONDecoder().decode([T].self, from: closureResponse.data!)
                           // let data = try JSONDecoder().decode([T].self, from: closureResponse.data)
                            print(data)
                            completion(data)
                        }catch{
                            print("catched error in do try")
                            CommonFuncs.AlertWithOK(msg: "Something went wrong,Check internet connection or try again later", vc: vc)
                            return
                        }
                        
                    
                    
                case .failure(let err):
                     CommonFuncs.stopLoader(vc: vc)
                    print("got an error while making request -> \(err)")
                    CommonFuncs.AlertWithOK(msg: "Got an error, Try again later", vc: vc)
                }
                
            }
        }else{
            print("No internet")
            CommonFuncs.AlertWithOK(msg: "No Internet,Please check your internet connectiom", vc: vc)
        }
        
        
    }

}  // end of class

