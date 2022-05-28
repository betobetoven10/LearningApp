//
//  ContentModel.swift
//  LearningApp
//
//  Created by Alberto Madueño Navarrete on 5/28/22.
//

import Foundation

class ContentModel: ObservableObject {
    @Published var modules = [Module]()
    var styleData: Data?
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        //Get the URL
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        do {
            //Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            //Try to decoded the json into an array of modules

            let jsonDecoder = JSONDecoder()
            
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            //Assigned parsed modules to modules property
            
            self.modules = modules
        } catch {
            //Log error
            print("Could not parse local data")
        }
        
        //parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        do {
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
        } catch {
            print("Could not parse data")
        }
        
    }
}
