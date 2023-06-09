//
//  SplashViewController.swift
//  Sport Application
//
//  Created by mariam adly on 18/05/2023.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {

    private let animationView = LottieAnimationView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimations()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
               let vc = self.storyboard?.instantiateViewController(identifier: "OnboardingViewController") as! OnboardingViewController
                        vc.modalTransitionStyle = .crossDissolve
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
                    }
        }
    private func setupAnimations(){
        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.width , height: 400)
        animationView.center = view.center
        view.addSubview(animationView)
        animationView.animation = .named("sport")
        animationView.loopMode = .playOnce
        animationView.contentMode = .scaleAspectFit
        animationView.play()
    }

}
