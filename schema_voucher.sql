-- 상품권 기능 추가 마이그레이션
-- Supabase SQL Editor에 붙여넣고 Run 하세요.

create table voucher (
  id bigint generated always as identity primary key,
  name text not null,
  initial_amount bigint not null default 0,
  active boolean not null default true,
  sort_order integer
);

alter table voucher enable row level security;
create policy "authed only" on voucher for all using (auth.uid() is not null) with check (auth.uid() is not null);

-- 지출 기록에 결제수단(상품권) 태그 추가. null = 현금(기본, 예산 계산에 포함)
alter table expense add column voucher_id bigint references voucher(id) on delete restrict;
