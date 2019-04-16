//
//  TAMainVC.swift
//  TextureDemo
//
//  Created by David on 2019/4/16.
//  Copyright © 2019 www.TabCen.com. All rights reserved.
//

import UIKit

class TAMainVC: ASTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nav = ASNavigationController.init(rootViewController: TAOverViewVC.init())
        nav.tabBarItem.title = "展示"
        
        self.viewControllers = [nav]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
