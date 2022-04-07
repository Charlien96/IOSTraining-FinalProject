//
//  StrHeroesViewModel.swift
//  FinalProject
//
//  Created by Admin on 07/04/2022.
//

import Foundation

class StrHeroesViewModel {
    
    weak var delegate: StrHeroesRefreshData?
    init(delegate: StrHeroesRefreshData) {
        self.delegate = delegate
    }
    var networkManager = NetworkManager()
    var strHeroes: [HeroData] = []
    
    func getStrHeroes() {
        networkManager.getHeroes { [weak self] heroDetails in
            self?.strHeroes = heroDetails
            self?.strHeroes = self?.strHeroes.filter{$0.primaryAttr == "str"} ?? []
            DispatchQueue.main.async {
                self?.delegate?.refresh()
            }
        }
    }
}
