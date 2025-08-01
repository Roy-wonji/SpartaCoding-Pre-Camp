import SwiftUI

struct ContentView: View {
    var viewModel = CombineViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .onAppear{
            viewModel.send(action: .justTest)
            viewModel.send(action: .numberTest)
            viewModel.send(action: .todotest)
            viewModel.send(action: .timerTest)
            
        }
    }
    

}
