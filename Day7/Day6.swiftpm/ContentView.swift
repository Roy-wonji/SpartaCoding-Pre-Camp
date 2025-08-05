import SwiftUI

struct ContentView: View {
    var viewModel = CombineViewModel()
    
    var body: some View {
        ZStack {
            viewModel.state.color
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                countLabelCoubt()
                
                colorChangeButton()
            }
        }
       
    }
}

extension  ContentView {
    @ViewBuilder
    private func countLabelCoubt() -> some View {
        VStack {
            Text("\(viewModel.state.count)")
                .font(.system(size: 50, weight: .semibold, design: .monospaced))
                .foregroundStyle(.white)
        }
    }
    
    @ViewBuilder
    private func colorChangeButton() -> some View {
        let count = viewModel.state.count
        let isMinusDisabled = count <= -10
        let isPlusDisabled = count >= 10
        
         HStack {
            Spacer()
            
            // ➕ 증가 버튼
            Text("+")
                .foregroundStyle(.white)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isPlusDisabled ? .gray : .blue)
                )
                .onTapGesture {
                    guard !isPlusDisabled else { return }
                    viewModel.send(action: .addCount)
                }
                .disabled(isPlusDisabled)
            
            Spacer().frame(width: 10)
            
           
            
            // ➖ 감소 버튼
            Text("-")
                .foregroundStyle(.white)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isMinusDisabled ? .gray : .red)
                )
                .onTapGesture {
                    guard !isMinusDisabled else { return }
                    viewModel.send(action: .minusCount)
                }
                .disabled(isMinusDisabled)
            
            Spacer().frame(width: 10)
            
            // 🔄 초기화 버튼
            Text("초기화")
                .foregroundStyle(.white)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue.opacity(0.8))
                )
                .onTapGesture {
                    viewModel.send(action: .resetCount)
                }
            
            Spacer()
        }
    }
}
