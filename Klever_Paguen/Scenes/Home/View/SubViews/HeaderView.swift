
import SwiftUI

struct HeaderView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        GeometryReader { view in
            VStack {
                HStack(spacing: 5) {
                    Image("Money")
                        .resizable()
                        .frame(width: self.horizontalSizeClass == .compact ? 50 : 70 , height: self.horizontalSizeClass == .compact ? 50 : 70)
                        
                    Text("PAGUEN")
                        .font(.custom("Bodoni", size: self.horizontalSizeClass == .compact ? 30 : 45))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: view.size.width)
                .padding()

                Spacer()
                
                Text("R$ \(String(format: "%0.2f", viewModel.totalDeDividas))")
                    .frame(maxWidth: view.size.width, alignment: .leading)
                    .font(.system(size: self.horizontalSizeClass == .compact ? 24 : 35))
                    .foregroundColor(.white)
                    .padding(.leading, 12)
                    .padding(.bottom, 12)
            }
            .background(LinearGradient(gradient: Gradient(colors: Colors().GradientHeader ), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
