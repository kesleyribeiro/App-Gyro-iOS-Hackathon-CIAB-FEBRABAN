//
//  FazerInvestimentoVC.swift
//  CIAB FEBRABAN
//
//  Created by Kesley Ribeiro on 10/Jun/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit
import Alamofire

class FazerInvestimentoVC: UIViewController {

    
    // MARK: - Properties
    
    var investimentos = [Investimento]()
    var showAlerts = Alerts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getInfos()
    }

    
    // MARK: - Function
    
    func getInfos() {
        
        Alamofire.request(URL_API, method: .post).responseJSON
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
                    self.showAlerts.exibirAlertaPersonalizado("Erro ao tentar fazer o investimento, tentar novamente mais tarde!", tipoAlerta: 2)
                }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
