//
//  LeagueViewModel.swift
//  Sport Application
//
//  Created by mariam adly on 21/05/2023.
//

import Foundation
class LeagueViewModel{
    var bindResultToLeagueTableViewController : (()->()) = {}
    var leagueResult : [League]!{
        didSet{
            bindResultToLeagueTableViewController()
        }
    }
    
    func getLeagues(sportName : String){
        NetworkServices.getLeague(sportName: sportName) {
            [weak self](result) in
            self?.leagueResult = result?.result
            
        }
    }
}
