//
//  LeagueDetailsCollectionViewController.swift
//  Sport Application
//
//  Created by mariam adly on 21/05/2023.
//

import UIKit


class LeagueDetailsViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

    
    @IBOutlet weak var teamsC: UICollectionView!
    @IBOutlet weak var latestC: UICollectionView!
    @IBOutlet weak var upComingC: UICollectionView!
    @IBOutlet weak var upComingL: UILabel!
    @IBOutlet weak var teamsL: UILabel!
    @IBOutlet weak var latestRwsultL: UILabel!
    
    var upComingArr : [UpCommingEvent]?
    var latestArr : [LatestEvent]?
    var teamsArr : [Teams]?
    
    var sportName : String?
    var leagueID : Int?
    
    var placeHolderImg : UIImage?
    var leagueDetailsViewModel : LeagueDetilsViewModel!
    var networkIndecator : UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        leagueDetailsViewModel = LeagueDetilsViewModel()
        
        upComingL.layer.cornerRadius = upComingL.frame.size.height/2.0
        upComingL.layer.masksToBounds = true
        
        latestRwsultL.layer.cornerRadius = upComingL.frame.size.height/2.0
        latestRwsultL.layer.masksToBounds = true
        
        teamsL.layer.cornerRadius = upComingL.frame.size.height/2.0
        teamsL.layer.masksToBounds = true
        
    
        upComingC.delegate = self
        upComingC.dataSource = self
        upComingC.layer.cornerRadius = 50
        
        latestC.delegate = self
        latestC.dataSource = self
        latestC.layer.cornerRadius = 50
        
        teamsC.delegate = self
        teamsC.dataSource = self
        
        networkIndecator = UIActivityIndicatorView(style: .large)
        networkIndecator.color = UIColor.black
        networkIndecator.center = view.center
        networkIndecator.startAnimating()
        view.addSubview(networkIndecator)
        
     
        
        upComingC.register(UINib.init(nibName: "LeagueDetailCollectionViewCell", bundle: nil) ,forCellWithReuseIdentifier: "leagueCell")
       
        latestC.register(UINib.init(nibName: "LeagueDetailCollectionViewCell", bundle: nil) ,forCellWithReuseIdentifier: "leagueCell")
        
        teamsC.register(UINib.init(nibName: "TeamsCollectionViewCell", bundle: nil) ,forCellWithReuseIdentifier: "teamCell")
        
        leagueDetailsViewModel.getUpccoming(sportName: sportName!, leagueId: leagueID!)
        leagueDetailsViewModel.bindUpComingListToLeagueDetailsVC = {
            DispatchQueue.main.async {
                self.upComingArr = self.leagueDetailsViewModel.upComingList
                self.upComingC.reloadData()
                self.networkIndecator.stopAnimating()
            }
        }
        leagueDetailsViewModel.getLastesEvent(sportName: sportName!, leagueId: leagueID!)
        leagueDetailsViewModel.bindLatestEventListToLeagueDetailsVC = {
            DispatchQueue.main.async {
                self.latestArr = self.leagueDetailsViewModel.latestEventsList
                self.latestC.reloadData()
            }
        }
        
        leagueDetailsViewModel.getTeams(sportName: sportName!, leagueId: leagueID!)
        leagueDetailsViewModel.bindTeamsListToLeagueDetailsVC = {
            DispatchQueue.main.async {
                self.teamsArr = self.leagueDetailsViewModel.teamsList
                self.teamsC.reloadData()
            }
        }

    }

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
         if collectionView == upComingC{
             var comingEvent = upComingArr?.count ?? 0
             if comingEvent == 0 {
                 self.upComingC.isHidden = true
            
             }else{
                 self.upComingC.isHidden = false
             }
             return comingEvent
         }else if collectionView == latestC{
             var latestResult = latestArr?.count ?? 0
             if latestResult == 0 {
                 self.latestC.isHidden = true
             }else{
                 self.latestC.isHidden = false
             }
             return latestResult
         }else{
             var teamsResult = teamsArr?.count ?? 0
             if teamsResult == 0{
                 self.teamsC.isHidden = true
             }else{
                 self.teamsC.isHidden = false
             }
             return teamsResult
         }
       
        return 0
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         switch sportName {
         case SportName.FootBall.rawValue:
             placeHolderImg = UIImage(named: "football")
         case SportName.BasketBall.rawValue :
             placeHolderImg = UIImage(named: "basketball")
         case SportName.Cricket.rawValue :
             placeHolderImg = UIImage(named: "cricket1")
         default:
             placeHolderImg = UIImage(named: "tennis-2")
             
         }
         if collectionView == upComingC {
             let cell = upComingC.dequeueReusableCell(withReuseIdentifier: "leagueCell", for: indexPath) as! LeagueDetailCollectionViewCell
        
             let data = upComingArr![indexPath.row]
             
             cell.homeTeamLogo.sd_setImage(with: URL(string: data.home_team_logo ?? ""),placeholderImage: placeHolderImg)
             cell.awayTeamLogo.sd_setImage(with: URL(string: data.away_team_logo ?? ""),placeholderImage: placeHolderImg)
             cell.homeTeamName.text = data.event_home_team
             cell.awatTeamName.text = data.event_away_team
             cell.date.text = data.event_date
             cell.time.text = data.event_time
             return cell
         }else if collectionView == latestC{
             let cell = latestC.dequeueReusableCell(withReuseIdentifier: "leagueCell", for: indexPath) as! LeagueDetailCollectionViewCell
        
             let data = latestArr![indexPath.row]
             
             cell.homeTeamLogo.sd_setImage(with: URL(string: data.home_team_logo ?? ""),placeholderImage: placeHolderImg)
             cell.awayTeamLogo.sd_setImage(with: URL(string: data.away_team_logo ?? ""),placeholderImage: placeHolderImg)
             cell.homeTeamName.text = data.event_home_team
             cell.awatTeamName.text = data.event_away_team
             cell.date.text = data.event_date
         cell.time.text = data.event_final_result
             return cell
         }
         let cell = teamsC.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamsCollectionViewCell
         let data = teamsArr![indexPath.row]
         cell.teamName.text = data.team_name
         cell.teamLogo.sd_setImage(with: URL(string: data.team_logo ?? ""),placeholderImage: placeHolderImg)
         return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        if collectionView == upComingC{
            return CGSize(width: collectionView.frame.width, height: 170)
        }
        else if (collectionView == teamsC)
        {
            return CGSize(width:184, height: 150)
        }
        return CGSize(width: Int(latestC.frame.width), height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 15, left: 5, bottom: 15, right: 5)

       }


}
