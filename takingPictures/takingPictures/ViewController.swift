//
//  ViewController.swift
//  takingPictures
//
//  Created by Kathryn Whelan on 4/7/21.
//

import UIKit

class ViewController: UIViewController  {

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var button: UIButton!
    @IBAction func didTapButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true 
        picker.delegate = self
        present(picker, animated: false)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.backgroundColor = .secondarySystemBackground
        
        button.backgroundColor = .systemBlue
        button.setTitle("Take Picture", for: .normal)
        button.setTitleColor(.white, for: .normal)
        // Do any additional setup after loading the view.
    }
    
   
    


}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    } 
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: false, completion: nil)
        guard let image =  info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
             return
        }
        imageView.image = image
    }
    
    
}
