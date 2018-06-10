//
//  Investimento.swift
//  CIAB FEBRABAN
//
//  Created by Kesley Ribeiro on 10/Jun/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Investimento {
    
    var _usuario: String!
    var _taxa: String!
    var _investimento: String!
    
    var usuario: String {
        if _usuario == nil {
            _usuario = ""
        }
        return _usuario
    }
    
    var taxa: String {
        if _taxa == nil {
            _taxa = ""
        }
        return _taxa
    }
    
    var investimento: String {
        if _investimento == nil {
            _investimento = ""
        }
        return _investimento
    }
    
    
    init(investimentoDict: Dictionary<String, AnyObject>) {
        
        if let usuario = investimentoDict["usuario"] as? String {
            self._usuario = usuario
        }
        
        if let taxa = investimentoDict["taxa"] as? String {
            self._taxa = taxa
        }
        
        if let investimento = investimentoDict["investimento"] as? String {
            self._investimento = investimento
        }
        
    }
    
}
