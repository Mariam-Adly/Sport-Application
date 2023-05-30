//
//  FavoriteViewModel.swift
//  Sport Application
//
//  Created by mariam adly on 24/05/2023.
//

import Foundation
class FavoriteViewModel{
    var bindfavListToFavouriteTableViewController : (()->()) = {}
    var bindFavTeamToDetailsTeamViewController : (()->()) = {}
   
    var favList : [Teams]?{
        didSet{
            bindfavListToFavouriteTableViewController()
        }
    }
    
    var teamDetails : Teams?{
        didSet{
            bindFavTeamToDetailsTeamViewController()
        }
    }
    
    func goToTeamDetails(teamID : Int){
        NetworkServices.getTeamDetails(teamId: teamID){
          [weak self] result in
            self?.teamDetails = result?.result[0]
        }
    }
    
    func getFavoriteTeams(){
        self.favList = TeamsFavCoreData.coreData.fetchTeams()
        
    }
    
    func deleteTeam(team:Teams){
        TeamsFavCoreData.coreData.deleteTeam(team: team)
    }
}
