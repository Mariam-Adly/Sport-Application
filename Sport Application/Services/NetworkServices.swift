//
//  NetworkServices.swift
//  Sport Application
//
//  Created by mariam adly on 20/05/2023.
//

import Foundation
class NetworkServices : LeaguesProtocol , UpComingEventsProtocol , LatestEventProtocol,TeamProtocol{


    static func getLeague(sportName: String , completionHandler: @escaping (LeagueResult?) -> Void ){
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?met=Leagues&APIkey=93f87636cdebb85cc3fbaa334ca0094cca19f7c62178d9a6462d2014d550ebf3")
        guard let newUrl = url else {
            return
        }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data,response , error in
            do{
                let result = try JSONDecoder().decode(LeagueResult.self, from: data!)
                completionHandler(result)
            }catch let error{
                print(error.localizedDescription)
                completionHandler(nil)
            }
        
        }
        task.resume()

    }
    static func getUpComingEvents(sportName: String ,leagueId: Int , completionHandler: @escaping (UpComingResult?) -> Void ){
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?met=Fixtures&leagueId=\(leagueId)&from=2023-05-09&to=2024-02-09&APIkey=93f87636cdebb85cc3fbaa334ca0094cca19f7c62178d9a6462d2014d550ebf3")
        guard let newUrl = url else {
            return
        }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data,response , error in
            do{
                let result = try JSONDecoder().decode(UpComingResult.self, from: data!)
                completionHandler(result)
            }catch let error{
                print(error.localizedDescription)
                completionHandler(nil)
            }
            
        }
        task.resume()
    }
    
    static func getLatestEvents(sportName: String, leagueId: Int, completionHandler: @escaping (LatestEventResult?) -> Void) {
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?met=Fixtures&leagueId=\(leagueId)&from=2023-04-09&to=2024-02-09&APIkey=93f87636cdebb85cc3fbaa334ca0094cca19f7c62178d9a6462d2014d550ebf3")
        guard let newUrl = url else {
            return
        }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data,response , error in
            do{
                let result = try JSONDecoder().decode(LatestEventResult.self, from: data!)
                completionHandler(result)
            }catch let error{
                print(error.localizedDescription)
                completionHandler(nil)
            }
            
        }
        task.resume()
    }
    static func getTeams(sportName: String, leagueId: Int, completionHandler: @escaping (TeamsResult?) -> Void) {
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?met=Teams&?met=Leagues&leagueId=\(leagueId)&APIkey=93f87636cdebb85cc3fbaa334ca0094cca19f7c62178d9a6462d2014d550ebf3")
        guard let newUrl = url else {
            return
        }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data,response , error in
            do{
                let result = try JSONDecoder().decode(TeamsResult.self, from: data!)
                completionHandler(result)
            }catch let error{
                print(error.localizedDescription)
                completionHandler(nil)
            }
            
        }
        task.resume()
    }
    
    static func getTeamDetails(teamId: Int, completionHandler: @escaping (TeamsResult?) -> Void) {
        
    }
    
}
