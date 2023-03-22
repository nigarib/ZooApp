//
//  OnboardItems.swift
//  ZooApp
//
//  Created by Nigar on 05.03.23.
//

import Foundation

struct OnboardItems: Codable {
    let image: String
    let label: String
}

struct ZooList: Codable {
    let image: String
    let name: String
    let info: String
    let about: AboutZooList?
    let animal: [AnimalsList]?
}

struct AboutZooList: Codable {
    let image: String
    let name: String
    let address: String
    let phone: String
    
}

struct AnimalsList: Codable {
    let image: String
    let animal: String
    let about: String? //aboutanimalslist olacaq gelecekde helelik string formatda qalsin
}

struct AboutAnimalsList: Codable {
    let image: String
    let name: String
    let info: String
}

