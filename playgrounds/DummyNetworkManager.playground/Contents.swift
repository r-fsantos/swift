import Foundation
import Network

enum HttpDummyError: LocalizedError {
    case usualError

    var localizedError: String {
        switch self {
        case .usualError:
            return "Usual error"
        }
    }
}

final class NetworkManagerService {
    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func request(url: String, method: String, completionHandler: @escaping (Result<Data, HttpDummyError>) -> Void) {
        guard let urlRequest = self.requestBuilder(urlPath: url, method: method) else {
            completionHandler(.failure(.usualError))
            return
        }

        let dataTask = self.session.dataTask(with: urlRequest) { [weak self] data, response, error in
            if error != nil {
                completionHandler(.failure(.usualError))
            }

            switch self?.processStatusCode(response: response) {
            case .failure:
                completionHandler(.failure(.usualError))
            case .none:
                completionHandler(.failure(.usualError))
            case .success:
                if let data = data, data.count > 0 {
                    completionHandler(.success(data))
                }
                completionHandler(.failure(.usualError))
            }
        }
        dataTask.resume()
    }

    private func processStatusCode(response: URLResponse?) -> Result<Void, HttpDummyError> {
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(.usualError)
        }

        switch httpResponse.statusCode {
        case 200...299:
            return .success(())
        case 401:
            return .failure(.usualError)
        case 404:
            return .failure(.usualError)
        case 400...499:
            return .failure(.usualError)
        default:
            return .failure(.usualError)
        }
    }

    private func requestBuilder(urlPath: String, method: String) -> URLRequest? {
        guard let urlPathQueryEncoding = urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: urlPathQueryEncoding) else {
                  return nil
              }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        return urlRequest
    }
}
