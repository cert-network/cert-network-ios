//
//  ApproveViewController.swift
//  CertNetwork
//
//  Created by Thongpak on 25/8/2561 BE.
//  Copyright © 2561 thongpak. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Material

class ApproveViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = ApproveViewModel()
    let disposeBag = DisposeBag()
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
//        setu,;pViewModel()
        title = "Cert Network"
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        viewModel.getCert().subscribe(onNext: { (message) in
            self.hideLoading()
            refreshControl.endRefreshing()
            self.tableView.reloadData()
        }, onError: { (error) in
            self.hideLoading()
        }).disposed(by: disposeBag)
    }
    
    func setupViewModel() { 
        showLoading()
        viewModel.getCert().subscribe(onNext: { (message) in
            self.hideLoading()
            self.tableView.reloadData()
        }, onError: { (error) in
            self.hideLoading()
        }).disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupViewModel()
    }
    
    override func setBackNavigationBarItem() {
        
    }
    
    func setupTableView() {
        self.tableView.refreshControl = refreshControl
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
}


extension ApproveViewController: UITableViewDataSource {
    enum TableViewIndex: Int {
        case profile, approveList
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch TableViewIndex(rawValue: section)! {
        case .profile:
            return 1
        case .approveList:
            return viewModel.approveList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch TableViewIndex(rawValue: indexPath.section)! {
        case .profile:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
            return cell
        case .approveList:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ApproveStatusTableViewCell", for: indexPath) as! ApproveStatusTableViewCell
            if let name = viewModel.approveList[indexPath.row].certCreatorName {
                cell.nameLabel.text = name + " (pending...)"
            }
            cell.profileImageView.image = #imageLiteral(resourceName: "Combined Shape")
            cell.nameCertLabel.text = viewModel.approveList[indexPath.row].certName
            return cell
        }
    }
    
}

extension ApproveViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.section == 0 {
            return
        }
        let storyboard = UIStoryboard(name: "Approve", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ApproveConfirmViewController") as! ApproveConfirmViewController
        vc.cert = viewModel.approveList[indexPath.row]
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav)
    }
    
}
