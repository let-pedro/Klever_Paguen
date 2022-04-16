
import Foundation


class RegistrarViewModel: ObservableObject {
    
    @Published  var nomeBoletoTextField: String = ""
    @Published  var dataVencimentoTextField: Date  = Date()
    @Published  var valorTextField: String = ""
    @Published  var barcodeTextField: String = ""
    
    let service: RegistrarService
    
    init() {
        self.service = RegistrarService()
    }
    
    
    func novoRegistro(){
        guard let valor = Int(valorTextField) else { return }
        
        let parametros: [String: Any] = [
            "nome_do_Boleto": nomeBoletoTextField,
            "data_vecimento": FormatadorDeData().FormatDataInString(dataVencimentoTextField),
            "valor": valor,
            "barcode": barcodeTextField
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
