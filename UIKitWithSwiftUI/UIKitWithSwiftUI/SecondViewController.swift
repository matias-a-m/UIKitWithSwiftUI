import UIKit

/// `SecondViewController` es una vista de controlador que incluye un botón para regresar a la pantalla anterior.
class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButton()
        print("SecondViewController: La vista se ha cargado correctamente.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondViewController: La vista está a punto de aparecer en la pantalla.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondViewController: La vista ha aparecido completamente en la pantalla.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondViewController: La vista está a punto de desaparecer de la pantalla.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SecondViewController: La vista ha desaparecido de la pantalla.")
    }
    
    private func setupButton() {
        let button = UIButton(type: .system)
        button.setTitle("Volver", for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Configuración de accesibilidad
        button.isAccessibilityElement = true
        button.accessibilityLabel = "Volver a la pantalla anterior" // Descripción del botón.
        button.accessibilityHint = "Toca para regresar a la pantalla anterior" // Indicación de la acción del botón.
        button.accessibilityTraits = .button // Define el tipo de elemento como botón.
    }
    
    @objc private func didTapBackButton() {
        dismiss(animated: true, completion: nil)
        print("SecondViewController: Se ha tocado el botón 'Volver'.")
    }
}
