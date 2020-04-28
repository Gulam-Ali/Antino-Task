//
//  tableview+Extn.swift
//
//  Created by gulam ali on 28/04/20.
//  Copyright © 2020 gulam ali. All rights reserved.
//

import Foundation
import UIKit

//MARK:>>>> TableView

extension UITableView {
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }

        return lastIndexPath == indexPath
    }
}


//MARK:>>>>> UIVIEW

extension UIView{
    
    //to get the shadow on view and setting its opacity and radius as well
    func GetShadow(myview:UIView,opacity:Float,Shadowradius:CGFloat){
        
        myview.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50).cgColor
        myview.layer.shadowOffset = CGSize(width: 0, height: 1)
        myview.layer.shadowOpacity = opacity
        myview.layer.shadowRadius = Shadowradius
        
    }
    
    func GetblackShadow(myview:UIView,opacity:Float,Shadowradius:CGFloat){
        
        myview.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.90).cgColor
        myview.layer.shadowOffset = CGSize(width: 0, height: 1)
        myview.layer.shadowOpacity = opacity
        myview.layer.shadowRadius = Shadowradius
        
    }
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    //avatarPlaceholder
                    DispatchQueue.main.async() {
                        self.image = UIImage(named: "avatarPlaceholder")
                    }
                    return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
