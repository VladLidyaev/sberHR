//
//  requestDecodable.swift
//  TestQ&A
//
//  Created by Vlad on 26.02.2021.
//

import Foundation

struct shortQuestion : Decodable {
    let id : Int?
    let header : String?
    let tags : String?
    let like : Int?
    let rating: Int?
    let dislike : Int?
    let isSolved : Bool?
    let createdBy : String?
}

struct longPost : Decodable {
    let id : Int?
    let title : String?
    let content : content
    let comments : [comment?]?
    let like : Int?
    let dislike : Int?
    let solvedOrNo : Bool?
    let name : String?
}

struct comment : Decodable {
    let id : Int?
    let name : String?
    let content : content
    let condition : Bool?
    let point : Int?
}

struct content : Decodable {
    let count : Int?
    let text : [textBlock]?
    let media : [mediaBlock]?
}

struct textBlock : Decodable {
    let id : Int?
    let data : String?
}

struct mediaBlock : Decodable {
    let id : Int?
    let type : String?
    let data : [UInt8]?
}
