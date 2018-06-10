//
//  CadastrarVC.swift
//  CIAB FEBRABAN
//
//  Created by Kesley Ribeiro on 10/Jun/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit
import Alamofire
import YBAlertController
import PasswordTextField

class CadastrarVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var nomeCompletoLbl: UITextField!
    @IBOutlet weak var cpfLbl: UITextField!
    @IBOutlet weak var emailLbl: UITextField!
    @IBOutlet weak var telefoneLbl: UITextField!
    @IBOutlet weak var senhaLbl: PasswordTextField!
    
    // MARK: - Properties
    
    var showAlerts = Alerts()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        cpfLbl.delegate = self
//        telefoneLbl.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        
        setupTextFields()
    }
    
    // MARK: - IBAction
    
    @IBAction func cadastrarBtn(_ sender: Any) {
    
        let nome = nomeCompletoLbl.text!
        let cpf = cpfLbl.text!
        let email = emailLbl.text!
        let telefone = telefoneLbl.text!
        let senha = senhaLbl.text!
        
        // Se dados não informados
        if nome.isEmpty || cpf.isEmpty || email.isEmpty || telefone.isEmpty || senha.isEmpty {
            self.showAlerts.exibirAlertaPersonalizado("Por favor, informe todos os dados corretamente!", tipoAlerta: 1)
            return
        }
            //  Se nome for inválido
        else if !validatePalavra(nome) {
            self.showAlerts.exibirAlertaPersonalizado("Nome inválido. Verifique o nome informado!", tipoAlerta: 1)
            return
        }
            //  Se CPF for inválido
        else if !validateOnzeDigitos(cpf) {
            self.showAlerts.exibirAlertaPersonalizado("CPF inválido. Verifique o CPF informado!", tipoAlerta: 1)
            return
        }
            //  Se email for inválido
        else if !validateEmail(email) {
            self.showAlerts.exibirAlertaPersonalizado("Email inválido. Verifique o email informado!", tipoAlerta: 1)
            return
        }
            //  Se telefone for inválido
        else if !validateOnzeDigitos(telefone) {
            self.showAlerts.exibirAlertaPersonalizado("Telefone inválido. Informe apenas os números!", tipoAlerta: 1)
            return
        }
            //  Se senha for menor que 8 caracteres
        else if senha.count <= 7 {
            self.showAlerts.exibirAlertaPersonalizado("Senha inválida. A senha precisa ter no mínimo 8 caracteres!", tipoAlerta: 1)
            return
        } else {
            
            guard let nomeCompleto = nomeCompletoLbl.text, nomeCompleto != "" else {
                print("\n[SUCESSO] Nome completo foi informado!")
                return
            }
            
            guard let cpf = cpfLbl.text, cpf != "" else {
                print("\n[SUCESSO] CPF foi informado!")
                return
            }
            
            guard let email = emailLbl.text, email != "" else {
                print("\n[SUCESSO] Email foi informado!")
                return
            }
            
            guard let telefone = telefoneLbl.text, telefone != "" else {
                print("\n[SUCESSO] Telefone foi informado!")
                return
            }
            
            guard let senha = senhaLbl.text, senha != "" else {
                print("\n[SUCESSO] Senha foi informada!")
                return
            }
            
            self.showAlerts.exibirAlertaPersonalizado("Cadastro realizado com sucesso!", tipoAlerta: 3)
            
            setupTextFields()
            
            performSegue(withIdentifier: "mostrarMenuVC", sender: nil)
        }
    }
    
    
    // MARK: - Funcions

    func setupTextFields() {
        nomeCompletoLbl.text = ""
        cpfLbl.text = ""
        emailLbl.text = ""
        telefoneLbl.text = ""
        senhaLbl.text = ""
    }
    

    // regex restrictions for email textfield
    func validatePalavra (_ palavra : String) -> Bool {
        let regex = "[A-Za-z]{3}"
        let range = palavra.range(of: regex, options: .regularExpression)
        let result = range != nil ? true : false
        return result
    }
    
    func validateEmail (_ email : String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]{2}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2}"
        let range = email.range(of: regex, options: .regularExpression)
        let result = range != nil ? true : false
        return result
    }
    
    func validateOnzeDigitos (_ onzeDigitos : String) -> Bool {
        let regex = "[0-9]{11}"
        let range = onzeDigitos.range(of: regex, options: .regularExpression)
        let result = range != nil ? true : false
        return result
    }
    
    // Função para esconder o teclado quando o usuário tocar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with withEvent: UIEvent?) {
        self.view.endEditing(true)
    }

}


private var kAssociationKeyMaxLength: Int = 0

extension UITextField {
    
    @IBInspectable var maxLength: Int {
        get {
            if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
                return length
            } else {
                return Int.max
            }
        }
        set {
            objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
            addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
        }
    }

    @objc func checkMaxLength(textField: UITextField) {
        guard let prospectiveText = self.text,
            prospectiveText.count > maxLength
            else {
                return
        }
        
        let selection = selectedTextRange
        let maxCharIndex = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        
        text = String(prospectiveText[..<maxCharIndex])
        selectedTextRange = selection
    }
}

