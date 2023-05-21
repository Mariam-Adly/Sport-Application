//
//  League.swift
//  Sport Application
//
//  Created by mariam adly on 19/05/2023.
//

import Foundation


class LeagueRoot : Decodable {
    var success: Int?
    var result: [League]
}


class League : Decodable {
    var league_key: Int?
    var league_name: String?
    var country_key: Int?
    var country_name: String?
    var league_logo: String?
}
