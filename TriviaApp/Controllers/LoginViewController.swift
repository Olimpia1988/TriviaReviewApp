import UIKit
import Photos

class LoginViewController: UIViewController {
    
    var photoAccessPermission = false

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
    
    func getImageAccess() {
        let photoLibrary = PHPhotoLibrary.authorizationStatus()
        switch photoLibrary {
        case .authorized:
            self.photoAccessPermission = true
        case .denied:
            self.photoAccessPermission = false
        case.notDetermined:
             print("No access determined")
        case .restricted:
            print("you creep")
            }
        }
        
        
    }
    



extension LoginViewController: UITextFieldDelegate {
    
}
