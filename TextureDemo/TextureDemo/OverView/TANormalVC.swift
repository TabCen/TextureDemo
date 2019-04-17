//
//  TANormalVC.swift
//  TextureDemo
//
//  Created by  chenfei on 2019/4/17.
//  Copyright © 2019 www.TabCen.com. All rights reserved.
//

import UIKit

class TANormalVC: ASViewController<ASDisplayNode> {
    
    init() {
        let node = TANormalNode.init()
        super.init(node: node)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        node.backgroundColor = UIColor.white
    }
}
