
import SwiftUI

struct RegistraBoletoView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @StateObject var viewModel = RegistrarViewModel()

    var body: some View {
        GeometryReader { view in
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    Text("Cadastra Boleto")
                        .font(.custom("Gilroy", size: self.horizontalSizeClass == .compact ? 20: 30))
                        .foregroundColor(.white)
                    
                }
                .frame(width: view.size.width, height: self.horizontalSizeClass == .compact ? 108: 120)
                .background(LinearGradient(gradient: Gradient(colors: Colors().GradientHeader ), startPoint: .topLeading, endPoint: .bottomTrailing))
                
                FieldsView()
                    .frame(width: view.size.width, height: self.horizontalSizeClass == .compact ? 108: 300, alignment: .center)

                Button(action: viewModel.novoRegistro){
                    HStack {
                        Spacer()
                        Text("Salvar")
                            .font(.custom("Avenir Medium", size: self.horizontalSizeClass == .compact ? 17: 22))
                            .foregroundColor(.white)
                    
                        Spacer()
                    }
                    .padding(.vertical)
                    .background(Colors().ColorButton)
                    .cornerRadius(32)
                    .padding(.horizontal)
                    
                }
            }.edgesIgnoringSafeArea(.all)
        }.environmentObject(viewModel)
    }
}

struct RegitrarView_Previews: PreviewProvider {
    static var previews: some View {
        RegistraBoletoView()
    }
}
