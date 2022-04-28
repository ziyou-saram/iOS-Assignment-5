//
//  RealmManager.swift
//  ToDo App
//
//  Created by Alikhan Zhumabayev on 28.04.2022.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTask()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: ["title": taskTitle, "done": false])
                    localRealm.add(newTask)
                    getTask()
                    print("Added new Task to Realm: \(newTask)")
                }
            } catch {
                print("Error adding Task to Realm: \(error)")
            }
        }
    }
    
    func getTask() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "done")
            tasks = []
            allTasks.forEach {task in
                tasks.append(task)
            }
        }
    }
    
    func updateTask(id: ObjectId, done: Bool) {
        if let localRealm = localRealm {
            do {
                let taskUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskUpdate.isEmpty else {return}
                
                try localRealm.write {
                    taskUpdate[0].done = done
                    getTask()
                    print("Updated Task with \(id)! Done status: \(done)")
                }
                
            } catch {
                print("Error updating Task: \(id) to Realm: \(error)")
            }
        }
    }
    
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let taskDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskDelete.isEmpty else {return}
                
                try localRealm.write {
                    localRealm.delete(taskDelete)
                    getTask()
                    print("Deleted Task with id \(id)")
                }
            } catch {
                print("Error deleting task \(id) from Realm: \(error)")
            }
        }
    }
}
