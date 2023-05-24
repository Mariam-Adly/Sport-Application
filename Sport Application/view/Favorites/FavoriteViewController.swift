//
//  FavoriteViewController.swift
//  Sport Application
//
//  Created by mariam adly on 24/05/2023.
//

import UIKit

class FavoriteViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{


    @IBOutlet weak var favoriteTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 0
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoriteTableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return cell
    }
}
