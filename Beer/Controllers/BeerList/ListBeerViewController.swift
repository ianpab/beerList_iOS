//
//  BeerListViewController.swift
//  Beer
//
//  Created by Ian Pablo on 18/01/21.
//

import UIKit
import RxCocoa
import RxSwift
import Then

class ListBeerViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    fileprivate var viewModel: ListBeerViewModel!
    fileprivate var navigator: Navigator!

    static func createWith(navigator: Navigator, storyboard: UIStoryboard, viewModel: ListBeerViewModel) -> ListBeerViewController {
      return storyboard.instantiateViewController(ofType: ListBeerViewController.self).then { vc in
        vc.navigator = navigator
        vc.viewModel = viewModel
      }
    }
    

    @IBOutlet weak var tableView: UITableView!
  
    
    // MARK: - Views

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchdados()
        
        }
    
    // MARK: - Methods
    
    func setupView(){
        navigationItem.title = viewModel.navigationTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func fetchdados(){
        viewModel.beer.asDriver()
          .drive(onNext: { [weak self] _ in self?.tableView.reloadData() })
          .disposed(by: disposeBag)

//        
    }
    
    
}

        // MARK: - Extensions

extension ListBeerViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.beer.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellId, for: indexPath) as! BeerCell
        let beerCell =  viewModel.beer.value[indexPath.row]
        cell.update(beerCell)
        return cell
//
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beerCell = viewModel.beer.value[indexPath.row]
        navigator.show(segue: .detailBeer(beer: beerCell), sender: self)
    }
    
}
extension ListBeerViewController: UITableViewDelegate{
   
}
