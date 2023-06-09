//
//  LatestResult.swift
//  Sport Application
//
//  Created by mariam adly on 23/05/2023.
//

import Foundation
class LatestEventResult : Decodable {
    var success : Int?
    var result : [LatestEvent]
}

class LatestEvent : Decodable {
    var  event_date : String?
    var  event_time : String?
    var  event_home_team : String?
    var  event_away_team : String?
    var  event_final_result : String?
    var event_first_player : String?
    var event_second_player : String?
    var event_first_player_logo : String?
    var event_second_player_logo : String?
    var  home_team_logo : String?
    var  away_team_logo: String?
}
