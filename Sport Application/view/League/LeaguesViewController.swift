//
//  LeaguesViewController.swift
//  Sport Application
//
//  Created by mariam adly on 18/05/2023.
//

import UIKit
import SDWebImage

class LeaguesViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var sportName:String?
    var leagueArr : [League]?
    var networkIndecator : UIActivityIndicatorView!
    var leagueViewModel : LeagueViewModel!
    var placeHolderImg : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        leagueViewModel = LeagueViewModel()
        
        networkIndecator = UIActivityIndicatorView(style: .large)
        networkIndecator.color = UIColor.black
        networkIndecator.center = view.center
        networkIndecator.startAnimating()
        view.addSubview(networkIndecator)
        leagueViewModel.getLeagues(sportName: sportName!)
        leagueViewModel.bindResultToLeagueTableViewController = {
            DispatchQueue.main.async {
                self.leagueArr = self.leagueViewModel.leagueResult
                self.tableView.reloadData()
                self.networkIndecator.stopAnimating()
            }
        }
       
       
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as! LeagueTableViewCell
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

        cell.leagueImg.sd_setImage(with: URL(string: (leagueArr![indexPath.row].league_logo ?? "")), placeholderImage: placeHolderImg)
        cell.leagueName.text = leagueArr![indexPath.row].league_name
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
    
}

