//
//  AllHeroesViewModel.swift
//  FinalProject
//
//  Created by Admin on 05/04/2022.
//

import Foundation

class AllHeroesViewModel {
    
    weak var delegate: RefreshData?
    init(delegate: RefreshData) {
        self.delegate = delegate
    }
    var networkManager = NetworkManager()
    var heroes: [HeroData] = []
    
    func getAllHeroes() {
        networkManager.getHeroes { [weak self] heroDetails in
            self?.heroes = heroDetails
            DispatchQueue.main.async {
                self?.delegate?.refresh()
            }
        }
        
    }
}
