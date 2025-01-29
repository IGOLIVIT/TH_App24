//
//  MaterialViewModel.swift
//  TH_App24
//
//  Created by IGOR on 29/01/2025.
//

import SwiftUI
import CoreData

final class MaterialViewModel: ObservableObject {

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false

    @Published var maName: String = ""
    @Published var maDurH: String = ""
    @Published var maDurM: String = ""
    @Published var maOpen: String = ""
    @Published var maMain: String = ""
    @Published var maClos: String = ""

    @Published var materials: [MaterModel] = []
    @Published var selectedMat: MaterModel?

    func addMat() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "MaterModel", into: context) as! MaterModel

        loan.maName = maName
        loan.maDurH = maDurH
        loan.maDurM = maDurM
        loan.maOpen = maOpen
        loan.maMain = maMain
        loan.maClos = maClos

        CoreDataStack.shared.saveContext()
    }

    func fetchMats() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MaterModel>(entityName: "MaterModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.materials = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.materials = []
        }
    }
}
