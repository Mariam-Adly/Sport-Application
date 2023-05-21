//
//  LeaguesProtocol.swift
//  Sport Application
//
//  Created by mariam adly on 21/05/2023.
//

import Foundation
protocol LeaguesProtocol{
    static func getLeague(sportName: String , completionHandler: @escaping (LeagueResult?) -> Void )
}
