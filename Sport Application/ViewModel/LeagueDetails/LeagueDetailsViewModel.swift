//
//  UpcomingViewModel.swift
//  Sport Application
//
//  Created by mariam adly on 21/05/2023.
//

import Foundation
class LeagueDetilsViewModel{
    var bindUpComingListToLeagueDetailsVC :  (()->()) = {}
    var bindLatestEventListToLeagueDetailsVC :  (()->()) = {}
    var bindTeamsListToLeagueDetailsVC :  (()->()) = {}
    
    var upComingList  : [UpCommingEvent]? {
        didSet {
            bindUpComingListToLeagueDetailsVC()
        }
    }
    var latestEventsList : [LatestEvent]?{
        didSet{
            bindLatestEventListToLeagueDetailsVC()
        }
    }
    var teamsList : [Teams]?{
        didSet{
            bindTeamsListToLeagueDetailsVC()
        }
    }

    func getUpccoming(sportName :  String,  leagueId: Int) {
        NetworkServices.getUpComingEvents(sportName: sportName, leagueId: leagueId) { [weak self] result in
            self?.upComingList = result?.result
        }
    }
    func getLastesEvent(sportName: String, leagueId: Int){
        NetworkServices.getLatestEvents(sportName: sportName, leagueId: leagueId) { [weak self] result in
            self?.latestEventsList = result?.result
            
        }
    }
    func getTeams(sportName: String, leagueId: Int){
        NetworkServices.getTeams(sportName: sportName, leagueId: leagueId) { [weak self] result in
            self?.teamsList = result?.result

        }
    }
    
}
