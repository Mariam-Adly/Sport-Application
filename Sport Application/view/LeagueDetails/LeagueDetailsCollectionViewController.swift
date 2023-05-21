//
//  LeagueDetailsCollectionViewController.swift
//  Sport Application
//
//  Created by mariam adly on 21/05/2023.
//

import UIKit


class LeagueDetailsViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{

    var upComingArr : [UpCommingEvent]?
    var sportName : String?
    var leagueID : Int?
    @IBOutlet weak var collectionView: UICollectionView!
    var leagueDetailsViewModel : LeagueDetilsViewModel!
    var networkIndecator : UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        leagueDetailsViewModel = LeagueDetilsViewModel()
        collectionView.delegate = self
        collectionView.dataSource = self
        networkIndecator = UIActivityIndicatorView(style: .large)
        networkIndecator.color = UIColor.black
        networkIndecator.center = view.center
        networkIndecator.startAnimating()
        view.addSubview(networkIndecator)
        
        collectionView.register(UINib.init(nibName: "LeagueDetailsCollectionViewCell", bundle: nil) ,forCellWithReuseIdentifier: "leagueCell")
        let layout = UICollectionViewCompositionalLayout{
            index , environment in
            switch index{
            case 0:
                return self.drawTopSection()
            default:
                return self.drawBottomSection()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
        leagueDetailsViewModel.getUpccoming(sportName: sportName!, leagueId: leagueID!)
        leagueDetailsViewModel.bindUpComingListToLeagueDetailsVC = {
            DispatchQueue.main.async {
                self.upComingArr = self.leagueDetailsViewModel.upComingList
                self.collectionView.reloadData()
                self.networkIndecator.stopAnimating()
            }
        }

    }
    
    func drawTopSection() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
         section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
        return section
    }
    
    func drawBottomSection()-> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(160))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        return section
    }


    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch section{
        case 0 :
            return upComingArr?.count ?? 0
        default:
            return 0
        }
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "leagueCell", for: indexPath) as! LeagueDetailsCollecViewCell
         let data = upComingArr![indexPath.row]
       //  cell.VSLabel.text = "VS"
         cell.homeTeamLogo.sd_setImage(with: URL(string: data.home_team_logo ?? ""))
         cell.awayTeamLogo.sd_setImage(with: URL(string: data.away_team_logo ?? ""))
         cell.homeTeamName.text = data.event_home_team
         cell.awatTeamName.text = data.event_away_team
         cell.date.text = data.event_date
         cell.time.text = data.event_time
    
        return cell
    }

}
