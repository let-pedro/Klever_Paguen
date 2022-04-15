
import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    let GradientHeader = [
                          Color(red: 0.99, green: 0.32, blue: 0.52, opacity: 1),
                          Color(red: 0.42, green: 0.31, blue: 0.45, opacity: 1),
                          Color(red: 0.21, green: 0.31, blue: 0.42, opacity: 1),
                          ]
    
    
    var body: some View {
        
        
        GeometryReader { view in
            VStack {
                HStack(spacing: 5) {
                    
                    Image("Money")
                        .resizable()
                        .frame(width: 50, height: 50)
                        
                    Text("Paguen")
                        .font(.custom("Avenir", size: 30))
                        //.fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: view.size.width)
                .padding()

                Spacer()
                
                Text("R$ \(String(format: "%.2", viewModel.totalDeDividas))")
                    .frame(maxWidth: view.size.width, alignment: .leading)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .padding()
                    
                
            }
            .frame(width: view.size.width, height: 144)
            .background(LinearGradient(gradient: Gradient(colors: GradientHeader ), startPoint: .topLeading, endPoint: .bottomTrailing))
            
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            
    }
}
