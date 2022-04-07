//
//  AgiHeroesViewController.swift
//  FinalProject
//
//  Created by Admin on 07/04/2022.
//

import UIKit

class AgiHeroesViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var agiHeroesTableView: UITableView!
    var agiHeroesViewModel: AgiHeroesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        agiHeroesTableView.dataSource = self
        agiHeroesTableView.delegate = self
        agiHeroesViewModel = AgiHeroesViewModel(delegate: self)
        agiHeroesViewModel.getAgiHeroes()
    }
}

extension AgiHeroesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agiHeroesViewModel.agiHeroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = agiHeroesTableView.dequeueReusableCell(withIdentifier: "agiHeroesCell", for: indexPath) as! AgiHeroesCell
        let agiHeroes = agiHeroesViewModel.agiHeroes[indexPath.row]
        cell.heroId.text = String(agiHeroes.id)
        cell.nameLbl.text = agiHeroes.localizedName
        cell.primaryAttrLbl.text = agiHeroes.primaryAttr
        let imageReturned = "https://api.opendota.com\(agiHeroes.img)"
        cell.img.downloadImg(owner: imageReturned)
        return cell
    }
}

protocol AgiHeroesRefreshData: AnyObject {
    func refresh()
}

extension AgiHeroesViewController: AgiHeroesRefreshData {
    func refresh() {
        DispatchQueue.main.async {
            self.agiHeroesTableView.reloadData()
        }
    }
}
