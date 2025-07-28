import SwiftUI

struct ShopCartView: View {
    var viewModel = ShoppingCartViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            GeometryReader { geo in
                VStack {
                    listItem()
                    Spacer()
                        .frame(height: 20)
                }
                .frame(width: geo.size.width, height: geo.size.height - 80, alignment: .top)
            }
            
            addButton()
                .transition(.move(edge: .bottom)
                .combined(with: .opacity))
                .padding(.vertical, 20)
        }
    }
}

extension ShopCartView {
    func addButton() -> some View {
        HStack {
            additemView()
            
            
        }
    }
    
    func additemView() -> some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.blue)
            .frame(height: 52)
            .padding(.horizontal, 24)
            .overlay { 
                Text("추가")
                    .foregroundStyle(.white)
                    .font(.caption)
                   
            }
            .onTapGesture {
                Task {
                    if let product = Product.mockItem.randomElement() {
                        try await viewModel.addItem(product)
                    }
                }
            }
    }
    
    
    func listItem() -> some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(Array(viewModel.item.enumerated()), id: \.element.id) { index, item in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(item.name)
                                .font(.title2)
                            
                            Text(item.category.categoryDescition)
                                .font(.title2)
                            
                            Spacer()
                            
                            Button(role: .destructive) {
                                Task {
                                    viewModel.removeItem(at: index)
                                }
                            } label: {
                                Label("삭제", systemImage: "trash")
                            }
                        }
                        .padding(.bottom, 5)
                        
                        Text(item.formattedPrice)
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)
                    
                }
            }
            .padding()
        }
    }
    
}
