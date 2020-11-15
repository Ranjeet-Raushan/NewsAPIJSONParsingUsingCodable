//  models.swift
//  NewsAPIJSONParsingUsingCodable
//  Created by Ranjeet Raushan on 15/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import Foundation

struct Result : Codable{
    let status: String?
    let totalResults: Int?
    let articles: [Articles]?
}

struct Articles: Codable{
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct Source: Codable{
    let id: String?
    let name :String?
}

