//
//  ContentView.swift
//  TestAssignment
//
//  Created by Maxim on 05.09.2025.
//

import SwiftUI

struct DoctorListView: View {
    @State private var showDetail = false
   
    @State private var searchBar = ""
    @State private var currentDoctor: DoctorDetails?
    let doctors = [
        DoctorDetails(surname: "1", name: "33", patronymic: "$4", specialization: "Педиатр", rating: 4, experience: "36", price: "100", university: "MSU", description: "Привет!", placeOFWork: "Hospital",image:"testImage",category: "Врач высшей категории"),
        DoctorDetails(surname: "Семенова", name: "Дарья", patronymic: "Сергеевна", specialization: "Педиатр", rating: 4, experience: "33", price: "33", university: "1-й ММИ им. И.М.Сеченова", description: "Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.", placeOFWork: "Детская клиника “РебёнОК”", image: "testImage",category: "Врач высшей категории")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.lightGray.ignoresSafeArea()
                VStack(alignment: .leading) {
                    PickerDoctorList()
                        .padding(.top,-16)
                    List(doctors) { doctor in
                        DoctorCell(surname: doctor.surname, name: doctor.name, patronymic: doctor.patronymic, rating: doctor.rating, experience: 222,price: doctor.price,image:doctor.image, onBookAction: {
                            currentDoctor = doctor
                            showDetail = true
                        })
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                        .listRowBackground(Color.clear)
                    }
                    .padding(.horizontal, 16)
                    .listStyle(PlainListStyle())
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Врачи")
                    .navigationDestination(isPresented: $showDetail) {
                        if let curDoctor = currentDoctor {
                            DetailView(doctorDetails: curDoctor)
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Педиатры")
                                .font(.system(size: 20, weight: .medium)).accentColor(Color.blackTest)
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                           
                            } label: {
                                Image("BackButton")
                            }
                        }
                    }
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("Педиатры", displayMode: .inline)
                    .toolbarTitleDisplayMode(.inline)
                    .searchable(text: $searchBar, prompt: "Поиск")
                    .scrollIndicators(.hidden)
                }
                
            }
            
        }
    }
}

let doctors = [
    DoctorDetails(surname: "1", name: "33", patronymic: "$4", specialization: "Педиатр", rating: 4, experience: "36", price: "100", university: "MSU", description: "Привет!", placeOFWork: "Hospital",image:"testImage",category: "Врач высшей категории"),
    DoctorDetails(surname: "Семенова", name: "Дарья", patronymic: "Сергеевна", specialization: "Педиатр", rating: 4, experience: "33", price: "33", university: "1-й ММИ им. И.М.Сеченова", description: "Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.", placeOFWork: "Детская клиника “РебёнОК”", image: "testImage",category: "Врач высшей категории")
]
#Preview {
    DoctorListView()
}
