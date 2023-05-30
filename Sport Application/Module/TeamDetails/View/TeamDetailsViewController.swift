//
//  TeamDetailsViewController.swift
//  Sport Application
//
//  Created by mariam adly on 24/05/2023.
//

import UIKit

class TeamDetailsViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var playesTableView: UITableView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var favoriteTeamBtn: UIButton!
    @IBOutlet weak var teamsL: UILabel!
    
    var playersArr : [Player]?
  

    
    var detailsViewModel : TeamDetailsViewModel?
   
    override func viewDidLoad() {
        super.viewDidLoad()
     
       
        
        playesTableView.register(UINib(nibName: "TeamDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "teamCell")
        
        
        playesTableView.delegate = self
        playesTableView.dataSource = self
        
        teamsL.layer.cornerRadius = teamsL.frame.size.height/2.0
        teamsL.layer.masksToBounds = true
        
        teamLogo.sd_setImage(with: URL(string: detailsViewModel?.team.team_logo ?? ""))
        teamName.text = detailsViewModel?.team.coaches?[0].coach_name
     
        playersArr = detailsViewModel?.team.players
        
        updateFavBtn()
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        playersArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playesTableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamDetailsTableViewCell
        let data = playersArr![indexPath.row]
        cell.playerImg.sd_setImage(with: URL(string: data.player_image ?? ""),placeholderImage: UIImage(named: "people"))
        cell.playerName.text = data.player_name
        cell.playerAge.text = data.player_age
        return cell
    }
    
    @IBAction func favoriteBtn(_ sender: UIButton) {
        if detailsViewModel?.isFavouriteTeam(team: detailsViewModel?.team) == false{
            let alert = UIAlertController(title: "Add Team To Favorite List", message: "Are You Sure , You want to add this team to favorites?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Add", style: .destructive,
                                          handler : { _ in
                self.detailsViewModel?.saveToCoreData(team: self.detailsViewModel?.team)
                self.updateFavBtn()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            present(alert, animated: true)
        }else{
            let alert = UIAlertController(title: "Delete Team From Favorite List", message: "Are You Sure , You want to delete this team from Favorites?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive,
                                          handler : { _ in
                self.detailsViewModel?.deleteFromCoreData(team: self.detailsViewModel?.team)
                self.updateFavBtn()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            present(alert, animated: true)
        }
    }
    func updateFavBtn(){
        if detailsViewModel?.isFavouriteTeam(team: detailsViewModel?.team) == false{
            self.favoriteTeamBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }else{
            self.favoriteTeamBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
    
}
