import UIKit

/// `AppDelegate` es el punto de entrada principal de la aplicación.
/// Gestiona la configuración inicial y el ciclo de vida de la aplicación,
/// delegando la gestión de las ventanas y escenas al `SceneDelegate`.
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    /// Este método es llamado cuando la aplicación ha terminado de lanzarse.
    /// Se puede usar para cualquier configuración inicial o lógica que deba ejecutarse al iniciar la app.
    ///
    /// - Parameters:
    ///   - application: La instancia de `UIApplication` que representa la aplicación.
    ///   - launchOptions: Un diccionario con las opciones de lanzamiento que puede incluir información sobre la razón por la que la aplicación fue lanzada (por ejemplo, por una notificación o un enlace).
    ///
    /// - Returns: Un booleano que indica si la aplicación completó exitosamente su proceso de lanzamiento.
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Configuración inicial de la aplicación si es necesario.
        // Este es un buen lugar para inicializar servicios, configurar analíticas o realizar configuraciones globales.
        return true
    }
}

