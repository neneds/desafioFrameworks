//
//  ViewController.swift
//  Camelot
//
//  Created by Michel Lopes on 5/10/16.
//  Copyright © 2016 Michel Lopes. All rights reserved.
//

import UIKit
import ResearchKit
import AVFoundation


class ViewController: UIViewController {

    var plim: AVAudioPlayer!
    
    var testResult : Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
//    @IBAction func microphoneTapped(sender : AnyObject) {
//        let taskViewController = ORKTaskViewController(task: MicrophoneTask, taskRunUUID: nil)
//        taskViewController.delegate = self
//        taskViewController.outputDirectory = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] , isDirectory: true)
//        presentViewController(taskViewController, animated: true, completion: nil)
//    }
    
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
        //Handle results with taskViewController.result
        if reason == .Completed {
            
            if let unwrappedTask = taskViewController.task{
                if unwrappedTask.identifier == "TarefasDePesquisa"{
                    self.testResult = 0
                    for step in TarefasDePesquisa.steps {
                        if let stepResult = taskViewController.result.stepResultForStepIdentifier(step.identifier){
                            if let results = stepResult.results, let choiceResult = results.first as? ORKChoiceQuestionResult {
                                if let answer = choiceResult.choiceAnswers?.first as? NSNumber {
                                    self.testResult += TarefasDePesquisaUtils.valorPorPeso(step.identifier, responseValue: answer.integerValue)
                                }
                                
                            }
                            
                        }
                    }
                    taskViewController.dismissViewControllerAnimated(true) {
                        self.showCaulculatedResult(result: self.testResult)
                    }
                    return
                }
            }
        }
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, shouldPresentStep step: ORKStep) -> Bool {
        
        if let path = NSBundle.mainBundle().pathForResource("solemn.mp3", ofType:nil){
            let url = NSURL(fileURLWithPath: path)
            
            do {
                let sound = try AVAudioPlayer(contentsOfURL: url)
                plim = sound
                sound.play()
            } catch {
                // couldn't load file :(
            }
        }
        
        return true
    }
    
    func showCaulculatedResult(result result: Int) {
        print("result = \(result)")
        self.performSegueWithIdentifier("to_resultado", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let resultadoVc = segue.destinationViewController as? ResultadoViewController {
            resultadoVc.valor = self.testResult
        }
    }
}

