//
//  AllHeroesViewController.swift
//  FinalProject
//
//  Created by Admin on 05/04/2022.
//

import UIKit

class AllHeroesViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var allHeroesTableView: UITableView!
    var allHeroesViewModel: AllHeroesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allHeroesTableView.dataSource = self
        allHeroesTableView.delegate = self
        allHeroesViewModel = AllHeroesViewModel(delegate: self)
        allHeroesViewModel.getAllHeroes()
    }
}

extension AllHeroesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allHeroesViewModel.heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allHeroesTableView.dequeueReusableCell(withIdentifier: "heroesCell", for: indexPath) as! AllHeroesCell
        let heroes = allHeroesViewModel.heroes[indexPath.row]
        cell.heroId.text = String(heroes.id)
        cell.heroNameLbl.text = heroes.localizedName
        cell.primaryAttrLbl.text = heroes.primaryAttr
        let imageReturned = "https://api.opendota.com\(heroes.img)"
        cell.heroImg.downloadImg(owner: imageReturned)
        return cell
    }
}

protocol AllHeroesRefreshData: AnyObject {
    func refresh()
}

extension AllHeroesViewController: AllHeroesRefreshData {
    func refresh() {
        DispatchQueue.main.async {
            self.allHeroesTableView.reloadData()
        }
    }
}
