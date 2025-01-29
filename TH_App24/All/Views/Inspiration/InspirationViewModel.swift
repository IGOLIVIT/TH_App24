//
//  InspirationViewModel.swift
//  TH_App24
//
//  Created by IGOR on 29/01/2025.
//

import SwiftUI
import CoreData

final class InspirationViewModel: ObservableObject {

    @Published var selRate: Int = 1

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false
    @Published var isDetailVisible: Bool = false

    @Published var inAu: String = ""
    @Published var inQuote: String = ""
    @Published var inRate: String = ""

    @Published var inspirations: [InspirModel] = []
    @Published var selectedInsp: InspirModel?

    func addInsp() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "InspirModel", into: context) as! InspirModel

        loan.inAu = inAu
        loan.inQuote = inQuote
        loan.inRate = Int16(inRate) ?? 0

        CoreDataStack.shared.saveContext()
    }

    func fetchInsps() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<InspirModel>(entityName: "InspirModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.inspirations = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.inspirations = []
        }
    }
}
