//
//  DetailView.swift
//  TestAssignment
//
//  Created by Maxim on 05.09.2025.
//

import SwiftUI
import Kingfisher

struct item: Hashable {
    let name: String
}

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    private let doctorDetails: DoctorDetails
    
    init(doctorDetails: DoctorDetails){
        self.doctorDetails = doctorDetails
    }
    
    var body: some View {
        ZStack(alignment: .top){
            Color.lightGray.ignoresSafeArea()
            VStack(alignment:.leading,spacing:20){
                HStack(spacing: 16){
                    KFImage(URL(string: doctorDetails.image))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 33))
                    VStack(alignment: .leading){
                        
                        Text(doctorDetails.surname)
                            .font(.system(size: 16, weight: .semibold))
                        Text("\(doctorDetails.name) \(doctorDetails.patronymic)")
                            .font(.system(size: 16, weight: .semibold))
                    }

                }
                
                VStack(alignment: .leading, spacing:10){
                    HStack(spacing: 12){
                        Image("experienceImage")
                        Text("Опыт работы: \(GrammatickHelper.formatExperience(doctorDetails.experience))")
                            .font(.system(size: 14,weight: .regular))
                            .foregroundColor(.darkGray)
                    }

                    HStack(spacing: 12){
                        Image("CategoryImage")
                        Text(doctorDetails.category)
                            .font(.system(size: 14,weight: .regular))
                            .foregroundColor(.darkGray)
                    }

                    HStack(spacing: 12){
                        Image("graduationImage")
                        Text(doctorDetails.university)
                            .font(.system(size: 14,weight: .regular))
                            .foregroundColor(.darkGray)
                    }

                    HStack(spacing: 12){
                        Image("PlaceOfWorkImage")
                        Text(doctorDetails.placeOFWork)
                            .font(.system(size: 14,weight: .regular))
                            .foregroundColor(.darkGray)
                    }
                    
                    
                }
                VStack(spacing:24){
                    HStack(){
                        Text("Стоимость Услуг")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(
                                .leading,16)
                            .font(.system(size: 16, weight: .semibold))
                        Text("от \(doctorDetails.price) ₽")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(
                                .trailing,16)
                            .font(.system(size: 16, weight: .semibold))
                    }
                    
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(8)
                    Text(doctorDetails.description)
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)

            .padding(.top, 16)
            
            Button("Записаться") {
          
            }
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Color.pinkTest)
            .cornerRadius(8)
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .semibold))
            .padding(.bottom, 10)
            .padding(.horizontal, 16)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Педиатр")
                    .font(.system(size: 20, weight: .medium))
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image("BackButton")
                }
            }
        }
    }
    
}

#Preview {
    DetailView(doctorDetails: DoctorDetails(surname: "Семеновв", name: "Дарья", patronymic: "Cергеевна", specialization: "Педиатр", rating: 3, experience: 27, price: 600, university: "1-й ММИ им. И.М.Сеченова", description: Constant.constantDescription, placeOFWork: Constant.constantPlaceOFWork, image: Constant.baseURLConstantAvatar, category: GrammatickHelper.formCategory(2)))
}
