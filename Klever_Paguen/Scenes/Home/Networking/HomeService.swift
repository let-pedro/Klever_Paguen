
import Foundation


struct HomeService {
    
    private let urlApi: String = "https://625732594428bb6c08201927.mockapi.io/api/v1/createBoleto"
    
    func get (completion: @escaping (Result<[Boleto],Error>) -> Void){

            guard let api = URL(string: "\(urlApi)") else {
                print ("Not found url")
                return
            }

            URLSession.shared.dataTask(with: api) { (data, response, error) in
                if error != nil {
                    print("error", error?.localizedDescription ?? "")
                    return
                }

                guard let data = data else { return }

                do {
                    let ArrayBoletos = try JSONDecoder().decode([Boleto].self, from: data)
                    completion(.success(ArrayBoletos))
                }catch  {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }.resume()
    }
}
