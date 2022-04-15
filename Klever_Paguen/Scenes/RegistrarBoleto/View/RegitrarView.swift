
import SwiftUI

struct RegitrarView: View {
    
    // Attributes
    @StateObject var viewModel = RegistrarViewModel()
    @State  var nomeBoletoTextField: String = ""
    @State  var dataVencimentoTextField: Date  = Date()
    @State  var valorTextField: String = ""
    @State  var barcodeTextField: String = ""

    
    var body: some View {
        
        GeometryReader { view in

            ScrollView {
                HStack {
                    Text("Cadastra Boleto")
                        .font(.custom("Gilroy", size: 20))
                        .foregroundColor(.white)
                    
                }
                .frame(maxWidth: view.size.width)
                .frame(height: 108)
                .background(LinearGradient(gradient: Gradient(colors: GradientHeader ), startPoint: .topLeading, endPoint: .bottomTrailing))
                
                
                VStack(spacing: 20) {
                                HStack {
                                    Image("bill_icon")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .padding()
                
                                    TextField("Nome do Boleto", text: $nomeBoletoTextField)
                                        .padding(.leading,12)
                                        .font(.system(size: 15))
                
                                }
                                .frame(width: view.size.width, height: 45)
                                .background(RoundedRectangle(cornerRadius: 6).stroke(ColorBorderFiedls))
                
                                HStack {
                                    Image("calendar_icon")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .padding()
                
                
                                    DatePicker("Vencimento", selection: $dataVencimentoTextField, displayedComponents: .date)
                
                                }
                                .frame(width: view.size.width, height: 45)
                                .background(RoundedRectangle(cornerRadius: 6).stroke(ColorBorderFiedls))
                
                
                                HStack(spacing: 20) {
                                    Image("money_icon")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .padding()
                
                
                                    TextField("Valor", text: $valorTextField)
                                        .padding(.leading,12)
                                        .font(.system(size: 15))
                
                                }
                                .frame(width: view.size.width, height: 45)
                                .background(RoundedRectangle(cornerRadius: 6).stroke(ColorBorderFiedls))
                
                
                                HStack(spacing: 20) {
                                    Image("barcode_icon")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .padding()
                
                
                                    TextField("Código de barrar", text: $barcodeTextField)
                                        .padding(.leading,12)
                                        .font(.system(size: 15))
                                }
                                .frame(width: view.size.width, height: 45)
                                .background(RoundedRectangle(cornerRadius: 6).stroke(ColorBorderFiedls))
  
                }
                
                Spacer()
                
                Button {
                    guard let varlorField = Int(valorTextField) else { return }
                    
                    viewModel.novoRegistro(boleto(nome: nomeBoletoTextField,
                                                  vecimento: FormatadorDeData().FormatDataInString(dataVencimentoTextField),
                                                  valor: varlorField,
                                                  barcode: barcodeTextField))
                } label : {
                    HStack {
                        Spacer()
                        Text("Salvar")
                            .font(.custom("Avenir Medium", size: 17))
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .padding(.vertical)
                        .background(Color.blue)
                        .cornerRadius(32)
                        .padding(.horizontal)
                    .padding(.bottom, 10)
                    .frame(alignment: .trailing)
                    
                }// Stack maior
            }
        }
    }
}

struct RegitrarView_Previews: PreviewProvider {
    static var previews: some View {
        RegitrarView()
    }
}
