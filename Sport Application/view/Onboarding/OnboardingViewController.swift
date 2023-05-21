//
//  OnboardingViewController.swift
//  Sport Application
//
//  Created by mariam adly on 20/05/2023.
//

import UIKit

class OnboardingViewController: UIViewController{

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var slides = [OnboardingSlide]()
    var currentPage = 0{
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1{
                nextBtn.setTitle("Get Started", for: .normal)
            }else{
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.layer.cornerRadius = 10
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
        
        slides = [OnboardingSlide(title: "Football", description: "Football , also called association football or soccer,Is game involving two teams of 11 player who try to maneuver the ball into the other team’s goals without using their hands or arms", image: UIImage(named: "on1")!),OnboardingSlide(title:"Cricket", description: "Cricket ,played with a bat and ball and involves two competing sides (teams) of 11 players.", image:UIImage(named:"on2")! ),OnboardingSlide(title: "Basketball", description: "Basketball ,a game in which two teams of five players each try to score goals by throwing a large ball through a circular net fixed to a metal ring at each end of the court.", image:UIImage(named:"on3")! )]
    }
    

    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let sportsView = self.storyboard?.instantiateViewController(withIdentifier: "homeView") as! ViewController
            sportsView.modalPresentationStyle = .fullScreen
            sportsView.modalTransitionStyle = .flipHorizontal
            present(sportsView, animated: true,completion: nil)
            
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
   
}

extension OnboardingViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboardingCell", for: indexPath) as! OnboardingCollectionViewCell
        let sliders = slides[indexPath.row]
        cell.setCell(title: sliders.title, description: sliders.description, photo: sliders.image)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}

