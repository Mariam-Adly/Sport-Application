//
//  TeamsFavCoreData.swift
//  Sport Application
//
//  Created by mariam adly on 24/05/2023.
//

import Foundation
import CoreData
import UIKit

class TeamsFavCoreData{
    
    var context : NSManagedObjectContext?
    let appDelegate : AppDelegate?
    static var coreData = TeamsFavCoreData()
    let entity: NSEntityDescription?
    
     private init(){
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate?.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "Team", in: context!)
    }
    func insertTeam(teamPass : Teams){
        
        let team = NSManagedObject(entity: entity!, insertInto: context)
    
        team.setValue(teamPass.team_key, forKey: "teamKey")
        team.setValue(teamPass.team_name, forKey: "teamName")
        team.setValue(teamPass.team_logo, forKey: "teamLogo")
        team.setValue(true, forKey: "isFav")
        do{
            try context?.save()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
    }
    
    func fetchTeams()->[Teams]?{
        var teamArr = [Teams]()
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Team")
        do{
            let teams = try self.context?.fetch(fetchReq)
            
            for team in teams!{
                let team = Teams(team_key: team.value(forKey: "teamKey") as? Int,
                                 team_name: team.value(forKey: "teamName") as? String,
                                 team_logo: team.value(forKey: "teamLogo") as? String)
                teamArr.append(team)

            }
          }catch let error as NSError{
              print(error.localizedDescription)
        }
        return teamArr
    }
    
    func deleteTeam(team:Teams){
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Team")
        let predicate = NSPredicate(format: "teamKey==%i", team.team_key ?? 0)
        fetchReq.predicate = predicate
        do{
            let team = try self.context?.fetch(fetchReq)
            context?.delete(team![0])
            try context?.save()
            
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    func teamIsFav(team:Teams)->Bool{
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Team")
        fetchReq.predicate = NSPredicate(format: "teamKey == %i", team.team_key ?? 0)
        do{
            let team = try self.context?.fetch(fetchReq) as! [NSManagedObject]
            if let team = team.first{
                return team.value(forKey: "isFav") as? Bool ?? false
            }
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        return false
    }
}
