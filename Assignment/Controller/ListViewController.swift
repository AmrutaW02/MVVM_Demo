//
//  ListViewController.swift
//  Assignment
//
//  Created by Amruta Warankar on 25/01/22.
//

import UIKit

extension UITableViewCell {
    func asNib() -> UINib {
        return UINib(nibName: String(describing: type(of: self)), bundle: nil)
    }
}

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!

    lazy var listViewModel : ListViewModel = {
        let viewModel = ListViewModel()
        return viewModel
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    func configureUI(){
        self.tableView.register(ListCell().asNib(), forCellReuseIdentifier: ListCell.identifire)

        listViewModel.listModel.addObserver { listData in
            self.tableView.reloadData()
        }
    }
    
    @IBAction func fetchRecordClicked(_ sender : UIButton){
        listViewModel.getPosts()
    }
}

extension ListViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.listModel.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListCell.self), for: indexPath) as? ListCell else{ return UITableViewCell() }
        cell.setListData(listViewModel.getDataAtIndex(indexPath.row))
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
