//: [Previous](@previous)

import Foundation

// MARK: - Async Usage

guard let url = URL(string: "https://kxcoding-study.azurewebsites.net/api/books") else {
    fatalError("Invalid URL")
}

struct BookListData: Codable {
    let code: Int
    let totalCount: Int
    let list: [Book]
}

struct Book: Codable {
    let title: String
}

enum APIError: Error {
    case general
    case invalidFormat
}


// MARK: -  Result를 쓰지 않고 하려던 방식
func NotUseResult() {
    typealias CompletionHandler = (BookListData?, Error?) -> ()

    func parseBookList(completion: @escaping CompletionHandler) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, nil)
                return
            }
            
            do {
                let list = try JSONDecoder().decode(BookListData.self, from: data)
                completion(list, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }

    parseBookList { data, error in
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        data?.list.forEach { print($0.title) }
    }
}


// MARK: - Result를 쓰는 방식
typealias CompletionHandler = (Result<BookListData, APIError>) -> ()

func parseBookList(completion: @escaping CompletionHandler) {
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let _ = error {
            completion(.failure(.general))
            return
        }
        guard let data = data else {
            completion(.failure(.general))
            return
        }
        
        do {
            let list = try JSONDecoder().decode(BookListData.self, from: data)
            completion(.success(list))
        } catch {
            completion(.failure(.general))
        }
    }
    task.resume()
}

parseBookList { result in
    switch result {
    case .success(let data):
        data.list.forEach { print("\($0.title)") }
        
    case .failure(let error):
        print(error.localizedDescription)
        
        switch error {
        case .general:
            // code
            break
        case .invalidFormat:
            // code
            break
        }
    }
}


//: [Next](@next)
