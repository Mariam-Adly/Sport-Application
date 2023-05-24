//
//  UpComingEvent.swift
//  Sport Application
//
//  Created by mariam adly on 21/05/2023.
//

import Foundation
class UpComingResult : Decodable {
    var result : [UpCommingEvent]
    var success : Int?
}

class UpCommingEvent : Decodable{
    var event_date : String?
    var event_time: String?
    var event_home_team : String?
    var event_away_team : String?
    var home_team_logo : String?
    var away_team_logo : String?
    
  
    
}
