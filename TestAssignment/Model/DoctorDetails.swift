//
//  DoctorDetails.swift
//  TestAssignment
//
//  Created by Maxim on 05.09.2025.
//

import Foundation


struct DoctorDetails: Identifiable {
    let id = UUID()
    let surname: String
    let name: String
    let patronymic: String
    let specialization: String
    let rating: Int
    let experience: Int
    let price: Int
    let university : String
    let description : String
    let placeOFWork : String
    let image: String
    let category: String
}
