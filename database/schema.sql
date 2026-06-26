-- =========================================================
-- ZenFlow AI — Supabase Database Schema
-- Projeto: Agente Inteligente para Estúdios de Yoga
-- Uso: versão de portfólio / estrutura base demonstrativa
-- =========================================================

-- Extensão necessária para gen_random_uuid()
create extension if not exists "pgcrypto";

-- =========================================================
-- Tabela: leads
-- Armazena os interessados/alunos captados pelo atendimento.
-- =========================================================
create table if not exists leads (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz default now(),
  nome text,
  telefone text unique,
  email text,
  tipo_usuario text,
  nivel_experiencia text,
  objetivo text,
  modalidade_interesse text,
  horario_preferido text,
  status_lead text default 'novo',
  ultima_msg timestamptz,
  follow_up_status text default 'nao_iniciado',
  precisa_humano boolean default false,
  trello_card_id text,
  observacoes text
);

-- =========================================================
-- Tabela: produtos_planos
-- Armazena aulas, planos e produtos comercializados.
-- =========================================================
create table if not exists produtos_planos (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz default now(),
  nome text not null unique,
  descricao text,
  valor numeric(10,2),
  tipo text,
  ativo boolean default true
);

-- =========================================================
-- Tabela: pedidos
-- Registra pedidos, forma de pagamento e vínculo com Asaas.
-- =========================================================
create table if not exists pedidos (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz default now(),
  lead_id uuid references leads(id),
  produto_id uuid references produtos_planos(id),
  status text default 'aguardando_pagamento',
  valor numeric(10,2),
  forma_pagamento text,
  asaas_customer_id text,
  asaas_payment_id text,
  asaas_link_pagamento text,
  due_date date
);

-- =========================================================
-- Tabela: interacoes
-- Registra histórico básico das mensagens e eventos do agente.
-- =========================================================
create table if not exists interacoes (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz default now(),
  lead_id uuid references leads(id),
  canal text,
  direcao text,
  mensagem text,
  intencao_detectada text,
  agente_respondeu boolean default true,
  precisa_humano boolean default false
);

-- =========================================================
-- Tabela: agendamentos
-- Registra solicitações de aula experimental/agendamento.
-- =========================================================
create table if not exists agendamentos (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz default now(),
  lead_id uuid references leads(id),
  modalidade_id uuid,
  data_aula date,
  horario text,
  status_agendamento text default 'pendente',
  origem text,
  observacoes text
);

-- =========================================================
-- Índices auxiliares
-- Melhoram consultas usadas pelos fluxos n8n.
-- =========================================================
create index if not exists idx_leads_telefone on leads(telefone);
create index if not exists idx_leads_status on leads(status_lead);
create index if not exists idx_leads_follow_up_status on leads(follow_up_status);
create index if not exists idx_pedidos_asaas_payment_id on pedidos(asaas_payment_id);
create index if not exists idx_interacoes_lead_id on interacoes(lead_id);
create index if not exists idx_agendamentos_lead_id on agendamentos(lead_id);

-- =========================================================
-- Dados iniciais: produtos e planos
-- =========================================================
insert into produtos_planos (nome, descricao, valor, tipo) values
  ('Aula Experimental', 'Aula experimental para conhecer o estúdio', 30.00, 'avulsa'),
  ('Aula Avulsa', 'Aula avulsa sem compromisso', 50.00, 'avulsa'),
  ('Plano Mensal 1x/semana', 'Plano mensal com 1 aula por semana', 160.00, 'mensal'),
  ('Plano Mensal 2x/semana', 'Plano mensal com 2 aulas por semana', 260.00, 'mensal'),
  ('Plano Livre Mensal', 'Plano mensal com aulas ilimitadas', 340.00, 'mensal')
on conflict (nome) do nothing;
