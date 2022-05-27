//
//  ViewController.swift
//  Travel Diries
//
//  Created by dhairya bhavsar on 2022-05-15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "Logo")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(imageView)
        DispatchQueue.main.asyncAfter(deadline: .now()+3){
            let homeVC = HomeVC(nibName: "HomeVC", bundle: nil)
            self.navigationController?.pushViewController(homeVC, animated: true)
//            self.performSegue(withIdentifier: "MainScreen", sender: self)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0){
            self.animate()
        }
    }
    
    private func animate(){
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.size.width * 2
            let diffx = size - self.view.frame.size.width
            let diffy = self.view.frame.size.height - size
            
            
            self.imageView.frame = CGRect(x: -(diffx/2), y: diffy/2, width: size, height: size)
            
            self.imageView.alpha = 0
        }
    }
    
}

