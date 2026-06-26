# Segurança e Limitações — ZenFlow AI

Este documento apresenta os cuidados de segurança, privacidade e limitações da versão de portfólio do projeto **ZenFlow AI**.

---

## Versão de Portfólio

O projeto foi estruturado como uma demonstração técnica e conceitual.

A versão publicada no GitHub não utiliza:

- tokens reais;
- credenciais reais;
- dados pessoais reais;
- webhooks ativos;
- contas reais de clientes;
- integrações produtivas validadas.

---

## Uso de Placeholders

Os arquivos do projeto utilizam placeholders como:

```text
SUPABASE_CREDENTIAL_ID
OPENAI_CREDENTIAL_ID
TRELLO_CREDENTIAL_ID
ASAAS_API_KEY
ZAPI_INSTANCE_ID
ZAPI_TOKEN
ZAPI_CLIENT_TOKEN
TRELLO_LIST_NOVO_LEAD
TRELLO_LIST_AGUARDANDO_PAGAMENTO
TRELLO_LIST_PAGO_AGENDADO
TRELLO_LIST_FOLLOWUP
TRELLO_LIST_ATENDIMENTO_HUMANO
```

Esses valores devem ser substituídos apenas em ambiente privado e seguro.

---

## Dados Sensíveis

O projeto não deve expor:

- nome real de alunos;
- telefone;
- e-mail;
- histórico de conversas reais;
- dados de pagamento;
- tokens de API;
- URLs reais de webhooks ativos.

---

## Limitações Técnicas

A versão de portfólio não foi conectada a ambientes reais de:

- Supabase;
- Asaas;
- Trello;
- WhatsApp API;
- OpenAI em produção.

Por isso, o workflow representa a lógica da arquitetura, mas não deve ser tratado como uma implantação produtiva testada.

---

## Limitações do Agente

O agente não deve:

- fazer diagnóstico médico;
- prometer cura;
- substituir professor, médico, terapeuta ou profissional de saúde;
- orientar práticas em casos de dor, lesão, gravidez ou condição médica sem intervenção humana;
- insistir comercialmente com leads.

---

## Recomendação para Uso Real

Antes de uma implantação real, seria necessário:

- configurar credenciais em ambiente seguro;
- validar permissões no Supabase;
- revisar políticas de acesso;
- testar webhooks;
- testar pagamentos em sandbox;
- revisar mensagens automáticas;
- criar tratamento de erro;
- validar a jornada com usuários reais;
- revisar conformidade com privacidade e LGPD.

---

## Conclusão

O ZenFlow AI foi publicado como projeto de portfólio para demonstrar arquitetura, lógica de automação e uso de agentes de IA.

A versão pública prioriza segurança, clareza e proteção de dados.
