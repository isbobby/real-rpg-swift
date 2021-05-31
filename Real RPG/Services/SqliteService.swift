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
        let fileURL = try! FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("real_rpg_database.sqlite")

        // open database
        var db: OpaquePointer?
        if (sqlite3_open(fileURL.path, &db) == SQLITE_OK) {
            print("DB is opened")
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
    
    func insertTask(character_id:Int, experience:Int, description:String, complete_time: Date) {
        
        self.openDatabase()
        
        let formatter = DateFormatter()

        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let query_string = NSString(format: "%d %d %@ %@", character_id, experience, description, formatter.string(from: complete_time))
        
        print(query_string)
    }
    
    func insertCharacter(class_name: String, experience: Int) {
        
        self.openDatabase()
        
        let formatter = DateFormatter()

        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let query_string = "INSERT INTO characters (class_name, experience) VALUES ('" + class_name + "'," + String(experience) + ")"
        
        if sqlite3_exec(self.db, query_string, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(self.db)!)
            print("error inserting character: \(errmsg)")
        } else {
            print("Insert character success")
        }
    }
    
    func deleteCharacterById(character_id : Int) {
        
        self.openDatabase()
        
        let query_string = "DELETE FROM characters WHERE id=" + String(character_id)
        
        if sqlite3_exec(self.db, query_string, nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(self.db)!)
            print("error Deleting character: \(errmsg)")
        } else {
            print("Delete character success")
        }
    }
    
    func getAllCharacters() {
        openDatabase()
        
        var queryStatement: OpaquePointer?
        if sqlite3_prepare_v2(self.db, "SELECT * FROM characters", -1, &queryStatement, nil) ==
              SQLITE_OK {
            if sqlite3_step(queryStatement) == SQLITE_ROW {
              let id = sqlite3_column_int(queryStatement, 0)
              guard let queryResultCol1 = sqlite3_column_text(queryStatement, 1) else {
                print("Query result is nil")
                return
              }
              let name = String(cString: queryResultCol1)
              print("\(id) | \(name)")
          } else {
              print("\nQuery returned no results.")
          }
          } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\nQuery is not prepared \(errorMessage)")
          }
          sqlite3_finalize(queryStatement)
        
    }
}
