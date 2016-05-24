//
//  ConsentTask.swift
//  Camelot
//
//  Created by Michel Lopes on 5/17/16.
//  Copyright © 2016 Michel Lopes. All rights reserved.
//

import Foundation
import ResearchKit
    
public var TarefasDeAutorizacao: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    //autorizacaoVisual
    let formularioDeAutorizacao = FormularioDeAutorizacao
    let autorizacaoVisual = ORKVisualConsentStep(identifier: "AutorizacaoVisual", document: formularioDeAutorizacao)
    steps += [autorizacaoVisual]
    
    //revisaoDeAutorizacao
    let assinatura = formularioDeAutorizacao.signatures!.first! as ORKConsentSignature
    let revisaoDeAutorizacao = ORKConsentReviewStep(identifier: "RevisaoDeAutorizacao", signature: assinatura, inDocument: formularioDeAutorizacao)
    revisaoDeAutorizacao.text = "Revisão de Autorização!"
    revisaoDeAutorizacao.reasonForConsent = "Autorização para entrar no estudo!"
    steps += [revisaoDeAutorizacao]
    
    return ORKOrderedTask(identifier: "TarefasDeAutorizacao", steps: steps)
}