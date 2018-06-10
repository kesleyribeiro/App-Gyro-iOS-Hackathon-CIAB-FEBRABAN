//
//  HistoricoVC.swift
//  CIAB FEBRABAN
//
//  Created by Kesley Ribeiro on 10/Jun/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit
import Alamofire

class HistoricoVC: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var historicoTableView: UITableView!
    @IBOutlet weak var semResultadosLabel: UILabel!
    @IBOutlet var menuBtn: UIBarButtonItem!
    
    
    // MARK: - Properties
    
    var historicos = [Historico]()
    var qtdHistoricos = Int()
    var showAlerts = Alerts()
    var timer = Timer()
    
    lazy var refresh: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(HistoricoVC.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        
        refreshControl.tintColor = UIColor(red: 29/255, green: 185/255, blue: 198/255, alpha: 1)
        refreshControl.attributedTitle = NSAttributedString(string: "Carregando histórico...")

        return refreshControl
    }()
        
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.target = self.revealViewController()
        menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
//        historicoTableView.estimatedRowHeight = 210
//        historicoTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.historicoTableView.addSubview(self.refresh)
        
        getHistoricos()
    }
    
    
    // MARK: - Funtions
    
    @objc func getHistoricos() {
        
        Alamofire.request(URL_HISTORICO_INVESTIMENTOS, method: .get).responseJSON
            { response in
                
                if response.result.isSuccess {
                    let result = response.result
                    
                    if let dict = result.value as? [Dictionary<String, AnyObject>] {
                        
                        // Atualiza a quantidade de históricos
                        self.qtdHistoricos = dict.count
                        
                        self.historicoTableView.isHidden = false
                        self.semResultadosLabel.isHidden = true
                        
                        for obj in dict {
                            let historico = Historico(historicoDict: obj)
                            self.historicos.append(historico)
                        }
                        self.historicoTableView.reloadData()
                    }
                } else {
                    
                    self.showAlerts.exibirAlertaPersonalizado("Erro ao tentar obter os dados, tentar novamente mais tarde!", tipoAlerta: 2)
                    
                    self.historicoTableView.isHidden = true
                    self.semResultadosLabel.isHidden = false
                    
                    // Chamar a função para tentar obter os dados
                    self.tentarNovamenteObterDados()
                }
        }
    }
    
    func tentarNovamenteObterDados() {
        
        // After 15 seconds, execute the function to try to get the data
        self.timer = Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(self.getHistoricos), userInfo: nil, repeats: false)
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        // Chamar a função novamente
        getHistoricos()
        
        // Atualizar tableView
        self.historicoTableView.reloadData()
        refreshControl.endRefreshing()
    }


}

// MARK: - UICollectionViewDataSource

extension HistoricoVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qtdHistoricos
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HistoricoCell", for: indexPath) as? HistoricoCell {
            
            let historico = historicos[indexPath.row]
            
            cell.configureCell(historico: historico)

            return cell
            
        } else {
            return HistoricoCell()
        }
    }
    
}
