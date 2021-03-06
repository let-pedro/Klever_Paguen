
import SwiftUI

struct FieldsView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @EnvironmentObject var viewModel: RegistrarViewModel
        
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

                    
                    TextField("C??digo de barrar", text: $viewModel.barcodeTextField)
                        .padding(.leading,12)
                        .font(.system(size: self.horizontalSizeClass == .compact ? 15: 22))
                        .keyboardType(.numberPad)
                    
                }
                .frame(width: view.size.width, height: self.horizontalSizeClass == .compact ? 45: 57)
                .background(RoundedRectangle(cornerRadius: 6).stroke(Colors().ColorBorderFiedls))
            }
        } 
    }
}

struct FieldsView_Previews: PreviewProvider {
    static var previews: some View {
        FieldsView()
    }
}
