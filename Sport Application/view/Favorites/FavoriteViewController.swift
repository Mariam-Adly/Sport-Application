//
//  FavoriteViewController.swift
//  Sport Application
//
//  Created by mariam adly on 24/05/2023.
//

import UIKit
import CoreData

class FavoriteViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var favTeamsLabel: UILabel!
    @IBOutlet weak var favoriteTableView: UITableView!
    
    
    var favTeamsArr : [Teams]?
    var favViewModel : FavoriteViewModel?
    var savedTeams : [NSManagedObject] = []
    var teamSelect: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favViewModel = FavoriteViewModel()
        
        favTeamsLabel.layer.cornerRadius = favTeamsLabel.frame.size.height/2.0
        favTeamsLabel.layer.masksToBounds = true
        
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        
        favoriteTableView.register(UINib(nibName: "FavoriteTableViewCell", bundle: nil), forCellReuseIdentifier: "favoriteCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        favViewModel?.getFavoriteTeams()
        DispatchQueue.main.async {
            self.favTeamsArr = self.favViewModel?.favList
            self.favoriteTableView.reloadData()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var favTeams = favTeamsArr?.count ?? 0
        if favTeams == 0 {
            self.favoriteTableView.isHidden = true
        }else{
            self.favoriteTableView.isHidden = false
        }
        return favTeams
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoriteTableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoriteTableViewCell
        let data = favTeamsArr![indexPath.row]
        cell.favoriteTeamLogo.sd_setImage(with: URL(string: data.team_logo!))
        cell.favoriteTeamName.text = data.team_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let alert = UIAlertController(title: "Delete Team From Favorite", message: "Are You Sure , You want to delete this team from favorites?", preferredStyle: .alert)
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ (action,view,complitionHandler) in
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive,
                                          handler : { _ in
                self.favViewModel?.deleteTeam(team: self.favTeamsArr![indexPath.row])
                self.favViewModel?.getFavoriteTeams()
                DispatchQueue.main.async {
                    self.favTeamsArr = self.favViewModel?.favList
                    self.favoriteTableView.reloadData()
                }
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if CheckNetwork.isConnectedToInternet(){
            var data = favTeamsArr![indexPath.row]
            favViewModel?.goToTeamDetails(teamID: data.team_key!)
            let teamDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
            favViewModel?.bindFavTeamToDetailsTeamViewController = {
                () in
                teamDetailsVC.team = self.favViewModel?.teamDetails
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(teamDetailsVC, animated: true)
                }
            }
        }else{
            let alert = UIAlertController(title: nil, message: "No internet connection please check your wi-fi or moblie data and try again", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        
        }
    }
}
