//
//  TAOverViewVC.swift
//  TextureDemo
//
//  Created by David on 2019/4/16.
//  Copyright © 2019 www.TabCen.com. All rights reserved.
//

import UIKit

/// 数据处理
struct CellModel {
    let title: String
    let clickBlock: ((TAOverViewVC?) -> Void)?
}

struct GroupModel {
    let groupTitle: String
    let cellArr: Array<CellModel>
}

let group1 = [CellModel.init(title: "ASDisplayNode", clickBlock: {(vc: TAOverViewVC?) -> Void in
    if let vc = vc {
        let forNodeVC = TANormalVC.init()
        forNodeVC.hidesBottomBarWhenPushed = true
        vc.navigationController?.pushViewController(forNodeVC, animated: true)
    }
})]

let groupArr = [GroupModel.init(groupTitle: "节点", cellArr: group1),
                GroupModel.init(groupTitle: "节点容器", cellArr: []),
                GroupModel.init(groupTitle: "布局", cellArr: []),
                GroupModel.init(groupTitle: "混合原生", cellArr: []),
                GroupModel.init(groupTitle: "Utils", cellArr: []),
                GroupModel.init(groupTitle: "Texture-RxSwift", cellArr: [])]

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
        return groupArr.count
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return groupArr[section].cellArr.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupArr[section].groupTitle
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let model: CellModel = groupArr[indexPath.section].cellArr[indexPath.row]
        
        weak var weakSelf = self
        let nodeBlock = {() -> ASTextCellNode in
            let cell = ASTextCellNode.init()
            cell.text = model.title
            
            cell.add(weakSelf!)
            return cell
        }
        return nodeBlock
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        let model: CellModel = groupArr[indexPath.section].cellArr[indexPath.row]
        
        weak var weakSelf = self
        if let block = model.clickBlock {
            block(weakSelf)
        }
    }
    
}



extension TAOverViewVC: ASInterfaceStateDelegate {
    func interfaceStateDidChange(_ newState: ASInterfaceState, from oldState: ASInterfaceState) {
        print("interfaceStateDidChange")
    }
    
    func didEnterVisibleState() {
        print("didEnterVisibleState")
    }
    
    func didExitVisibleState() {
        print("didExitVisibleState")
    }
    
    func didEnterDisplayState() {
        print("didEnterDisplayState")
    }
    
    func didExitDisplayState() {
        print("didEnterDisplayState")
    }
    
    func didEnterPreloadState() {
        print("didExitPreloadState")
    }
    
    func didExitPreloadState() {
        print("didExitPreloadState")
    }
    
    func nodeDidLayout() {
        print("nodeDidLayout")
    }
    
    func nodeDidLoad() {
        print("nodeDidLoad")
    }
    
    func hierarchyDisplayDidFinish() {
        print("hierarchyDisplayDidFinish")
    }
}
