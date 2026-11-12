-- 위고 프로젝트관리 클라우드 동기화용 테이블
-- Supabase 대시보드 → SQL Editor → New query 에 붙여넣고 Run 을 한 번만 실행하세요.
create table if not exists public.pm_data (
  user_id    uuid primary key references auth.users(id) on delete cascade,
  data       jsonb not null,
  updated_at timestamptz not null default now()
);
alter table public.pm_data enable row level security;
drop policy if exists "own select" on public.pm_data;
drop policy if exists "own insert" on public.pm_data;
drop policy if exists "own update" on public.pm_data;
create policy "own select" on public.pm_data for select using (auth.uid() = user_id);
create policy "own insert" on public.pm_data for insert with check (auth.uid() = user_id);
create policy "own update" on public.pm_data for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
