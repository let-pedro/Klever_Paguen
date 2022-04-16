
import UIKit


struct Boleto: Codable, Identifiable  {
    let id: String
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
