//
//  DoctorListViewModel.swift
//  TestAssignment
//
//  Created by Maxim on 17.09.2025.
//

import Foundation

final class DoctorListViewModel: ObservableObject {
    @Published var doctors: [DoctorDetails] = []
    
    init(){
        getList()
    }
  
    private func fetchDoctors(completeion: @escaping (Result<Data, Error>) -> Void) {
        assert(Thread.isMainThread)
        guard let request = makeURLRequest() else {
            print("Error! Cannot create URLRequest")
            return
        }
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error! \(error)")
                completeion(.failure(error))
                return
            }
            guard let data = data else {
                completeion(.failure(NSError(domain: "No data received", code: 0)))
                return
            }
            completeion(.success(data))
        }
        task.resume()
    }
    
    
    private func getList() {
        fetchDoctors{[weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let data):
                do{
                    let doctors = try JSONDecoder().decode(Response.self, from: data)
                    Task { @MainActor in
                        self.getDoctors(doctorsDetails: doctors.data.users)
                    }
                }
                catch{
                    print(error)
                }
            case .failure(let error):
                print(error)
            }

        }
    }
    
    @MainActor
    private func getDoctors(doctorsDetails: [Details]){
        for doctor in doctorsDetails{
            let minPrice = [doctor.homePrice,doctor.homePrice,doctor.textChatPrice,doctor.videoChatPrice].filter({$0 != 0}).min() ?? 0
            let doctorDetail = DoctorDetails(surname: doctor.lastName, name: doctor.firstName, patronymic: doctor.patronymic, specialization: "Педиатр", rating: Int(doctor.rank), experience: doctor.seniority, price: minPrice, university: doctor.educationTypeLabel?.name ?? Constant.educationConstant, description: Constant.constantDescription, placeOFWork: Constant.constantPlaceOFWork, image: doctor.avatar ?? Constant.baseURLConstantAvatar, category: GrammatickHelper.formCategory(doctor.category), chatPrice: doctor.textChatPrice, homePrice: doctor.homePrice, videoPrice: doctor.videoChatPrice, hospitalPrice: doctor.hospitalPrice)
            doctors.append(doctorDetail)
        }
    }
    
    
    private func makeURLRequest() -> URLRequest? {
        guard let url = URL(string: Constant.urlString) else {
            print("error with url")
            return nil
        }
        return URLRequest(url: url)
    }
}
