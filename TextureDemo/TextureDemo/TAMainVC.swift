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
        
        let nav1 = ASNavigationController.init(rootViewController: TAOverViewVC.init())
        nav1.tabBarItem.title = "技术"
        
        let nav2 = ASNavigationController.init(rootViewController: TAProjectMainVC.init())
        nav2.tabBarItem.title = "项目"
        
        let nav3 = ASNavigationController.init(rootViewController: TAMineVC.init())
        nav3.tabBarItem.title = "我的"
        
        self.viewControllers = [nav1,nav2,nav3]
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
