//
//  EarningsViewModel.swift
//  TH_App24
//
//  Created by IGOR on 29/01/2025.
//

import SwiftUI
import CoreData

final class EarningsViewModel: ObservableObject {
    
    @AppStorage("TotEar") var TotEar: Int = 0

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false

    @Published var eaLoc: String = ""
    @Published var eaDate: Date = Date()
    @Published var eaDurH: String = ""
    @Published var eaDurM: String = ""
    @Published var eaEarning: String = ""
    @Published var isDetailVisible: Bool = false

    @Published var earnings: [EarModel] = []
    @Published var selectedEarning: EarModel?

    func addEarning() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "EarModel", into: context) as! EarModel

        loan.eaLoc = eaLoc
        loan.eaDate = eaDate
        loan.eaDurH = eaDurH
        loan.eaDurM = eaDurM
        loan.eaEarning = eaEarning

        CoreDataStack.shared.saveContext()
    }

    func fetchEarnings() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<EarModel>(entityName: "EarModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.earnings = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.earnings = []
        }
    }
}
