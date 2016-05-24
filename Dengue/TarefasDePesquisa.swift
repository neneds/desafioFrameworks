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
    instrucao.title = "Pesquisa sobre depressāo"
    instrucao.text = "Após informar o seu nome, responda para cada questāo apenas uma alternativa"
    steps += [instrucao]
    
    
    
    ///
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    nameAnswerFormat.multipleLines = false
    let nameQuestionStepTitle = "Qual é o seu nome:?"
    let nameQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
    steps += [nameQuestionStep]
    
    
    
//    ///Pesquisa
//    let tituloDaQuestao = "Eu faço as coisas devagar"
//    let opcoes = [
//        ORKTextChoice(text: "Nunca", value: 0),
//        ORKTextChoice(text: "Raramente", value: 1),
//        ORKTextChoice(text: "Um Pouco", value: 2),
//        ORKTextChoice(text: "Moderadamente", value: 3),
//        ORKTextChoice(text: "Bastante", value: 4),
//        ORKTextChoice(text: "Bastante", value: 5)
//    ]
//    let formatoDerResposta: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: opcoes)
//    let perguntaProblemaDoUsuario = ORKQuestionStep(identifier: "perguntaProblemaDoUsuario", title: tituloDaQuestao, answer: formatoDerResposta)
//    steps += [perguntaProblemaDoUsuario]
    
    func createQuestions(question: String, index : Int)->ORKQuestionStep{
        
        let opcoes = [
            ORKTextChoice(text: "Nunca", value: 0),
            ORKTextChoice(text: "Raramente", value: 1),
            ORKTextChoice(text: "Um Pouco", value: 2),
            ORKTextChoice(text: "Moderadamente", value: 3),
            ORKTextChoice(text: "Bastante", value: 4),
            ORKTextChoice(text: "Bastante", value: 5)
        ]
        let formatoDerResposta: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: opcoes)
        let perguntaProblemaDoUsuario = ORKQuestionStep(identifier: "pergunta"+"\(index)", title: question, answer: formatoDerResposta)
        return perguntaProblemaDoUsuario
    }
    
    
    let perguntas : [String] = ["Eu faço as coisas devagar","Meu futuro parece desesperador","É difícil para mim, concentrar na leitura","O prazer e alegria tem estado fora da minha vida","Tenho dificuldade em tomar decisões","Já perdi o interesse em aspectos da vida, que costumava ser importante para mim", "Eu me sinto triste, desmotivado e infeliz", "Estou agitado e fico irritado", "Eu me sinto cansado","É preciso grande esforço para eu fazer coisas simples", "Sinto que sou uma má pessoa que merece ser punido", "Eu me sinto fracassado", "Eu me sinto sem energia, mais morto do que vivo","Meu sono está perturbado, tenho dormido pouco, insônia, sono excessivo ou sono com muitas interrupções","Perco tempo pensando em suicídio", "Eu me sinto preso ou aprisionado", "Sinto-me deprimido, mesmo quando as coisas boas acontecem para mim","Sem tentar dieta, perdi ou adquiri peso"]
    
    for (index,item) in perguntas.enumerate(){
        steps += [createQuestions(item, index: index)]
    }
    
    
    
    
    
    
//    ///
//    let colorQuestionStepTitle = "What is your favorite color?"
//    let colorTuples = [
//        (UIImage(named: "red")!, "Red"),
//        (UIImage(named: "orange")!, "Orange"),
//        (UIImage(named: "yellow")!, "Yellow"),
//        (UIImage(named: "green")!, "Green"),
//        (UIImage(named: "blue")!, "Blue"),
//        (UIImage(named: "purple")!, "Purple")
//    ]
//    let imageChoices : [ORKImageChoice] = colorTuples.map {
//        return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1)
//    }
//    let colorAnswerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithImageChoices(imageChoices)
//    let colorQuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: colorQuestionStepTitle, answer: colorAnswerFormat)
//    steps += [colorQuestionStep]
    
    
    ///
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Right. Off you go!"
    summaryStep.text = "That was easy!"
    steps += [summaryStep]
    
    return ORKOrderedTask(identifier: "TarefasDePesquisa", steps: steps)
}