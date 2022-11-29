//
//  ViewController.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 19/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var ARView: UIView!
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 460, height: 431))
        imageView.image = UIImage(named: "SplashLogo")
        return imageView
    }()
   
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)

        
        
        // Do any additional setup after loading the view.
    }
    

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        animate()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0, execute: {
            self.animate()
        })
    }
    private func animate(){
        UIView.animate(withDuration: 3){
            let size = self.view.frame.size.width * 1.5
            let diffX = size - self.view.frame.size.width
            let diffY = size - self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size)
        } completion: { isComplete in
            if isComplete{
                self.imageView.alpha = 0

            }
            
        }
        
//        UIView.animate(withDuration: 2, animations: {
//
//
//            self.imageView.alpha = 0
//        })
    }
    
}
