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
    
    func routeToLevelOne() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let OptionSatuVC = OptionSatuVC()
        UIView.transition(with: window, duration: 0.0, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = OptionSatuVC
        }, completion: nil)
    }
    
    func routeToLevelTwo() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let OptionDuaVC = OptionDuaVC()
        UIView.transition(with: window, duration: 0.0, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = OptionDuaVC
        }, completion: nil)
    }
    
    func routeToLevelThree() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let OptionTigaVC = OptionThreeVC()
        UIView.transition(with: window, duration: 0.0, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = OptionTigaVC
        }, completion: nil)
    }
    
    func routeToLevelFour() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let OptionEmpatVC = OptionFourVC()
        UIView.transition(with: window, duration: 0.0, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = OptionEmpatVC
        }, completion: nil)
    }
    
    func routeToLevelFive() {
        guard let window = UIApplication.shared.keyWindow else { return }
        let OptionLimaVC = OptionFiveVC()
        UIView.transition(with: window, duration: 0.0, options: .transitionCrossDissolve, animations: { [weak window] in
            window?.rootViewController = OptionLimaVC
        }, completion: nil)
    }
    

    @IBAction func oneAction(_ sender: Any) {
        routeToLevelOne()
    }
    
    @IBAction func twoAction(_ sender: Any) {
        routeToLevelTwo()
    }
    @IBAction func threeAction(_ sender: Any) {
        routeToLevelThree()
    }
    
    @IBAction func fourAction(_ sender: Any) {
        routeToLevelFour()
    }
    
    @IBAction func fiveAction(_ sender: Any) {
        routeToLevelFive()
    }
    
//    func routeToLevelTwo() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let OptionDuaVC = storyboard.instantiateViewController(withIdentifier: "OptionDuaVC") as! OptionDuaVC()
//        self.present(OptionDuaVC, animated: true, completion: nil)
//    }
}
