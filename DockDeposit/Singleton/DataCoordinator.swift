//
//  CoreDataManager.swift
//  DockDeposit
//
//  Created by Ethan Keiser on 2/17/20.
//  Copyright © 2020 Ethan Keiser. All rights reserved.
//

import Foundation
import CoreData

final class DataCoordinator {
    //MARK: - singleton
    private static var coordinator: DataCoordinator?
    public class func sharedInstance() -> DataCoordinator {
        if coordinator == nil {
            coordinator = DataCoordinator()
        }
        return coordinator!
    }
    
    //MARK: - init
    public var container : NSPersistentContainer
    private init() {
        container = NSPersistentContainer(name: "DockDeposit")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        })
    }
    
    //MARK: - perform methods
    static func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        DataCoordinator.sharedInstance().container.performBackgroundTask(block)
    }
   
    static func performViewTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        block(DataCoordinator.sharedInstance().container.viewContext)
    }
}
