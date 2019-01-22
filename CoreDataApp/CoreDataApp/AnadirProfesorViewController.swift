//
//  AnadirProfesorViewController.swift
//  CoreDataApp
//
//  Created by Adrián Rodríguez Escudero on 06/01/2019.
//  Copyright © 2019 Adrián Rodríguez Escudero. All rights reserved.
//

import UIKit
import CoreData

class AnadirProfesorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet weak var nombreTxt: UITextField!
    @IBOutlet weak var apellidosTxt: UITextField!
    @IBOutlet weak var dniTxt: UITextField!
    
    
    @IBAction func guardar(_ sender: Any) {
        if(nombreTxt.hasText == false || apellidosTxt.hasText == false||dniTxt.hasText == false){
            mostrarAlerta(titulo: "ERROR", mensaje: "Hay al menos un campo vacío")
        }else{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Profesores", in: context)
            let profesor = NSManagedObject(entity: entity!, insertInto: context)
            
            profesor.setValue(nombreTxt.text, forKey: "nombre")
            profesor.setValue(apellidosTxt.text, forKey: "apellidos")
            profesor.setValue(dniTxt.text, forKey: "dni")
            do {
                try context.save()
                dismiss(animated: true, completion: nil)
                nombreTxt.text = ""
                apellidosTxt.text = ""
                dniTxt.text = ""
            } catch {
                mostrarAlerta(titulo: "ERROR", mensaje: "Error al registrar un profesor")
            }
        }
    }
    
    @IBAction func regresar(sender: AnyObject) {
        dismiss(animated: true, completion : nil)
    }
    
    func mostrarAlerta(titulo : String, mensaje : String){
        let ventana = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let accionOk = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        ventana.addAction(accionOk)
        self.present(ventana, animated: true, completion: nil)
        
    }
}
