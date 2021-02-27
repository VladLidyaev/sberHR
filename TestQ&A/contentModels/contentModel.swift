//
//  contentModel.swift
//  TestQ&A
//
//  Created by Vlad on 27.02.2021.
//

import Foundation
import UIKit

struct contentModel : Codable {
    let id : Int
    let count : Int
    var arrayTextBlocks : [contentModelText]
    var arrayMediaBlocks : [contentModelMedia]
    
    init(input: content) {
        id = input.id!
        count = input.count!
        arrayTextBlocks = [contentModelText]()
        for element in input.text! {
            arrayTextBlocks.append(contentModelText(input: element))
        }
        arrayMediaBlocks = [contentModelMedia]()
        for element in input.media! {
            arrayMediaBlocks.append(contentModelMedia(input: element))
        }
    }
    
    func getImage(id : Int) -> (UIImage) {
        for element in arrayMediaBlocks {
            if (element.type == "img")&&(element.id == id) {
                return UIImage(data: NSData(bytes: element.data, length: element.data.count) as Data)!
            }
        }
        return UIImage(systemName: "questionmark")!
    }
}

struct contentModelText : Codable{
    let id : Int
    let data : String
    
    init(input: textBlock) {
        id = input.id!
        data = input.data!
    }
}

struct contentModelMedia : Codable {
    let id : Int
    let type : String
    let data : [UInt8]
    
    init(input: mediaBlock) {
        id = input.id!
        type = input.type!
        data = input.data!
    }
}
