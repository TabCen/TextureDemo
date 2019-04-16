//
//  TAOverViewVC.swift
//  TextureDemo
//
//  Created by David on 2019/4/16.
//  Copyright © 2019 www.TabCen.com. All rights reserved.
//

import UIKit

class TAOverViewVC: ASViewController<ASDisplayNode> {
    
    init() {
        let tableNode = ASTableNode.init(style: .grouped)
        super.init(node: tableNode)
        
        tableNode.delegate = self
        tableNode.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "展示"
    }

}

extension TAOverViewVC: ASTableDelegate, ASTableDataSource {
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 2
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {

        let nodeBlock = {() -> ASTextCellNode in
            
            let cell = ASTextCellNode.init()
            cell.text = "\(indexPath.row)"
            
            return cell
        }
        return nodeBlock
    }
    
}
