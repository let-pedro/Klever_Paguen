//
//  boleto.swift
//  Klever_Paguen
//
//  Created by Development IOS on 15/04/22.
//

import Foundation

struct boleto: Encodable, Identifiable  {
    var id = UUID()
    let nome: String
    let vecimento: String
    let valor: Int
    let barcode: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case nome = "nome_do_Boleto"
        case vecimento = "data_vecimento"
        case valor
        case barcode
    }
}
