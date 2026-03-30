//
//  ViewController.swift
//  Example3
//
//  Created by Jose Ramos on 29/3/26.
//

// Un arreglo (Array) que contiene diccionarios (Dictionaries)
//let lenguajes = [
//    ["nombre": "Swift", "anio": "2014", "icono": "orange-circle"],
//    ["nombre": "Python", "anio": "1991", "icono": "blue-circle"],
//    ["nombre": "JavaScript", "anio": "1995", "icono": "yellow-circle"]
//]

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tabla: UITableView! // Conecta tu tabla desde el storyboard
    
    // Nuestro arreglo de diccionarios
    let lenguajes = [
        ["nombre": "Swift", "anio": "2014"],
        ["nombre": "Python", "anio": "1991"],
        ["nombre": "JavaScript", "anio": "1995"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // Le decimos a la tabla que este ViewController es su "jefe"
        tabla.dataSource = self
        tabla.delegate = self
    }
 
    // PASO 1: ¿Cuántas filas tendrá la tabla?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lenguajes.count // El tamaño del arreglo
    }
 
    // PASO 2: ¿Qué datos lleva cada celda?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        // Reutilizamos una celda con el Identificador que pusimos en el Storyboard
        let celda = tableView.dequeueReusableCell(withIdentifier: "MiCelda", for: indexPath)
         
        // Extraemos el diccionario correspondiente a la fila actual
        let lenguajeIndividual = lenguajes[indexPath.row]
         
        // Asignamos los textos (usando las llaves del diccionario)
        celda.textLabel?.text = lenguajeIndividual["nombre"]
        celda.detailTextLabel?.text = "Lanzado en: \(lenguajeIndividual["anio"] ?? "N/A")"
         
        return celda
    }
}
