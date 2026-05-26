# ZenFlow AI — Agente Inteligente para Estúdios de Yoga

Projeto de portfólio desenvolvido como parte da Formação em Gestão de Agentes de IA da NoCode Startup.

O **ZenFlow AI** é um agente de inteligência artificial projetado para apoiar estúdios de yoga no atendimento inicial, qualificação de leads, recomendação de aulas e planos, geração de cobrança, acompanhamento de pagamento e automação de follow-up.

A solução foi planejada como um **case autoral**, adaptando os conceitos da formação para um contexto real de pequenos negócios no segmento de yoga e bem-estar.

---

## Objetivo do Projeto

O objetivo do projeto é estruturar uma solução de IA aplicada a um problema real de pequenos estúdios de yoga: a dificuldade de responder rapidamente mensagens, organizar interessados, orientar novos alunos, acompanhar pagamentos e converter leads em alunos.

O agente atua como uma primeira camada inteligente de atendimento, conduzindo o interessado desde o primeiro contato até a geração de um link de pagamento e o acompanhamento do status da jornada.

---

## Problema Identificado

Pequenos estúdios de yoga geralmente dependem de atendimento manual por WhatsApp ou Instagram para responder dúvidas repetitivas sobre horários, valores, modalidades, planos e aulas experimentais.

Além disso, muitos interessados demonstram intenção de compra ou agendamento, mas acabam não concluindo o pagamento ou não retornam à conversa. Sem automação, esses leads podem se perder, dificultando o acompanhamento comercial e a organização do estúdio.

---

## Solução Proposta

O ZenFlow AI foi planejado para:

- atender interessados via WhatsApp;
- responder dúvidas frequentes;
- qualificar leads;
- identificar objetivos e nível de experiência;
- recomendar aulas, planos ou aula experimental;
- registrar informações no Supabase;
- criar ou atualizar cartões no Trello;
- gerar cobranças via Asaas;
- enviar link de pagamento ao lead;
- reconhecer pagamentos confirmados por webhook;
- atualizar status do lead e do pedido;
- executar follow-up automático;
- encaminhar casos sensíveis para atendimento humano.

---

## Stack Prevista

A arquitetura do projeto prevê o uso das seguintes ferramentas:

- **n8n** para automação dos fluxos;
- **Supabase** como banco de dados e backend;
- **Asaas** para geração de cobranças e reconhecimento de pagamento;
- **Trello** como CRM visual simples para acompanhamento dos leads;
- **IA generativa** para interpretação de mensagens e respostas do agente;
- **WhatsApp API** como canal principal de atendimento;
- **Google Calendar** como possível integração futura para agendamentos;
- **Dashboard futuro** para acompanhamento de leads, pagamentos e conversões.

---

## Arquitetura Geral

O fluxo principal do projeto segue a lógica:

```text
Mensagem recebida no WhatsApp
↓
n8n recebe e processa a entrada
↓
Lead é consultado ou criado no Supabase
↓
Cartão é criado ou atualizado no Trello
↓
Agente qualifica o interesse do lead
↓
Agente recomenda aula, plano ou modalidade
↓
Pedido é criado no Supabase
↓
Cobrança é gerada no Asaas
↓
Link de pagamento é enviado ao lead
↓
Trello é atualizado para "Aguardando Pagamento"
↓
Asaas envia webhook de confirmação
↓
Supabase atualiza pedido e lead
↓
Trello é movido para "Pago"
↓
Agente confirma pagamento e orienta próximo passo
↓
Follow-up automático é acionado quando necessário
```

---

## Escopo do MVP

O MVP será focado no fluxo principal de atendimento, venda e acompanhamento:

- recebimento de mensagem;
- identificação ou criação do lead;
- qualificação do interesse;
- recomendação de aula ou plano;
- criação de pedido;
- geração de link de pagamento;
- registro das informações;
- atualização do funil no Trello;
- reconhecimento de pagamento;
- follow-up automático;
- fallback humano.

Para fins de portfólio, a primeira versão prática poderá ser demonstrada com dados fictícios, placeholders e simulações técnicas, preservando a lógica de uma solução real sem expor credenciais ou gerar custos com plataformas externas.

---

## Funil no Trello

O Trello será usado como CRM visual para acompanhar a jornada do lead.

Sugestão de colunas:

```text
Novo Lead
↓
Qualificado
↓
Aguardando Pagamento
↓
Pago / Agendado
↓
Follow-up
↓
Perdido
↓
Atendimento Humano
```

---

## Status do Projeto

🚧 Em desenvolvimento.

Etapas já estruturadas:

- [x] Visão estratégica
- [x] Insights de mercado
- [x] Arquitetura técnica inicial
- [x] Plano de criação interativa
- [x] Lançamento e PDCA
- [x] Revisão de escopo com Supabase, Asaas, Trello, follow-up e reconhecimento de pagamento
- [ ] Atualização da documentação resumida para portfólio
- [ ] Modelagem SQL atualizada
- [ ] Workflow demonstrativo no n8n
- [ ] Adaptação do fluxo de follow-up
- [ ] Adaptação do fluxo de reconhecimento de pagamento
- [ ] Testes do MVP
- [ ] Publicação final do projeto

---

## Próximos Passos

- Atualizar a documentação resumida do planejamento;
- Revisar a arquitetura técnica com Asaas e Trello;
- Criar modelagem de dados atualizada;
- Criar script SQL das tabelas principais;
- Adaptar o template de follow-up ao contexto do estúdio de yoga;
- Adaptar o template de verificação de pagamento ao fluxo do projeto;
- Documentar os workflows do n8n;
- Criar versão demonstrativa do fluxo;
- Preparar apresentação do projeto para GitHub e LinkedIn.

---

## Observação

Este projeto foi planejado como uma solução real para estúdios de yoga, mas sua primeira versão de portfólio será apresentada de forma segura, com dados fictícios e sem exposição de credenciais, tokens, webhooks ativos ou informações sensíveis.

O objetivo é demonstrar competências em planejamento de agentes de IA, automação com n8n, integração com APIs, modelagem de dados, pagamentos digitais, CRM operacional e melhoria contínua.
