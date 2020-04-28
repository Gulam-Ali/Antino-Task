//
//  Model.swift
//  AntinoLabsTASK
//
//  Created by gulam ali on 27/04/20.
//  Copyright © 2020 gulam ali. All rights reserved.
//

import Foundation
import UIKit

struct UserData : Decodable {
    var array : UserDataArr?
}

struct UserDataArr : Decodable {
    var url : String?
    var name : String?
    var age : String?
    var location : String?
}


/*
 
 "url": "https://pbs.twimg.com/profile_images/572905100960485376/GK09QnNG.jpeg",
 "name": "Sofia",
 "age": "20",
 "location": "New York",
 
 */
