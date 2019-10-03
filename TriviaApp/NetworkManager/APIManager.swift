import Foundation

final class APIManager {
   
    private init() {}
    static let manager = APIManager()
    
    func getData(completionHandler: @escaping(Result<[TrivaQuestion], AppError>) -> ()) {
        
        let stringUrl = "https://opentdb.com/api.php?amount=10"
        
        guard let url = URL(string: stringUrl) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
                
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                let questions = TrivaQuestion.getQuestions(from: data)
                completionHandler(.success(questions))
            }
        }
    }
}



