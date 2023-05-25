//
//  TeamDetailsViewModel.swift
//  Sport Application
//
//  Created by mariam adly on 24/05/2023.
//

import Foundation
class TeamDetailsViewModel{
    
    
    func saveToCoreData(team:Teams?){
        TeamsFavCoreData.coreData.insertTeam(teamPass: team!)
    }
    
    func deleteFromCoreData(team: Teams?){
        TeamsFavCoreData.coreData.deleteTeam(team: team!)
    }
    
    func isFavouriteTeam(team: Teams?) -> Bool {
        return TeamsFavCoreData.coreData.teamIsFav(team: team!)
    }
    
}
