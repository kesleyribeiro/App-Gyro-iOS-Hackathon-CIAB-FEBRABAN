//
//  HistoricoCell.swift
//  CIAB FEBRABAN
//
//  Created by Kesley Ribeiro on 10/Jun/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit

class HistoricoCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var bkgView: UIView!
    @IBOutlet weak var valorDoEmprestimoLabel: UILabel!
    @IBOutlet weak var prazoDoEmprestimoLabel: UILabel!
    @IBOutlet weak var totalDoEmprestimoLabel: UILabel!
    @IBOutlet weak var taxaDeJurosLabel: UILabel!
    @IBOutlet weak var data1PagamentoLabel: UILabel!
    @IBOutlet weak var dataUltimoPagamentoLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bkgView.layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 1).cgColor
        bkgView.layer.shadowOpacity = 1
        bkgView.layer.shadowRadius = 5
        bkgView.layer.shadowOffset = CGSize(width: 2, height: 5)
        bkgView.layer.cornerRadius = 10
    }
    

    // MARK: - Function
    
    func configureCell(historico: Historico) {
        
        valorDoEmprestimoLabel.text = "R$ \(historico.valorDoEmprestimo)"
        prazoDoEmprestimoLabel.text = historico.prazoDoEmprestimo
        totalDoEmprestimoLabel.text = "R$ \(historico.totalDoEmprestimo)"
        taxaDeJurosLabel.text = historico.taxaDeJuros
        data1PagamentoLabel.text = historico.dataPrimeiroPagamento
        dataUltimoPagamentoLabel.text = historico.dataUltimoPagamento
        statusLabel.text = historico.status

        if historico.status == "Confirmado" {
            statusLabel.textColor = UIColor(red: 0/255, green: 144/255, blue: 81/255, alpha: 1)
        } else {
            statusLabel.textColor = UIColor.red
        }
        
    }

}
