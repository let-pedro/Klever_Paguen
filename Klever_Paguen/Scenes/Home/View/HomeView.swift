
import SwiftUI

struct HomeView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { view in
                VStack(spacing: 20) {
                    HeaderView()
                        .frame(width: view.size.width, height: self.horizontalSizeClass == .compact ? 144: 160, alignment: .top)
                        .clipShape(RoundedShape(corners: [.bottomRight]))
                        
                    Text("Meus Boletos")
                        .font(.system(size: self.horizontalSizeClass == .compact ? 20: 35))
                        .fontWeight(.light)
                        .frame(maxWidth: view.size.width, alignment: .leading)
                        .padding(.leading, 16)

                    List {
                        ForEach(viewModel.boletos){ boleto in
                            CellListaBoletos(Dateboleto: boleto)
                        }
                        .onDelete(perform: viewModel.deletarBoleto)
                    }
                    .listStyle(PlainListStyle())
                    .onAppear{
                        viewModel.ListarBoletos()
                    }
                }
            }.edgesIgnoringSafeArea(.all)
            .overlay(
                NavigationLink(destination: RegistraBoletoView()){
                    HStack {
                        Spacer()
                        Text("Novo")
                            .font(.custom("Avenir Medium", size: self.horizontalSizeClass == .compact ? 17: 22))
                            .foregroundColor(.white)
                    
                        Spacer()
                    }
                    .padding(.vertical)
                    .background(Colors().ColorButton)
                    .cornerRadius(32)
                    .padding(.horizontal)
                },alignment: .bottom
            )
        }
        .environmentObject(viewModel)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
