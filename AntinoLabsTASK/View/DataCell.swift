//
//  DataCell.swift
//  AntinoLabsTASK
//
//  Created by gulam ali on 27/04/20.
//  Copyright © 2020 gulam ali. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {

    
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var myview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func GenerateCell(User:UserDataArr){
        userImg.layer.cornerRadius = userImg.frame.height/2
        userImg.downloaded(from: User.url ?? "")
        myview.GetShadow(myview: myview, opacity: 0.5, Shadowradius: 1.0)
        fullname.text = User.name ?? ""
        let userage = User.age ?? ""
        age.text = "Age : \(userage)"
        let userLoc = User.location ?? ""
        location.adjustsFontSizeToFitWidth = true
        location.text = "Location : \(userLoc)"
    }

}
