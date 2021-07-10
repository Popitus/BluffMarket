//
//  SoccerViewController.swift
//  BluffMarket
//
//  Created by MacAMD on 4/7/21.
//

import UIKit

class SoccerViewController: UIViewController {

    // MARK: Propiedades privadas
    private let playerSoccer = PlayerSoccerRepository()
    private var soccerList: PlayerSoccers = []
    private let segueToDetail = "SEGUE_FROM_HOME_TO_DETAIL"
    
    // MARK: IBOutlets
    @IBOutlet weak var soccerTableView: UITableView!
    
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        soccerTableView.delegate = self
        soccerTableView.dataSource = self
        UITabBar.appearance().barTintColor = UIColor.black
        loadData()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true // Escondemos la barra de navegación

    }
    // MARK: Private Functions
    
    private func loadData() {
        soccerList = playerSoccer.soccerPlayer.filter({ $0.probability >= 50.0 })
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController,
              let soccer = sender as? PlayerSoccer else {
            return
        }
        destination.soccer = soccer
    }
    
}

extension SoccerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soccerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = soccerTableView.dequeueReusableCell(withIdentifier: SoccerTableViewCell.cellIdentifier,
                                                       for: indexPath) as? SoccerTableViewCell
        if indexPath.row <= soccerList.count {
            cell?.updateView(soccerPlayer: soccerList[indexPath.row])
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < soccerList.count {
            let soccer = soccerList[indexPath.row]
            performSegue(withIdentifier: segueToDetail,
                         sender: soccer)
        }
    }
}
