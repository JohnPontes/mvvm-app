//
//  PostCardViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by John Pontes on 15/12/22.
//

import UIKit

class PostCardViewModel: NSObject {
    private var listPosts: [Posts]
    
    init(listPosts: [Posts]) {
        self.listPosts = listPosts
    }
    
    public var numberOfItems: Int {
        listPosts.count
    }
    
    public func loadCurrentPost(indexPath: IndexPath) -> Posts {
        listPosts[indexPath.row]
    }
}
