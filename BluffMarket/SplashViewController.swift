//
//  ViewController.swift
//  BluffMarket
//
//  Created by MacAMD on 4/7/21.
//

import UIKit

class SplashViewController: UIViewController {
    
    // MARK: Variables & Constants
    private var timer = Timer()
    
    // MARK: IBOutlets

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
   
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Cuando inicio la vista, arranca la animación
        
        navigationController?.isNavigationBarHidden = true // Escondemos la barra de navegación
        activityIndicator.startAnimating() // Arranca la animación de carga
        loadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Antes de salir de la vista, paro la animacion
        activityIndicator.stopAnimating() // Paramos anumacion de carga
    }
        
    // MARK: Private Methods
    private func loadData() {
        
        // Constantes y variables de la funcion
        let storyBoardName = "Main"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
            print("Load Data Completed!")
            let storyBoardHome = UIStoryboard(name: storyBoardName,
                                              bundle: nil)
            if let destitation = storyBoardHome.instantiateInitialViewController() {
                self?.navigationController?.setViewControllers([destitation],
                                                               animated: true)
            }
        }
    }
}

