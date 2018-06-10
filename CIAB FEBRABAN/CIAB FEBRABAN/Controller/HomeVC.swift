//
//  HomeVC.swift
//  CIAB FEBRABAN
//
//  Created by Kesley Ribeiro on 9/Jun/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit
import Alamofire

class HomeVC: UIViewController {
    
    // MARK: - IBOutlets
    
    
    // MARK: - Properties
    
    var investimentos = [Investimento]()
    var showAlerts = Alerts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        
        getInfos()
    }
    
    func getInfos() {
        
        Alamofire.request(URL_API, method: .get).responseJSON
            { response in
                
                if response.result.isSuccess {
                    let result = response.result
                    
                    if let dict = result.value as? [Dictionary<String, AnyObject>] {
                        
                        for obj in dict {
                            
                            let investimento = Investimento(investimentoDict: obj)
                            self.investimentos.append(investimento)                            
                        }
                    }
                } else {
                    self.showAlerts.exibirAlertaPersonalizado("Erro ao tentar obter os dados, tentar novamente mais tarde!", tipoAlerta: 2)
                }
        }
    }
    
    
    
}

