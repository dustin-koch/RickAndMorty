//
//  CharacterController.swift
//  RickAndMortyPractice
//
//  Created by Dustin Koch on 7/7/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import Foundation

class CharacterController {
    
    //MARK: - Singleton / Source of truth
    static let shared = CharacterController()
    private init() {}
    
    //MARK: - Properties
    var characterList: [Character] = []
    let baseURLString = "https://rickandmortyapi.com/api/"
    let characterString = "character"
    
    //URL I WANT TO MAKE
    //https://rickandmortyapi.com/api/character/
    
    //MARK: - CRUD
    func getCharacters(completion: @escaping () -> Void) {
        //Make the URL
        guard var baseURL = URL(string: baseURLString) else { return }
//        let components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        baseURL.appendPathComponent(characterString)
        print("\(baseURL)")
        //Get info from the URL
        let dataTask = URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error {
                print("There was an error with data task: \(error.localizedDescription)")
                return
            }
            guard let data = data else { return }
            //Turn data into Rick and Morty Characters
            let jsonDecoder = JSONDecoder()
            do {
                let characters = try jsonDecoder.decode([Character].self, from: data)
                self.characterList = characters
            } catch {
                print("There was an error with the jsonDecoder: \(error.localizedDescription)")
                return
            }
        }.resume()
        
    }//END OF FETCH
    

} // END OF CLASS
