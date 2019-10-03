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
        getImageAccess()
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        imagePicker.sourceType = .photoLibrary
      
        
        if photoAccessPermission {
        present(imagePicker, animated: true)
            
            
        } else {
           let alertVC = UIAlertController(title: "No access", message: "Photo library requres access", preferredStyle: .alert)
                       
                       alertVC.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (alertAction) in
                           self.photoAccessPermission = true
                           self.present(imagePicker, animated: true, completion: nil)
                       }))
                       
                       alertVC.addAction(UIAlertAction(title: "No", style: .destructive, handler: { (alertAction) in
                           self.photoAccessPermission = false
                       }))
                       self.present(alertVC, animated: true, completion: nil)
            
        }
    
    }
    
   
    
    
    func getImageAccess() {
        let photoLibrary = PHPhotoLibrary.authorizationStatus()
        switch photoLibrary {
        case .authorized:
            self.photoAccessPermission = true
        case .denied:
            self.photoAccessPermission = false
            let alert = UIAlertController(title: "No photo library access", message: "ha!", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                   self.present(alert, animated: true, completion: nil)
        case.notDetermined:
            PHPhotoLibrary.requestAuthorization { (requestToChangeStatus) in
                switch requestToChangeStatus{
                case .authorized:
                    self.photoAccessPermission = true
                case .denied:
                    self.photoAccessPermission = false
                case .notDetermined:
                    print("no permission given")
                case .restricted:
                    print("no permision given")
                }
            }
             print("No access determined")
        case .restricted:
            print("you creep")
            }
        }
        
        
    }
    



extension LoginViewController: UITextFieldDelegate {
    
}

extension LoginViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
