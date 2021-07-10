//
//  SoccerCollectionViewController.swift
//  BluffMarket
//
//  Created by MacAMD on 4/7/21.
//

import UIKit

class SoccerCollectionViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var soccerCollectionView: UICollectionView!
    
    
    // MARK: Private properties
    private let playerSoccer = PlayerSoccerRepository()
    private var soccerList: PlayerSoccers = []
    private let segueToDetail = "SEGUE_FROM_HOME_TO_DETAIL"
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        soccerCollectionView.delegate = self
        soccerCollectionView.dataSource = self
        loadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true // Mostramos la barra de navegación
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController,
              let soccer = sender as? PlayerSoccer else {
            return
        }
        destination.soccer = soccer	
        
    }
    private func loadData() {
        soccerList = playerSoccer.soccerPlayer.filter({ $0.probability < 50.0 })
    }
    
}

extension SoccerCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return soccerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 207.00,
                      height: 426.00)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = soccerCollectionView.dequeueReusableCell(withReuseIdentifier: SoccerCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? SoccerCollectionViewCell
        if indexPath.row <= soccerList.count {
            cell?.updateView(soccerPlayer: soccerList[indexPath.row])
        }
        return cell ?? UICollectionViewCell()
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row < soccerList.count {
            let soccer = soccerList[indexPath.row]
            performSegue(withIdentifier: segueToDetail,
                         sender: soccer)
        }
    }
    
    
}

