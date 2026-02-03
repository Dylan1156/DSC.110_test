-- This creates a table called Patients with basic patient information.
CREATE TABLE Patients (
    patient_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    gender TEXT,
    city TEXT
);

-- This inserts sample patients into the Patients table.
INSERT INTO Patients (patient_id, name, age, gender, city) VALUES
(1, 'John Doe', 45, 'M', 'Boston'),
(2, 'Jane Smith', 32, 'F', 'Cambridge'),
(3, 'Mike Johnson', 58, 'M', 'Boston'),
(4, 'Sarah Williams', 41, 'F', 'Somerville'),
(5, 'David Brown', 29, 'M', 'Boston'),
(6, 'Emily Davis', 67, 'F', 'Cambridge');


-- This shows everything in the Patients table.
-- I use this to see all the data and make sure it worked.
SELECT * FROM Patients;

-- This shows only patients who are female.
SELECT * FROM Patients
WHERE gender = 'F';

-- This only shows the name and age columns.
SELECT Name, Age 
FROM Patients; 


-- Can you show me all the fields pertaining to the records for patients who are above 40 years?

-- This shows patients who are older than 40.
SELECT * FROM Patients
WHERE Age > 40;

-- This counts how many patients are in the table. COUNT(*) counts the number of rows.
SELECT COUNT(*) FROM Patients;

-- This counts how many different cities there are.
select count(distinct city) from patients;

-- This shows each city only one time.
select distinct city from patients;


-- Can you give me the average age of the patients in the patient table?

-- This finds the average age of all patients.
SELECT AVG(Age) FROM Patients;
-- This finds the lowest age in the table.
SELECT MIN(Age) FROM Patients;
-- This finds the highest age in the table.
SELECT MAX(Age) FROM Patients;
-- This adds up all the ages together.
SELECT SUM(Age) from Patients;


-- Aggregation 
-- This shows the average age for each gender.
-- GROUP BY splits the data by gender.
-- ORDER BY arranges the results.
select gender, AVG(Age) Average_age
from Patients
group by gender
order by 2;

-- What is the Min age for each city?
-- This shows the lowest age in each city.
-- The table is grouped by city.
select MIN(Age), city from patients
group by city;

-- This shows the highest age in each city.
-- The results are arranged from highest to lowest.
select MAX(Age), city 
from patients
group by city
order by 1 desc;

-- This shows the average age for each city.
-- Cities are sorted by average age.
select AVG(Age), city 
from patients
group by city
order by 1 desc;




-- This creates a table called Visits.
-- It stores visit information for patients.
CREATE TABLE Visits (
    visit_id INTEGER PRIMARY KEY,
    patient_id INTEGER,
    visit_date TEXT,
    diagnosis TEXT,
    cost REAL,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- This adds visit records into the Visits table.
-- Each visit is linked to a patient using patient_id.
INSERT INTO Visits (visit_id, patient_id, visit_date, diagnosis, cost) VALUES
(101, 1, '2024-01-15', 'Hypertension', 150.00),
(102, 1, '2024-03-20', 'Diabetes', 200.00),
(103, 2, '2024-02-10', 'Flu', 100.00),
(104, 3, '2024-01-25', 'Hypertension', 150.00),
(105, 3, '2024-02-14', 'Back Pain', 180.00),
(106, 4, '2024-03-05', 'Diabetes', 200.00),
(108, 6, '2024-02-20', 'Arthritis', 220.00),
(109, 6, '2024-03-15', 'Hypertension', 150.00);

-- This shows all visit records.
-- It helps check that the data was added correctly.
select * from visits;

-- This joins Patients and Visits together.
-- LEFT JOIN keeps all patients even if they have no visits.
select p.patient_id, visit_id, diagnosis, city
from Patients p left join Visits v 
on p.patient_id = v.patient_id;


-- Give me the average cost per city?
-- This finds the average visit cost for each city.
-- It joins the tables and groups the data by city.
SELECT p.city, AVG(v.cost)
FROM Patients p JOIN Visits v
ON p.patient_id = v.patient_id
GROUP BY p.city;


--Practice link

-- This shows all the patients in the table.
-- I use this to check that the table has data.
SELECT * FROM Patients;


-- This shows all visits in the Visits table.
-- It lets me see the visit info like date and cost.
SELECT * FROM Visits;


-- This shows only patients who live in Boston.
-- It filters the table using the city column.
SELECT *
FROM Patients
WHERE city = 'Boston';


-- This shows only female patients.
-- It filters the rows using gender.
SELECT *
FROM Patients
WHERE gender = 'F';


-- This shows only patient id, name, and age.
-- The other columns are not shown.
SELECT patient_id, name, age
FROM Patients;


-- This counts how many patients are in the table.
-- COUNT(*) counts all the rows.
SELECT COUNT(*)
FROM Patients;


-- This counts how many different genders there are.
-- DISTINCT removes repeated values.
SELECT COUNT(DISTINCT gender)
FROM Patients;


-- This finds the average age of patients.
-- AVG calculates the average number.
SELECT AVG(age)
FROM Patients;


-- This shows the average age for each gender.
-- GROUP BY separates the data by gender.
SELECT gender, AVG(age)
FROM Patients
GROUP BY gender;


-- This shows the average age for each gender.
-- ORDER BY arranges the results from highest to lowest.
SELECT gender, AVG(age)
FROM Patients
GROUP BY gender
ORDER BY 2 DESC;


-- This joins the Patients and Visits tables.
-- It shows patient info with their visit info.
-- Only patients who have visits will show.
SELECT 
    p.name,
    p.age,
    v.visit_date,
    v.diagnosis,
    v.cost
FROM Patients p
JOIN Visits v
ON p.patient_id = v.patient_id;


-- This left joins Patients and Visits.
-- All patients will show, even if they have no visits.
SELECT 
    p.name,
    p.age,
    v.visit_date,
    v.diagnosis,
    v.cost
FROM Patients p
LEFT JOIN Visits v
ON p.patient_id = v.patient_id;
















