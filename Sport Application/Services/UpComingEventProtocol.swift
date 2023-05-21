//
//  UpComingEventProtocol.swift
//  Sport Application
//
//  Created by mariam adly on 21/05/2023.
//

import Foundation
protocol UpComingEventsProtocol {
    static func getUpComingEvents(sportName: String ,leagueId: Int , completionHandler: @escaping (UpComingResult?) -> Void )
}
