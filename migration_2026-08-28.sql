-- 2026-08-28 스키마 변경
-- Supabase 대시보드 → SQL Editor에 붙여넣고 Run 하세요.
-- 앱은 이 컬럼들이 없어도 안 터지게 만들어뒀지만(그냥 관련 기능만 조용히 꺼진 상태),
-- 아래 두 기능을 쓰려면 실행이 필요합니다.

-- 1. 자산의 "달달" 통장 행을 지출 캘린더와 자동 연동하는 기능
--    (매달 1일 그 달 예산으로 리셋 → 캘린더 지출만큼 자동 차감해서 보여줌)
alter table asset add column if not exists linked_cash boolean not null default false;

-- 2. 고정지출 항목에 달러(USD) 입력 + 자동 환율 환산 기능
alter table fixed_cost add column if not exists currency text not null default 'KRW';
