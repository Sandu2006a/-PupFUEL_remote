import SwiftUI

struct PetLoginView: View {
    @State private var petName: String = ""
    @State private var age: Double = 1.0
    @State private var weight: Double = 1.0
    @State private var isNextButtonTapped: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                Spacer()
            }
            .padding(.horizontal)
            
            Text("Pet Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50)
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            
            TextField("Numele câinelui", text: $petName)
                .font(.title2)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
            
            Slider(value: $age, in: 1...50, step: 1)
                .padding(.horizontal)
            
            Text("Vârsta: \(Int(age)) ani")
                .font(.title3)
            
            Slider(value: $weight, in: 1...100, step: 1)
                .padding(.horizontal)
            
            Text("Greutate: \(Int(weight)) kg")
                .font(.title3)
            
            Button(action: {
                isNextButtonTapped = true
            }) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isNextButtonTapped) {
                BreedSelectionView()
            }
            
            Spacer()
        }
        .padding()
        .navigationBarHidden(true)
    }
}
 
struct BreedSelectionView: View {
    var body: some View {
        VStack {
            Text("Selectați rasa câinelui")
                .font(.title)
                .padding()
            
            // Aici poți adăuga selecția rasei câinelui
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            PetLoginView()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
