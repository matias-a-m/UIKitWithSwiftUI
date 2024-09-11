import UIKit
import SwiftUI

/// `SceneDelegate` gestiona el ciclo de vida de una escena en una aplicación iOS.
/// Este delegado es responsable de inicializar la ventana principal con una vista SwiftUI
/// y manejar los cambios de estado de la escena, como cuando entra en primer plano o fondo.
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    /// La ventana principal de la aplicación.
    var window: UIWindow?

    /// Método llamado cuando la escena está a punto de conectarse a la aplicación.
    /// Se utiliza para configurar la jerarquía de vistas iniciales, en este caso, configurando `ContentView`
    /// como la vista raíz dentro de un `UIHostingController` que encapsula una vista de SwiftUI en UIKit.
    ///
    /// - Parameters:
    ///   - scene: La escena que se está conectando.
    ///   - session: La sesión asociada a esta escena.
    ///   - connectionOptions: Opciones de conexión que incluyen información sobre por qué se creó la escena.
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        // Asegura que la escena pasada es de tipo UIWindowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Configura la ventana principal utilizando UIWindowScene
        window = UIWindow(windowScene: windowScene)
        
        // Crea la vista principal utilizando SwiftUI
        let contentView = ContentView()
        
        // Encapsula la vista SwiftUI dentro de un UIHostingController
        let hostingController = UIHostingController(rootView: contentView)
        
        // Configura el UIHostingController como el rootViewController de la ventana
        window?.rootViewController = hostingController
        
        // Hace visible la ventana en pantalla
        window?.makeKeyAndVisible()
    }

    /// Método llamado cuando la escena pasa a estado activo.
    /// Aquí se pueden reiniciar tareas pausadas o no iniciadas cuando la escena estaba inactiva.
    ///
    /// - Parameter scene: La escena que ha pasado a estado activo.
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Reinicia tareas o procesos que fueron pausados cuando la escena estaba inactiva.
        print("La escena ha pasado a estado activo. Reiniciando tareas.")
    }

    /// Método llamado cuando la escena pasará a estado inactivo.
    /// Aquí se deben pausar las tareas que no deberían ejecutarse mientras la escena esté inactiva.
    ///
    /// - Parameter scene: La escena que está a punto de pasar a estado inactivo.
    func sceneWillResignActive(_ scene: UIScene) {
        // Pausa tareas que no deben ejecutarse cuando la aplicación está en segundo plano.
        print("La escena está a punto de pasar a estado inactivo. Pausando tareas.")
    }

    /// Método llamado cuando la escena está a punto de entrar en primer plano.
    /// Se utiliza para restaurar el estado o actualizar la UI con datos nuevos.
    ///
    /// - Parameter scene: La escena que está entrando en primer plano.
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Restaurar el estado de la aplicación o actualizar la interfaz de usuario
    }

    /// Método llamado cuando la escena entra en segundo plano.
    /// Se debe utilizar para liberar recursos, guardar datos y manejar otras operaciones que se deben
    /// realizar cuando la aplicación ya no está activa.
    ///
    /// - Parameter scene: La escena que ha entrado en segundo plano.
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Guardar el estado de la aplicación y liberar recursos
        print("La escena ha pasado al fondo. Guardando datos y liberando recursos.")
    }

}

