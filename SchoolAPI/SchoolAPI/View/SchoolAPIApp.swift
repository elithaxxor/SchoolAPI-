//
//  SchoolAPIApp.swift
//  SchoolAPI
//
//  Created by Adel Al-Aali on 2/11/23.
//

import SwiftUI
import CoreBluetooth
import Combine


//struct downloadWithSimpleCombine : View {
//    typealias Body = <#type#>
//    
//    @StateObject var vm = APIManager()
//
//}
@main
struct SchoolAPIApp: App {
    
    @ObservedObject private var bluetoothViewModel = BluetoothViewModel()
    
    @ObservedObject private var viewModel = StudentsViewModel()
    
    
    var controller = StudentsViewModel()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
   
        WindowGroup {
////
//            var data = controller.school
//            APIManager.
//             List {
//                 ForEach(data) { school in
//                         VStack {
//                             Text(school.title)
//                                 .font(.headline)
//                             Text(school.sat)
//                                 .foregroundColor(.gray)
//                         }
//                     }
//                 }

            ZStack{
                
                ContentView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                
                LinearGradient(gradient:
                                Gradient(colors: [.blue, .red, .white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            }
            
            VStack {
                Text("School API App ")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding(.bottom)
                Spacer()
            }
            
        }
    }
}
