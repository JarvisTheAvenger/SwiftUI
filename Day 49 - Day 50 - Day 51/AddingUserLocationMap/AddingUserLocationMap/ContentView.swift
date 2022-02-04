//
//  ContentView.swift
//  AddingUserLocationMap
//
//  Created by Rahul on 03/02/22.
//

import SwiftUI
import MapKit
import LocalAuthentication

struct LockedView: View {
    @Binding var isUnlocked: Bool
    @State private var showingError = false
    @State private var errorTitle = ""
    @State private var errorMsg = ""

    var body: some View {
        Button("Unlock Places") {
            self.authenticate()
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(Capsule())
        .alert(isPresented: $showingError) {
            Alert(title: Text(errorTitle), message: Text(errorMsg), dismissButton: .default(Text("OK")))
        }
    }

    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Please authenticate yourself to unlock your places."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, _ in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        self.errorTitle = "Unable to authenticate"
                        self.errorMsg = "\(error?.localizedDescription ?? "Unknown error")"
                        self.showingError = true
                    }
                }
            }
        } else {
            self.errorTitle = "Unable to unlock"
            self.errorMsg = "Your device does not support biometric authentication."
            self.showingError = true
        }
    }
}

struct UnlockedView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [CodableMKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    @State private var showingEditScreen = false

    var body: some View {
        ZStack {
            MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        let newLocation = CodableMKPointAnnotation()
                        newLocation.coordinate = self.centerCoordinate
                        newLocation.title = "Example location"
                        self.locations.append(newLocation)

                        self.selectedPlace = newLocation
                        self.showingEditScreen = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
        .alert(isPresented: $showingPlaceDetails) {
            Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place information."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
                self.showingEditScreen = true
            })
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: saveData) {
            if self.selectedPlace != nil {
                EditView(placemark: self.selectedPlace!)
            }
        }
        .onAppear(perform: loadData)
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func loadData() {
        let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")

        do {
            let data = try Data(contentsOf: filename)
            locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
        } catch {
            print("Unable to load saved data.")
        }
    }

    func saveData() {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
            let data = try JSONEncoder().encode(self.locations)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
}

struct ContentView: View {
    @State private var isUnlocked = false

    var body: some View {
        //if isUnlocked {
            UnlockedView()
//        } else {
//            LockedView(isUnlocked: $isUnlocked)
//        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        @Published var selectedPlace: Location?
        
        @Published private(set) var locations: [Location]
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func addLocation() {
            let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            locations.append(newLocation)
        }
        
        func update(location: Location) {
            guard let selectedPlace = selectedPlace else { return }

            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }

    }
    

}
