# ZenFlow AI — Agente Inteligente para Estúdios de Yoga

Projeto de portfólio desenvolvido como parte da **Formação em Gestão de Agentes de IA da NoCode Startup**.

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

- **n8n** para automação e orquestração dos fluxos;
- **Supabase** como banco de dados e backend;
- **Asaas** para geração de cobranças e reconhecimento de pagamento;
- **Trello** como CRM visual simples para acompanhamento dos leads;
- **IA generativa / LLM** para interpretação de mensagens e respostas do agente;
- **WhatsApp API** como canal principal de atendimento;
- **Webhooks** para comunicação entre sistemas;
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
Trello é movido para "Pago / Agendado"
↓
Agente confirma pagamento e orienta próximo passo
↓
Follow-up automático é acionado quando necessário
```

---

## Estrutura do Repositório

```text
zenflow-ai-agente-yoga/
│
├── README.md
│
├── docs/
│   ├── planejamento-resumido.md
│   ├── arquitetura-tecnica.md
│   ├── workflow-n8n.md
│   └── seguranca-e-limitacoes.md
│
├── database/
│   └── schema.sql
│
└── n8n/
    └── ZenFlow AI — Portfolio.json
```

### Documentação

- [`docs/planejamento-resumido.md`](docs/planejamento-resumido.md): resumo das etapas de planejamento do projeto.
- [`docs/arquitetura-tecnica.md`](docs/arquitetura-tecnica.md): visão técnica da solução, ferramentas, banco de dados e fluxos.
- [`docs/workflow-n8n.md`](docs/workflow-n8n.md): explicação do workflow consolidado no n8n.
- [`docs/seguranca-e-limitacoes.md`](docs/seguranca-e-limitacoes.md): cuidados de segurança, privacidade e limitações da versão de portfólio.

### Arquivos Técnicos

- [`database/schema.sql`](database/schema.sql): estrutura das tabelas previstas no Supabase.
- [`n8n/ZenFlow AI — Portfolio.json`](n8n/ZenFlow%20AI%20%E2%80%94%20Portfolio.json): workflow consolidado para portfólio e validação visual da lógica.

---

## Workflow n8n

O projeto utiliza um workflow consolidado no n8n para representar, em uma única visão, os principais blocos de automação:

- atendimento e qualificação via WhatsApp;
- consulta e registro de leads no Supabase;
- organização do funil no Trello;
- geração lógica de cobrança via Asaas;
- reconhecimento de pagamento por webhook;
- follow-up automático para leads pendentes.

O arquivo `ZenFlow AI — Portfolio.json` foi criado para fins de **portfólio e validação visual da lógica**.

Para uma implantação real, recomenda-se separar os fluxos críticos em workflows independentes, configurar credenciais reais e testar cada integração de forma isolada.

---

## Modelagem de Dados

O projeto prevê as seguintes tabelas principais no Supabase:

- `leads`: dados dos interessados e status do funil;
- `produtos_planos`: aulas, planos e produtos disponíveis;
- `pedidos`: pedidos, valores e status de pagamento;
- `interacoes`: histórico básico de mensagens e eventos;
- `agendamentos`: solicitações e registros de aulas.

O script de criação está disponível em [`database/schema.sql`](database/schema.sql).

---

## Funil no Trello

O Trello foi previsto como CRM visual simples para acompanhar a jornada do lead.

Colunas sugeridas:

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

## Escopo do MVP

O MVP é focado no fluxo principal de atendimento, venda e acompanhamento:

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

Para fins de portfólio, a versão publicada é demonstrativa, com dados fictícios, placeholders e simulações técnicas, preservando a lógica de uma solução real sem expor credenciais ou gerar custos com plataformas externas.

---

## Segurança e Limitações

A versão publicada no GitHub não utiliza:

- tokens reais;
- credenciais reais;
- dados pessoais reais;
- webhooks ativos;
- contas reais de clientes;
- integrações produtivas validadas.

O agente também não deve fazer diagnóstico médico, prometer cura ou substituir professor, médico, terapeuta ou profissional de saúde.

Casos de dor, lesão, cirurgia, gravidez, crise emocional, condição médica, reclamação ou pedido direto de atendimento humano devem ser encaminhados para uma pessoa responsável pelo estúdio.

---

## Status do Projeto

Versão de portfólio estruturada.

Etapas concluídas:

- [x] Visão estratégica do projeto
- [x] Insights de mercado
- [x] Arquitetura técnica
- [x] Planejamento resumido
- [x] Modelagem SQL do Supabase
- [x] Workflow demonstrativo consolidado no n8n
- [x] Documentação do workflow
- [x] Documento de segurança e limitações
- [x] Organização inicial do repositório

Possíveis evoluções futuras:

- [ ] Separar workflows por responsabilidade para uso produtivo
- [ ] Testar integrações em ambiente sandbox
- [ ] Criar tela ou dashboard de acompanhamento
- [ ] Integrar calendário para agendamento real
- [ ] Criar versão adaptada para outros pequenos negócios

---

## Observação

Este projeto foi planejado como uma solução real para estúdios de yoga, mas sua primeira versão de portfólio é apresentada de forma segura, com dados fictícios e sem exposição de credenciais, tokens, webhooks ativos ou informações sensíveis.

O objetivo é demonstrar competências em planejamento de agentes de IA, automação com n8n, integração com APIs, modelagem de dados, pagamentos digitais, CRM operacional e melhoria contínua.
