//
//  MockNetworkServicesTest.swift
//  Sport ApplicationTests
//
//  Created by mariam adly on 29/05/2023.
//

import XCTest
@testable import Sport_Application

final class MockNetworkServicesTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
 
    func testGetLegues(){
        MockNetworkService.getLeague(sportName: "football"){
            leagues in
            guard let leagueList = leagues?.result else{
                XCTFail()
                return
            }
            XCTAssertGreaterThan(leagueList.count, 0, "parseing Failed")
        }
    }
    
    func testGetUpComingEvents(){
        MockNetworkService.getUpComingEvents(sportName: "football", leagueId: 4){
            upComing in
            guard let upComingList = upComing?.result else{
                XCTFail()
                return
            }
            XCTAssertGreaterThan(upComingList.count, 0, "parseing Failed")
        }
    }
    
    func testGetLatestEvents(){
        MockNetworkService.getLatestEvents(sportName: "football", leagueId: 4){
            latest in
            guard let latestList = latest?.result else{
                XCTFail()
                return
            }
            XCTAssertGreaterThan(latestList.count, 0, "parseing Failed")
        }
    }
    
    func testGetTeams(){
        MockNetworkService.getTeams(sportName: "football", leagueId: 4){
            teams in
            guard let teamsList = teams?.result else{
                XCTFail()
                return
            }
            XCTAssertGreaterThan(teamsList.count, 0, "parseing Failed")
        }
    }
    
    func testGetTeamDetails(){
        MockNetworkService.getTeamDetails(teamId: 4){
            teamDetails in
            guard let teamsDetails = teamDetails?.result else{
                XCTFail()
                return
            }
            XCTAssertGreaterThan(teamsDetails.count, 0, "parseing Failed")
        }
    }
    

}
