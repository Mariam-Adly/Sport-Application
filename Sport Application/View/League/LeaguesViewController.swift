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
    var leagueArr = [League]()
    var networkIndecator : UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        networkIndecator = UIActivityIndicatorView(style: .large)
        networkIndecator.color = UIColor.black
        networkIndecator.center = view.center
        networkIndecator.startAnimating()
        view.addSubview(networkIndecator)
        
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?met=Leagues&APIkey=93f87636cdebb85cc3fbaa334ca0094cca19f7c62178d9a6462d2014d550ebf3")
        
        guard let newUrl = url else{
            return
        }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        print("hellp")
        let task = session.dataTask(with: request){ data,response,error in
            do{
                print("result")
                let result = try? JSONDecoder().decode(LeagueRoot.self,from: data!)
                self.leagueArr.append(contentsOf: result!.result)
                print(result?.result)
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                    self.networkIndecator.stopAnimating()
                }
            }catch let error{
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as! LeagueTableViewCell
        cell.leagueImg.sd_setImage(with: URL(string: (leagueArr[indexPath.row].league_logo ?? "")), placeholderImage: UIImage(named: "football"))
        cell.leagueName.text = leagueArr[indexPath.row].league_name
        return cell
    }
   

}

