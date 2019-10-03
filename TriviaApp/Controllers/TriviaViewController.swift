import UIKit

class TriviaViewController: UIViewController {
    
    var triviaData = [TrivaQuestion]() {
        didSet {
            DispatchQueue.main.async {
                self.triviaCollectionView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var triviaCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegates()
        loadData()
    }
    
    
    func setUpDelegates() {
        triviaCollectionView.delegate = self
        triviaCollectionView.dataSource = self
    }
    
    func loadData() {
        APIManager.manager.getData { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                DispatchQueue.main.async {
                    self.triviaData = data
                }
            }
        }
        
    }
    
}


extension TriviaViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return triviaData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "triviaCell", for: indexPath) as? TriviaCell else { return UICollectionViewCell() }
        let oneCell = triviaData[indexPath.row]
        cell.categoryLable.text = oneCell.category
        cell.questionLabel.text = oneCell.question
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 200)
    }
    
    
}
