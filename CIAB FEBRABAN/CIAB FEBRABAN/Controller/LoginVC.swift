//
//  LoginVC.swift
//  CIAB FEBRABAN
//
//  Created by Kesley Ribeiro on 10/Jun/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit
import YBAlertController
import PasswordTextField

class LoginVC: UIViewController {

    
    // MARK: - IBOutlets
    @IBOutlet weak var emailLbl: UITextField!    
    @IBOutlet weak var senhaLbl: PasswordTextField!
    
    // MARK: - Properties
    
    var showAlerts = Alerts()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        
        setupTextFields()
    }
    
    // MARK: - IBAction
    
    @IBAction func entrarBtn(_ sender: Any) {
        
        let email = emailLbl.text!
        let senha = senhaLbl.text!
        
        // Se dados não informados
        if email.isEmpty || senha.isEmpty {
            self.showAlerts.exibirAlertaPersonalizado("Por favor, informe todos os dados corretamente!", tipoAlerta: 1)
            return
        }
            //  Se email for inválido
        else if !validateEmail(email) {
            self.showAlerts.exibirAlertaPersonalizado("Email inválido. Verifique o email informado!", tipoAlerta: 1)
            return
        }
            //  Se senha for menor que 8 caracteres
        else if senha.count <= 7 {
            self.showAlerts.exibirAlertaPersonalizado("Senha inválida. A senha precisa ter no mínimo 8 caracteres!", tipoAlerta: 1)
            return
        } else {
            
            guard let email = emailLbl.text, email != "" else {
                print("\n[SUCESSO] Email foi informado!")
                return
            }
            
            guard let senha = senhaLbl.text, senha != "" else {
                print("\n[SUCESSO] Senha foi informada!")
                return
            }
            
            setupTextFields()
            
            performSegue(withIdentifier: "entrar", sender: nil)
        }
    }
    
    
    // MARK: - Funcions
    
    func setupTextFields() {
        emailLbl.text = ""
        senhaLbl.text = ""
    }

    
    // Restrições regex para email
    func validateEmail (_ email : String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]{2}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2}"
        let range = email.range(of: regex, options: .regularExpression)
        let result = range != nil ? true : false
        return result
    }
    
    // Função para esconder o teclado quando o usuário tocar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with withEvent: UIEvent?) {
        self.view.endEditing(true)
    }

}
