
import Foundation

class EditorViewModel: ObservableObject {
    
    @Published  var id: String = ""
    @Published  var nomeBoletoTextField: String = ""
    @Published  var dataVencimentoTextField: Date  = Date()
    @Published  var valorTextField: String = ""
    @Published  var barcodeTextField: String = ""
    
    @Published var ativaAlerta: Bool = false
    @Published var sucessoRequest: Bool = false
    @Published var fieldsCorretas: Bool = false
    let service: EditorService
    
    init() {
        self.service = EditorService()
    }
    
    func AtulizarRegistro(){
        
        if validarFields() == false {
            guard let valor = Double(valorTextField) else { return }
            
            let parametros: [String: Any] = [
                "id": id,
                "nome_do_Boleto": nomeBoletoTextField,
                "data_vecimento": FormatadorDeData().FormatDataInString(dataVencimentoTextField),
                "valor": valor,
                "barcode": barcodeTextField
            ]

            service.put(id,parametros) { Result in
                guard Result != nil else {
                    DispatchQueue.main.async {
                        self.ativaAlerta =  true
                        self.sucessoRequest = true
                        self.fieldsCorretas = false
                    }
                    return
                }
                print("Erro \(String(describing: Result?.localizedDescription))")
            }
        }
    }
    
    
    func validarFields() -> Bool{
        if nomeBoletoTextField.isEmpty == false &&
            FormatadorDeData().FormatDataInString(dataVencimentoTextField).isEmpty  == false &&
            valorTextField.isEmpty == false &&
            barcodeTextField.isEmpty == false {
            return false
        } else {
            self.fieldsCorretas = true
            return true
        }
    }
}
