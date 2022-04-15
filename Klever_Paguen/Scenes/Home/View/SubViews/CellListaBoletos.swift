
import SwiftUI

struct CellListaBoletos: View {
    
    var Dateboleto: Boleto
    
    var body: some View {
        HStack(spacing: 20) {
                Image("payment")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                
                
                VStack(alignment: .leading) {
                    Text(Dateboleto.nome)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    
                    Text(Dateboleto.vecimento)
                        .font(.system(size: 14))
                        .foregroundColor(Color(.lightGray))
                }
                
                Spacer()
                
            Text(String(Dateboleto.valor))
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
            }
            .frame(height: 60)
            .padding(.horizontal,3)
    }
}

struct CellListaBoletos_Previews: PreviewProvider {
    static var previews: some View {
        CellListaBoletos(Dateboleto: Boleto(id: "r545454",nome:"rerer", vecimento: "fdfdf", valor: 4343, barcode: "432" ))
            .previewLayout(.fixed(width: .infinity, height: 60))
            
    }
}
