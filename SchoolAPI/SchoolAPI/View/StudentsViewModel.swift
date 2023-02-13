//
//  StudentsViewModel.swift
//  SchoolAPI
//
//  Created by Adel Al-Aali on 2/11/23.
//


///... json model, and Get request for api
// https://data.cityofnewyork.us/resource/s3k6-pzi2.json

import Foundation
import Combine

class StudentsViewModel : ObservableObject {
    
    @Published var school = [Schools]()
    @Published var sat = [Schools]()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getSchoolData()
        getSchoolGrades()
        useSimpleMlanager()
    }
    
    
    func useSimpleMlanager() {
        APIManager.shared.getDataSimple()
    }
    // returns from APIManager using .sink to return school list
    func getSchoolData() {
        print("running school data fetch")
        APIManager.shared.getData(endpoint: .schools, type: Schools.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[-] Error fetching school data \(err.localizedDescription)")
                case .finished:
                    print("[!] Success fetching school data ")
                }
            }
    receiveValue: { [weak self] schoolData in
        self?.school = schoolData
    }
    .store(in: &cancellables)
    }
    
    // returns from APIManager using .sink to return school details

    
    func getSchoolGrades() {
        print("running school grades fetch")

        APIManager.shared.getData(endpoint: .details, type: Schools.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[-] failed to grab school SAT details \(err.localizedDescription) ")
                case .finished :
                    print("[!] Success in fetching school SAT details")
                }
            }
    receiveValue: { [weak self] schoolSAT in
        self?.sat = schoolSAT
    }
    .store(in: &cancellables)
    }

}
