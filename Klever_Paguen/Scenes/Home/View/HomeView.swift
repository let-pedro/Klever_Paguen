
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
                            NavigationLink(destination: EditorView(boletoEdit: boleto)){
                                CellListaBoletos(Dateboleto: boleto)
                            }
                        }
                        .onDelete(perform: viewModel.deletarBoleto)
                    }
                    .listStyle(PlainListStyle())
                }
            }.edgesIgnoringSafeArea(.all)
            .overlay(
                NavigationLink(destination: RegistraBoletoView()){
                    HStack{
                        Text("Adicionar")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        //Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.body)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(Color.white.opacity(0.3),lineWidth: 1)
                            )
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal,30)
                    .background(Colors().ColorButton)
                    .clipShape(RoundedShape(corners: [.topLeft]))
                },alignment: .bottomTrailing
            )
        }
        .environmentObject(viewModel)
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear{
            viewModel.SomarDividas()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        //HomeView()
        
        Group{
//            HomeView()
//                .previewDevice("iPad Air (4th generation)")
            
            HomeView()
                .previewDevice("iPhone 8")
        }
    }
}
