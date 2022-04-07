//
//  IntHeroesViewController.swift
//  FinalProject
//
//  Created by Admin on 07/04/2022.
//

import UIKit

class IntHeroesViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var intHeroesTableView: UITableView!
    var intHeroesViewModel: IntHeroesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        intHeroesTableView.dataSource = self
        intHeroesTableView.delegate = self
        intHeroesViewModel = IntHeroesViewModel(delegate: self)
        intHeroesViewModel.getIntHeroes()
    }
}

extension IntHeroesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return intHeroesViewModel.intHeroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = intHeroesTableView.dequeueReusableCell(withIdentifier: "intHeroesCell", for: indexPath) as! IntHeroesCell
        let intHeroes = intHeroesViewModel.intHeroes[indexPath.row]
        cell.heroId.text = String(intHeroes.id)
        cell.nameLbl.text = intHeroes.localizedName
        cell.primaryAttrLbl.text = intHeroes.primaryAttr
        let imageReturned = "https://api.opendota.com\(intHeroes.img)"
        cell.img.downloadImg(owner: imageReturned)
        return cell
    }
}

protocol IntHeroesRefreshData: AnyObject {
    func refresh()
}

extension IntHeroesViewController: IntHeroesRefreshData {
    func refresh() {
        DispatchQueue.main.async {
            self.intHeroesTableView.reloadData()
        }
    }
}
