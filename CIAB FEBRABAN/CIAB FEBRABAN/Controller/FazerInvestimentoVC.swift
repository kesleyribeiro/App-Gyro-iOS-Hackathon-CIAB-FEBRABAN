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

    // MARK: - IBOutlets
    @IBOutlet weak var quantoInvestirLabel: UITextField!
    @IBOutlet weak var porcentagemLucroLabel: UITextField!
    @IBOutlet weak var periodoRetornoLabel: UITextField!
    
    
    // MARK: - Properties
    
    var investimentos = [Investimento]()
    var showAlerts = Alerts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //getInfos()
        setupTextFields()
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
    
    
    // MARK:- IBAction
    
    @IBAction func investirBtn(_ sender: Any) {
    
        let quanto = quantoInvestirLabel.text!
        let porcentagem = porcentagemLucroLabel.text!
        let periodo = periodoRetornoLabel.text!
        
        // Se dados não informados
        if quanto.isEmpty || porcentagem.isEmpty || periodo.isEmpty {
            self.showAlerts.exibirAlertaPersonalizado("Por favor, informe todos os dados corretamente!", tipoAlerta: 1)
            return
        } else {
            
            self.showAlerts.exibirAlertaPersonalizado("Investimento realizado com sucesso!", tipoAlerta: 3)
            
            setupTextFields()                        
        }
    }
    
    // MARK: - Funcions
    
    func setupTextFields() {
        quantoInvestirLabel.text = ""
        porcentagemLucroLabel.text = ""
        periodoRetornoLabel.text = ""
    }

    // Função para esconder o teclado quando o usuário tocar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with withEvent: UIEvent?) {
        self.view.endEditing(true)
    }

}
