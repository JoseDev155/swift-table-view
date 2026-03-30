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
     
    // Diccionario: [Nombre de la fruta : Precio]
    let inventarioFrutas: [String: Double] = [
        "Manzana       ": 1.50,
        "Plátano       ": 0.80,
        "Uva       ": 2.50,
        "Fresa      ": 3.00,
        "Mango       ": 1.20
    ]
     
    // Los diccionarios no tienen orden, se crea un arreglo con sus llaves
    // para poder usarlas en las filas de la tabla (indexPath.row)
    lazy var nombresDeFrutas = Array(inventarioFrutas.keys)
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // 1. Decirle a la tabla que este ViewController le dará los datos
        // (Si ya se hizo visualmente en el Storyboard, esto es opcional pero refuerza)
        tableView.dataSource = self
        tableView.delegate = self
         
        // 2. Registrar una celda estándar (esto es vital para que no crashee)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "celdaFruta")
    }
 
    // MARK: - Métodos Obligatorios del Data Source
 
    // ¿Cuántas filas se necesitan? (El tamaño del arreglo)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventarioFrutas.count
    }
 
    // ¿Qué contenido tiene cada fila?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
    // 1. Intentamos obtener una celda con estilo "Value1" (Texto + Detalle)
        var cell = tableView.dequeueReusableCell(withIdentifier: "celdaFruta")
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "celdaFruta")
        }
        
        // 2. Obtenemos el nombre de la fruta usando el índice de la fila
        let nombreFruta = nombresDeFrutas[indexPath.row]
        
        // 3. Obtenemos el precio buscando esa fruta en el diccionario
        let precioFruta = inventarioFrutas[nombreFruta] ?? 0.0
        
        // 4. Configuramos la interfaz visual de la celda
        cell?.textLabel?.text = nombreFruta
        cell?.detailTextLabel?.text = String(format: "$%.2f", precioFruta)
        cell?.detailTextLabel?.textColor = .systemGreen // El precio se verá verde
        return cell!
    }
}
