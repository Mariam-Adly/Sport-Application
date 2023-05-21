//
//  AllSportsViewController.swift
//  Sport Application
//
//  Created by mariam adly on 18/05/2023.
//

import UIKit

class AllSportsViewController: UIViewController , UICollectionViewDelegate,UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    var sportArr = [Sport]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        sportArr.append(Sport(sportName: "FootBall", sportImg: UIImage(named: "football")!))
        sportArr.append(Sport(sportName: "BasketBall", sportImg: UIImage(named: "basketball")!))
        sportArr.append(Sport(sportName: "Tennis", sportImg: UIImage(named: "tennis-2")!))
        sportArr.append(Sport(sportName: "Cricket", sportImg: UIImage(named: "cricket1")!))
       
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportsCell", for: indexPath) as! AllSportsCollectionViewCell
        let sport = sportArr[indexPath.row]
        cell.setCell(name: sport.sportName, photo: sport.sportImg)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 100, left: 15, bottom: 100, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var leaguesTableView = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
        leaguesTableView.sportName = sportArr[indexPath.row].sportName.lowercased()
        self.navigationController?.pushViewController(leaguesTableView, animated: true)
    }
    
   
}
