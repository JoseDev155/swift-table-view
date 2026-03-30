//
//  ViewController.swift
//  Example2
//
//  Created by Jose Ramos on 29/3/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

let secciones = ["Familia", "Trabajo"]
let datos: [String: [String]] = [
    "Familia": ["Mamá", "Papá", "Hermano"],
    "Trabajo": ["Jefe", "Colega A", "Colega B"]
]

extension ViewController: UITableViewDataSource {
    
    // 1. ¿Cuántas secciones hay?
    func numberOfSections(in tableView: UITableView) -> Int {
        return secciones.count
    }
    
    // 2. Título de cada sección
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return secciones[section]
    }
    
    // 3. ¿Cuántas filas hay en cada sección?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let categoria = secciones[section]
        return datos[categoria]?.count ?? 0
    }
     
    // 4. ¿Qué contenido tiene la celda?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
         
        let categoria = secciones[indexPath.section] // Obtenemos la llave del diccionario
        let nombres = datos[categoria]               // Obtenemos el arreglo de nombres
        let nombre = nombres?[indexPath.row]         // Obtenemos el nombre específico
         
        cell.textLabel?.text = nombre
        return cell
    }
}
