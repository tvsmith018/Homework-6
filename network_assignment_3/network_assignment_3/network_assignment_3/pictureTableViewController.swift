//
//  pictureTableViewController.swift
//  network_assignment_3
//
//  Created by Consultant on 5/1/22.
//

import UIKit

class pictureTableViewController: UIViewController {
    
    
    
    lazy var pictureTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.pictureTableView)
        SetupUI()
        setUpNavigation()
        activating_cells()
        
    }
    
    func SetupUI(){
        self.pictureTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.pictureTableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        self.pictureTableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        self.pictureTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
   
    
    func activating_cells(){
        self.pictureTableView.dataSource = self
        self.pictureTableView.register(PictureTableViewCell.self, forCellReuseIdentifier: "pictureCell")
    }
    
    func setUpNavigation(){
        navigationItem.title = "Picture Table"
        self.navigationController?.navigationBar.barTintColor = UIColor.green
         self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.red]

    }
    
}

extension pictureTableViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "pictureCell", for: indexPath) as! PictureTableViewCell
        return cell
    }
    
   
}
