# ZenFlow AI — Agente Inteligente para Estúdios de Yoga

Projeto de portfólio desenvolvido como parte da Formação em Gestão de Agentes de IA da NoCode Startup.

O **ZenFlow AI** é um agente de inteligência artificial projetado para apoiar estúdios de yoga no atendimento inicial de alunos e interessados, com foco em qualificação de leads, recomendação de modalidades e automação de agendamentos de aulas experimentais.

## Objetivo do Projeto

O objetivo do projeto é estruturar uma solução de IA aplicada a um problema real de pequenos estúdios de yoga: a dificuldade de responder rapidamente mensagens, organizar interessados, orientar novos alunos e acompanhar solicitações de aula experimental.

A proposta é criar um agente capaz de atuar como primeira camada de atendimento, mantendo uma comunicação clara, acolhedora e segura.

## Problema Identificado

Pequenos estúdios de yoga geralmente dependem de atendimento manual por WhatsApp ou Instagram para responder dúvidas repetitivas sobre horários, valores, modalidades, planos e aulas experimentais.

Esse processo pode gerar demora nas respostas, perda de interessados e dificuldade para organizar informações importantes sobre cada lead.

## Solução Proposta

O ZenFlow AI foi planejado para:

- atender interessados via WhatsApp;
- responder dúvidas frequentes;
- qualificar leads;
- identificar objetivos e nível de experiência;
- recomendar modalidades de aula;
- apoiar o agendamento de aula experimental;
- registrar informações em banco de dados;
- encaminhar casos sensíveis para atendimento humano.

## Stack Prevista

A arquitetura do projeto prevê o uso das seguintes ferramentas:

- **n8n** para automação dos fluxos;
- **Supabase** como banco de dados;
- **IA generativa** para interpretação e respostas do agente;
- **WhatsApp API** como canal principal de atendimento;
- **Google Calendar** para apoio ao agendamento;
- **Dashboard futuro** para acompanhamento de leads e métricas.

## Escopo do MVP

O MVP será focado no fluxo principal:

```text
Mensagem recebida
↓
Identificação do lead
↓
Qualificação do interesse
↓
Recomendação de modalidade
↓
Agendamento de aula experimental
↓
Registro das informações
↓
Fallback humano quando necessário
```
Para fins de portfólio, a primeira versão prática poderá ser demonstrada com dados fictícios, placeholders e simulações técnicas, preservando a lógica de uma solução real sem expor credenciais ou gerar custos com plataformas externas.

Status do Projeto

Em desenvolvimento.

Etapas já estruturadas:

Visão estratégica
Insights de mercado
Arquitetura técnica
Plano de criação interativa
Lançamento e PDCA
Documentação resumida para portfólio
Modelagem SQL
Workflow demonstrativo no n8n
Testes do MVP
Publicação final do projeto
 
Próximos Passos
Criar documentação resumida do planejamento;
Adicionar modelagem de dados;
Criar script SQL das tabelas principais;
Documentar os workflows do n8n;
Criar versão demonstrativa do fluxo;

Observação

Este projeto foi planejado como uma solução real para estúdios de yoga, mas sua primeira versão de portfólio será apresentada de forma segura, com dados fictícios e sem exposição de credenciais, tokens ou informações sensíveis.
