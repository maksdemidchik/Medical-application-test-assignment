//
//  DoctorCell.swift
//  TestAssignment
//
//  Created by Maxim on 11.09.2025.
//
import SwiftUI
struct DoctorCell: View {
    private var tasksString: String {
        if experience != nil {
            return String.localizedStringWithFormat(
                NSLocalizedString("experience", comment: "Number of remaining tasks"),
                experience ?? -1
            )
        }
        return "неизвестен"
    }
    private let surname: String
    private let name: String
    private let patronymic: String
    private let rating: Int
    private let experience: Int?
    private let price: String
    private var onBookAction: () -> Void
    private var image: String
    init(surname: String,
         name: String,
         patronymic: String,
         rating: Int,
         experience: Int?,
         price: String,
         image: String,
         onBookAction: @escaping () -> Void) {
        self.surname = surname
        self.name = name
        self.patronymic = patronymic
        
        self.rating = rating
        self.experience = experience
        self.price = price
        self.image = image
        self.onBookAction = onBookAction
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            HStack(alignment: .top,spacing: 16) {

                Image(image)
                    .frame(width: 50, height: 50)

                VStack(alignment: .leading, spacing: 4) {
                    Text("\(surname)\n\(name) \(patronymic)")
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack(spacing: 2) {
                        ForEach(0..<5, id: \.self) { index in
                            Image(systemName: "star.fill")
                                .foregroundStyle(index < rating ? Color.pinkTest : Color.darkGray)
                                .font(.system(size: 12))
                        }
                    }
                    
                    Text("Педиатр・стаж \(tasksString)")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.darkGray)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("от \(price) ₽")
                        .font(.system(size: 16, weight: .semibold))
                }
                Spacer()
                Button{
                    
                } label: {
                    Image("Heart")
                }
               
                    
            }
            
            Button("Записаться") {
                onBookAction()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 47)
            .background(Color.pinkTest)
            .cornerRadius(8)
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .semibold))
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(8)
    }
}

#Preview {
    DoctorCell(surname: "ggg", name: "rrrr", patronymic: "rr", rating: 3, experience: 1, price: "11", image: "testImage", onBookAction: {})
}
