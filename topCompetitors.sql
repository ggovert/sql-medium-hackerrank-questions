WITH hackers_challenges AS (
    select
        h.hacker_id as hacker_id,
        h.name as name,
        count(s.submission_id) as challenge_count
    from hackers h  
        right join submissions s on h.hacker_id = s.hacker_id
        left join challenges c on s.challenge_id = c.challenge_id
        left join difficulty d on c.difficulty_level = d.difficulty_level
    where d.score = s.score
   
    group by h.hacker_id,h.name
   
    having count(s.submission_id) >1
)


select hacker_id, name
from hackers_challenges
order by challenge_count desc, hacker_id asc;
