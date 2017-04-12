//
//  ViewController.swift
//  Multimedia en IOS
//
//  Created by alumno on 11/04/17.
//  Copyright © 2017 william. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    var player:AVAudioPlayer?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnCambiarTouch(_ sender: UIButton) {
        
        let actionSheet = UIAlertController(title: "Seleccione una Opcion", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let actionCamara = UIAlertAction(title: "Camara", style: UIAlertActionStyle.default){(action) in self.usarCamara()}
        
        let actionGaleria = UIAlertAction(title: "Galeria de Fotos", style: UIAlertActionStyle.default){(action) in print("Galeria")}
        
        let actionCancelar = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel){(action) in }
        
        actionSheet.addAction(actionCamara)
        actionSheet.addAction(actionGaleria)
        actionSheet.addAction(actionCancelar)
        
        self.present(actionSheet, animated: true) {}
        
    }
    
    func usarCamara(){
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            imagePicker.sourceType = .camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.modalPresentationStyle = .fullScreen
            
            self.present(imagePicker, animated: true, completion: {})
        }
    
    }
    
    func usarGaleria(){
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: UIImagePickerControllerSourceType.photoLibrary)!
            self.present(imagePicker, animated: true, completion: {})
        }
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let imagen = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = imagen
        
        self.dismiss(animated: true) {}
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        self.dismiss(animated: true) {}
        
    }
    
    
    @IBAction func btnPlay(_ sender: UIButton) {
        
        let path = Bundle.main.path(forResource: "sonido.wav", ofType: nil)
        let url = URL(fileURLWithPath: path!)
        
        do{
            let sonido = try AVAudioPlayer(contentsOf: url)
            player = sonido
            
            if !(player?.isPlaying)! {
                player?.numberOfLoops = -1
                player?.play()
            }
        
        }
        catch{
            print("Excepcion!!!!")
        }
        
    }
    
    @IBAction func btnStop(_ sender: UIButton) {
        
        if player != nil{
            player?.stop()
            player = nil
        }
        
    }
    
    
    @IBAction func btnMostrarTouch(_ sender: UIButton) {
        
        let path = Bundle.main.path(forResource: "small.mp4", ofType: nil)
        let url = URL(fileURLWithPath: path!)
        let videoPlayer = AVPlayer(url: url)
        let playerViewControler = AVPlayerViewController()
        playerViewControler.player = videoPlayer
        playerViewControler.player?.play()
        
        self.present(playerViewControler, animated: true) {}
        
    }


}

