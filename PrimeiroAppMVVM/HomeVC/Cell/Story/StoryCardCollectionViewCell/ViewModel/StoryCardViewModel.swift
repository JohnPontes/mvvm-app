//
//  StoryCardViewModel.swift
//  PrimeiroAppMVVM
//
//  Created by John Pontes on 12/12/22.
//

import UIKit

class StoryCardViewModel: NSObject {
    private var listStory: [Stories]
    
    init(listStory: [Stories]) {
        self.listStory = listStory
    }
    
    public var numberOfItems: Int {
        listStory.count
    }
    
    public func loadCurrentStory(indexPath: IndexPath) -> Stories {
        listStory[indexPath.row]
    }
}
