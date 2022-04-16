
import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var boletos: [Boleto]
    @Published var totalDeDividas: Double
    
    let service: HomeService
    
    init() {
        self.boletos = []
        self.totalDeDividas = 0.0
        self.service = HomeService()
    }
    
    
    func ListarBoletos(){
        service.get() { Result in
            switch Result {
            case .success(let ListaBoletos):
                self.boletos = ListaBoletos
                self.SomarDividas()
            case .failure(let error):
                print("Failed to fetch posts: ", error)
            }
        }
    }
    
    
    func SomarDividas(){
        self.totalDeDividas = 0.0
        for boleto in boletos {
            totalDeDividas += Double(boleto.valor)
        }
    }
}

