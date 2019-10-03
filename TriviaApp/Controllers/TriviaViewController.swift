//
//  TriviaViewController.swift
//  TriviaApp
//
//  Created by Olimpia on 10/2/19.
//  Copyright © 2019 Olimpia. All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var triviaCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegates()
        // Do any additional setup after loading the view.
    }
    

    func setUpDelegates() {
        triviaCollectionView.delegate = self
        triviaCollectionView.dataSource = self
    }
  
    
}

extension TriviaViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "triviaCell", for: indexPath) as? TriviaCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     return CGSize(width: 350, height: 200)
    }
    
    
}
