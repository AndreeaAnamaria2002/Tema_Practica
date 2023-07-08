/*1. Scrieti o interogare pentru a afisa numele, prenumele, anul de studiu si data
nasterii pentru toti studentii. Ordonati rezultatele dupa nume si prenume.*/
SELECT nume,prenume,an,data_nastere
FROM studenti
ORDER BY nume,prenume

/*2. Afisati nume, prenume, bursa si jumatate din valoarea bursei studentilor la care a
fost adaugat in prealabil 100 (aveti in vedere si precendenta operatorilor).*/

SELECT nume,prenume,bursa
FROM studenti



/*3. Scrieti o interogare care sa afiseze in mod unic valoarea burselor*/
SELECT DISTINCT bursa FROM studenti

/*4. Afisati numele concatenat cu prenumele, urmat de virgula si anul de studiu.
Ordonati crescator dupa anul de studiu. Denumiti coloana: “Studenti / ani de studiu”.*/

SELECT nume ||','||prenume "Studenti/ani de studiu",an
FROM studenti

/*5. Afisati studentii nascuti intre 1 martie 1996 si 10 noiembrie 1997. Ordonati
descrescator dupa anul de studiu.*/
SELECT * FROM studenti
WHERE data_nastere BETWEEN '1- MAR -1996' and '10 -NOV -1997'
ORDER BY an DESC;

/*6. Afisati toti studentii nascuti in 1996.*/
SELECT * FROM studenti
WHERE TO_CHAR(DATA_NASTERE,'YYYY')= '1996';

/*7. Afisati studentii ce nu iau bursa.*/
SELECT * FROM studenti
WHERE bursa IS NULL;

/* 8. Afisati studentii care iau bursa si sunt in anii 2 sau 3 de studiu. Ordonati alfabetic
crescator dupa nume si descrescator dupa prenume.*/
SELECT * FROM studenti
WHERE bursa IS NOT NULL AND (AN='2' OR AN='3')
ORDER BY nume ASC,prenume DESC;

/* 9. Afisati studentii care iau bursa precum si valoarea bursei daca aceasta ar fi marita
cu 25%. Valoarea calculata va fi rotunjita (fara zecimale).*/
SELECT nume,prenume,bursa,
bursa+round(bursa*(25/100),0) as bursa_marita from studenti
WHERE bursa IS NOT NULL;

/* 10. Afisati studentii al caror nume incepe cu B si nu sunt in anul 1 de studiu*/
SELECT * FROM studenti
WHERE nume LIKE 'B%' AND an NOT LIKE '1%';

/* 11. Afisati toate informatiile despre studentii care au doua aparitii ale literei ‘i’ in
prenume*/
SELECT * FROM studenti
WHERE prenume LIKE '%i%i%';

/* 12. Afisati toate informatiile despre studentii al caror prenume este “Mihaela”,
“Mihai” sau “Anca”*/
SELECT * FROM studenti
WHERE prenume IN('Mihaela','Mihai','Anca');

/*13. Afisati numele si prenumele profesorilor al caror prenume se termina cu litera ‘n’*/
SELECT nume,prenume FROM profesori
WHERE prenume LIKE '%n';

/*14. Scrieti o interogare pentru a afisa data de astazi in forma an / luna / zi. Etichetati
coloana cu “Astazi”. */

SELECT
  TO_CHAR(CURRENT_DATE, 'yyyy-MM-dd') AS Astazi
FROM dual;

/* 15. Pentru fiecare student afisati numele, prenumele, data de nastere si numarul de
luni intre data curenta si data nasterii*/

SELECT nume,prenume,data_nastere,MONTHS_BETWEEN(CURRENT_DATE, DATA_NASTERE) as "Luni" from studenti;

/*16. Afisati ziua din saptamana in care s-a nascut fiecare student */

SELECT TO_CHAR(data_nastere, 'D') as Ziua from studenti;

