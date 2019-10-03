import Foundation

struct PersistenceHelper<T: Codable> {
    func getObjects() throws -> [T] {
        guard let data = FileManager.default.contents(atPath: url.path) else {
            return []
        }
        return try PropertyListDecoder().decode([T].self, from: data)
    }
    
    func save(newElement: T) throws {
        var elements = try getObjects()
        elements.append(newElement)
        let serializedData = try PropertyListEncoder().encode(elements)
        try serializedData.write(to: url, options: Data.WritingOptions.atomic)
    }
    init(fileName: String) {
        self.fileName = fileName
    }
    
    private let fileName: String
    
    private let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    private func filePathFromDcoumentsDirectory(name: String) -> URL {
        return documentsDirectory.appendingPathComponent(fileName)
    }
    
    private var url: URL {
        return filePathFromDcoumentsDirectory(name: fileName)
    }
}
