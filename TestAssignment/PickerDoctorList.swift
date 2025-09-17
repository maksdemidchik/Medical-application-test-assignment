//
//  PickerDoctorList.swift
//  TestAssignment
//
//  Created by Maxim on 16.09.2025.
//

import SwiftUI

struct PickerDoctorList: View {
    @State private var selectedFilter = 0
    @State private var didAppear = false
    
    var body: some View {
        VStack {
            Picker(selection: $selectedFilter) {
                Text("По цене").tag(0)
                Text("По стажу").tag(1)
                Text("По рейтингу").tag(2)
            } label: {
                Text("Picker")
            }
            .font(.system(size: 14))
            .pickerStyle(.segmented)
            .onAppear {
                if !didAppear {
                    
                    UISegmentedControl.appearance().selectedSegmentTintColor = .pinkTest
                    UISegmentedControl.appearance().setTitleTextAttributes(
                        [.foregroundColor: UIColor.white],
                        for: .selected
                    )
                    UISegmentedControl.appearance().setTitleTextAttributes(
                        [.foregroundColor: UIColor.darkGray],
                        for: .normal
                    )
                    didAppear = true
                }
            }
           
        }
        .padding()
    }
}

#Preview {
    PickerDoctorList()
}
