//
//  ViewController.swift
//  treasuar
//
//  Created by Rinaldi Alfian on 19/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    
//    @IBOutlet var ARButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var buttonSatu: UIButton!
    @IBOutlet var buttonDua: UIButton!
    @IBOutlet var buttonTiga: UIButton!
    @IBOutlet var buttonEmpat: UIButton!
    @IBOutlet var buttonLima: UIButton!
    
   
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 460, height: 431))
        imageView.image = UIImage(named: "SplashLogo")
        return imageView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        nameLabel.text = "Hi, Steve!"
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont(name: "Boldhead", size: 64)
        
        
        // Do any additional setup after loading the view.
    }
    
    func routeToLevelOne() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelOneVC = LevelOneVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelOneVC
        }, completion: nil)
    }
    
    func routeToLevelTwo() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelOneVC = LevelTwoVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelOneVC
        }, completion: nil)
    }
    
    func routeToLevelThree() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelOneVC = LevelThreeVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelOneVC
        }, completion: nil)
    }

    func routeToLevelFour() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelOneVC = LevelFourVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelOneVC
        }, completion: nil)
    }
    
    func routeToLevelFive() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let levelOneVC = LevelFiveVC()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = levelOneVC
        }, completion: nil)
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
        
        
    }
    

    @IBAction func oneAction(_ sender: Any) {
        OptionSatuVC()
    }
    
    @IBAction func twoAction(_ sender: Any) {
        OptionDuaVC()
    }
    @IBAction func threeAction(_ sender: Any) {
        OptionThreeVC()
    }
    
    @IBAction func fourAction(_ sender: Any) {
        OptionFourVC()
    }
    
    @IBAction func fiveAction(_ sender: Any) {
        OptionFiveVC()
    }
    
}
