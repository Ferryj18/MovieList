//
//  title.swift
//  MovieList
//
//  Created by Ferry jati on 05/12/24.
//


import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}

////popular
//  "page": 1,
//  "results": [
//    {
//      "adult": false,
//      "backdrop_path": "/tElnmtQ6yz1PjN1kePNl8yMSb59.jpg",
//      "genre_ids": [
//        16,
//        12,
//        10751,
//        35
//      ],
//      "id": 1241982,
//      "original_language": "en",
//      "original_title": "Moana 2",
//      "overview": "After receiving an unexpected call from her wayfinding ancestors, Moana journeys alongside Maui and a new crew to the far seas of Oceania and into dangerous, long-lost waters for an adventure unlike anything she's ever faced.",
//      "popularity": 5883.763,
//      "poster_path": "/yh64qw9mgXBvlaWDi7Q9tpUBAvH.jpg",
//      "release_date": "2024-11-27",
//      "title": "Moana 2",
//      "video": false,
//      "vote_average": 6.9,
//      "vote_count": 311
//    },
//    {
//      "adult": false,
//      "backdrop_path": "/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg",
//      "genre_ids": [
//        878,
//        28,
//        12
//      ],
//      "id": 912649,
//      "original_language": "en",
//      "original_title": "Venom: The Last Dance",
//      "overview": "Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance.",
//      "popularity": 3523.453,
//      "poster_path": "/aosm8NMQ3UyoBVpSxyimorCQykC.jpg",
//      "release_date": "2024-10-22",
//      "title": "Venom: The Last Dance",
//      "video": false,
//      "vote_average": 6.4,
//      "vote_count": 987
//    },
//    {
//      "adult": false,
//      "backdrop_path": "/au3o84ub27qTZiMiEc9UYzN74V3.jpg",
//      "genre_ids": [
//        28,
//        878,
//        53
//      ],
//      "id": 1035048,
//      "original_language": "en",
//      "original_title": "Elevation",
//      "overview": "A single father and two women venture from the safety of their homes to face monstrous creatures to save the life of a young boy.",
//      "popularity": 2204.744,
//      "poster_path": "/uQhYBxOVFU6s9agD49FnGHwJqG5.jpg",
//      "release_date": "2024-11-07",
//      "title": "Elevation",
//      "video": false,
//      "vote_average": 6.4,
//      "vote_count": 86
//    },
