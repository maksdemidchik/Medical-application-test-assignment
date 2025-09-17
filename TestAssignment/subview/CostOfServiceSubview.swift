//
//  CostOfServiceSubview.swift
//  TestAssignment
//
//  Created by Maxim on 17.09.2025.
//

import SwiftUI
struct CostOfServiceSubview: View {
    private let nameService : String
    private let infoForService : String
    private let priceService: Int 
    init(nameService: String, infoForService:String, priceService: Int){
        self.nameService = nameService
        self.infoForService = infoForService
        self.priceService = priceService
    }
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(nameService)
                .font(.system(size: 16,weight: .semibold))
            HStack(){
                Text(infoForService)

                Text("\(priceService > 0 ? String(priceService)+" ₽" : "Бесплатно")")
                    .font(.system(size: 16,weight: .semibold))
                    .frame(maxWidth: .infinity,alignment: .trailing)
                    
            }
            .padding(.horizontal,16)
            .frame(height: 56)
            .background(Color.white)

            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.horizontal,16)
    }
}

#Preview {
    CostOfServiceSubview(nameService: "Видеоконсультация", infoForService: "30 мин", priceService: 40)
}
