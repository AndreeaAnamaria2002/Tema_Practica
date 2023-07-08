/*1.afisati numele si salariile angajatiilor
*/
SELECT first_name,last_name,salary FROM EMPLOYEES

/*2.afisati numele de familie si salariul angajatiilor care castiga mai mult de 12000*/
SELECT last_name,salary FROM EMPLOYEES
WHERE salary >=12000 

/*3.afisati numele de familie si salariul pentru toti angajatii al caror salariu nu se afla in intervalul 5000 12000*/
SELECT last_name,salary FROM EMPLOYEES 
WHERE salary NOT between 5000 and 12000


/*4.afisati numele de familie, loc de munca (job ID) si data de inceput (data angajarii)
pentru angajatii cu numele de familie Smith si Taylor. Ordona?i rezultatele în ordine
cresc?toare dup? data angajarii*/
SELECT last_name,job_id,hire_date FROM EMPLOYEES
WHERE last_name IN('Smith', 'Taylor')
ORDER BY hire_date ASC;

/*5.afisati numele de familie si numele departamentului pentru angajatii din
departamentele 20 sau 50 in ordine alfabetica crescatoare dupa nume*/
SELECT last_name,department_id FROM EMPLOYEES
WHERE department_id IN('20','50')
ORDER BY last_name ASC;

/*6.afisati numele de familie si denumirea functiei pentru toti angajatii care nu au un
manager*/ 
SELECT last_name,job_id FROM EMPLOYEES
WHERE manager_id is null;

/*7.afisati numele de familie, salariul si comisionul pentru toti angajatii care castiga comisioane. Sorta?i datele în ordine descresc?toare a salariilor ?i comisioanelor*/ 
SELECT last_name,salary,commission_pct FROM EMPLOYEES
WHERE commission_pct is not null
ORDER BY salary,commission_pct DESC;

/*8.gasiti cel mai mare, cel mai mic salariu si salariul mediu al tuturor angajatilor. Etichetati coloanele Maxim, Minim, Suma si respectiv, Medie*/
SELECT
round(max(salary),0)Maxim,
round (min(salary),0)Minim,
round (sum(salary),0)Suma,
round(avg(salary),0)Medie
FROM EMPLOYEES;

/*9. Modificati interogarea anterioara pentru a afisa Minim, Maxim, Suma si salariul mediu pentru fiecare loc de munca (job_ID)*/ 
SELECT job_id,
round(max(salary),0) Maxim,
round(min((salary),0) Minim,
round(sum(salary),0) Suma,
round(avg(salary),0) Medie
FROM EMPLOYEES
ORDER BY job_id;

/*10. Afisati numarul persoanelor cu acelasi loc de munca*/
SELECT job_id ,COUNT(*)FROM EMPLOYEES
GROUP BY job_id;

/*11. Determinati numarul managerilor fara a lista angajatii. Etichetati coloana
Numarul Managerilor. Sugestie: Folositi coloana Manager_ID din tabela cu angajati
pentru a determina numarul managerilor*/
SELECT COUNT(DISTINCT manager_id) as Nr_managerilor 
FROM EMPLOYEES; 

/*12. Gasiti diferenta dintre cel mai mare ?i cel mai mic salariu. Etichetati coloana
Diferenta.*/
SELECT 
max(salary) - min(salary) as Diferenta
FROM EMPLOYEES

/*13. Gasiti adresele tuturor departamentelor. Utilizati tabelele LOCATIONS si
COUNTRIES.*/
select 
 d.DEPARTMENT_NAME,
 l.location_id, 
 l.street_address, 
 l.city,
 c.country_name
from DEPARTMENTS d
 inner join LOCATIONS l 
 on d.LOCATION_ID = l.LOCATION_ID
 inner join COUNTRIES C 
 on l.country_id = c.country_id;


/* 14. Afisati la iesire, ID_Locatie, adresa strazii, orasul, statul sau provincia si tara.*/

select 
 d.DEPARTMENT_NAME,
 l.location_id, 
 l.street_address, 
 l.city,
 l.state_province,
 c.country_name
from DEPARTMENTS d
 inner join LOCATIONS l 
 on d.LOCATION_ID = l.LOCATION_ID
 inner join COUNTRIES C 
 on l.country_id = c.country_id;

/*15. Afisati numele de familie, locul de munca, numarul departamentului si numele
departamentului pentru toti angajatii care lucreaza in Toronto.*/
SELECT
e.last_name,
e.job_id,
e.department_id,
d.department_name,
l.city
FROM EMPLOYEES e
inner join DEPARTMENTS d
on (e.department_id=d.department_id)
inner join LOCATIONS l
on (d.location_id=l.location_id)
WHERE l.city IN 'Toronto'


