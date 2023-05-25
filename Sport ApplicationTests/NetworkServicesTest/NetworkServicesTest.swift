//
//  NetworkServicesTest.swift
//  Sport ApplicationTests
//
//  Created by mariam adly on 29/05/2023.
//

import XCTest
@testable import Sport_Application

final class NetworkServicesTest: XCTestCase {
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetLegues(){
        let myExpectation = expectation(description: "wait for my Api")
        NetworkServices.getLeague(sportName: "football"){
            leagues in
            guard let leagueList = leagues?.result else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(leagueList.count, 0, "fail to catch data")
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 5,handler: nil)
    }
    
    func testGetUpComingEvents(){
        let myExpectation = expectation(description: "wait for my Api")
        NetworkServices.getUpComingEvents(sportName: "football", leagueId: 4){
            upComing in
            guard let upComingList = upComing?.result else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(upComingList.count, 0, "fail to catch data")
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 9,handler: nil)
    }
    
    func testGetLatestEvents(){
        let myExpectation = expectation(description: "wait for my Api")
        NetworkServices.getLatestEvents(sportName: "football", leagueId: 4){
            latest in
            guard let latestList = latest?.result else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(latestList.count, 0, "fail to catch data")
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 9,handler: nil)
    }
    
    func testGetTeams(){
        let myExpectation = expectation(description: "wait for my Api")
        NetworkServices.getTeams(sportName: "football", leagueId: 4){
            teams in
            guard let teamsList = teams?.result else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(teamsList.count, 0, "fail to catch data")
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 5,handler: nil)
    }
    
    func testGetTeamDetails(){
        let myExpectation = expectation(description: "wait for my Api")
        NetworkServices.getTeamDetails(teamId: 4){
            teamDetails in
            guard let teamsDetails = teamDetails?.result else{
                XCTFail()
                myExpectation.fulfill()
                return
            }
            XCTAssertGreaterThan(teamsDetails.count, 0, "fail to catch data")
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 5,handler: nil)
    }
}
