//
//  ViewController.swift
//  PrimeiroAppMVVM
//
//  Created by John Pontes on 10/12/22.
//

import UIKit

class HomeVC: UIViewController {
    
    private var homeScreen: HomeScreen?
    private var ViewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ViewModel.delegate(delegate: self)
        ViewModel.fetchAllRequest()
    }
}

extension HomeVC: HomeViewModelProtocol {
    func success() {
        print(#function)
        DispatchQueue.main.async {
            self.homeScreen?.configProtocolsCollectionView(delegate: self, dataSource: self)
        }
    }
    
    func error() {
        print(#function)
    }
    
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ViewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.row == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCardCollectionViewCell.identifier, for: indexPath) as? StoryCardCollectionViewCell
            cell?.setupCell(listStory: ViewModel.getListStory)
            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCardCollectionViewCell.identifier, for: indexPath) as? PostCardCollectionViewCell
            cell?.setupCell(listPosts: ViewModel.getListPosts)
            return cell ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        ViewModel.sizeForItem(indexPath: indexPath, frame: collectionView.frame)
    }
    
}


