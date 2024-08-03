CREATE TABLE seat (
    id INT PRIMARY KEY,
    student VARCHAR(255)
);

INSERT INTO seat (id, student) VALUES
(1, 'Rahul yadav'),
(2, 'manoj kangane'),
(3, 'praveen pal'),
(4, 'Priy raj'),
(5, 'Deepa Patil'),
(6, 'ram mohan'),
(7, 'roshni yadav'); 

WITH SwappedSeats AS (
    SELECT 
        CASE 
            WHEN id % 2 = 1 AND LEAD(id) OVER (ORDER BY id) IS NOT NULL 
			THEN LEAD(id) OVER (ORDER BY id)
            WHEN id % 2 = 0 
			THEN LAG(id) OVER (ORDER BY id)
            ELSE id
        END AS new_id,
        student
    FROM seat
)
SELECT new_id AS id, student
FROM SwappedSeats
ORDER BY id;

