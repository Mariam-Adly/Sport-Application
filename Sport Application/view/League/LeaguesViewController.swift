//
//  LeaguesViewController.swift
//  Sport Application
//
//  Created by mariam adly on 18/05/2023.
//

import UIKit
import SDWebImage

class LeaguesViewController: UIViewController , UITableViewDelegate,UITableViewDataSource , UISearchBarDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var sportName:String?
    var leagueArr : [League]?
    var filterData : [League]?
    var networkIndecator : UIActivityIndicatorView!
    var leagueViewModel : LeagueViewModel!
    var placeHolderImg : UIImage?
    var isSearching = false
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        leagueViewModel = LeagueViewModel()
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
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
        if isSearching{
            return filterData?.count ?? 0
        }else{
            return leagueArr?.count ?? 0
        }
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
        if isSearching{
            cell.leagueImg.sd_setImage(with: URL(string: (filterData![indexPath.row].league_logo ?? "")), placeholderImage: placeHolderImg)
            cell.leagueName.text = filterData![indexPath.row].league_name
        }else{
            cell.leagueImg.sd_setImage(with: URL(string: (leagueArr![indexPath.row].league_logo ?? "")), placeholderImage: placeHolderImg)
            cell.leagueName.text = leagueArr![indexPath.row].league_name
        }
        cell.leagueImg.layer.cornerRadius = cell.leagueImg.frame.width/2.17
        cell.leagueImg.clipsToBounds = true
        cell.leagueImg.layer.borderColor = UIColor.black.cgColor
        cell.leagueImg.layer.borderWidth = 2
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
            let leaguedetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "leagueDetailsVC") as! LeagueDetailsViewController
            leaguedetailsVC.sportName = sportName
            leaguedetailsVC.leagueID = leagueArr![indexPath.row].league_key
               self.navigationController?.pushViewController(leaguedetailsVC, animated: true)
    
    }
     
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
        }else{
            isSearching = true
            filterData = leagueArr?.filter{$0.league_name!.uppercased().prefix(searchText.count) == searchText.uppercased()}
            tableView.reloadData()
        }
    }

}

