
import SwiftUI

struct RegistraBoletoView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @StateObject var viewModel = RegistrarViewModel()
        
    var body: some View {
        GeometryReader { view in
            VStack {
                HStack {
                    Text("Cadastra Boleto")
                        .font(.custom("Gilroy", size: self.horizontalSizeClass == .compact ? 20: 30))
                        .foregroundColor(.white)
                    
                }
                .frame(width: view.size.width, height: self.horizontalSizeClass == .compact ? 108: 120)
                .background(LinearGradient(gradient: Gradient(colors: Colors().GradientHeader ), startPoint: .topLeading, endPoint: .bottomTrailing))
                
                
                Spacer()
                
                ScrollView(.vertical, showsIndicators: false){
                    FieldsView()
                        .frame(height: view.size.height)
                }
                .padding()
                
                Spacer()
                
                HStack{
                    Text("Salvar")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button { viewModel.novoRegistro()
                        
                    } label: {
                        Image(systemName: "chevron.right")
                            .font(.body)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(Color.white.opacity(0.3),lineWidth: 1)
                            )
                    }
                }
                .padding(.vertical,10)
                .padding(.horizontal,30)
                .background(Colors().ColorButton)
                
            }
            .frame(width: view.size.width, height: view.size.height)
            .ignoresSafeArea()
        }.environmentObject(viewModel)
        .ignoresSafeArea()
    }
}

struct RegitrarView_Previews: PreviewProvider {
    static var previews: some View {
        RegistraBoletoView()
            .previewDevice("iPhone 8")
    }
}
