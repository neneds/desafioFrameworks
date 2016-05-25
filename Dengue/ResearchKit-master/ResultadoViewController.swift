//
//  ResultadoViewController.swift
//  Dengue
//
//  Created by Luciano Almeida on 5/25/16.
//  Copyright © 2016 Michel Lopes. All rights reserved.
//

import UIKit

class ResultadoViewController: UIViewController {
    @IBOutlet weak var lblResultado: UILabel!
    @IBOutlet weak var descricaoResultadoTxt: UITextView!
    
    var valor :  Int = 0 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblResultado.text = "Seu resultado foi \(self.valor)"
        self.descricaoResultadoTxt.text = self.textForResult(self.valor)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textForResult(result: Int) -> String {
        var text = ""
        if result < 20 {
            text = "Você está bem e não apresenta sinais de depressão."
        }else if result >= 20 && result < 32 {
            text =  "Você apresenta um índice de depressão baixa."
        }else if result >= 32 && result < 44 {
            text =  "Você apresenta um índice de depressão média baixa."
        }else if result >= 45 && result < 56 {
            text =  "Você apresenta um índice de depressão média."
        }else if result >= 56 && result < 68 {
            text =  "Você apresenta um índice de depressão média alta."
        }else{
            text =  "Você apresenta um índice de depressão alta."
        }
        return "\(text)\n\n\nOs indíces indicadores são: \n\nEntre 20 e 31 : baixa\nEntre 32 e 43 : média baixa\nEntre 44 e 55 : média\nEntre 56 e 67 : média alta\nEntre 68 e 80 : alta\n\n\nSe o resultado obtido se situar nestes valores, considere a possibilidade de pedir ajuda, e consultar um profissional que o(a) possa ajudar."

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
