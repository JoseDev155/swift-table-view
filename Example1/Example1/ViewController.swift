//
//  ViewController.swift
//  Example1
//
//  Created by Jose Ramos on 29/3/26.
//

import UIKit
 
class ViewController: UIViewController, UITableViewDataSource,
UITableViewDelegate {
 
    // El outlet que conectaste arrastrando desde el Storyboard
    @IBOutlet weak var tableView: UITableView!
     
    // Nuestro Modelo de Datos: Un arreglo de strings
    let misFrutas = ["Manzana       ", "Plátano       ", "Uva       ", "Fresa      ", "Mango       "]
 
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // 1. Decirle a la tabla que este ViewController le dará los datos
        // (Si ya se hizo visualmente en el Storyboard, esto es opcional pero refuerza)
        tableView.dataSource = self
        tableView.delegate = self
         
        // 2. Registrar una celda estándar (esto es vital para que no crashee)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "miCelda")
    }
 
    // MARK: - Métodos Obligatorios del Data Source
 
    // ¿Cuántas filas se necesitan? (El tamaño del arreglo)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
Int {
        return misFrutas.count
    }
 
    // ¿Qué contenido tiene cada fila?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
UITableViewCell {
         
        // Reutilizamos una celda con el identificador que registramos arriba
        let cell = tableView.dequeueReusableCell(withIdentifier: "miCelda", for:
indexPath)
         
        // Asignamos el texto del arreglo según la posición de la fila (row)
        cell.textLabel?.text = misFrutas[indexPath.row]
         
        return cell
    }
}
