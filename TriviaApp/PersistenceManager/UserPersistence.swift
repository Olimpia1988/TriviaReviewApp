import Foundation
struct DataPersistence {
    private init() {}
    static let manager = DataPersistence()
    private let persistenceHelper = PersistenceHelper<String>(fileName: "trivia.plist")
    
    
    
    func addData(newUser: String) throws {
        try persistenceHelper.save(newElement: newUser)
    }
    
    func getTrivias() throws -> [String] {
        return try persistenceHelper.getObjects()
    }
}
