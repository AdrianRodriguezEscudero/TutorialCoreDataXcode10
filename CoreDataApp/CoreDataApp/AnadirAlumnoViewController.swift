//
//  AnadirAlumno.swift
//  CoreDataApp
//
//  Created by Adrián Rodríguez Escudero on 06/01/2019.
//  Copyright © 2019 Adrián Rodríguez Escudero. All rights reserved.
//

import UIKit
import CoreData
class AnadirAlumnoViewController: UIViewController {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
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
            let entity = NSEntityDescription.entity(forEntityName: "Alumnos", in: context)
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
                mostrarAlerta(titulo: "ERROR", mensaje: "Error al registrar un alumno")
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
