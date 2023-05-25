//
//  NetworkServiceProtocol.swift
//  Sport Application
//
//  Created by mariam adly on 29/05/2023.
//

import Foundation
protocol NetworkServiceProtocol{
    static func getLeague(sportName: String , completionHandler: @escaping (LeagueResult?) -> Void )
    
    static func getUpComingEvents(sportName: String ,leagueId: Int , completionHandler: @escaping (UpComingResult?) -> Void )
    
    static func getLatestEvents(sportName: String ,leagueId: Int , completionHandler: @escaping (LatestEventResult?) -> Void )
    
    static func getTeams(sportName: String ,leagueId: Int , completionHandler: @escaping (TeamsResult?) -> Void )
    
    static func getTeamDetails(teamId: Int , completionHandler: @escaping (TeamsResult?) -> Void )
    
}

