//
//  OnBoardingViewController.swift
//  treasuar
//
//  Created by Zakki Mudhoffar on 23/11/22.
//

import UIKit

class OnBoardingViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var contentWidth: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self

        // Do any additional setup after loading the view.
        for image in 0...2 {
            let imageDisplayed = UIImage(named: "\(image).png")
            let imageView = UIImageView(image: imageDisplayed)
            
            let yCoordinate = view.frame.midY + view.frame.width * CGFloat(image)
            
            contentWidth += view.frame.width
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: (view.frame.height/3) + 50, y: yCoordinate + 200, width: 595, height: 113)
        }
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.height)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(1366))
    }


    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
