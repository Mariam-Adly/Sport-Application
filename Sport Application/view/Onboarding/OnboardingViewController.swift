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
        
        slides = [OnboardingSlide(title: "Football", description: "Football is a game played by two teams, each with 11 players. The objective is to score more goals than the other team by kicking the ball into the opposing team's goal.", image: UIImage(named: "on1")!),OnboardingSlide(title:"Cricket", description: "Cricket is a game played by two teams, each with eleven players. The objective is to score more runs than the other team by hitting the ball with a bat and running back and forth between two sets of wickets.", image:UIImage(named:"on2")! ),OnboardingSlide(title: "Basketball", description: "Basketball is a game played by two teams, each with five players. The objective is to score more points than the other team by shooting a ball through a hoop that is 10 feet high.", image:UIImage(named:"on3")! )]
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

