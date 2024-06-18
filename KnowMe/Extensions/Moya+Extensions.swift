//
//  Moya+Extensions.swift
//  KnowMe
//
//  Created by MEKHAK GHAPANTSYAN on 17.06.24.
//

import Foundation
import Moya
import Combine

extension MoyaProvider {
    @discardableResult func requestSimple(_ target: Target) -> AnyPublisher<Void, Error> {
        return Future { [weak self] promise in
            guard let self = self else { return promise(.failure(RequestServiceError(message: "self", httpStatus: "400"))) }
            self.request(target, callbackQueue: RequestServices.Auth.apiQueue) { result in
                switch result {
                case .success(let response):
                    do {
                        _ = try response.filterSuccessfulStatusCodes()
                        return promise(.success(()))
                    } catch {
                        let errorMoya = error as? MoyaError
                        
                        if let data = errorMoya?.response?.data, let errorArray = try? JSONDecoder().decode([RequestServiceError].self, from: data), var errorLocal = errorArray.first {
                            if errorLocal.message.contains("password") {
                                errorLocal.statusCode = 422
                            }
                            return promise(.failure(errorLocal))
                        }
                        
                        if let data = errorMoya?.response?.data, let errorLocal = try? JSONDecoder().decode(RequestServiceError.self, from: data) {
                            return promise(.failure(errorLocal))
                        }
                            
                        if response.needsAuthentication {
                            print("Could not complete request for \(target): \(errorMoya?.localizedDescription ?? "")")
                            return promise(.failure(error))
                        } else {
                            return promise(.failure(error))
                        }
                    }
                case .failure(let error):
                    return promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    @discardableResult func requestDecodable<T: Decodable>(_ target: Target) -> AnyPublisher<T, Error> {
        return Future { [weak self] promise in
            guard let self = self else { return promise(.failure(RequestServiceError(message: "self", httpStatus: "400"))) }
            self.request(target, callbackQueue: RequestServices.Auth.apiQueue) { result in
                switch result {
                    
                case .success(let response):
                    do {
                        _ = try response.filterSuccessfulStatusCodes()
                        
                        let object = try response.map(T.self)
                        return promise(.success(object))
                    } catch {
                        let errorMoya = error as? MoyaError
                        
                        if let data = errorMoya?.response?.data, let errorArray = try? JSONDecoder().decode([RequestServiceError].self, from: data), let errorLocal = errorArray.first {
                            return promise(.failure(errorLocal))
                        }
                        
                        if let data = errorMoya?.response?.data, let errorLocal = try? JSONDecoder().decode(RequestServiceError.self, from: data) {
                            return promise(.failure(errorLocal))
                        }
                        
                        if response.needsAuthentication {
                            print("Could not complete request for \(target): \(error)")
                        } else {
                            return promise(.failure(error))
                        }
                    }
                case .failure(let error):
                    return promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}

private extension Response {
    var needsAuthentication: Bool {
        return !(statusCode == 401 || statusCode == 403)
    }
}

enum RequestServices {
    enum Auth {
        static let apiQueue: DispatchQueue = .init(label: "authQueue", qos: .default, attributes: .concurrent)
    }
}

