//
//  StrHeroesViewController.swift
//  FinalProject
//
//  Created by Admin on 07/04/2022.
//

import UIKit

class StrHeroesViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var strHeroesTableView: UITableView!
    var strHeroesViewModel: StrHeroesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strHeroesTableView.dataSource = self
        strHeroesTableView.delegate = self
        strHeroesViewModel = StrHeroesViewModel(delegate: self)
        strHeroesViewModel.getStrHeroes()
    }
}

extension StrHeroesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strHeroesViewModel.strHeroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = strHeroesTableView.dequeueReusableCell(withIdentifier: "strHeroesCell", for: indexPath) as! StrHeroesCell
        let strHeroes = strHeroesViewModel.strHeroes[indexPath.row]
        cell.heroId.text = String(strHeroes.id)
        cell.nameLbl.text = strHeroes.localizedName
        cell.primaryAttrLbl.text = strHeroes.primaryAttr
        let imageReturned = "https://api.opendota.com\(strHeroes.img)"
        cell.img.downloadImg(owner: imageReturned)
        return cell
    }
}

protocol StrHeroesRefreshData: AnyObject {
    func refresh()
}

extension StrHeroesViewController: StrHeroesRefreshData {
    func refresh() {
        DispatchQueue.main.async {
            self.strHeroesTableView.reloadData()
        }
    }
}
