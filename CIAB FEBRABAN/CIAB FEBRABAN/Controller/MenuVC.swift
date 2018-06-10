//
//  MenuVC.swift
//  CIAB FEBRABAN
//
//  Created by Kesley Ribeiro on 9/Jun/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit
import YBAlertController

class MenuVC: UITableViewController {
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 50
    }
    
    
    // MARK: - IBAction
    
    @IBAction func sairBtn(_ sender: Any) {
        
        // Cria o Alerta com o título e mensagem padrão
        let alerta = YBAlertController(title: "Sair do aplicativo", message: "Deseja realmente sair?", style: .alert)
        
        // Adiciona o botão 'SIM'
        alerta.addButton("SIM", action: {
            self.performSegue(withIdentifier: "paraHomeVC", sender: nil)
        })

        // touch outside the alert to dismiss
        alerta.touchingOutsideDismiss = true
        
        // Adiciona o botão 'Cancelar'
        alerta.cancelButtonTitle = "NÃO"
        
        // Mostra o alerta
        alerta.show()
    }
    
}
