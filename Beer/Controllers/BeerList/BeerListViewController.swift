//
//  BeerListViewController.swift
//  Beer
//
//  Created by Ian Pablo on 18/01/21.
//

import UIKit

class BeerListViewController: UIViewController {
    
    
    var viewModel: BeerListViewModel!
    var beers: [BeerListViewModel] = []
    @IBOutlet weak var tableView: UITableView!
    var currentPage = 1
    var loadingBeers: Bool = false

    
    
    // MARK: - Views

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
       
        }
    
    // MARK: - Methods
    
    func setupView(){
        navigationItem.title = "Beer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func fetchData(){
        loadingBeers = true
        BeerService.api.fetchBeer(pages: currentPage) { (beer) in
            if let beer = beer {
                self.beers += beer.map({return BeerListViewModel(beer: $0)})
                DispatchQueue.main.async {
                    self.loadingBeers = false
                    self.tableView.reloadData()
                }
            }
        }
    }
    
   

}

extension BeerListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BeerCell
        let beerCell = viewModel[indexPath.row]
        cell.update = beerCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
       if indexPath.row == viewModel.count - 10 && !loadingBeers{
           currentPage += 1
           fetchData()
       }
   }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beerCell = viewModel[indexPath.row]
        
    }
    
}
extension BeerListViewController: UITableViewDelegate{
   
}
