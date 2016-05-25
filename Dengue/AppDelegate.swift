//
//  AppDelegate.swift
//  Camelot
//
//  Created by Michel Lopes on 5/10/16.
//  Copyright © 2016 Michel Lopes. All rights reserved.
//

import UIKit

import CoreSpotlight
import MobileCoreServices
import ResearchKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
      
            addToSpotlight()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    func addToSpotlight(){
        
        for step in TarefasDePesquisa.steps{
            if let qStep = step as? ORKQuestionStep{
                if(qStep.questionType == .SingleChoice){
                    let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeImage as String)
                    attributeSet.title = "\(qStep.title!)?"
                    attributeSet.contentDescription =  "Responda as perguntas e descubra se seu nível de depressão é preocupante."
                    let item = CSSearchableItem(uniqueIdentifier: "br.depreapp.spotlight.questions.\(qStep.identifier)", domainIdentifier: "br.depreapp", attributeSet: attributeSet)
                    CSSearchableIndex.defaultSearchableIndex().indexSearchableItems([item]) {
                        (error) in
                    }
                }
            }
            

            
        }
        
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeImage as String)
        attributeSet.title = "Teste de Depressão"
        attributeSet.contentDescription = "Responda as perguntas e descubra se seu nível de depressão é preocupante."
        let item = CSSearchableItem(uniqueIdentifier: "br.depreapp.spotlight.depressao", domainIdentifier: "br.depreapp", attributeSet: attributeSet)
        CSSearchableIndex.defaultSearchableIndex().indexSearchableItems([item]) {
            (error) in
        }
    }

}

