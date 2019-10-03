import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var profileImage: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImage()
        setupDelegates()
    }
    
    func setUpImage() {
      
        profileImage.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
    }
    
    func setupDelegates() {
        nameTextField.delegate = self
    }
    
    @IBAction func imageToSelect(_ sender: Any) {
        
    }
    

}

extension LoginViewController: UITextFieldDelegate {
    
}
