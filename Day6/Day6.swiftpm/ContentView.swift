import SwiftUI

struct ContentView: View {
    var viewModel = CombineViewModel()
    
    var body: some View {
        ZStack {
            viewModel.color
                .edgesIgnoringSafeArea(.all)
            VStack {
                colorChnageButton()
            }
        }
       
    }
}

extension  ContentView {
    @ViewBuilder
    private func colorChnageButton() -> some View {
        HStack {
            Spacer()
            Text("배경 색 변경")
                .foregroundStyle(.white)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                )
                .onTapGesture {
                    viewModel.send(action: .randomColor)   
                }
            
            Spacer()
                .frame(width: 10)
            
            Text("초기화")
                .foregroundStyle(.white)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.red)
                )
                .onTapGesture {
                    viewModel.send(action: .resetColor)   
                }
            
            Spacer()

        }
    }
}
