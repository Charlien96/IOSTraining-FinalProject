//
//  IntHeroesViewModel.swift
//  FinalProject
//
//  Created by Admin on 07/04/2022.
//

import Foundation

class IntHeroesViewModel {
    
    weak var delegate: IntHeroesRefreshData?
    init(delegate: IntHeroesRefreshData) {
        self.delegate = delegate
    }
    var networkManager = NetworkManager()
    var intHeroes: [HeroData] = []
    
    func getIntHeroes() {
        networkManager.getHeroes { [weak self] heroDetails in
            self?.intHeroes = heroDetails
            self?.intHeroes = self?.intHeroes.filter{$0.primaryAttr == "int"} ?? []
            DispatchQueue.main.async {
                self?.delegate?.refresh()
            }
        }
    }
}
