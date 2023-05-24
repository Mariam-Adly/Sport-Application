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
    var team : Teams?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playesTableView.register(UINib(nibName: "TeamDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "teamCell")

        
        playesTableView.delegate = self
        playesTableView.dataSource = self
        
        teamsL.layer.cornerRadius = teamsL.frame.size.height/2.0
        teamsL.layer.masksToBounds = true
        
        teamLogo.sd_setImage(with: URL(string: team?.team_logo ?? ""))
        teamName.text = team?.coaches![0].coach_name
        playersArr = team?.players
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
    }
}
