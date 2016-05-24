//
//  ViewController.swift
//  Camelot
//
//  Created by Michel Lopes on 5/10/16.
//  Copyright © 2016 Michel Lopes. All rights reserved.
//

import UIKit
import ResearchKit


class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func microphoneTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: MicrophoneTask, taskRunUUID: nil)
        taskViewController.delegate = self
        taskViewController.outputDirectory = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] , isDirectory: true)
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func iniciarPesquisa(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: TarefasDePesquisa, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func iniciarAutorizacao(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: TarefasDeAutorizacao, taskRunUUID: nil)
        taskViewController.delegate = self
        presentViewController(taskViewController, animated: true, completion: nil)
    }
    
}


extension ViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason:ORKTaskViewControllerFinishReason, error: NSError?) {
        
        print()
        
        //Handle results with taskViewController.result
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

