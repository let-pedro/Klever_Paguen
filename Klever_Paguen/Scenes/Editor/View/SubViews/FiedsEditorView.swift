

import SwiftUI

struct FiedsEditorView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @EnvironmentObject var viewModel: EditorViewModel
    
    var boleto: Boleto
    
    var body: some View {
        GeometryReader { view in
            VStack(spacing: 20) {
                HStack {
                    Image("bill_icon")
                        .resizable()
                        .frame(width: self.horizontalSizeClass == .compact ? 20: 30, height: self.horizontalSizeClass == .compact ? 20: 30)
                        .padding()
                    
                    TextField("Nome do Boleto", text: $viewModel.nomeBoletoTextField)
                        .padding(.leading,12)
                        .font(.system(size: self.horizontalSizeClass == .compact ? 15: 22))
                    
                }
                .frame(width: view.size.width, height: self.horizontalSizeClass == .compact ? 45: 57)
                .background(RoundedRectangle(cornerRadius: 6).stroke(Colors().ColorBorderFiedls))
                
                HStack {
                    Image("calendar_icon")
                        .resizable()
                        .frame(width: self.horizontalSizeClass == .compact ? 20: 30, height: self.horizontalSizeClass == .compact ? 20: 30)
                        .padding()

                    
                    DatePicker("Vencimento", selection: $viewModel.dataVencimentoTextField, displayedComponents: .date)
                        .padding(.leading,12)
                        .font(.system(size: self.horizontalSizeClass == .compact ? 15: 22))
                        .foregroundColor(.gray)
                    
                }
                .frame(width: view.size.width, height: self.horizontalSizeClass == .compact ? 45: 57)
                .background(RoundedRectangle(cornerRadius: 6).stroke(Colors().ColorBorderFiedls))
                

                HStack(spacing: 20) {
                    Image("money_icon")
                        .resizable()
                        .frame(width: self.horizontalSizeClass == .compact ? 20: 30, height: self.horizontalSizeClass == .compact ? 20: 30)
                        .padding()

                    
                    TextField("Valor", text: $viewModel.valorTextField)
                        .padding(.leading,12)
                        .font(.system(size: self.horizontalSizeClass == .compact ? 15: 22))
                        .keyboardType(.decimalPad)
                    
                }
                .frame(width: view.size.width, height: self.horizontalSizeClass == .compact ? 45: 57)
                .background(RoundedRectangle(cornerRadius: 6).stroke(Colors().ColorBorderFiedls))
                
                
                HStack(spacing: 20) {
                    Image("barcode_icon")
                        .resizable()
                        .frame(width: self.horizontalSizeClass == .compact ? 20: 30, height: self.horizontalSizeClass == .compact ? 20: 30)
                        .padding()

                    
                    TextField("Código de barrar", text: $viewModel.barcodeTextField)
                        .padding(.leading,12)
                        .font(.system(size: self.horizontalSizeClass == .compact ? 15: 22))
                        .keyboardType(.numberPad)
                    
                }
                .frame(width: view.size.width, height: self.horizontalSizeClass == .compact ? 45: 57)
                .background(RoundedRectangle(cornerRadius: 6).stroke(Colors().ColorBorderFiedls))
            }
            .onAppear(perform:{
                guard let data = FormatadorDeData().FormatStringInData(boleto.vecimento) else { return }
                viewModel.id = boleto.id
                viewModel.nomeBoletoTextField = boleto.nome
                viewModel.dataVencimentoTextField = data
                viewModel.valorTextField = String(boleto.valor)
                viewModel.barcodeTextField = boleto.barcode
            })
        }
    }
}

struct FiedsEditorView_Previews: PreviewProvider {
    static var previews: some View {
        FiedsEditorView( boleto: Boleto(id: "0", nome: "teste", vecimento: "00/00/000", valor: 111, barcode:  "000000"))
    }
}
