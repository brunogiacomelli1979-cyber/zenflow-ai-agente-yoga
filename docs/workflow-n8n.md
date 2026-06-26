# Workflow n8n — ZenFlow AI

Este documento apresenta a lógica do workflow consolidado do projeto **ZenFlow AI**, criado para fins de portfólio, validação visual da arquitetura e demonstração da jornada principal da solução.

---

## Objetivo

O arquivo `ZenFlow AI — Portfolio.json` reúne, em uma única visão, os principais blocos de automação do projeto:

- atendimento, qualificação e venda via WhatsApp;
- organização do lead no Supabase e Trello;
- geração lógica de pedido e pagamento;
- reconhecimento de pagamento via webhook;
- follow-up automático para leads pendentes.

---

## Importante

Esta versão foi criada para fins de portfólio.

Ela demonstra a lógica da solução, mas não utiliza credenciais reais, contas reais, webhooks ativos ou dados pessoais reais.

Para implantação real, seria necessário:

- configurar credenciais reais;
- substituir placeholders;
- validar APIs;
- testar webhooks;
- revisar permissões;
- separar fluxos críticos em workflows independentes.

---

## Visão Geral do Fluxo

```text
Lead envia mensagem no WhatsApp
↓
n8n recebe a mensagem via webhook
↓
Dados são normalizados
↓
Lead é consultado ou criado no Supabase
↓
Card é criado ou atualizado no Trello
↓
Agente IA conduz o atendimento
↓
Lead é qualificado
↓
Agente recomenda aula, plano ou modalidade
↓
Pedido e cobrança podem ser gerados
↓
Resposta é enviada ao lead pelo WhatsApp
```

---

## Bloco 1 — Atendimento, Qualificação e Venda

O primeiro bloco representa a entrada do lead pelo WhatsApp e a condução do atendimento pelo agente de IA.

Principais etapas:

1. Receber a mensagem via webhook.
2. Normalizar os dados principais do contato.
3. Consultar o lead no Supabase pelo telefone.
4. Criar o lead, caso ainda não exista.
5. Atualizar a última interação, caso o lead já exista.
6. Criar ou atualizar um card no Trello.
7. Acionar o agente IA para qualificar o interesse.
8. Recomendar aula, modalidade ou plano.
9. Enviar resposta pelo WhatsApp.

Campos normalizados:

- telefone;
- nome;
- mensagem;
- canal;
- timestamp.

---

## Bloco 2 — Agente IA

O agente foi planejado para atuar como uma primeira camada de atendimento inteligente.

Responsabilidades principais:

- acolher o lead;
- entender o interesse;
- fazer perguntas de qualificação;
- recomendar aula, modalidade ou plano;
- orientar sobre horários e valores;
- identificar casos sensíveis;
- encaminhar para atendimento humano quando necessário.

Regras importantes:

- falar em português do Brasil;
- manter tom acolhedor e profissional;
- fazer uma pergunta por vez;
- não inventar valores, horários ou regras;
- não fazer diagnóstico médico;
- não prometer cura;
- encaminhar casos sensíveis para atendimento humano.

---

## Bloco 3 — Pagamento

O bloco de pagamento representa o reconhecimento de eventos recebidos do Asaas por webhook.

```text
Asaas envia webhook de pagamento
↓
n8n identifica o evento recebido
↓
Se o pagamento foi confirmado, o pedido é atualizado
↓
Lead é marcado como pago
↓
Card é movido no Trello
↓
Mensagem de confirmação é enviada ao lead
```

Eventos previstos:

- `PAYMENT_RECEIVED`;
- `PAYMENT_CONFIRMED`;
- `PAYMENT_OVERDUE`;
- `PAYMENT_DELETED`;
- `PAYMENT_REFUNDED`.

Tratamento lógico:

- pagamentos recebidos ou confirmados atualizam o pedido para `pago`;
- pagamentos vencidos reiniciam a possibilidade de follow-up;
- pagamentos cancelados ou estornados atualizam o status do pedido e do lead.

---

## Bloco 4 — Follow-up Automático

O bloco de follow-up representa o acompanhamento automático de leads pendentes.

```text
Schedule Trigger roda a cada 1 hora
↓
n8n busca leads pendentes
↓
Calcula o tempo desde a última mensagem
↓
Define a etapa de follow-up
↓
Envia mensagem pelo WhatsApp
↓
Atualiza status do lead
↓
Registra a interação no Supabase
```

Etapas previstas:

- Follow-up 1 após 30 minutos;
- Follow-up 2 após 24 horas;
- Follow-up 3 após 36 horas.

O objetivo do follow-up é retomar o contato de forma leve, sem insistência excessiva e respeitando a experiência do lead.

---

## Placeholders Utilizados

O workflow usa placeholders para evitar exposição de credenciais e dados sensíveis.

```text
SUPABASE_CREDENTIAL_ID
TRELLO_CREDENTIAL_ID
OPENAI_CREDENTIAL_ID
ZAPI_INSTANCE_ID
ZAPI_TOKEN
ZAPI_CLIENT_TOKEN
ASAAS_API_KEY
TRELLO_LIST_NOVO_LEAD
TRELLO_LIST_QUALIFICADO
TRELLO_LIST_AGUARDANDO_PAGAMENTO
TRELLO_LIST_PAGO_AGENDADO
TRELLO_LIST_FOLLOWUP
TRELLO_LIST_PERDIDO
TRELLO_LIST_ATENDIMENTO_HUMANO
```

Esses valores devem ser substituídos apenas em ambiente privado e seguro.

---

## Status da Versão

Esta versão representa uma **arquitetura lógica de portfólio**.

Ela é adequada para demonstrar:

- entendimento de automação com n8n;
- uso de agente IA em jornada de atendimento;
- integração lógica entre CRM, banco de dados e pagamento;
- organização de fluxos por eventos;
- preocupação com segurança e privacidade.

Não deve ser tratada como uma versão produtiva validada em ambiente real.

---

## Conclusão

O workflow consolidado apresenta a lógica completa do ZenFlow AI, desde o primeiro contato do lead até o acompanhamento de pagamento e follow-up.

A proposta é demonstrar uma arquitetura clara, visual e replicável para pequenos negócios que precisam automatizar atendimento, qualificação, cobrança e acompanhamento comercial.
