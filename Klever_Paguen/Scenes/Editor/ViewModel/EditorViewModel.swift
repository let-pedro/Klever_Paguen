
import Foundation

class EditorViewModel: ObservableObject {
    
    @Published  var id: String = ""
    @Published  var nomeBoletoTextField: String = ""
    @Published  var dataVencimentoTextField: Date  = Date()
    @Published  var valorTextField: String = ""
    @Published  var barcodeTextField: String = ""
    let service: EditorService
    
    init() {
        self.service = EditorService()
    }
    
    func AtulizarRegistro(){
        guard let valor = Int(valorTextField) else { return }
        
        let parametros: [String: Any] = [
            "id": id,
            "nome_do_Boleto": nomeBoletoTextField,
            "data_vecimento": FormatadorDeData().FormatDataInString(dataVencimentoTextField),
            "valor": valor,
            "barcode": barcodeTextField
        ]

        service.put(id,parametros) { Result in
            guard Result != nil else {
                print("Atualizado com Sucesso")
                return
            }
            print("Erro ao atualizar")
        }
    }
}
