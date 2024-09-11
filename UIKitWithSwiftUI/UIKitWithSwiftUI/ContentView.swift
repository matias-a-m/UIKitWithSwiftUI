import SwiftUI
import UIKit

/// `ContentView` es la vista principal de la aplicación, que combina elementos de SwiftUI y UIKit.
/// Esta vista muestra un título, un UILabel de UIKit, un ProgressView para mostrar el progreso de una carga simulada,
/// y botones para iniciar la carga y navegar a una segunda vista. Se utilizan accesibilidad y compatibilidad con versiones anteriores de iOS.
struct ContentView: View {
    /// Estado que indica si la carga está en progreso.
    @State private var isLoading = false
    /// Estado que almacena el progreso de la carga (0 a 100).
    @State private var progress: Double = 0.0
    /// Texto a mostrar en la etiqueta de UIKit.
    @State private var labelText: String = ""
    /// Color del texto de la etiqueta de UIKit.
    @State private var labelColor: UIColor = .clear
    /// Cadena que representa los datos cargados.
    @State private var data: String? = nil
    /// Estado que controla la presentación de la segunda vista.
    @State private var isSecondViewPresented = false

    var body: some View {
        VStack(spacing: 20) {
            // Título principal de la vista
            if #available(iOS 14.0, *) {
                Text("Integración de SwiftUI y UIKit")
                    .font(.largeTitle)
                    .padding()
                    .accessibilityLabel("Integración de SwiftUI y UIKit")
                    .accessibilityHint("Muestra la integración entre vistas de SwiftUI y UIKit.")
            } else {
                // Soporte para versiones anteriores de iOS
            }

            // UILabel de UIKit representado en SwiftUI mediante UIKitLabelView
            if #available(iOS 14.0, *) {
                UIKitLabelView(text: labelText, textColor: labelColor)
                    .frame(height: 50)
                    .accessibilityLabel(labelText.isEmpty ? "Sin datos" : labelText)
                    .accessibilityValue(labelText.isEmpty ? "No hay datos disponibles." : labelText)
            } else {
                // Soporte para versiones anteriores de iOS
            }

            // Vista de progreso que se muestra mientras isLoading es verdadero
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
                    // Soporte para versiones anteriores de iOS
                }
            }

            // Botón para iniciar la carga simulada
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
                // Soporte para versiones anteriores de iOS
            }

            // Botón para ir a la segunda vista
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
                // Soporte para versiones anteriores de iOS
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

    /// Método que simula una carga asincrónica actualizando el progreso en una `ProgressView`.
    private func startLoading() {
        isLoading = true
        DispatchQueue.global().async {
            for i in 0...100 {
                DispatchQueue.main.async {
                    self.progress = Double(i)
                }
                Thread.sleep(forTimeInterval: 0.05) // Simulación de tiempo de carga
            }
            DispatchQueue.main.async {
                self.isLoading = false
                self.labelText = "Carga Completa"
                self.labelColor = .systemBlue
            }
        }
    }

    /// Método que simula la carga de datos asincrónicos y actualiza el estado de `data`.
    private func loadData() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            DispatchQueue.main.async {
                self.data = "Datos Cargados"
            }
        }
    }

    /// Método que limpia los recursos cuando la vista desaparece.
    private func cleanupResources() {
        data = nil
    }
}

/// `UIKitLabelView` es una vista de SwiftUI que envuelve un `UILabel` de UIKit.
/// Permite usar componentes de UIKit dentro de un entorno de SwiftUI.
/// - Parameters:
///   - text: El texto que se muestra en el `UILabel`.
///   - textColor: El color del texto del `UILabel`.
struct UIKitLabelView: UIViewRepresentable {
    var text: String
    var textColor: UIColor

    /// Crea el `UILabel` cuando la vista de SwiftUI es inicializada.
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }

    /// Actualiza el `UILabel` cuando el estado de la vista de SwiftUI cambia.
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
        uiView.textColor = textColor
        print("UILabel actualizado: Texto: \(text), Color: \(textColor)")
    }
}

/// `ActivityIndicatorView` es una vista personalizada para mostrar un indicador de actividad en iOS 13.
/// Es útil para aplicaciones que necesitan compatibilidad con versiones anteriores de iOS.
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

/// `SecondViewControllerWrapper` es una vista de SwiftUI que presenta `SecondViewController`.
/// Utiliza `UIViewControllerRepresentable` para integrar controladores de vistas de UIKit en SwiftUI.
struct SecondViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIKitViewController {
        return UIKitViewController()
    }

    func updateUIViewController(_ uiViewController: UIKitViewController, context: Context) {
        // No se necesita actualizar el UIViewController aquí.
    }
}

#Preview {
    ContentView()
}
