# Arquitetura Técnica — ZenFlow AI

Este documento apresenta a arquitetura técnica resumida do projeto **ZenFlow AI**, um agente inteligente para atendimento, vendas e agendamento em estúdios de yoga.

---

## Visão Geral

O ZenFlow AI foi planejado como uma primeira camada inteligente de atendimento via WhatsApp.

A solução combina automação, banco de dados, CRM visual, pagamento digital e IA generativa para conduzir leads desde o primeiro contato até a conversão.

O projeto foi estruturado como uma versão de portfólio, utilizando placeholders, dados fictícios e fluxos demonstrativos para representar a lógica da solução sem expor credenciais reais.

---

## Stack Prevista

- **WhatsApp API** — canal principal de atendimento com o lead;
- **n8n** — orquestração dos fluxos e automações;
- **Supabase** — banco de dados e backend da solução;
- **OpenAI / LLM** — interpretação das mensagens e geração de respostas;
- **Trello** — CRM visual para acompanhamento do funil comercial;
- **Asaas** — geração de cobrança e reconhecimento de pagamento;
- **Webhook** — comunicação entre sistemas externos e o n8n.

---

## Fluxo Geral da Solução

```text
Lead envia mensagem no WhatsApp
↓
Webhook recebe a mensagem no n8n
↓
n8n normaliza os dados recebidos
↓
Supabase consulta ou cria o lead
↓
Trello cria ou atualiza o card do lead
↓
Agente IA qualifica o interesse
↓
Agente recomenda aula, plano ou modalidade
↓
Pedido é criado no Supabase
↓
Cobrança é gerada no Asaas
↓
Link de pagamento é enviado ao lead
↓
Webhook do Asaas confirma pagamento
↓
Supabase e Trello são atualizados
↓
Follow-up automático atua sobre leads pendentes
```

---

## Principais Componentes

### WhatsApp API

O WhatsApp representa o canal de entrada e saída das mensagens.

Na versão de portfólio, a integração é representada por chamadas HTTP com placeholders de configuração da Z-API ou serviço equivalente.

---

### n8n

O n8n é o centro de orquestração da solução.

Ele coordena:

- entrada de mensagens;
- normalização de dados;
- consulta e atualização no Supabase;
- criação e movimentação de cards no Trello;
- chamada ao agente de IA;
- geração lógica de cobrança;
- reconhecimento de pagamento;
- envio de follow-ups automáticos.

---

### Supabase

O Supabase funciona como banco de dados principal do projeto.

Ele armazena:

- leads;
- produtos e planos;
- pedidos;
- interações;
- agendamentos.

A modelagem está documentada no arquivo:

```text
database/schema.sql
```

---

### Agente IA

O agente de IA é responsável por interpretar a mensagem do lead, conduzir a conversa e apoiar a tomada de decisão dentro do fluxo.

Responsabilidades previstas:

- acolher o lead;
- entender o objetivo da pessoa;
- fazer perguntas de qualificação;
- recomendar uma aula, plano ou modalidade;
- responder dúvidas frequentes;
- identificar casos que exigem atendimento humano;
- evitar diagnósticos, promessas de cura ou orientações sensíveis.

---

### Trello

O Trello funciona como CRM visual simples.

Ele permite acompanhar os leads por etapa do funil, facilitando a visualização do status comercial e operacional.

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

### Asaas

O Asaas representa o componente de cobrança e confirmação de pagamento.

Na lógica proposta, ele pode ser usado para:

- criar cliente;
- gerar cobrança;
- disponibilizar link de pagamento;
- enviar evento de pagamento via webhook.

Eventos previstos:

- `PAYMENT_RECEIVED`;
- `PAYMENT_CONFIRMED`;
- `PAYMENT_OVERDUE`;
- `PAYMENT_DELETED`;
- `PAYMENT_REFUNDED`.

---

## Modelagem de Dados

### leads

Armazena os dados principais dos interessados.

Campos principais:

- nome;
- telefone;
- e-mail;
- objetivo;
- modalidade de interesse;
- horário preferido;
- status do lead;
- status de follow-up;
- necessidade de atendimento humano;
- ID do card no Trello.

---

### produtos_planos

Armazena os produtos e planos disponíveis.

Exemplos:

- Aula Experimental;
- Aula Avulsa;
- Plano Mensal 1x por semana;
- Plano Mensal 2x por semana;
- Plano Livre Mensal.

---

### pedidos

Registra pedidos e dados de pagamento.

Campos principais:

- lead relacionado;
- produto escolhido;
- valor;
- status do pedido;
- forma de pagamento;
- ID do cliente Asaas;
- ID do pagamento Asaas;
- link de pagamento;
- data de vencimento.

---

### interacoes

Registra o histórico básico das mensagens e eventos do atendimento.

Campos principais:

- lead relacionado;
- canal;
- direção da mensagem;
- conteúdo da mensagem;
- intenção detectada;
- indicação se o agente respondeu;
- indicação de necessidade de atendimento humano.

---

### agendamentos

Registra solicitações de aula experimental ou agendamento futuro.

Campos principais:

- lead relacionado;
- modalidade;
- data da aula;
- horário;
- status do agendamento;
- origem;
- observações.

---

## Regras de Atendimento Humano

O atendimento humano deve ser acionado quando o lead mencionar:

- dor intensa;
- lesão;
- cirurgia;
- gravidez;
- pós-parto;
- crise emocional;
- condição médica;
- reclamação;
- pedido direto para falar com uma pessoa.

Nesses casos, o agente deve evitar qualquer orientação sensível e encaminhar o lead para uma pessoa responsável do estúdio.

---

## Versão de Portfólio

Esta arquitetura foi documentada para fins de portfólio.

A versão publicada no GitHub não utiliza:

- credenciais reais;
- tokens reais;
- dados pessoais reais;
- webhooks ativos;
- contas reais de clientes;
- integrações produtivas validadas.

O objetivo é demonstrar a lógica, a arquitetura e a capacidade de estruturar uma solução com agentes de IA e automação no-code.

---

## Conclusão

A arquitetura do ZenFlow AI foi desenhada para ser simples, modular e replicável.

Embora o projeto tenha sido aplicado ao nicho de yoga, a estrutura pode ser adaptada para outros pequenos negócios que precisam automatizar atendimento, qualificação, cobrança e follow-up.
