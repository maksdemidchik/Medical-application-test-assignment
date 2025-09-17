//
//  Response.swift
//  TestAssignment
//
//  Created by Maxim on 17.09.2025.
//
import Foundation
struct Response: Decodable {
    let count: Int
    let message: String
    let data: Users
}

struct Users: Decodable {
    let users: [Details]
}

struct Details: Decodable {
    let id: String
    let lastName: String
    let firstName: String
    let patronymic: String
    let seniority: Int
    let rank: Int
    let textChatPrice : Int
    let videoChatPrice : Int
    let homePrice : Int
    let hospitalPrice : Int
    let avatar: String?
    let category: Int
    let educationTypeLabel: Education?
    private enum CodingKeys: String, CodingKey {
        case lastName = "last_name"
        case firstName="first_name"
        case textChatPrice = "text_chat_price"
        case videoChatPrice = "video_chat_price"
        case homePrice = "home_price"
        case hospitalPrice = "hospital_price"
        case educationTypeLabel = "education_type_label"
        case id, patronymic, seniority, rank, avatar, category
    }
}

struct Education: Decodable{
    let name: String
}
