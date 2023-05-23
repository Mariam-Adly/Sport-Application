//
//  TeamProtocol.swift
//  Sport Application
//
//  Created by mariam adly on 23/05/2023.
//

import Foundation
protocol TeamProtocol {
    static func getTeams(sportName: String ,leagueId: Int , completionHandler: @escaping (TeamsResult?) -> Void )
    
    static func getTeamDetails(teamId: Int , completionHandler: @escaping (TeamsResult?) -> Void )
}
