//
//  ConsentDocument.swift
//  Camelot
//
//  Created by Michel Lopes on 5/17/16.
//  Copyright © 2016 Michel Lopes. All rights reserved.
//

import ResearchKit

public var FormularioDeAutorizacao: ORKConsentDocument {
    
    let FormularioDeAutorizacao = ORKConsentDocument()
    FormularioDeAutorizacao.title = "Exemplo de Autorização"
    
    let tiposDeSessoesDeAutorizacao: [ORKConsentSectionType] = [
        .Overview,
        .DataGathering,
        .Privacy,
        .DataUse,
        .TimeCommitment,
        .StudySurvey,
        .StudyTasks,
        .Withdrawing
    ]
    
    let sessoesDeAutorizacoes: [ORKConsentSection] = tiposDeSessoesDeAutorizacao.map {
        tipoDeSessao in
        
        let sessaoDeAutorizacao = ORKConsentSection(type: tipoDeSessao)
        sessaoDeAutorizacao.summary = "Se você deseja completar esse estudo..."
        sessaoDeAutorizacao.content = "Neste estudo voce vai responder algumas perguntas para nos ajudar no tratamento da doença."
        return sessaoDeAutorizacao
    }
    
    FormularioDeAutorizacao.sections = sessoesDeAutorizacoes
    
    
    
    FormularioDeAutorizacao.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "AssinaturaDoFormularioDeAutorizacao"))
    
    return FormularioDeAutorizacao
}