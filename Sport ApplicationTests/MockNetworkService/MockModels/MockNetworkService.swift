//
//  MockNetworkService.swift
//  Sport ApplicationTests
//
//  Created by mariam adly on 29/05/2023.
//

import Foundation
@testable import Sport_Application

class MockNetworkService : NetworkServiceProtocol {
    
    
    static func getLeague(sportName: String, completionHandler: @escaping (Sport_Application.LeagueResult?) -> Void) {
        do{
            let result = try JSONDecoder().decode(LeagueResult.self, from: MockLeagueResponse.leagueResponse.data(using: .utf8)!)
            completionHandler(result)
        }catch let error{
            print(error.localizedDescription)
            completionHandler(nil)
        }
    }

    static func getUpComingEvents(sportName: String, leagueId: Int, completionHandler: @escaping (Sport_Application.UpComingResult?) -> Void) {
        do{
            let result = try JSONDecoder().decode(UpComingResult.self, from: MockUpComingResponce.upComingResponce.data(using: .utf8)!)
            completionHandler(result)
        }catch let error{
            print(error.localizedDescription)
            completionHandler(nil)
        }
    }
    
    static func getLatestEvents(sportName: String, leagueId: Int, completionHandler: @escaping (Sport_Application.LatestEventResult?) -> Void) {
        do{
            let result = try JSONDecoder().decode(LatestEventResult.self, from: MockLatestResponcce.latestResponce.data(using: .utf8)!)
            completionHandler(result)
        }catch let error{
            print(error.localizedDescription)
            completionHandler(nil)
        }
    }
    
    static func getTeams(sportName: String, leagueId: Int, completionHandler: @escaping (Sport_Application.TeamsResult?) -> Void) {
        do{
            let result = try JSONDecoder().decode(TeamsResult.self, from: MockTeamResponce.teamResponce.data(using: .utf8)!)
            completionHandler(result)
        }catch let error{
            print(error.localizedDescription)
            completionHandler(nil)
        }
    }
    
    static func getTeamDetails(teamId: Int, completionHandler: @escaping (Sport_Application.TeamsResult?) -> Void) {
        do{
            let result = try JSONDecoder().decode(TeamsResult.self, from: MockTeamResponce.teamResponce.data(using: .utf8)!)
            completionHandler(result)
        }catch let error{
            print(error.localizedDescription)
            completionHandler(nil)
        }
        
    }
}

    

