
import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        GeometryReader { view in
            VStack(spacing: 20) {
                
                HeaderView()
                    .frame(maxWidth: view.size.width)
                    .frame(height: 144)
                    .clipShape(RoundedShape(corners: [.bottomRight]))
                    
                
                Text("Meus Boletos")
                    .font(.system(size: 20))
                    .fontWeight(.light)
                    .frame(maxWidth: view.size.width, alignment: .leading)
                    .padding(.leading, 16)

                List {
                    ForEach(viewModel.boletos){ boleto in
                        CellListaBoletos(Dateboleto: boleto)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .environmentObject(viewModel)
            .onAppear {
                viewModel.ListarBoletos()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
