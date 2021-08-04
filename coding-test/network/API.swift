//
//  API.swift
//  coding-test
//
//  Created by Yan Correa Trindade on 03/08/21.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

public class ImagesAPIClient {

    // MARK: - Properties

    private let endpointURL = URL(string: "http://abihome-test.herokuapp.com/test/")!

    private let session: URLSession

    // MARK: - Life Cycle

    public init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }

    // MARK: - Methods
    public func fetchImages(completion: @escaping (_ result: Result<[ImageItem]>) -> Void) {

        guard let requestURL = URL(string: "images", relativeTo: endpointURL) else {
            return
        }

        let request = URLRequest(url: requestURL)

        let task = session.dataTask(with: request) { data, response, error in

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase

                    let paths = try decoder.decode([URL].self, from: data)
                    
                    let images = paths.map({ImageItem(url: $0)})

                    DispatchQueue.main.async {
                        completion(.success(images))
                    }

                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }

        task.resume()
    }

}
