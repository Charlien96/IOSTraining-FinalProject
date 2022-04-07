//
//  AgiHeroesViewModel.swift
//  FinalProject
//
//  Created by Admin on 07/04/2022.
//

import Foundation

class AgiHeroesViewModel {
    
    weak var delegate: AgiHeroesRefreshData?
    init(delegate: AgiHeroesRefreshData) {
        self.delegate = delegate
    }
    var networkManager = NetworkManager()
    var agiHeroes: [HeroData] = []
    
    func getAgiHeroes() {
        networkManager.getHeroes { [weak self] heroDetails in
            self?.agiHeroes = heroDetails
            self?.agiHeroes = self?.agiHeroes.filter{$0.primaryAttr == "agi"} ?? []
            DispatchQueue.main.async {
                self?.delegate?.refresh()
            }
        }
    }
}
