//
//  ViewController.swift
//  AntinoLabsTASK
//
//  Created by gulam ali on 27/04/20.
//  Copyright © 2020 gulam ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblview: UITableView!
    
    var UsersData : [UserDataArr] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tblview.delegate = self
        tblview.dataSource = self
        tblview.tableFooterView = UIView()
        GetUserdata()
    }
    
    //MARK:>>> GetUser details
    
    private func GetUserdata(){
        let serverURL = "http://demo8716682.mockable.io/cardData"
        networking.MakeRequest(Url: serverURL, Param: nil, vc: self) { (Users : [UserDataArr]) in
            print(Users.count)
            
            for user in Users{
                self.UsersData.append(user)
            }
            
            DispatchQueue.main.async {
                self.tblview.reloadData()
            }
            
        }
    }


}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UsersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as! DataCell
        let CurrentUser = UsersData[indexPath.row]
        cell.GenerateCell(User: CurrentUser)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            let animation = AnimationFactory.makeMoveUpWithBounce(rowHeight: 130.0, duration: 1.0, delayFactor: 0.05)
            let animator = Animator(animation: animation)
            animator.animate(cell: cell, at: indexPath, in: tableView)
    }
    
    
}
