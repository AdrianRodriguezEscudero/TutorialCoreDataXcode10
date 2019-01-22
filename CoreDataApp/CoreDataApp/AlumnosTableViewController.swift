//
//  AlumnosTableViewController.swift
//  CoreDataApp
//
//  Created by Adrián Rodríguez Escudero on 06/01/2019.
//  Copyright © 2019 Adrián Rodríguez Escudero. All rights reserved.
//

import UIKit
import CoreData

class AlumnosTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    @IBAction func regresar(sender: AnyObject) {
        dismiss(animated: true, completion : nil)
    }
    var datos = [NSManagedObject]()
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            //Método que elimine de la base de datos el elemento.
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            managedContext.delete(datos[indexPath.row] as NSManagedObject)
            datos.remove(at: indexPath.row)
            do {
                try managedContext.save()
            } catch _ {
            }
            tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datos.count
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celda")as! AlumnosTableViewCell
        //Creamos un objeto task que recuperamos del array tasks
        let asignatura = datos[indexPath.row]
        //Con KVC obtenemos el contenido del atributo "name" de la task y lo añadimos a nuestra Cell
        cell.nombreTxt.text = asignatura.value(forKey: "nombre") as? String
        cell.apellidosTxt.text = asignatura.value(forKey: "apellidos") as? String
        cell.dniTxt.text = asignatura.value(forKey: "dni") as? String
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // 2
        //let fetchRequest : NSFetchRequest<Asignaturas> = Asignaturas.fetchRequest()
        let fetchRequest : NSFetchRequest<Alumnos> = Alumnos.fetchRequest()
        // 3
        do {
            let results = try managedContext.fetch(fetchRequest)
            datos = results as [NSManagedObject]
        } catch let error as NSError {
            print("No ha sido posible cargar \(error), \(error.userInfo)")
        }
        // 4
        tableView.reloadData()
    }
    
}
