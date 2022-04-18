

import SwiftUI

struct EditorView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @StateObject var viewModel = EditorViewModel()
    
    var boletoEdit: Boleto

    var body: some View {
        GeometryReader { view in
            VStack {
                HStack {
                    Text("Editar Boleto \(boletoEdit.nome)")
                        .font(.custom("Gilroy", size: self.horizontalSizeClass == .compact ? 20: 30))
                        .foregroundColor(.white)
                    
                }
                .frame(width: view.size.width, height: self.horizontalSizeClass == .compact ? 108: 120)
                .background(LinearGradient(gradient: Gradient(colors: Colors().GradientHeader ), startPoint: .topLeading, endPoint: .bottomTrailing))
                
                
                Spacer()
                
                ScrollView(.vertical, showsIndicators: false) {
                    FiedsEditorView(boleto: boletoEdit)
                        .frame(height: view.size.height)
                }
                .padding()
                
                Spacer()
                
                if viewModel.fieldsCorretas {
                    Text("Todos os campos precisar ser preenchidos")
                        .foregroundColor(.red)
                }
                
                HStack{
                    Text("Salvar")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button { viewModel.AtulizarRegistro()
                        
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
                    .alert(isPresented: $viewModel.ativaAlerta, content: {
                        switch viewModel.sucessoRequest {
                        case true:
                            return Alert(title: Text("Sucesso 😀"), message: Text("O boleto foi Atualizado com Sucesso"), primaryButton: .default(Text("Confirmar"), action: {
                                viewModel.ativaAlerta = false
                                viewModel.sucessoRequest = false
                            }), secondaryButton: .cancel())
                        
                        case false:
                            return Alert(title: Text("Error 😔"), message: Text("Ocorreu um erro no momento de Atualizar o boleto, verificar os dados registrado ou tenta novamente depois"), primaryButton: .default(Text("Confirmar"), action: {
                                viewModel.ativaAlerta = false
                                viewModel.sucessoRequest = false
                            }), secondaryButton: .cancel())
                        }
                    })
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

struct EditorView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            EditorView(boletoEdit: Boleto(id: "0", nome: "teste", vecimento: "00/00/000", valor: 111, barcode:  "000000"))
                .previewDevice("iPad Air (4th generation)")

                        
//            EditorView(boletoEdit: Boleto(id: "0", nome: "teste", vecimento: "00/00/000", valor: 111, barcode:  "000000"))
//                .previewDevice("iPhone 8")
                
        }
    }
}
