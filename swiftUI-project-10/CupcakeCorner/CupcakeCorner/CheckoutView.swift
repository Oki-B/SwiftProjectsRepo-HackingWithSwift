//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Syaoki Biek on 07/09/25.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order

    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(
                    url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"),
                    scale: 3
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)

                Text(
                    "Your total cost is \(order.cost, format: .currency(code: "USD"))"
                )
                .font(.title)

                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank you!", isPresented: $showingConfirmation) {
            Button("OK") {}
        } message: {
            Text(confirmationMessage)
        }
    }

    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }

        // prepare address and content we want to sent to remote server
        let url = URL(string: "https://reqres.in/api/users")!  // reqres is an API that very useful to purpose a testing content
        var request = URLRequest(url: url)
        request.addValue("reqres-free-v1", forHTTPHeaderField: "x-api-key")  // Reqres.in now required free API key to use
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        do {
            let (data, _) = try await URLSession.shared.upload(
                for: request,
                from: encoded
            )

            // handle the result
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage =
                "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true

        } catch {
            print("Check out failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
