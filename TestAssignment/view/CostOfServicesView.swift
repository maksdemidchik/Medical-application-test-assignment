//
//  CostOfServicesView.swift
//  TestAssignment
//
//  Created by Maxim on 17.09.2025.
//

import Foundation
import SwiftUI

struct CostOfServicesView: View {
    @Environment(\.dismiss) private var dismiss
    private let chatPrice: Int
    private let videoPrice: Int
    private let hospitalPrice: Int
    private let homePrice: Int
    init(chatPrice: Int, videoPrice: Int, hospitalPrice: Int, homePrice: Int) {
        self.chatPrice = chatPrice
        self.videoPrice = videoPrice
        self.hospitalPrice = hospitalPrice
        self.homePrice = homePrice
    }
    var body: some View {

        ZStack(alignment: .top ){
            Color.lightGray.ignoresSafeArea()
            VStack(spacing: 24){
                CostOfServiceSubview(nameService: "Видеоконсультация", infoForService: "30 минут", priceService: videoPrice)
                CostOfServiceSubview(nameService: "Чат с врачом", infoForService: "30 минут", priceService: chatPrice)
                CostOfServiceSubview(nameService: "Приём в клинике", infoForService: "В клинике", priceService: hospitalPrice)
                CostOfServiceSubview(nameService: "Вызов на дом", infoForService: "На дом", priceService: homePrice)
            }
            
        }
        .padding(.top,16)
        .background(Color.lightGray)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Стоимость услуг")
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
    CostOfServicesView(chatPrice: 500, videoPrice: 500, hospitalPrice: 0, homePrice: 1000)
}
