SELECT student.roll_number, student.name
  FROM student_information AS student
 INNER JOIN faculty_information AS faculty
 ON student.advisor = faculty.advisor
 WHERE (faculty.gender = 'M' AND faculty.salary > 15000)
    OR (faculty.gender = 'F' AND faculty.salary > 20000);
