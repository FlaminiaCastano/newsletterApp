//
//  APIManager.swift
//  NewsletterApp
//
//  Created by Flaminia Castaño on 27/12/2023.
//

import Foundation

protocol Routable {
    var url: String { get }
    var baseURL: String { get }
    var path: String { get }
}

extension Routable {
    var url: String {
        return "\(baseURL)\(path)"
    }
}

enum JsonPlaceHolderRoute {
    case news
    case users
}

protocol JsonPlaceHolderRoutable: Routable {
    var route: JsonPlaceHolderRoute { get set }
    
}

extension JsonPlaceHolderRoutable {
    var baseURL: String {
        return "https://jsonplaceholder.org/"
    }
    
    var path: String {
        switch route {
        case .news:
            return "/posts"
        case .users:
            return "/users"
        }
    }
}

struct JsonPlaceHolderRoutes: JsonPlaceHolderRoutable {
    var route: JsonPlaceHolderRoute
}
