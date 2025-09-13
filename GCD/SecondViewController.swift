//
//  SecondViewController.swift
//  GCD
//
//  Created by Владислав Близнюк on 13.09.2025.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicato: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            activityIndicato.stopAnimating()
            activityIndicato.isHidden = true
            
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }
    
fileprivate func fetchImage() {
        imageURL = URL(string: "https://i02.appmifile.com/images/2018/04/01/c4d24020-5e96-4ff2-9d44-9d8a24327f87.png")
    activityIndicato.isHidden = false
    activityIndicato.startAnimating()
    
    let queue = DispatchQueue.global(qos: .utility)
    queue.async { [self] in
        guard let url = imageURL, let imageData = try? Data(contentsOf: url) else { return }
        DispatchQueue.main.async {
            self.image = UIImage(data: imageData)
           }
         }
      }
    }
