# To find the 3 consequtive values, under certain condition (e.g. more than 100 people)
## Join the table itself, and break into 3 sectors. Then, consider the possible sequence (e.g. in the beginning of the consecutive 3 days, or the middle, or the last)

``` SAS
PROC SQL;
SELECT distinct t1.*
FROM stadium t1, stadium t2, stadium t3
WHERE t1.people >= 100 and t2.people >= 100 and t3.people >= 100
AND
(
    (t1.id - t2.id = 1 and t1.id - t3.id = 2 and t2.id - t3.id =1)  -- t1, t2, t3
    OR
    (t2.id - t1.id = 1 and t2.id - t3.id = 2 and t1.id - t3.id =1) -- t2, t1, t3
    OR
    (t3.id - t2.id = 1 and t2.id - t1.id =1 and t3.id - t1.id = 2) -- t3, t2, t1
)
ORDER BY t1.id
;

QUIT;
``` 
