
import Foundation


class RegistrarViewModel: ObservableObject {
    
    @Published  var nomeBoletoTextField: String = ""
    @Published  var dataVencimentoTextField: Date  = Date()
    @Published  var valorTextField: String = ""
    @Published  var barcodeTextField: String = ""
    
    @Published var ativaAlerta: Bool = false
    @Published var sucessoRequest: Bool = false
    @Published var fieldsCorretas: Bool = false
    let service: RegistrarService
    
    init() {
        self.service = RegistrarService()
    }
    
    
    func novoRegistro(){
        if validarFields() == false {
            print("Entrei para salvar") //-----------------testes
            guard let valor = Double(valorTextField) else { return } //
            let parametros: [String: Any] = [
                "nome_do_Boleto": nomeBoletoTextField,
                "data_vecimento": FormatadorDeData().FormatDataInString(dataVencimentoTextField),
                "valor": valor,
                "barcode": barcodeTextField
            ]
            
            service.post(parametros) { Result in
                guard Result != nil else {
                    DispatchQueue.main.async {
                        self.ativaAlerta =  true
                        self.sucessoRequest = true
                        self.fieldsCorretas = false
                    }
                    return
                }
                print("Erro \(String(describing: Result?.localizedDescription))")
                self.limpaFields()
            }
        }
    }
    
    
    func limpaFields() {
        self.nomeBoletoTextField = ""
        self.dataVencimentoTextField = Date()
        self.valorTextField = ""
        self.barcodeTextField = ""
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
