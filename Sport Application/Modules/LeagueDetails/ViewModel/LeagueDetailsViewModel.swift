//
//  UpcomingViewModel.swift
//  Sport Application
//
//  Created by mariam adly on 21/05/2023.
//

import Foundation
class LeagueDetilsViewModel{
    
    var sportName : String?
    var leagueId : Int?
    var leagueDetailsViewModel : LeagueDetilsViewModel?
    init(sportName: String? = nil, leagueId: Int? = nil, leagueDetailsViewModel: LeagueDetilsViewModel? = nil) {
        self.sportName = sportName
        self.leagueId = leagueId
        self.leagueDetailsViewModel = leagueDetailsViewModel
    }

   
    var bindUpComingListToLeagueDetailsVC :  (()->()) = {}
    var bindLatestEventListToLeagueDetailsVC :  (()->()) = {}
    var bindTeamsListToLeagueDetailsVC :  (()->()) = {}
    var bindTeamsTennisListToLeagueDetailsVC :  (()->()) = {}
    
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
    
    var playersTennis : [TennisPlayer]? {
        didSet {
            bindTeamsTennisListToLeagueDetailsVC()
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
    
    func getPlayers(sportName: String, leagueId: Int){
        NetworkServices.getPlayers(sportName: sportName, leagueId: leagueId) { [weak self] result in
            self?.playersTennis = result?.result
        }
    }
    
    
}
