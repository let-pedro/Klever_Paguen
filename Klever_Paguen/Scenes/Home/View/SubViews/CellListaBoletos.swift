
import SwiftUI

struct CellListaBoletos: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var Dateboleto: Boleto
    
    var body: some View {
        HStack(spacing: 20) {
                Image("payment")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                
                
                VStack(alignment: .leading) {
                    Text(Dateboleto.nome)
                        .font(.system(size: self.horizontalSizeClass == .compact ? 16 : 23))
                        .fontWeight(.bold)
                    
                    Text(Dateboleto.vecimento)
                        .font(.system(size: self.horizontalSizeClass == .compact ? 16 : 20))
                        .foregroundColor(Color(.lightGray))
                }
                
                Spacer()
                
            Text(String(Dateboleto.valor))
                    .font(.system(size: self.horizontalSizeClass == .compact ? 14 : 20))
                    .fontWeight(.semibold)
            }
            .frame(height: self.horizontalSizeClass == .compact ? 60 : 70)
            .padding(.horizontal,3)
    }
}

struct CellListaBoletos_Previews: PreviewProvider {
    static var previews: some View {
        CellListaBoletos(Dateboleto: Boleto(id: "1",nome:"teste", vecimento: "00/00/0000", valor: 1111, barcode: "0000000" ))
            .previewLayout(.fixed(width: .infinity, height: 60))
            
    }
}
