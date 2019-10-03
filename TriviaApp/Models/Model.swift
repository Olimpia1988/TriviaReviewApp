import Foundation


struct TriviaModel: Codable {
    var results: [TrivaQuestion]
}

struct TrivaQuestion: Codable {
    var category: String
    var type: String
    var question: String
    var correctAnswer: String
    var incorrectAnser: [String]
    
    static func getQuestions(from jsonData: Data) -> [TrivaQuestion] {
        do {
            let questionWrapper = try JSONDecoder().decode(TriviaModel.self,
                                                           from: jsonData)
            return questionWrapper.results
            
        } catch {
            dump(error)
            return []
        }
    }
    
    private enum CodingKeys : String, CodingKey {
        case category, type, question,correctAnswer = "correct_answer", incorrectAnser = "incorrect_answers"
    }
}

