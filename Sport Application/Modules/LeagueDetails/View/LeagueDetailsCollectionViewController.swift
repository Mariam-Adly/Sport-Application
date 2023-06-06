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
    var players : [TennisPlayer]?
    
    
    
    var placeHolderImg : UIImage?
    var leagueDetailsViewModel : LeagueDetilsViewModel?
    var networkIndecator : UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        upComingL.layer.cornerRadius = upComingL.frame.size.height/2.0
        upComingL.layer.masksToBounds = true
        
        latestRwsultL.layer.cornerRadius = latestRwsultL.frame.size.height/2.0
        latestRwsultL.layer.masksToBounds = true
        
        teamsL.layer.cornerRadius = teamsL.frame.size.height/2.0
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
        
        leagueDetailsViewModel?.getUpccoming(sportName: leagueDetailsViewModel?.sportName ?? "", leagueId: leagueDetailsViewModel?.leagueId ?? 0)
    
        leagueDetailsViewModel?.bindUpComingListToLeagueDetailsVC = {
            DispatchQueue.main.async {
                self.upComingArr = self.leagueDetailsViewModel?.upComingList
                self.upComingC.reloadData()
                self.networkIndecator.stopAnimating()
            }
        }
        leagueDetailsViewModel?.getLastesEvent(sportName: leagueDetailsViewModel?.sportName ?? "", leagueId: leagueDetailsViewModel?.leagueId ?? 0)
        leagueDetailsViewModel?.bindLatestEventListToLeagueDetailsVC = {
            DispatchQueue.main.async {
                self.latestArr = self.leagueDetailsViewModel?.latestEventsList
                self.latestC.reloadData()
                
            }
        }
        
        
            leagueDetailsViewModel?.getPlayers(sportName: leagueDetailsViewModel?.sportName ?? "", leagueId: leagueDetailsViewModel?.leagueId ?? 0)
        leagueDetailsViewModel?.bindTeamsTennisListToLeagueDetailsVC = {
            DispatchQueue.main.async {
                self.players = self.leagueDetailsViewModel?.playersTennis
                self.teamsC.reloadData()
                print("mariam\(self.players)")
                
            }
        }
          
      
            leagueDetailsViewModel?.getTeams(sportName: leagueDetailsViewModel?.sportName ?? "", leagueId: leagueDetailsViewModel?.leagueId ?? 0)
            leagueDetailsViewModel?.bindTeamsListToLeagueDetailsVC = {
                DispatchQueue.main.async {
                    self.teamsArr = self.leagueDetailsViewModel?.teamsList
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
         }
             var teamsResult = teamsArr?.count ?? 0
             if teamsResult == 0{
                 self.teamsC.isHidden = true
             }else{
                 self.teamsC.isHidden = false
             }
             return teamsResult
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         switch leagueDetailsViewModel?.sportName {
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
             cell.ScoreTeam.text = "VS"
             cell.date.text = data.event_date
             cell.time.text = data.event_time
             if leagueDetailsViewModel?.sportName == "tennis" {
                 cell.homeTeamLogo.sd_setImage(with: URL(string: data.event_first_player_logo ?? ""),placeholderImage: placeHolderImg)
                 cell.awayTeamLogo.sd_setImage(with: URL(string: data.event_second_player_logo ?? ""),placeholderImage: placeHolderImg)
                 cell.homeTeamName.text = data.event_first_player
                 cell.awatTeamName.text = data.event_second_player
             }else{
                 cell.homeTeamLogo.sd_setImage(with: URL(string: data.home_team_logo ?? ""),placeholderImage: placeHolderImg)
                 cell.awayTeamLogo.sd_setImage(with: URL(string: data.away_team_logo ?? ""),placeholderImage: placeHolderImg)
                 cell.homeTeamName.text = data.event_home_team
                 cell.awatTeamName.text = data.event_away_team
             }
             return cell
             
         }else if collectionView == latestC{
             let cell = latestC.dequeueReusableCell(withReuseIdentifier: "leagueCell", for: indexPath) as! LeagueDetailCollectionViewCell
        
             let data = latestArr![indexPath.row]
             
                 if leagueDetailsViewModel?.sportName == "tennis" {
                     cell.homeTeamLogo.sd_setImage(with: URL(string: data.event_first_player_logo ?? ""),placeholderImage: placeHolderImg)
                     cell.awayTeamLogo.sd_setImage(with: URL(string: data.event_first_player_logo ?? ""),placeholderImage: placeHolderImg)
                     cell.homeTeamName.text = data.event_first_player
                     cell.awatTeamName.text = data.event_second_player
                 }else{
                     cell.homeTeamLogo.sd_setImage(with: URL(string: data.home_team_logo ?? ""),placeholderImage: placeHolderImg)
                     cell.awayTeamLogo.sd_setImage(with: URL(string: data.away_team_logo ?? ""),placeholderImage: placeHolderImg)
                     cell.homeTeamName.text = data.event_home_team
                     cell.awatTeamName.text = data.event_away_team
                 }
                 cell.date.text = data.event_date
                 cell.time.text = data.event_time
                 cell.ScoreTeam.text = data.event_final_result
                
                 return cell
         }
         let cell = teamsC.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamsCollectionViewCell
         if leagueDetailsViewModel?.sportName == "tennis" {
             let players = players![indexPath.row]
             print("wafaa\(players.player_name)")
             cell.teamName.text = players.player_name
             cell.teamLogo.sd_setImage(with: URL(string: players.player_logo ?? ""),placeholderImage: placeHolderImg)
         }else{
             let data = teamsArr![indexPath.row]
             print("wafaa\(data.team_name)")
             cell.teamName.text = data.team_name
             cell.teamLogo.sd_setImage(with: URL(string: data.team_logo ?? ""),placeholderImage: placeHolderImg)
            
         }
         return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        if collectionView == upComingC{
            return CGSize(width: collectionView.frame.width - 10, height: 170)
        }
        else if (collectionView == teamsC)
        {
            return CGSize(width:184, height: 150)
        }
        return CGSize(width: Int(latestC.frame.width - 10 ), height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 15, left: 5, bottom: 15, right: 5)

       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == teamsC {
            if leagueDetailsViewModel?.sportName == "basketball" || leagueDetailsViewModel?.sportName == "cricket"{
                let alert = UIAlertController(title: nil, message: "Sorry, this team has no more information", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }else{
                let teamsDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
                let controller = TeamDetailsViewModel(team:teamsArr![indexPath.row])
                teamsDetailsVC.detailsViewModel = controller
               
                self.navigationController?.pushViewController(teamsDetailsVC, animated: true)
            }
        }
    }


}
