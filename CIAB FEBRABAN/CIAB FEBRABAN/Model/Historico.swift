//
//  Historico.swift
//  CIAB FEBRABAN
//
//  Created by Kesley Ribeiro on 10/Jun/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit
import Alamofire

class Historico {
    
    var _usuario: String!
    var _valorDoEmprestimo: String!
    var _prazoDoEmprestimo: String!
    var _totalDoEmprestimo: String!
    var _taxaDeJuros: String!
    var _dataPrimeiroPagamento: String!
    var _dataUltimoPagamento: String!
    var _status: String!
    
    var usuario: String {
        if _usuario == nil {
            _usuario = ""
        }
        return _usuario
    }
    
    var valorDoEmprestimo: String {
        if _valorDoEmprestimo == nil {
            _valorDoEmprestimo = ""
        }
        return _valorDoEmprestimo
    }
    
    var prazoDoEmprestimo: String {
        if _prazoDoEmprestimo == nil {
            _prazoDoEmprestimo = ""
        }
        return _prazoDoEmprestimo
    }
    
    var totalDoEmprestimo: String {
        if _totalDoEmprestimo == nil {
            _totalDoEmprestimo = ""
        }
        return _totalDoEmprestimo
    }
    
    var taxaDeJuros: String {
        if _taxaDeJuros == nil {
            _taxaDeJuros = ""
        }
        return _taxaDeJuros
    }
    
    var dataPrimeiroPagamento: String {
        if _dataPrimeiroPagamento == nil {
            _dataPrimeiroPagamento = ""
        }
        return _dataPrimeiroPagamento
    }
    
    var dataUltimoPagamento: String {
        if _dataUltimoPagamento == nil {
            _dataUltimoPagamento = ""
        }
        return _dataUltimoPagamento
    }
    
    var status: String {
        if _status == nil {
            _status = ""
        }
        return _status
    }
    
    
    init(historicoDict: Dictionary<String, AnyObject>) {
        
        if let usuario = historicoDict["usuario"] as? String {
            self._usuario = usuario
        }
        
        if let valorDoEmprestimo = historicoDict["valorDoEmprestimo"] as? String {
            self._valorDoEmprestimo = valorDoEmprestimo
        }
        
        if let prazoDoEmprestimo = historicoDict["prazoDoEmprestimo"] as? String {
            self._prazoDoEmprestimo = prazoDoEmprestimo
        }
        
        if let totalDoEmprestimo = historicoDict["totalDoEmprestimo"] as? String {
            self._totalDoEmprestimo = totalDoEmprestimo
        }
        
        if let taxaDeJuros = historicoDict["taxaDeJuros"] as? String {
            self._taxaDeJuros = taxaDeJuros
        }
        
        if let dataPrimeiroPagamento = historicoDict["dataPrimeiroPagamento"] as? String {
            self._dataPrimeiroPagamento = dataPrimeiroPagamento
        }
        
        if let dataUltimoPagamento = historicoDict["dataUltimoPagamento"] as? String {
            self._dataUltimoPagamento = dataUltimoPagamento
        }

        if let status = historicoDict["status"] as? String {
            self._status = status
        }
        
    }
    
}
