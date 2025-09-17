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
    @StateObject var viewModel = DoctorListViewModel()
    private var doctors : [DoctorDetails] {
      return viewModel.doctors
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.lightGray.ignoresSafeArea()
                VStack(alignment: .leading) {
                    PickerDoctorList()
                        .padding(.top,-16)
                    List(doctors) { doctor in
                        DoctorCell(surname: doctor.surname, name: doctor.name, patronymic: doctor.patronymic, rating: doctor.rating, experience: doctor.experience,price: String(doctor.price),image:doctor.image, onBookAction: {
                            currentDoctor = doctor
                            showDetail = true
                        })
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                        .listRowBackground(Color.clear)
                    }
                    .padding(.horizontal, 16)
                    .listStyle(PlainListStyle())
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

#Preview {
    DoctorListView()
}
