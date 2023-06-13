//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by Ömer Faruk Ercivan on 3.06.2023.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
