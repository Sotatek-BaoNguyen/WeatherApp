import Foundation

class APIClient: APIClientProtocol {
    typealias APIClientResult<T> = (Result<T, Error>) -> Void
    var session: URLSessionProtocol
    
    required init(session: URLSessionProtocol) {
        self.session = session
    }
    
    func fetch<T: Decodable>(dataType: T.Type, from url: URL, completionHandler: @escaping APIClientResult<T>) {
        session.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completionHandler(.failure(error!))
                return
            }
                        
            do {
                let decodedJSON: T = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(decodedJSON))
            } catch let error {
                completionHandler(.failure(error))
            }
        }.resume()
    }
    
    func fetchRawData(from url: URL, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completionHandler(.failure(error!))
                return
            }
            
            completionHandler(.success(data))
            return
        }.resume()
    }
}
