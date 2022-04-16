
import SwiftUI

struct ModalEditorView: View {
    
    
    @State  var nomeBoletoTextField: String = ""
    @State  var dataVencimentoTextField: Date  = Date()
    @State  var valorTextField: String = ""
    @State  var barcodeTextField: String = ""
    
    
    var isFlase = true
    
    var body: some View {
        GeometryReader { view in
            ZStack(alignment: .bottom) {
                if isFlase {
                    VStack {
                        Color.black
                            .opacity(0.3)
                            .ignoresSafeArea()
                            .onTapGesture {
                                Text("")
                            }
                        
                        
                        Text("Alterar dados")
                        
                        VStack(spacing: 10) {
                            TextField("Nome do Boleto", text: $nomeBoletoTextField)
                                .padding(.leading,12)
                                .font(.system(size: 15))
                                .frame(width: view.size.width, height: 40)
                                .background(RoundedRectangle(cornerRadius: 6).stroke(Colors().ColorBorderFiedls))
                            
                            DatePicker("Vencimento", selection: $dataVencimentoTextField, displayedComponents: .date)
                                .frame(width: view.size.width, height: 40)
                                .background(RoundedRectangle(cornerRadius: 6).stroke(Colors().ColorBorderFiedls))
                            
                            TextField("Valor", text: $valorTextField)
                                .padding(.leading,12)
                                .font(.system(size: 15))
                                .frame(width: view.size.width, height: 40)
                                .background(RoundedRectangle(cornerRadius: 6).stroke(Colors().ColorBorderFiedls))

                            TextField("Código de barrar", text: $barcodeTextField)
                                .padding(.leading,12)
                                .font(.system(size: 15))
                                .frame(width: view.size.width, height: 40)
                                .background(RoundedRectangle(cornerRadius: 6).stroke(Colors().ColorBorderFiedls))
                        }
                        
                        
                        Button {
                            guard let varlorField = Int(valorTextField) else { return }
                            
        //                    viewModel.novoRegistro(boleto(nome: nomeBoletoTextField,
        //                                                  vecimento: FormatadorDeData().FormatDataInString(dataVencimentoTextField),
        //                                                  valor: varlorField,
        //                                                  barcode: barcodeTextField))
                        } label : {
                            HStack {
                                Spacer()
                                Text("Salvar")
                                    .font(.custom("Avenir Medium", size: 17))
                                    .foregroundColor(.white)
                                
                                Spacer()
                            }
                            .foregroundColor(.white)
                            .frame(width: 120, height: 40)
                            .background(Color.blue)
                            .cornerRadius(32)
                            .padding(.horizontal)
                        }
                    }
                    .background(Color.white)
                    .transition(.move(edge: .bottom))
                }
            }
            .frame(maxWidth: view.size.width, maxHeight: view.size.height, alignment: .bottom)
            .ignoresSafeArea()
            .animation(.easeInOut)
        }
    }
}

struct ModalEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ModalEditorView()
    }
}
