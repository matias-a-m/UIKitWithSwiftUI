import UIKit

/// `UIKitViewController` es una subclase de `UIViewController` que actúa como una vista secundaria.
/// Contiene un botón que permite al usuario regresar a la pantalla anterior, manejando también
/// eventos del ciclo de vida como la aparición y desaparición de la vista.
class UIKitViewController: UIViewController {
    
    /// Método llamado cuando la vista ha sido cargada en memoria.
    /// Aquí se configura el fondo de la vista y se llama a `setupButton()` para configurar el botón.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Establece el color de fondo de la vista.
        view.backgroundColor = .white
        // Configura el botón en la vista.
        setupButton()
        print("SecondViewController: La vista se ha cargado correctamente.")
    }
    
    /// Método llamado justo antes de que la vista aparezca en la pantalla.
    /// Se utiliza para actualizar la UI o realizar acciones justo antes de que la vista sea visible.
    ///
    /// - Parameter animated: Un valor booleano que indica si la aparición de la vista es animada.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController: La vista está a punto de aparecer en la pantalla.")
    }
    
    /// Método llamado cuando la vista ha aparecido completamente en la pantalla.
    /// Ideal para comenzar animaciones o tareas que requieren que la vista esté completamente visible.
    ///
    /// - Parameter animated: Un valor booleano que indica si la aparición de la vista es animada.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondViewController: La vista ha aparecido completamente en la pantalla.")
    }
    
    /// Método llamado justo antes de que la vista desaparezca de la pantalla.
    /// Se puede utilizar para cancelar tareas, detener animaciones, o guardar estado antes de que la vista se oculte.
    ///
    /// - Parameter animated: Un valor booleano que indica si la desaparición de la vista es animada.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondViewController: La vista está a punto de desaparecer de la pantalla.")
    }
    
    /// Método llamado cuando la vista ha desaparecido completamente de la pantalla.
    /// Aquí es un buen lugar para liberar recursos asociados con la vista o finalizar tareas en segundo plano.
    ///
    /// - Parameter animated: Un valor booleano que indica si la desaparición de la vista fue animada.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SecondViewController: La vista ha desaparecido de la pantalla.")
    }
    
    /// Configura el botón "Volver" en el centro de la pantalla.
    /// El botón invoca la función `didTapBackButton` cuando se toca.
    private func setupButton() {
        // Inicializa un botón del tipo `.system` (estilo predeterminado).
        let button = UIButton(type: .system)
        button.setTitle("Volver", for: .normal)
        // Asigna la acción que se ejecutará cuando el botón sea tocado.
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        
        // Desactiva las restricciones automáticas para configurarlas manualmente.
        button.translatesAutoresizingMaskIntoConstraints = false
        // Añade el botón a la vista principal.
        view.addSubview(button)
        
        // Configuración de las restricciones para centrar el botón en la vista.
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Configuración de accesibilidad del botón
        button.isAccessibilityElement = true
        button.accessibilityLabel = "Volver a la pantalla anterior" // Descripción para usuarios con VoiceOver.
        button.accessibilityHint = "Toca para regresar a la pantalla anterior" // Indicación de la acción del botón.
        button.accessibilityTraits = .button // Define el tipo de elemento como un botón para accesibilidad.
    }
    
    /// Método llamado cuando el botón "Volver" es tocado.
    /// Este método cierra la vista actual de manera animada y regresa a la vista anterior.
    @objc private func didTapBackButton() {
        // Descartar la vista actual y volver a la vista anterior.
        dismiss(animated: true, completion: nil)
        print("SecondViewController: Se ha tocado el botón 'Volver'.")
    }
}

