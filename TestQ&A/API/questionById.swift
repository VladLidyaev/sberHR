//
//  questionById.swift
//  TestQ&A
//
//  Created by Vlad on 27.02.2021.
//

import Foundation

enum allErrors: Error {
    case NoDataAvailable
    case CanNotProcessData
}

struct shortQuestionsDataProvider {

    let resourceURL : URL

    init(id : Int) {
        guard let resourceURL = URL(string: "http://82.146.61.94:8080/api/questions/\(id)") else {fatalError()}
        self.resourceURL = resourceURL
    }

    func getList(completion: @escaping(Result<shortQuestion,allErrors>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, _, _) in
            guard let jsonData = data else {
                completion(.failure(.NoDataAvailable))
                return
            }
            do{
                let Ans = try JSONDecoder().decode(shortQuestion.self, from: jsonData)
                completion(.success(Ans))
            } catch {
                completion(.failure(.CanNotProcessData))
            }
        }
        dataTask.resume()
    }
}
