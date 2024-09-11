import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        let contentView = ContentView()
        let hostingController = UIHostingController(rootView: contentView)
        window?.rootViewController = hostingController
        window?.makeKeyAndVisible()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Reinicia tareas pausadas, por ejemplo:
        print("La escena ha pasado a estado activo. Reiniciando tareas.")
    }


    func sceneWillResignActive(_ scene: UIScene) {
        // Pausa tareas, por ejemplo:
        print("La escena está a punto de pasar a estado inactivo. Pausando tareas.")
    }


    func sceneWillEnterForeground(_ scene: UIScene) {
        // Restaura estado
        // Ejemplo: actualizar la UI con datos nuevos
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Guarda datos y liberar recursos, por ejemplo:
        print("La escena ha pasado al fondo. Guardando datos y liberando recursos.")
    }

}
