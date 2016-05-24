//
//  SurveyTask.swift
//  Camelot
//
//  Created by Michel Lopes on 5/17/16.
//  Copyright © 2016 Michel Lopes. All rights reserved.
//

import ResearchKit

public var TarefasDePesquisa: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    
    ///Instruções
    let instrucao = ORKInstructionStep(identifier: "Instrucoes")
    instrucao.title = "Titulo da pesquisa"
    instrucao.text = "Instruções da pesquisa."
    steps += [instrucao]
    
    
    
    ///
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    nameAnswerFormat.multipleLines = false
    let nameQuestionStepTitle = "What is your name?"
    let nameQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
    steps += [nameQuestionStep]
    
    
    
    ///Pesquisa
    let tituloDaQuestao = "O que você está sentindo?"
    let opcoes = [
        ORKTextChoice(text: "Eu tenho dores de cabeça", value: 0),
        ORKTextChoice(text: "Eu tenho gripe", value: 1),
        ORKTextChoice(text: "Eu tenho febre", value: 2)
    ]
    let formatoDerResposta: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: opcoes)
    let perguntaProblemaDoUsuario = ORKQuestionStep(identifier: "perguntaProblemaDoUsuario", title: tituloDaQuestao, answer: formatoDerResposta)
    steps += [perguntaProblemaDoUsuario]
    
    
    
    ///
    let colorQuestionStepTitle = "What is your favorite color?"
    let colorTuples = [
        (UIImage(named: "red")!, "Red"),
        (UIImage(named: "orange")!, "Orange"),
        (UIImage(named: "yellow")!, "Yellow"),
        (UIImage(named: "green")!, "Green"),
        (UIImage(named: "blue")!, "Blue"),
        (UIImage(named: "purple")!, "Purple")
    ]
    let imageChoices : [ORKImageChoice] = colorTuples.map {
        return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1)
    }
    let colorAnswerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithImageChoices(imageChoices)
    let colorQuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: colorQuestionStepTitle, answer: colorAnswerFormat)
    steps += [colorQuestionStep]
    
    
    ///
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Right. Off you go!"
    summaryStep.text = "That was easy!"
    steps += [summaryStep]
    
    return ORKOrderedTask(identifier: "TarefasDePesquisa", steps: steps)
}