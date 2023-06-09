//
//  NetworkServices.swift
//  Sport Application
//
//  Created by mariam adly on 20/05/2023.
//

import Foundation
class NetworkServices : NetworkServiceProtocol{

    static func getLeague(sportName: String , completionHandler: @escaping (LeagueResult?) -> Void ){
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?met=Leagues&APIkey=57cecd84100c07505520ada35504718a426ad11fe99174a030c25ff4ed94bce9")
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
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?met=Fixtures&APIkey=57cecd84100c07505520ada35504718a426ad11fe99174a030c25ff4ed94bce9&from=2020-05-23&to=2025-06-30&leagueId=\(leagueId)")
        print("jessy\(sportName)")
        print("jessy\(leagueId)")
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
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?met=Fixtures&APIkey=57cecd84100c07505520ada35504718a426ad11fe99174a030c25ff4ed94bce9&from=2020-05-23&to=2025-06-30&leagueId=\(leagueId)")
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
                print("jessy\(error.localizedDescription)")
                completionHandler(nil)
            }
            
        }
        task.resume()
    }

    static func getTeams(sportName: String, leagueId: Int, completionHandler: @escaping (TeamsResult?) -> Void) {
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?&met=Teams&APIkey=57cecd84100c07505520ada35504718a426ad11fe99174a030c25ff4ed94bce9&leagueId=\(leagueId)")
        guard let newUrl = url else {
            return
        }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data,response , error in
            do{
                let result = try JSONDecoder().decode(TeamsResult.self, from: data!)
                completionHandler(result)
                print("jessy\(leagueId)")
            }catch let error{
                print(error.localizedDescription)
                completionHandler(nil)
            }
            
        }
        task.resume()
    }
    
    static func getPlayers(sportName: String, leagueId: Int, completionHandler: @escaping (AllPlayers?) -> Void) {
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sportName)/?&met=Players&APIkey=57cecd84100c07505520ada35504718a426ad11fe99174a030c25ff4ed94bce9&leagueId=\(leagueId)")
        guard let newUrl = url else {
            return
        }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data,response , error in
            do{
                let result = try JSONDecoder().decode(AllPlayers.self, from: data!)
                completionHandler(result)
                print("jessy\(leagueId)")
            }catch let error{
                print(error.localizedDescription)
                completionHandler(nil)
            }
            
        }
        task.resume()
    }
    
    static func getTeamDetails(teamId: Int, completionHandler: @escaping (TeamsResult?) -> Void) {
        let url = URL(string: "https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=\(teamId)&APIkey=57cecd84100c07505520ada35504718a426ad11fe99174a030c25ff4ed94bce9")
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
    
}
