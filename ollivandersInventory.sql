with min_coin_wands as (select
    w.id as id,
    wp.age as age,
    w.coins_needed as coins_needed,
    min(w.coins_needed) over (partition by w.power, wp.age ) as min_coin,
    w.power as powers
from wands w left join wands_property wp on wp.code = w.code
where wp.is_evil = 0)


select id, age, coins_needed, powers
from min_coin_wands
where min_coin = coins_needed
order by powers desc, age desc;
