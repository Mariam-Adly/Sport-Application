//
//  MockTeamResponse.swift
//  Sport ApplicationTests
//
//  Created by mariam adly on 29/05/2023.
//

import Foundation
@testable import Sport_Application

class MockTeamResponce{
    static var teamResponce = """
    {
      "success": 1,
      "result": [
        {
          "team_key": 93,
          "team_name": "Lazio",
          "team_logo": "https://apiv2.allsportsapi.com/logo/93_lazio.jpg",
          "players": [
            {
              "player_key": 819834549,
              "player_name": "Luís Maximiano",
              "player_number": "1",
              "player_country": null,
              "player_type": "Goalkeepers",
              "player_age": "24",
              "player_match_played": "1",
              "player_goals": "0",
              "player_yellow_cards": "0",
              "player_red_cards": "1",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/62528_luis-maximiano.jpg"
            },
            {
              "player_key": 3678828862,
              "player_name": "M. Adamonis",
              "player_number": "31",
              "player_country": null,
              "player_type": "Goalkeepers",
              "player_age": "25",
              "player_match_played": "0",
              "player_goals": "0",
              "player_yellow_cards": "0",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/42209_m-adamonis.jpg"
            }
          ],
          "coaches": [
            {
              "coach_name": "M. Sarri",
              "coach_country": null,
              "coach_age": null
            }
          ]
        }
      ]
    }

"""
}
