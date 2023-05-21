//
//  NetworkServices.swift
//  Sport Application
//
//  Created by mariam adly on 20/05/2023.
//

import Foundation
class NetworkServices : LeaguesProtocol{
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
}
