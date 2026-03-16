//
//  DataStorage.swift
//  BarbellMath
//
//  Created by Emily Corso on 11/19/21.
//  Copyright © 2021 Emily Corso. All rights reserved.
//

import Foundation

struct DataStorage {
    func save(searchData: [SearchData]) throws {
        guard let encoded = try? JSONEncoder().encode(searchData) else {
            print("encoding failed")
            return
        }
        
        let fileManager = FileManager()
        let url = fileManager.getDocumentsDirectory().appendingPathComponent("loadedBar.txt")
        
        do {
            try encoded.write(to: url)
        } catch {
            print("save failed")
        }
    }
    
    func retrieve() -> [SearchData]? {
        let fileManager = FileManager()
        let url = fileManager.getDocumentsDirectory().appendingPathComponent("loadedBar.txt")
        
        do {
            let jsonData = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode([SearchData].self, from: jsonData)
            return decodedData
        } catch {
            return nil
        }
    }
}
