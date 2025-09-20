with student_grade as (select name, marks,
    case
        when marks >= 90 then 10
        when marks >=80 then 9
        when marks >=70 then 8
        when marks >=60 then 7
        when marks >=50 then 6
        when marks >=40 then 5
        when marks >=30 then 4
        when marks >=20 then 3
        when marks >=10 then 2
        else 1
    end grade 
from students)




select name, grade, marks
from (
    select name, grade,marks, 1 as sort_group
    from student_grade
    where grade >=8


    union ALL


    select NULL, grade,marks, 2 as sort_group
    from student_grade
    where grade < 8) AS combined
   
ORDER BY
    sort_group, grade desc,
    case when sort_group = 1 then name end asc,
    case when sort_group = 2 then marks end asc;
