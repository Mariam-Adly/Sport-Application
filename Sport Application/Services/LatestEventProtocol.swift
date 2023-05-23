//
//  LatestEventProtocol.swift
//  Sport Application
//
//  Created by mariam adly on 23/05/2023.
//

import Foundation
protocol LatestEventProtocol{
    static func getLatestEvents(sportName: String ,leagueId: Int , completionHandler: @escaping (LatestEventResult?) -> Void )
}
