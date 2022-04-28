//
//  Task.swift
//  ToDo App
//
//  Created by Alikhan Zhumabayev on 28.04.2022.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var done = false
}
