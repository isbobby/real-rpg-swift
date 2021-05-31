import SQLite3
import Foundation

class SqliteApi {
    let createCharacterTableString =  """
        CREATE TABLE IF NOT EXISTS characters
        (id INTEGER PRIMARY KEY AUTOINCREMENT, class_name TEXT NOT NULL, experience INTEGER NOT NULL)
    """
    
    let createTaskTableString =  """
        CREATE TABLE IF NOT EXISTS tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        character_id INTEGER NOT NULL,
        experience INTEGER NOT NULL,
        description TEXT,
        complete_time DATETIME,
         FOREIGN KEY (character_id) REFERENCES characters(id))
    """
    
    var db : OpaquePointer?
    
    func openDatabase() {
        // Create/open DB
        let fileURL = try! FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("test.sqlite")

        // open database
        var db: OpaquePointer?
        if (sqlite3_open(fileURL.path, &db) == SQLITE_OK) {
            print("DB is created/opened")
            self.db = db;
        } else {
            sqlite3_close(db)
            self.db = nil
        }
    }
    
    func createTables() {

        self.openDatabase()
        
        if sqlite3_exec(self.db, self.createCharacterTableString, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(self.db)!)
            print("error creating table: \(errmsg)")
        } else {
            print("Create character table success")
        }
        
        if sqlite3_exec(self.db, self.createTaskTableString, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(self.db)!)
            print("error creating table: \(errmsg)")
        } else {
            print("Create task table success")
        }
    }
    
    func insertTask(character_id:Int, experience: Int, description: String, complete_time: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let insertTaskString = NSString(format: "%d %d %@ %@", character_id, experience, description, formatter.string(from: complete_time))
        
        print(insertTaskString)
    }
}
