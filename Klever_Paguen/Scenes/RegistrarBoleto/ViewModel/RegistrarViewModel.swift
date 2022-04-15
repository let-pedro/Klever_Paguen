
//FormatadorDeData().getData(recibo.data),
import Foundation


class RegistrarViewModel: ObservableObject {
    
    let service: RegistrarService
    
    init() {
        self.service = RegistrarService()
    }
    
    
    func novoRegistro(_ DadosBoleto: boleto){
                
        let parametros: [String: Any] = [
            "nome_do_Boleto": DadosBoleto.nome,
            "data_vecimento": DadosBoleto.vecimento,
            "valor": DadosBoleto.valor,
            "barcode": DadosBoleto.barcode
        ]
        
        service.post(parametros) { Result in
            switch Result {
            case true:
                print("Sucesso")
            case false:
                print("Failed to fetch posts: ")
            }
        }
    }
}
