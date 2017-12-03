//
//  BeerTableViewController.swift
//  RM30950
//
//  Created by Rafael Valverde on 26/11/17.
//  Copyright © 2017 PUNKBeers. All rights reserved.
//

import UIKit

class BeerTableViewController: UITableViewController {
    
    lazy var beerList = [Beer]()
    var itemSelected: Beer?



    override func viewDidLoad() {
        super.viewDidLoad()
        loadBeers();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func loadBeers() {
        REST.loadBeers { beerListResult in
            guard let beers = beerListResult else { return }
            DispatchQueue.main.async {
                self.beerList = beers
                self.tableView.reloadData()
                }
            }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeerTableViewCell
      
        cell.lbName?.text = beerList[indexPath.row].name
        let abv = String(format: "%.1f", beerList[indexPath.row].alcoholByVolume ?? 0.0)
        cell.lbAbv?.text = "Teor Alcoolico: " + abv
       

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemSelected = beerList[indexPath.row]
        performSegue(withIdentifier: "beerView", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "beerView" {
            let beerVC = segue.destination as! BeerViewController
            beerVC.beer = self.itemSelected
        }
    
    }
 
}
