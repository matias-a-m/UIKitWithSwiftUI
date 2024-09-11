import SwiftUI
import UIKit

struct ContentView: View {
    @State private var isLoading = false
    @State private var progress: Double = 0.0
    @State private var labelText: String = ""
    @State private var labelColor: UIColor = .clear
    @State private var data: String? = nil
    @State private var isSecondViewPresented = false

    var body: some View {
        VStack(spacing: 20) {
            if #available(iOS 14.0, *) {
                Text("Integración de SwiftUI y UIKit")
                    .font(.largeTitle)
                    .padding()
                    .accessibilityLabel("Integración de SwiftUI y UIKit")
                    .accessibilityHint("Muestra la integración entre vistas de SwiftUI y UIKit.")
            } else {
                // Fallback on earlier versions
            }

            if #available(iOS 14.0, *) {
                UIKitLabelView(text: labelText, textColor: labelColor)
                    .frame(height: 50)
                    .accessibilityLabel(labelText.isEmpty ? "Sin datos" : labelText)
                    .accessibilityValue(labelText.isEmpty ? "No hay datos disponibles." : labelText)
            } else {
                // Fallback on earlier versions
            }

            if isLoading {
                if #available(iOS 14.0, *) {
                    ProgressView("Cargando...", value: progress, total: 100)
                        .progressViewStyle(LinearProgressViewStyle())
                        .padding()
                        .frame(height: 20)
                        .accessibilityLabel("Cargando progreso")
                        .accessibilityValue("\(Int(progress))% completo")
                        .accessibilityHint("Indica el progreso de la carga en porcentaje.")
                } else {
                    // Fallback on earlier versions
                }
            }

            if #available(iOS 14.0, *) {
                Button(action: startLoading) {
                    Text("Iniciar Carga")
                        .fontWeight(.bold)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                        .scaleEffect(1.1)
                }
                .buttonStyle(PlainButtonStyle())
                .accessibilityLabel("Iniciar Carga")
                .accessibilityHint("Toca para comenzar la carga simulada.")
            } else {
                // Fallback on earlier versions
            }

            if #available(iOS 14.0, *) {
                Button(action: { isSecondViewPresented = true }) {
                    Text("Ir a Segunda Vista")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                        .scaleEffect(1.1)
                }
                .buttonStyle(PlainButtonStyle())
                .accessibilityLabel("Ir a la segunda vista")
                .accessibilityHint("Toca para presentar la segunda vista.")
                .sheet(isPresented: $isSecondViewPresented) {
                    SecondViewControllerWrapper()
                }
            } else {
                // Fallback on earlier versions
            }
        }
        .padding()
        .onAppear {
            loadData()
        }
        .onDisappear {
            cleanupResources()
        }
    }

    private func startLoading() {
        isLoading = true
        DispatchQueue.global().async {
            for i in 0...100 {
                DispatchQueue.main.async {
                    self.progress = Double(i)
                }
                Thread.sleep(forTimeInterval: 0.05)
            }
            DispatchQueue.main.async {
                self.isLoading = false
                self.labelText = "Carga Completa"
                self.labelColor = .systemBlue
            }
        }
    }

    private func loadData() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            DispatchQueue.main.async {
                self.data = "Datos Cargados"
            }
        }
    }

    private func cleanupResources() {
        data = nil
    }
}


/// `UIKitLabelView` es una vista de SwiftUI que envuelve un `UILabel` de UIKit.
struct UIKitLabelView: UIViewRepresentable {
    var text: String
    var textColor: UIColor

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
        uiView.textColor = textColor
        print("UILabel actualizado: Texto: \(text), Color: \(textColor)")
    }
}

/// `ActivityIndicatorView` es una vista personalizada para mostrar un indicador de actividad en iOS 13.
struct ActivityIndicatorView: UIViewRepresentable {
    @Binding var isAnimating: Bool

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        return activityIndicator
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if isAnimating {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}

/// `SecondViewControllerWrapper` es una vista de SwiftUI que presenta `SecondViewController` utilizando un `UIViewControllerRepresentable`.
struct SecondViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SecondViewController {
        return SecondViewController()
    }

    func updateUIViewController(_ uiViewController: SecondViewController, context: Context) {
        // No se necesita actualizar el UIViewController aquí.
    }
}

#Preview {
    ContentView()
}
