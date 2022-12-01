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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let OptionSatuVC = storyboard.instantiateViewController(withIdentifier: "OptionSatuVC") as! OptionSatuVC
        self.present(OptionSatuVC, animated: true, completion: nil)
    }
    
    func routeToLevelTwo() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let OptionDuaVC = storyboard.instantiateViewController(withIdentifier: "OptionDuaVC") as! OptionDuaVC
        self.present(OptionDuaVC, animated: true, completion: nil)
    }
    
    func routeToLevelThree() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let OptionThreeVC = storyboard.instantiateViewController(withIdentifier: "OptionThreeVC") as! OptionThreeVC
        self.present(OptionThreeVC, animated: true, completion: nil)
    }
    
    func routeToLevelFour() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let OptionFourVC = storyboard.instantiateViewController(withIdentifier: "OptionFourVC") as! OptionFourVC
        self.present(OptionFourVC, animated: true, completion: nil)
    }
    
    func routeToLevelFive() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let OptionFiveVC = storyboard.instantiateViewController(withIdentifier: "OptionFiveVC") as! OptionFiveVC
        self.present(OptionFiveVC, animated: true, completion: nil)
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
    
}
