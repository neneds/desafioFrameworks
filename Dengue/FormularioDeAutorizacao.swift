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
    FormularioDeAutorizacao.title = "Formulário de Autorizaçāo para estudo sobre depressāo"
    
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
        sessaoDeAutorizacao.summary = "Se você deseja participar do estudo, leia com atençāo"
        sessaoDeAutorizacao.content = "Esse questionário de maneira alguma serve para definir ou substituir um diagnóstico feito por um profissional. Em caso de dúvidas sobre sua avaliação mental, por favor, consulte imediatamente um profissional da área de saúde mental – psiquiatras, psicólogos. Somente esses profissionais poderão diagnosticar e avaliar o melhor tratamento para seus transtornos, distúrbios, disfunções."
        return sessaoDeAutorizacao
    }
    
    FormularioDeAutorizacao.sections = sessoesDeAutorizacoes
    
    
    
    FormularioDeAutorizacao.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "AssinaturaDoFormularioDeAutorizacao"))
    
    return FormularioDeAutorizacao
}