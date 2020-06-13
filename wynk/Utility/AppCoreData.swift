//
//  AppCoreData.swift
//  wynk
//
//  Created by Python on 6/13/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit
import CoreData

class AppCoreData: NSObject {
    

    var context : NSManagedObjectContext?
    lazy var persistentContainer: NSPersistentContainer = {
    
        let container = NSPersistentContainer(name: "wynk")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    override init() {
        super.init()
        context = self.persistentContainer.viewContext
    }

    
    func addSearchString(value:String)  {
        
        if !checkIfItemExist(keyword: value) {
            if let cont = context {
               let entity = NSEntityDescription.entity(forEntityName: "SearchStrings", in: cont )
               let new = NSManagedObject(entity: entity!, insertInto: cont)
               
                new.setValue(value.lowercased(), forKey: "keyword")

               do {
                  try cont.save()
                 } catch {
                  print("Failed saving")
               }
            }
        }else{
            print("alredy exits")
        }

       
    }
    
    
    func checkIfItemExist( keyword: String) -> Bool {

         if let managedContext = context {

            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "SearchStrings")
                fetchRequest.fetchLimit =  1
            fetchRequest.predicate = NSPredicate(format: "keyword = %@", keyword.lowercased())

                do {
                    let count = try managedContext.count(for: fetchRequest)
                    if count > 0 {
                        return true
                    }else {
                        return false
                    }
                }catch let error as NSError {
                    print("Could not fetch. \(error), \(error.userInfo)")
                    return false
                }
            
        }
        
        return false
    }
    
    func getValues(str:String) -> [String] {

        var array = [String]()
        if let cont = context {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "SearchStrings")

            if str.count > 0{
                request.predicate = NSPredicate(format: "keyword = %@", str)   
            }
            
            request.returnsObjectsAsFaults = false
            
            do {
                let result = try cont.fetch(request)
               
                for data in result as! [NSManagedObject] {
                   print(data.value(forKey: "keyword") as! String)
                    if let value = data.value(forKey: "keyword") as? String {
                          array.append(value)
                    }
                    
                }
                
            } catch {
                
                print("Failed")
            }
            
            
            
        }
        
        if array.count > 0 {
            let reversedNames : [String] = Array(array.reversed())
            return reversedNames
        }
        

        return array
        
    }
}
