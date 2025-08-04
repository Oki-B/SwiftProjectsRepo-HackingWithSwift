//
//  StateWithClasses.swift
//  iExpense
//
//  Created by Syaoki Biek on 04/08/25.
//

import SwiftUI

//struct User { if we create the struct’s properties as variable but the struct itself is constant, we can’t change the properties – Swift needs to be able to destroy and recreate the whole struct when a property changes, and that isn’t possible for constant structs.
//    var firstName = "Bilbo"
//    var lastName = "Baggins"
//}

@Observable 
class User { //Class work differently with struct, Classes don’t need the mutating keyword, because even if the class instance is marked as constant Swift can still modify variable properties.
    var firstName = "Bilbo"
    var lastName = "Baggins"
}


struct StateWithClasses: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is: \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("Second name", text: $user.lastName)
        }
        .padding()
    }
}

#Preview {
    StateWithClasses()
}
