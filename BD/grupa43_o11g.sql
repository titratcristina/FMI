--#######################################################################################--

-- Laborator 1 Saptamana 2  26.02.2020  (LABORATOR 1 pe site)

-------------------------------------------------------------------------------------------

select * from employees;
 
select * from departments; 
 
select * from jobs;
 
select * from job_history;
 
desc employees;
 
-- cheia primara - este o coloana sau o combinatie de coloane
--               - este unica nu se repeta
--               - nu poate fi null
               
-- cheia externa - este o coloana
--               - poate fi null
--               - daca se afla intr-un tabel  atunci se afla si in tabelul pe care il refera
--               - se poate repeta
              
select job_id from employees; -- 107 joburi deoarece job_id este cheie externa
                              -- si se poate repeta => avem 107 ang deci avem 107 joburi

select job_id from jobs; -- 19 joburi unice deosrece job_id este cheie primara
                         -- si nu se poate repeta
                        
select distinct job_id from employees;

select unique job_id from employees;

select employee_id, last_name, salary * 12 "annual sAlAry"
from employees;

select employee_id as ID, last_name as Nume, salary * 12 as annual_sAlAry
from employees;


-------------------------------------------------------------------------------------------
-- 6. Sa se afiseze numele concatenat cu job_id-ul, separate prin virgula ?i spatiu. 
-- Etichetati coloana "Angajat si titlu".

-- operatorul de concatenare -> ||

select last_name || ' , ' || job_id as "angajat si titlu"
from employees;


-------------------------------------------------------------------------------------------
-- 7. Sa se listeze numele si salariul angaja?ilor care castiga mai mult de 2850.

SELECT last_name, salary
FROM employees
WHERE salary > 2850;


-------------------------------------------------------------------------------------------
-- 9. Sa se modifice cererea de la problema 7 pentru a afisa numele si salariul angajatilor
-- al caror salariu nu se afli in intervalul [1500, 2850].

SELECT last_name, salary
FROM employees
WHERE salary not between 1500 and 2850;

SELECT last_name, salary
FROM employees
WHERE salary >= 1500 and salary <= 2850;


--#######################################################################################--

-- Laborator 2 Saptamana 3  04.03.2020  (LABORATOR 1 pe site)

-------------------------------------------------------------------------------------------

-- 11. Să se afişeze numele salariaţilor şi codul departamentelor pentru toti angajaţii din
-- departamentele 10 şi 30 în ordine alfabetică a numelor.

-- varianta 1 ---
SELECT last_name, departament_id
FROM employees
WHERE department_id IN (10, 30)
ORDER BY last_name;

-- varianta 2 ---
SELECT last_name, departament_id
FROM employees
WHERE department_id IN (10, 30)
ORDER BY 1;

-- varianta 3 ---
SELECT last_name Nume, departament_id
FROM employees
WHERE department_id IN (10, 30)
ORDER BY Nume;

SELECT * FROM employees;


-------------------------------------------------------------------------------------------
-- 12. Să se modifice cererea de la problema 11 pentru a lista numele şi salariile angajatilor
-- care câştigă mai mult de 1500 şi lucrează în departamentul 10 sau 30. Se vor eticheta
-- coloanele drept Angajat si Salariu lunar. 

SELECT last_name "Angajat", salary "Salariul lunar"
FROM employees
WHERE DEPARTMENT_ID IN (10, 30) and salary > 1500
ORDER BY last_name;


-------------------------------------------------------------------------------------------
-- 13. Care este data curentă? Afişaţi diferite formate ale acesteia.

SELECT SYSDATE 
FROM employees;

DESC dual;
SELECT * FROM dual;

SELECT 2+4 
FROM dual;

SELECT SYSDATE 
FROM dual;

-----------------------
TO_CHAR (DATA, FROMAT);

TO_NUMBER

TO_DATE
-----------------------

TO_CHAR (DATA, FROMAT);

SELECT TO_CHAR(SYSDATE, 'DAY-MON-YEAR HH12 SS SSSSS D DD DDD')
FROM DUAL;


-------------------------------------------------------------------------------------------
-- 14. Să se afișeze numele şi data angajării pentru fiecare salariat care a fost angajat în
-- 1987. Se cer 2 soluţii: una în care se lucrează cu formatul implicit al datei şi alta prin
-- care se formatează data.

-- Varianta1:
SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE hire_date LIKE '%87%';
--WHERE hire_date LIKE ('%87%');

-- %X% -> abcXaaaabbbcc
--  X% -> Xabcaaabbbccc
-- %X  -> abcaaaabbbccX

-- Varianta 2:
SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(hire_date, 'YYYY') = '1987';

-- face conversie automata daca nu are ghilimele

DESC employees; -- DESCRIE TIPUL DE DATE DIN TABELE


-------------------------------------------------------------------------------------------
-- 15. Să se afişeze numele şi job-ul pentru toţi angajaţii care nu au manager.

SELECT * FROM EMPLOYEES;

SELECT LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;


-------------------------------------------------------------------------------------------
-- 16. Să se afișeze numele, salariul și comisionul pentru toti salariații care câștigă comision.
-- Să se sorteze datele în ordine descrescătoare a salariilor și comisioanelor.

SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

-- dupa prima ordonare daca elementele sunt egale atunci ordoneaza dupa al doilea criteriu

-------------------------------------------------------------------------------------------
-- 17. Eliminaţi clauza WHERE din cererea anterioară. Unde sunt plasate valorile NULL în
-- ordinea descrescătoare?

SELECT last_name, salary, commission_pct
FROM employees
--WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

-- daca exista valori null in ord desc il pune primul (e considerat cel mai mare)
-- in ordine cresc null e considerat cel mai mic


-------------------------------------------------------------------------------------------
-- 18. Să se listeze numele tuturor angajatilor care au a treia literă din nume ‘A’.
-- Obs: Pentru compararea şirurilor de caractere, împreună cu operatorul LIKE se utilizează
-- caracterele wildcard:
--➢ % - reprezentând orice şir de caractere, inclusiv şirul vid;
--➢ _ (underscore) – reprezentând un singur caracter şi numai unul.

SELECT last_name
FROM employees
--WHERE last_name LIKE ('__A%'); nu se gasesc angajati xu XxA ci doar Xxa
--WHERE last_name LIKE ('__a%');
--WHERE UPPER(last_name) LIKE ('__A%');
--WHERE LOWER(last_name) LIKE ('__a%');
WHERE INITCAP(last_name) LIKE ('__a%');


-------------------------------------------------------------------------------------------
-- 19. Să se listeze numele tuturor angajatilor care au cel putin 2 litere ‘L’ in nume şi
-- lucrează în departamentul 30 sau managerul lor este 102.

SELECT last_name, department_id, manager_id
FROM employees
WHERE UPPER(last_name) LIKE '%L%L%' AND department_id = 30 or manager_id = 102;


-------------------------------------------------------------------------------------------
-- 20. Să se afiseze numele, job-ul si salariul pentru toti salariatii al caror job conţine şirul
-- "CLERK" sau "REP" și salariul nu este egal cu 1000, 2000 sau 3000 $. (operatorul
-- NOT IN).

SELECT last_name, job_id, salary
FROM employees
WHERE (job_id LIKE '%CLERK%' OR job_id LIKE '%REP%') AND salary NOT IN (1000, 2000, 3000);


------------------------------------- LABORATOR 2 -----------------------------------------

SELECT TO_NUMBER ('-25.789', 99.999) -- = -25.789
FROM dual;

-- LENGTH(string) incepe de la 1 :)

SELECT RPAD (LOWER('InfO'), 7, 'X')
FROM DUAL;


-------------------------------------------------------------------------------------------
-- 2. Scrieţi o cerere prin care să se afişeze prenumele salariatului cu prima litera majusculă
-- şi toate celelalte litere minuscule, numele acestuia cu majuscule şi lungimea
-- numelui, pentru angajaţii al căror nume începe cu J sau M sau care au a treia literă din
-- nume A. Rezultatul va fi ordonat descrescător după lungimea numelui. Se vor eticheta
-- coloanele corespunzător. Se cer 2 soluţii (cu operatorul LIKE şi funcţia SUBSTR).

-- like
select initcap(first_name) Prenume, upper(last_name) Nume, length(last_name) Lungime
from employees
where upper(last_name) like 'J%' 
    or upper(last_name) like 'M%' upper(last_name) 
    or upper(last_name) like '__A%'
ordered by length(last_name) desc;

select initcap(first_name) Prenume, upper(last_name) Nume, length(last_name) Lungime
from employees
where upper(last_name) like 'J%' or upper(last_name) like 'M%' or upper(last_name) like '__A%'
order by length(last_name) desc;

-- substr 
select initcap(first_name) Prenume, upper(last_name) Nume, length(last_name) Lungime
from employees
where upper(last_name) like 'J%' 
    or upper(last_name) like 'M%' 
    or substr upper(last_name) like '__A%'
ordered by length(last_name) desc;

SELECT initcap(first_name) Prenume, upper(last_name) Nume, length(last_name) Lungime
FROM employees
WHERE upper(last_name) LIKE 'J%' or upper(last_name) LIKE 'M%' or substr(upper(last_name),3,1)='A'
ORDER BY length(last_name) desc;


-------------------------------------------------------------------------------------------
-- 3. Să se afişeze, pentru angajaţii cu prenumele „Steven”, codul şi numele acestora, precum
-- şi codul departamentului în care lucrează. Căutarea trebuie să nu fie case-sensitive, iar
-- eventualele blank-uri care preced sau urmează numelui trebuie ignorate.

-- SELECT ...
-- FROM ...
-- WHERE LTRIM(RTRIM(UPPER(first_name)))='STEVEN';
-- sau
-- SELECT ...
-- FROM ...
-- WHERE TRIM(BOTH FROM UPPER(first_name))='STEVEN';


-------------------------------------------------------------------------------------------
-- 4. Să se afişeze pentru toţi angajaţii al căror nume se termină cu litera 'e', codul, numele,
--lungimea numelui şi poziţia din nume în care apare prima data litera 'A'. Utilizaţi alias-uri
--corespunzătoare pentru coloane

SELECT EMPLOYEE_ID, LAST_NAME, LENGTH(LAST_NAME) "Lungime",
    --instr(string, 'ch', start, n) PozitieLitera
      instr(upper(last_name, 'A', 1, 1) PozitieLitera
FROM EMPLOYEES
WHERE substr(last_name, -1) = 'e';


-------------------------------------------------------------------------------------------
-- 9. Să se afişeze numărul de zile rămase până la sfârşitul anului.

select round(to_date('31-12-2020', 'dd-mm-yyyy') - sysdate, 3)
from dual;


--------------------------------------- TEMA ----------------------------------------------

-- data nasterii sa vezi cate zile ai trait
-- tema ex: 5

-------------------------------------------------------------------------------------------
-- 5. Să se afişeze detalii despre salariaţii care au lucrat un număr întreg de săptămâni până
-- la data curentă.
-- Obs: Soluția necesită rotunjirea diferenței celor două date calendaristice. De ce este necesar
-- acest lucru?

SELECT * FROM employees;

SELECT first_name, last_name
WHERE round(SYSDATE - TO_DATE(hire_date, 'dd-mm-yyyy')) / 7 =  SYSDATE - TO_DATE(hire_date, 'dd-mm-yyyy') / 7
FROM employees;

SELECT first_name, last_name
FROM employees
WHERE (SYSDATE - hire_date) / 7 = round((SYSDATE - hire_date ) / 7, 2);

SELECT round((SYSDATE - hire_date ) / 7, 2)
FROM employees;

--#######################################################################################--

-- Laborator 3 Saptamana 4  11.03.2020  (LABORATOR 2 pe site)

-------------------------------------------------------------------------------------------

SELECT last_name
FROM employees
WHERE MOD(ROUND(sysdate - hire_date), 7) = 0;


-------------------------------------------------------------------------------------------
-- 6. Să se afişeze codul salariatului, numele, salariul, salariul mărit cu 15%, exprimat cu
-- două zecimale şi numărul de sute al salariului nou rotunjit la 2 zecimale. Etichetaţi
-- ultimele două coloane “Salariu nou”, respectiv “Numar sute”. Se vor lua în considerare
-- salariaţii al căror salariu nu este divizibil cu 1000. 

SELECT employee_id, last_name, salary, ROUND(salary * 1.15, 2) "Salariu nou",
        ROUND(salary * 1.15/100, 2) "Numar sute"
FROM employees
WHERE MOD(salary, 1000) != 0;
--WHERE MOD(salary, 1000) <> 0;
--WHERE MOD(salary, 1000) ^= 0;

--salary + salary * 0.15 -> salary * 1.15


-------------------------------------------------------------------------------------------
-- 7. Să se listeze numele şi data angajării salariaţilor care câştigă comision. Să se
-- eticheteze coloanele „Nume angajat”, „Data angajarii”. Utilizaţi funcţia RPAD pentru a
-- determina ca data angajării să aibă lungimea de 20 de caractere.

SELECT last_name "Nume angajat", RPAD(hire_date, 20, 'X') "Data angajarii"
FROM employees
WHERE commission_pct IS NOT NULL;


-------------------------------------------------------------------------------------------
-- 8. Să se afişeze data (numele lunii, ziua, anul, ora, minutul si secunda) de peste 30 zile.
-- SELECT TO_CHAR(SYSDATE+30, ‘MONTH DD YYYY HH24:MI:SS’) “Data”
-- FROM DUAL;

SELECT TO_CHAR(SYSDATE + 30, 'MONTH DD YYYY HH24:MI:SS') DATA
FROM DUAL;


-------------------------------------------------------------------------------------------
-- 10. a) Să se afişeze data de peste 12 ore.
-- SELECT TO_CHAR(SYSDATE+12/24, ‘ DD/MM HH24:MI:SS’) “Data”
-- FROM DUAL;
-- b) Să se afişeze data de peste 5 minute
-- Obs: Cât reprezintă 5 minute dintr-o zi?

-- 12/24 <=> 1/2
select to_char(sysdate + 12/24, 'DD/MM HH24:MI:SS') DATA
from dual;

select to_char(sysdate + (5/60) / 24, 'DD/MM HH24:MI:SS') DATA
from dual;

1h ... 60m
 x ...  5m -> 5/60 -> in raport cu ora
 
(5/60) / 24 -> in raport cu ziua


-------------------------------------------------------------------------------------------
-- 11. Să se afişeze numele şi prenumele angajatului (într-o singură coloană), data angajării şi
-- data negocierii salariului, care este prima zi de Luni după 6 luni de serviciu. Etichetaţi
-- această coloană “Negociere”;

SELECT concat(last_name, first_name), hire_date, NEXT_DAY(ADD_MONTHS(hire_date, 6), 'monday') "Negociere"
FROM employees;


-------------------------------------------------------------------------------------------
-- 12. Pentru fiecare angajat să se afişeze numele şi numărul de luni de la data angajării.
-- Etichetaţi coloana “Luni lucrate”. Să se ordoneze rezultatul după numărul de luni lucrate.
-- Se va rotunji numărul de luni la cel mai apropiat număr întreg.

SELECT last_name, months_between(sysdate, hire_date) "Luni lucrate"
FROM employees
ORDER BY MONTHS_BETWEEN(SYSDATE, hire_date);


SELECT last_name, months_between(sysdate, hire_date) "Luni lucrate"
FROM employees
ORDER BY "Luni lucrate";


SELECT last_name, months_between(sysdate, hire_date) "Luni lucrate"
FROM employees
ORDER BY 2;

Obs: În clauza ORDER BY, precizarea criteriului de ordonare se poate realiza şi prin
indicarea alias-urilor coloanelor sau a poziţiilor acestora în clauza SELECT.

--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--
-- 13. Să se afişeze numele angajaţilor şi comisionul. Dacă un angajat nu câştigă comision, să
-- se scrie “Fara comision”. Etichetaţi coloana “Comision”.

SELECT last_name, NVL(to_char(commission_pct), 'Fara Comision') "Comision"
FROM employees;


-------------------------------------------------------------------------------------------
-- 14. Să se listeze numele, salariul şi comisionul tuturor angajaţilor al căror venit lunar
-- (salariu + valoare comision * salariu) depăşeşte 10 000;

SELECT last_name, salary, commission_pct
FROM employees
WHERE salary + salary * commission_pct > 10000;

--!!!!!!!!!!!!!!!!!--
select 10 + 10 * null
from dual; -> null

select 10 + null
from dual; -> null; 

SELECT last_name, salary, commission_pct
FROM employees
WHERE NVL(salary + salary * commission_pct, salary) > 10000;

SELECT last_name, salary, commission_pct
FROM employees
WHERE salary + salary * nvl(commission_pct, 0) > 10000;

-- se poate face si cu nvl2


-------------------------------------------------------------------------------------------
-- 15. Să se afişeze numele, codul functiei, salariul şi o coloana care să arate salariul după
-- mărire. Se ştie că pentru IT_PROG are loc o mărire de 10%, pentru ST_CLERK 15%, iar
-- pentru SA_REP o mărire de 20%. Pentru ceilalti angajati nu se acordă mărire. Să se
-- denumească coloana "Salariu renegociat";

SELECT last_name, job_id, salary,
        DECODE(job_id,
                'IT_PROG', salary * 1.1, -- marit cu 10%
                'ST_CLERK', salary * 1.15,
                'SA_REP', salary * 1.2,
                salary) "Salariu renegociat" -- daca nu se indeplineste nicio conditie de mai sus afiseaza 0
FROM employees;

-- case e fara virgule
SELECT last_name, job_id, salary,
        CASE job_id WHEN 'IT_PROG' THEN salary *  1.1
                    WHEN 'ST_CLERK' THEN salary *  1.15
                    WHEN 'SA_REP' THEN salary *  1.2
        ELSE salary
        END "Salariu renegociat"
FROM employees;

select * from departments;

select * from employees;


-------------------------------------------------------------------------------------------
-- 16. Să se afişeze codul angajatilor şi numele departamentului pentru toţi angajaţii.

-- I. Condiția de Join este scrisă în clauza WHERE a instrucțiunii SELECT;

select employee_id, department_name
from employees e, departments d --> produs cartezian
where e.department_id = d.department_id;
--> de ce afiseaza 106 in loc de 107? NU ARE DEPARTAMENT

select employee_id, last_name
from employees
where employee_id is null; --178 Grant nu are departament 

--> in tabelul employees department_id este cheie externa deci poate fi null
--> de aceea exista un angajat fara departament


-- vrem sa afisam si angajatii care nu au departament
-- Exista simbolul (+) care se pune in dreptul coloanei din conditia de join unde este deficit de informare (nu au departament)
select employee_id, department_name
from employees e, departments d
where e.department_id = d.department_id (+);

--vrem sa afisam si departamentele care nu au angajati
select employee_id, department_name
from employees e, departments d
where e.department_id (+) = d.department_id;

-- importanta ALIAS-ULUi 
select employee_id, department_name, employees.department_id
from employees, departments d
where employees.department_id = d.department_id;

----------- saptamana viitoare ----------
-- II. Condiția de Join este scrisă în FROM
-- Utilizăm ON:;
-----------------------------------------

select employee_id, department_name
from employees e join departments d on (e.department_id = d.department_id);

-- Utilizăm USING – atunci când avem coloane cu același nume:

select employee_id,department_name
from employees e join departments d using(department_id);
Ce observați având în vedere numărul de rânduri returnate?

-- EMP (#ID, NUME, DEPID)
-- DEP (#ID, NUMEDEP)


-------------------------------------------------------------------------------------------
-- 17. Să se listeze codurile și denumirile job-urilor care există în departamentul 30;

SELECT e.job_id, job_title
FROM jobs j, employees e
WHERE department_id = 30 and e.job_id = j.job_id;


-------------------------------------------------------------------------------------------
-- 18. Să se afişeze numele angajatului, numele departamentului şi id-ul locației pentru toţi
-- angajaţii care câştigă comision.

SELECT last_name, department_name, location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id AND commission_pct is not null ;


-------------------------------------------------------------------------------------------
-- 19. Să se afişeze numele angajatului, titlul job-ului şi denumirea departamentului pentru toţi angajaţii
-- care lucrează în Oxford.

SELECT last_name, job_title, department_name
FROM employees e, jobs j, departments d, locations l
WHERE e.job_id = j.job_id and
      e.department_id = d.department_id and
      d.location_id = l.location_id and
      initcap(l.city) = 'Oxford';
      
      
-------------------------------------------------------------------------------------------
-- 20. Să se afişeze codul angajatului şi numele acestuia, împreună cu numele şi codul
-- şefului său direct. Se vor eticheta coloanele Ang#, Angajat, Mgr#, Manager.;

-- self join cand vorbin de acelasi lucru

SELECT ang.employee_id Ang#, ang.last_name Angajat, sef.employee_id Mgr#, sef.last_name Manager
FROM employees ang, employees sef
WHERE ang.manager_id = sef.employee_id;

select * from employees;

SELECT ang.employee_id Ang#, ang.last_name Angajat, sef.employee_id Mgr#, sef.last_name Manager
FROM employees ang, employees sef
WHERE ang.manager_id = sef.employee_id (+);


-------------------------------------------------------------------------------------------
-- 22. Scrieţi o cerere care afişează numele angajatului, codul departamentului în care
-- acesta lucrează şi numele colegilor săi de departament. Se vor eticheta coloanele
-- corespunzător.

select ang.last_name, ang.department_id, coleg.last_name
from employees ang, employees coleg
where ang.department_id = coleg.department_id
      and ang.employee_id > coleg.employee_id; -- am eliminat dublicatele 
      

-------------------------------------------------------------------------------------------
-- 24. Să se afişeze numele şi data angajării pentru salariaţii care au fost angajaţi după Gates.
-- WHERE e.hire_date > gates.hire_date AND ________; 

SELECT ang.last_name, ang.hire_date, gates.hire_date, gates.last_name
FROM employees ang, employees gates
WHERE ang.hire_date > gates.hire_date and initcap(gates.last_name) = 'Gates';


--------------------------------------- TEMA ----------------------------------------------

-- tema 23, 25

-------------------------------------------------------------------------------------------

--23. Creaţi o cerere prin care să se afişeze numele angajatilor, codul job-ului, titlul job-ului,
--numele departamentului şi salariul angajaţilor. Se vor include și angajații al căror
--departament nu este cunoscut;

SELECT last_name, e.job_id, job_title, department_name, salary
FROM employees e, jobs j, departments d
WHERE e.job_id = j.job_id AND e.department_id = d.department_id;

--25. Să se afişeze numele salariatului şi data angajării împreună cu numele şi data angajării
--şefului direct pentru salariaţii care au fost angajaţi înaintea şefilor lor. Se vor eticheta
--coloanele Angajat, Data_ang, Manager si Data_mgr.
--WHERE ang.manager_id = m.employee_id AND ang.hire_date < m.hire_date;

SELECT ang.last_name "Angajat", ang.hire_date "Data_ang", m.last_name "Manager", m.hire_date "Data_mgr"
FROM employees ang, employees m
WHERE ang.manager_id = m.employee_id AND ang.hire_date < m.hire_date;


--#######################################################################################--

-- Laborator 4 saptamana 5  18.03.2020  (LABORATOR 3 de pe site)

-------------------------------------------------------------------------------------------

--Exemplu Nonequijoin:
SELECT last_name, salary, grade_level, lowest_sal, highest_sal
FROM employees, job_grades
WHERE salary BETWEEN lowest_sal AND highest_sal;

SELECT * FROM job_grades;

-- JOIN
-- LEFT / RIGTH OUTER JOIN

-- NATURAL JOIN -- exista o coloana comuna, cu acelasi nume
SELECT last_name, job_id, job_title 
FROM employees   
NATURAL JOIN jobs; 
-- VS
SELECT last_name, e.job_id, job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;


SELECT * FROM employees NATURAL JOIN departments;


SELECT last_name, department_name, location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id; -- 106 rezultate -> avem un angajat fara departament care nu este afisat

-- SQL 3 - ON
SELECT last_name, department_name, location_id
FROM employees e JOIN departments d ON (e.department_id = d.department_id);

-- SQL 3 - USING
SELECT last_name, department_name, location_id
FROM employees JOIN departments USING (department_id);


-- dorim sa afisam angajatii fara departament -> (+) se pune in partea deficitara, unde e nagatia
SELECT last_name, department_name, location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id (+);

-- dorim sa afisam TOTI angajatii chiar daca au sau nu departament
SELECT last_name, department_name, location_id
FROM employees e, departments d
LEFT JOIN departments d ON (e.department_id = d.department_id);

-- dorim sa afisam TOATE departamentele chiar daca au sau nu angajati
-- SELECT last_name, department_name, location_id
-- FROM employees e
-- LEFT JOIN departments d ON (e.department_id = d.department_id);

-- dorim sa afisam TOTI angajatii chiar daca au sau nu departament
-- dorim sa afisam TOATE departamentele chiar daca au sau nu angajati
-- DE COMPLETAT

-----------------------------------------------------------------------------------------------
-- 1. Scrieți o cerere pentru a se afisa numele, luna (în litere) şi anul angajării pentru toți
-- salariații din acelasi departament cu Gates, al căror nume conţine litera “a”. Se va
-- exclude Gates. 
-- (SELF JOIN) ex. angajatii si colegii de departament

SELECT ang.last_name, TO_CHAR(ang.hire_date, 'month-yyyy'), gates.last_name
FROM employees ang JOIN employees gates ON (ang.department_id = gates.department_id)
WHERE INITCAP(gates.last_name) = 'Gates' AND LOWER(ang.last_name) LIKE '%a%'
                                         AND INITCAP(ang.last_name) NOT LIKE 'Gates'; -- != 
                                         

-----------------------------------------------------------------------------------------------
-- 2. Să se afișeze codul şi numele angajaţilor care lucrează în același departament cu
-- cel puţin un angajat al cărui nume conţine litera “t”. Se vor afişa, de asemenea, codul şi
-- numele departamentului respectiv. Rezultatul va fi ordonat alfabetic după nume.
-- (SELF JOIN again)

SELECT e.employee_id "Cod ang", e.last_name "Nume ang", d.department_id "Code dep", department_name "Nume dep"
FROM employees e JOIN employees t ON(e.department_id = t.department_id)
                 JOIN departments d ON(e.department_id = d.department_id)
WHERE LOWER(last_name) LIKE '%t%'
ORDER BY e.last_name;


-----------------------------------------------------------------------------------------------
-- 3. Să se afișeze numele, salariul, titlul job-ului, oraşul şi ţara în care lucrează
-- angajații conduși direct de King.

SELECT e.last_name, e.salary, job_title, city, country_name, k.last_name
FROM employees e JOIN employees k ON(e.manager_id = k.employee_id)
                 JOIN jobs j ON(e.job_id = j.job_id)
                 JOIN departments d ON (e.department_id = d.department_id)
                 JOIN locations l ON (d.location_id = d.location_id)
                 JOIN countries c ON (l.country_id = c.country_id)
WHERE INITCAP(k.last_name) LIKE 'King'; -- 14 colegi de departament


SELECT * FROM employees;


-----------------------------------------------------------------------------------------------
-- 4. Să se afișeze codul departamentului, numele departamentului, numele și job-ul
-- tuturor angajaților din departamentele al căror nume conţine şirul ‘ti’. De asemenea, se
-- va lista salariul angajaţilor, în formatul “$99,999.00”. Rezultatul se va ordona alfabetic
-- după numele departamentului, şi în cadrul acestuia, după numele angajaţilor.

SELECT d.department_id, department_name, job_id, last_name, to_char(salary,'$99,999.00')
FROM employees e JOIN departments d ON (e.department_id = d.department_id)
WHERE lower(department_name) like '%ti%'
ORDER BY department_name, last_name;


-----------------------------------------------------------------------------------------------
-- 5. Cum se poate implementa full outer join?
-- Obs: Full outer join se poate realiza fie prin reuniunea rezultatelor lui right outer join
-- şi left outer join, fie utilizând sintaxa specifică standardului SQL3.

-- varianta JOIN
SELECT DISTINCT last_name, department_name, location_id
FROM employees e FULL JOIN department d ON(e.department_id = d.department_id);

-- 106 + 1 + 16 = 123 (e raspunsul corect)

-- varianta cu operatori pe multimi

-- dorim sa afisam TOTI angajatii chiar daca au sau nu departament
SELECT last_name, department_name, location_id
FROM employees e LEFT JOIN departments d ON(e.department_id = d.department_id);


UNION -- elementele comune si necomnune luate o singura data
         -- scoate elementele care se repeta

-- dorim sa afisam TOATE departamentele chiar daca au sau nu angajati
SELECT last_name, department_name, location_id
FROM employees e RIGHT JOIN departments d ON(e.department_id = d.department_id);


-----------------------------------------------------------------------------------------------
-- 6. Se cer codurile departamentelor al căror nume conţine şirul “re” sau în care
-- lucrează angajaţi având codul job-ului “SA_REP”.
-- Cum este ordonat rezultatul?

-- operatori pe multimi
SELECT department_id
FROM departments
WHERE LOWER(department_name) LIKE '%re%' -- 40, 70, 120, 140, 150, 250, 260

UNION
-- 7. Ce se întâmplă dacă înlocuim UNION cu UNION ALL în comanda precedentă?
--UNION ALL -- le pune pe toate, nu elimina dublicatele

SELECT department_id
FROM employees
WHERE UPPER(job_id) like '%SA_REP%'; -- 80, NULL 

-- join clasic
SELECT DISTINCT d.department_id 
FROM employees e FULL JOIN departments d ON(e.department_id = d.department_id)
WHERE LOWER(department_name) LIKE '%re%' OR UPPER(job_id) LIKE '%SA_REP%'
ORDER BY 1;


-----------------------------------------------------------------------------------------------
-- 8. Să se obțină codurile departamentelor în care nu lucreaza nimeni (nu este introdus
-- nici un salariat în tabelul employees). Se cer două soluţii.
-- Obs: Operatorii pe mulţimi pot fi utilizaţi în subcereri. Coloanele care apar în clauza
-- WHERE a interogării trebuie să corespundă, ca număr şi tip de date, celor din clauza
-- SELECT a subcererii.

-- varianta 1 cu join

-- se afiseaza intersectia - elementele comune + toate departamentele (chiar daca au sau nu angajati)
SELECT *
FROM employees e RIGHT JOIN departments d ON(e.department_id = d.department_id); -- angajati care lucreaza si in departamente


-- codurile departamentelor în care nu lucreaza nimeni
SELECT d.department_id -- pentru ca in d - department_id este cheie primara si nu poate fi null
FROM employees e RIGHT JOIN departments d ON(e.department_id = d.department_id)
WHERE e.employee_id IS NULL;
-- sau
-- WHERE e.department_id IS NULL

-- !!!!!!!!!!!!!!!! varianta 2 este cu MINUS (se doreste acelasi numar de coloane) (coloanele pot corespunde ca tip)
SELECT department_id "Cod departament"
FROM departments    -- din lista tuturor departamentelor (department_id este cheie primara)

MINUS   -- scadem/eliminam

SELECT department_id
FROM employees;     -- departamentele in care lucreaza angajatii (department_id este cheie externa)

--> obtinem departamentele fara angajati
-- DATA VIITOARE -> subcereri


--#######################################################################################--

-- Laborator 5 saptamana 6  25.03.2020 (Continuare LABORATOR 3 de pe site)

-------------------------------------------------------------------------------------------

-- 10. Folosind subcereri, să se afişeze numele şi data angajării pentru salariaţii care au
-- fost angajaţi după Gates.

SELECT last_name, hire_date
FROM employees
WHERE hire_date > (SELECT hire_date
                    FROM employees
                    WHERE INITCAP(last_name)='Gates'
                    -- subcerere prin care preluam data angajarii lui Gates
                    );


-------------------------------------------------------------------------------------------
-- 11. Folosind subcereri, scrieţi o cerere pentru a afişa numele şi salariul pentru toţi
-- colegii (din acelaşi departament) lui Gates. Se va exclude Gates.
-- Se poate înlocui operatorul IN cu = ???

-- subcerere nesincronuzata care determina id-ul de departament pentru angajtaul cu numele Gates
select department_id
from employees
where initcap(last_name) = 'Gates';

-- cererea principala
select last_name, salary
from employees
-- si aici il putem folosi pe IN 
-- (e de preferat, pentru ca se poate folosi in amble cazuri - cand returneaza o linie sau mai multe)
where department_id = ( select department_id
                        from employees
                        where initcap(last_name) = 'Gates'
                      )
    and initcap(last_name) != 'Gates';

-- Se va inlocui Gates cu King
select last_name, salary
from employees
where department_id IN ( select department_id
                        from employees
                        where initcap(last_name) = 'King'
                      )
    and initcap(last_name) != 'King';
    
--> se poate inlocui operatorul = cu IN (NU SI INVERS!)


-------------------------------------------------------------------------------------------
-- 12. Folosind subcereri, să se afişeze numele şi salariul angajaţilor conduşi direct de
-- preşedintele companiei (acesta este considerat angajatul care nu are manager).

-- subcerere prin care selectam angajatul care este manager
select employee_id
from employees
where manager_id is null;

-- cererea principala
select last_name, salary
from employees
where manager_id = ( select employee_id
                     from employees
                     where manager_id is null
                   );

-- metoda cu self join
from employees e join employees sef on (e.manager_id = sef.employee_id)


-------------------------------------------------------------------------------------------
-- 13. Scrieți o cerere pentru a afişa numele, codul departamentului și salariul
-- angajaților al căror cod de departament și salariu coincid cu codul departamentului și
-- salariul unui angajat care câștigă comision.

SELECT last_name, department_id, salary
FROM employees
WHERE (department_id, salary) IN ( SELECT department_id, salary
                                   FROM employees
                                   WHERE commission_pct is not null
                                 );
     
                                
-------------------------------------------------------------------------------------------
-- 14. Să se afișeze codul, numele și salariul tuturor angajaților al căror salariu este mai
-- mare decât salariul mediu.

SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary)
                FROM employees);
                
                
-------------------------------------------------------------------------------------------
-- 15. Scrieti o cerere pentru a afișa angajații care câștigă (salariul plus comision) mai mult
-- decât oricare funcționar (job-ul conţine şirul “CLERK”). Sortați rezultatele dupa salariu,
-- în ordine descrescătoare.

select id_job;
from employees;

upper(job_id) like 'CLERK'

-- subcerere prin care selectam venitul pe care il au functionarii - %CLERK%
select max(salary + salary * nvl(commission_pct, 0))
from employees
where upper(job_id) like '%CLERK%';

-- !!!!!!!!!!!!!!!!!!!!!!!!!! -- DE VERIFICAT DATELE MEREU -- !!!!!!!!!!!!!!!!!!!!!!!!!! --

-- cererea principala
select *
from employees
where salary + salary * nvl(commission_pct, 0) > (select max(salary + salary + nvl(commission_pct, 0))
                                                  from employees
                                                  where upper(job_id) like '%CLERK%')
order by salary desc;

-- varianta 2
select *
from employees
where salary + salary * nvl(commission_pct, 0) > ALL (select max(salary + salary + nvl(commission_pct, 0))
                                                      from employees
                                                      where upper(job_id) like '%CLERK%')
order by salary desc;

-- " > ANY " -> mai mare ca orici element 
-- (este suficient sa fie mai mare decat salariul unui singur angajat <=> mai mare decat minimul)
-- " > ALL " -> mai mare ca tot
-- (inseamna mai mare decat salariul oricarui functionar <=> mai mare decat maximul)


-------------------------------------------------------------------------------------------
-- 16. Scrieţi o cerere pentru a afişa numele angajatilor, numele departamentului şi
-- salariul angajaţilor care nu câştigă comision, dar al căror şef direct câştigă comision.

SELECT last_name, department_name, salary
FROM employees e JOIN departments d USING (department_id)
WHERE commission_pct is null and
      e.manager_id IN ( SELECT employee_id
                        FROM employees
                        WHERE commission_pct is not null
                      );
--> nu exista un rezultat pentru ca nu avem date
 
-------------------------------------------------------------------------------------------
-- 17. Să se afișeze numele angajatilor, departamentul, salariul şi job-ul tuturor
-- angajaților al căror salariu și comision coincid cu salariul și comisionul unui angajat din
-- Oxford.

SELECT last_name, department_id, salary, job_id, employee_id
FROM employees
WHERE (nvl(commission_pct, -1), salary) IN ( SELECT nvl(commission_pct, -1), salary    
                                             FROM employees e JOIN departments d ON (e.department_id = d.department_id)
                                             JOIN locations l ON (l.location_id = d.location_id)
                                             WHERE initcap(l.city)='Oxford'
                                            );


----------------------------------- LABORATOR 4 -------------------------------------------

create table grupare (id number(5) not null,
                      nume varchar2(10) not null,
                      salariu number(10) not null,
                      manager_id number(5) not null);
                      
select * from grupare;

insert into grupare values (1, 'user1', 1000, 1);

insert into grupare values (2, 'user2', 1400, 1);

insert into grupare values (3, 'user3', 700, 2);

insert into grupare values (4, 'user4', 300, 2);

insert into grupare values (5, 'user5', 1600, 2);

insert into grupare values (6, 'user6', 1200, 2);

commit;

-- exemplu folosind clauza where
select *
from grupare
where salariu < 1100;

-- exemplu folosind where si grupare
select manager_id, salariu
from grupare
where salariu < 1100
group by manager_id, salariu;

-- exemplu folosind where, iar gruparea realizata doar dupa coloana manager_id
select manager_id
from grupare
where salariu < 1100
group by manager_id;

-- exemplu folosind having
select max(salariu)
from grupare
having max(salariu) < 10000;

-- group by si having
select manager_id, min(salariu)
from grupare
group by manager_id
having min(salariu) <= 1000;

-- 1. where
-- 2. group by
-- 3. having 

drop table grupare;


-------------------------------------------------------------------------------------------
-- 2. Să se afişeze cel mai mare salariu, cel mai mic salariu, suma şi media salariilor
-- TUTUROR angajaţilor. Etichetaţi coloanele Maxim, Minim, Suma, respectiv Media. Sa se
-- rotunjeasca media salariilor.

SELECT MAX(salary) Maxim, MIN(salary) Minim, SUM(salary) Suma, AVG(salary) Medie
FROM employees;


-------------------------------------------------------------------------------------------
-- 3. Să se modifice problema 2 pentru a se afişa minimul, maximul, suma şi media
-- salariilor pentru FIECARE job.

SELECT job_id, MAX(salary) Maxim, MIN(salary) Minim, SUM(salary) Suma, AVG(salary) Medie
FROM employees
GROUP BY job_id;


-------------------------------------------------------------------------------------------
-- 4. Să se afişeze numărul de angajaţi pentru FIECARE departament.

SELECT COUNT(*), department_id
FROM employees
GROUP BY department_id;

-- daca un departament nu are angajati dorim sa afisam id-ul depart si zero
-- right join -> luam toate departamentele chiar daca au sau nu angajati
SELECT COUNT(employee_id), d.department_id
FROM employees e right join departments d on (e.department_id = d.department_id)
GROUP BY d.department_id;

count(expresie) -> returneaza numarul de linii pentru care expresia data NU ARE valoarea null

count(*) -> NU IGNORA valorile null (adica ia in considerare toate liniile)


-------------------------------------------------------------------------------------------
-- 5. Să se determine numărul de angajaţi care sunt şefi. Etichetati coloana “Nr.
-- manageri”.
-- ? De ce am folosit cuvântul cheie DISTINCT? Ce am fi obţinut dacă îl omiteam?

select count(distinct manager_id)
from employees;


-------------------------------------------------------------------------------------------
-- 6. Să se afişeze diferenţa dintre cel mai mare si cel mai mic salariu. Etichetati
-- coloana “Diferenta”.


--------------------------------------- TEMA ----------------------------------------------

-- Laborator 3 -> ex: 18 + Laborator 4 -> ex: 9 (0.5pct) -> primele 3 surse
-- Laborator 4 -> ex: 8, 10, 12, 13, 14 (Bonus la final) 

-------------------------------------------------------------------------------------------
-- 18. Să se afişeze numele angajaţilor, codul departamentului şi codul job-ului
-- salariaţilor al căror departament se află în Toronto.

SELECT e.last_name, d.department_id, e.job_id
FROM employees e JOIN departments d ON (e.department_id = d.department_id)
                 JOIN locations l ON (l.location_id = d.location_id)
WHERE initcap(l.city)='Toronto';


-------------------------------------------------------------------------------------------
-- 9. Pentru fiecare şef, să se afişeze codul său şi salariul celui mai prost platit
-- subordonat. Se vor exclude cei pentru care codul managerului nu este cunoscut. De
-- asemenea, se vor exclude grupurile în care salariul minim este mai mic de 1000$.
-- Sortaţi rezultatul în ordine descrescătoare a salariilor.

SELECT manager_id "ID Manager", MIN(salary) "Salariu minim"
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) >= 1000
ORDER BY 2 DESC;


-------------------------------------------------------------------------------------------
-- 8. Să se afişeze codul şi numele angajaţilor care au salariul mai mare decât salariul
-- mediu din firmă. Se va sorta rezultatul în ordine descrescătoare a salariilor.

SELECT employee_id, first_name, last_name
FROM employees
WHERE salary > (SELECT AVG(salary)
                FROM employees)
ORDER BY salary DESC; 


-------------------------------------------------------------------------------------------
-- 10. Pentru departamentele in care salariul maxim depăşeşte 3000$, să se obţină codul,
-- numele acestor departamente şi salariul maxim pe departament.

SELECT d.department_id "ID Departament", d.DEPARTMENT_NAME "Nume Departament", MAX(e.salary) "Salariu maxim"
FROM employees e, departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING MAX(e.salary) > 3000;


-------------------------------------------------------------------------------------------
-- 12. Să se afişeze maximul salariilor medii pe departamente.

SELECT MAX(ROUND(AVG(salary))) "Maximul salariilor medii"
FROM employees
GROUP BY department_id;


-------------------------------------------------------------------------------------------
-- 13. Sa se obtina codul, titlul şi salariul mediu al job-ului pentru care salariul mediu
-- este minim. 

SELECT j.job_id "Cod job", j.job_title "Titlu job", ROUND(AVG(e.salary)) "Salariul mediu"
FROM employees e, jobs j
WHERE e.job_id = j.job_id
GROUP BY j.JOB_ID, j.job_title
HAVING ROUND(AVG(e.salary)) = ( SELECT MIN(ROUND(AVG(salary)))
                                FROM employees
                                GROUP BY job_id
                              );


-------------------------------------------------------------------------------------------
-- 14. Să se afişeze salariul mediu din firmă doar dacă acesta este mai mare decât 2500.
-- (clauza HAVING fără GROUP BY)

SELECT ROUND(AVG(salary)) "Salariul mediu din firmă"
FROM employees
HAVING ROUND(AVG(salary)) > 2500;


--#######################################################################################--

-- Laborator 6 saptamana 7  25.03.2020 (LABORATOR 4 de pe site)

-------------------------------------------------------------------------------------------

-- 16. Sa se afiseze codul, numele departamentului si numarul de angajati care
-- lucreaza in acel departament pentru:
-- a) departamentele in care lucreaza mai putin de 4 angajati;

SELECT e.department_id, d.department_name, COUNT(*)
FROM employees e JOIN departments d ON (d.department_id = e.department_id )
GROUP BY e.department_id, d.department_name
HAVING COUNT(*) < 4;

-- * înlocuit cu employee_id
SELECT e.department_id, d.department_name, COUNT(employee_id)
FROM employees e JOIN departments d ON (d.department_id = e.department_id )
GROUP BY e.department_id, d.department_name
HAVING COUNT(employee_id) < 4;

-- vrem să afișăm și departamentele care au zero angajați
SELECT d.department_id, d.department_name, COUNT(employee_id)
FROM employees e RIGHT JOIN departments d ON (d.department_id = e.department_id )
GROUP BY d.department_id, d.department_name
HAVING COUNT(employee_id) < 4;

-- Sau: (subcerere nesicronizată)
SELECT e.department_id, d. department_name, COUNT(employee_id)
FROM departments d JOIN employees e ON (d.department_id = e.department_id )
WHERE e.department_id IN ( SELECT department_id
                           FROM employees
                           GROUP BY department_id
                           HAVING COUNT(employee_id) < 4 
                         )
GROUP BY e.department_id, d.department_name;

-- NOT IN și valorile null
SELECT e.department_id, d. department_name, COUNT(employee_id)
FROM departments d JOIN employees e ON (d.department_id = e.department_id )
WHERE e.department_id NOT IN ( SELECT department_id
                           FROM employees
                           WHERE department_id IS NOT NULL
                           GROUP BY department_id
                           HAVING COUNT(employee_id) < 4 
                         )
GROUP BY e.department_id, d.department_name;

-- !!!Antenție!!! la compararea cu NULL atunci când se utiliează NOT IN

-- putem elimina valorile NULL cu ajutorul unei condiții sau putem înlocui valorile NULL cu o altă valoare
SELECT e.department_id, d.department_name, COUNT(employee_id)
FROM departments d JOIN employees e ON (d.department_id = e.department_id )
WHERE e.department_id NOT IN ( SELECT nvl(department_id, 0)
                               FROM employees
                               GROUP BY department_id
                               HAVING COUNT(employee_id) < 4 
                             )
GROUP BY e.department_id, d.department_name;

-- b) departamentul care are numarul maxim de angajati
SELECT e.department_id, d.department_name, COUNT(employee_id)
FROM employees e JOIN departments d ON (d.department_id = e.department_id )
GROUP BY e.department_id, d.department_name
HAVING COUNT(employee_id) = ( SELECT MAX(COUNT(employee_id))
                              FROM employees
                              GROUP BY department_id 
                            );


-------------------------------------------------------------------------------------------
-- 17. Sa se afiseze salariatii care au fost angajati în aceeaşi zi a lunii în care cei mai
-- multi dintre salariati au fost angajati.

SELECT employee_id, last_name, TO_CHAR(hire_date, 'dd')
FROM employees
WHERE TO_CHAR(hire_date, 'dd') IN ( SELECT TO_CHAR(hire_date, 'dd')
                                    FROM employees
                                    GROUP BY TO_CHAR(hire_date, 'dd')
                                    HAVING COUNT(employee_id)=( SELECT MAX(COUNT(employee_id))
                                                                FROM employees
                                                                GROUP BY TO_CHAR(hire_date, 'dd')
                                                              )
                                  );

-- prima dată determinăm numărul maxim de angajați dintr-o zi a lunii
SELECT COUNT(employee_id), TO_CHAR(hire_date, 'dd')
FROM employees
GROUP BY TO_CHAR(hire_date, 'dd'); -- ziua 24

-- selectăm ziua lunii pentru care numărul de angajați este maxim
-- adică este egal cu numărul obținut în cererea anterioră
SELECT last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'dd') = ( SELECT TO_CHAR(hire_date, 'dd')
                                   FROM employees
                                   GROUP BY TO_CHAR(hire_date, 'dd')
                                   HAVING COUNT(employee_id) = ( SELECT MAX(COUNT(employee_id))
                                                                 FROM employees
                                                                 GROUP BY TO_CHAR(hire_date, 'dd')
                                                                )
                                 );
                                 
                                 
-------------------------------------------------------------------------------------------
-- 18. Să se obţină numărul departamentelor care au cel puţin 15 angajaţi.
-- count numara randurile
SELECT COUNT(COUNT(department_id))
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) >= 15;


-------------------------------------------------------------------------------------------
-- 19. Să se obţină codul departamentelor şi suma salariilor angajaţilor care lucrează în
-- acestea, în ordine crescătoare. Se consideră departamentele care au mai mult de
-- 10 angajaţi şi al căror cod este diferit de 30

SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id
HAVING COUNT(department_id) > 10 AND department_id <> 30
ORDER BY 2;

-- Sau: (sunt echivalente, dar varianta 2 este mai optima) De ce? -> pentru ca il eliminam din start departamenul 30
SELECT department_id, SUM(salary)
FROM employees
WHERE department_id <> 30
GROUP BY department_id
HAVING COUNT(department_id) > 10
ORDER BY 2 ASC;


-------------------------------------------------------------------------------------------
-- 20. Care sunt angajatii care au mai avut cel putin doua joburi?
SELECT employee_id, count(job_id)
FROM job_history
GROUP BY employee_id
HAVING COUNT(job_id) >= 2;


-------------------------------------------------------------------------------------------
--21. Să se calculeze comisionul mediu din firmă, luând în considerare toate liniile din
--tabel.

SELECT commission_pct
FROM employees;  

--Obs: Funcţiile grup ignoră valorile null (cu exceptia lui COUNT(*) - numara toate liniile). Prin urmare, instrucţiunea

SELECT AVG(commission_pct)
FROM employees; -- 0.22

-- va returna media valorilor pe baza liniilor din tabel pentru care există o valoare diferită
-- de null. Astfel, reiese că suma valorilor se împarte la numărul de valori diferite de null.
-- Calculul mediei pe baza tuturor liniilor din tabel se poate realiza utilizând funcţiile NVL,
--NVL2 sau COALESCE:

SELECT AVG(NVL(commission_pct, 0))
FROM employees; -- 0.07 (acesta este rezultatul cerut in exercitiu)

--O altă variantă este dată de o cerere de forma:

SELECT SUM(commission_pct)/COUNT(*) -- COUNT(*) ESTE NECESAR!
FROM employees; -- 0.07

SELECT SUM(commission_pct)/COUNT(employee_id)
FROM employees; -- 0.07, deoarece employee_id este cheie primara si este unica 
                -- => impartirea se realizeaza utilizand toate liniile din tabel
                
                
---------------------------------------DECODE----------------------------------------------

-- DECODE( value, if1, then1, if2, then2, ..., ifN, thenN, else);

-- 22. Scrieţi o cerere pentru a afişa job-ul, salariul total pentru job-ul respectiv pe
-- departamente si salariul total pentru job-ul respectiv pe departamentele 30, 50, 80.
-- Se vor eticheta coloanele corespunzător. Rezultatul va apărea sub forma de mai jos:

-- Job Dep30 Dep50 Dep80 Total
------------------------------------------------------------------------------

SELECT job_id, department_id, salary
FROM employees;


SELECT job_id, SUM(DECODE(department_id, 30, salary)) Dep30,
               SUM(DECODE(department_id, 50, salary)) Dep50,
               SUM(DECODE(department_id, 80, salary)) Dep80,
               SUM(salary) Total
FROM employees
GROUP BY job_id;


-- Metoda 2: (cu subcereri corelate în clauza SELECT)

SELECT job_id, (SELECT SUM(salary)
                FROM employees
                WHERE department_id = 30
                AND job_id = e.job_id) Dep30, 
                (SELECT SUM(salary)
                FROM employees
                WHERE department_id = 50
                AND job_id = e.job_id) Dep50, 
                (SELECT SUM(salary)
                FROM employees
                WHERE department_id = 80
                AND job_id = e.job_id) Dep80, 
                SUM(salary) Total
FROM employees e
GROUP BY job_id;


-------------------------------------------------------------------------------------------
-- V. [Exerciţii – subcereri în clauza FROM]
-- Obs: Subcererile pot apărea în clauza SELECT, WHERE sau FROM a unei cereri. O
-- subcerere care apare în clauza FROM se mai numeşte view in-line.

-- 24. Să se afişeze codul, numele departamentului şi suma salariilor pe departamente.

SELECT d.department_id, department_name, SUM(salary)
FROM departments d JOIN employees e on (d.department_id = e.department_id)
GROUP BY d.department_id, department_name;


-- varianta cu subcerere in FROM
SELECT d.department_id, department_name, a.suma
FROM departments d, ( SELECT department_id, SUM(salary) suma
                      FROM employees
                      GROUP BY department_id) a
WHERE d.department_id = a.department_id;


-------------------------------------------------------------------------------------------
-- 25. Să se afişeze numele, salariul, codul departamentului si salariul mediu din
-- departamentul respectiv.

-- subcerere in FROM
select last_name, salary, department_id, SalariuMediu
from employees join (select round(avg(salary)) SalariuMediu, department_id
                     from employees
                     group by department_id)
    using(department_id);


--subcerere in SELECT
select last_name, salary, department_id, (select round(avg(salary))
                                          from employees
                                          where e.department_id = department_id
                                          --group by department_id
                                          ) SalMediu
from employees e;


select last_name, salary, department_id
from employees;


--------------------------------------- TEMA ----------------------------------------------



-------------------------------------------------------------------------------------------
-- Ex1 : Sa se afiseze codul, numele departamentului si numarul de angajati care
-- lucreaza in acel departament pentru departamentul care are numarul minim de angajati.

SELECT e.department_id "Cod Departament", d.department_name "Departament", COUNT(employee_id) "Numar min angajati"
FROM employees e JOIN departments d ON (d.department_id = e.department_id )
GROUP BY e.department_id, d.department_name
HAVING COUNT(employee_id) = ( SELECT MIN(COUNT(employee_id))
                              FROM employees
                              GROUP BY department_id 
                            );


-------------------------------------------------------------------------------------------
-- Ex2 : Sa se afiseze numele, salariul, titlul jobului, departamentul, orasul si tara in care
-- lucreaza angajatii condusi direct de „hunoldalexander”.

SELECT last_name "Nume", salary "Salariu", (SELECT job_title 
                                            FROM jobs 
                                            WHERE job_id = e.job_id) "Titlu Jib", 
                                           
                                           (SELECT department_name 
                                            FROM departments 
                                            WHERE  department_id = e.department_id) "Departament",
                                            
                                           (SELECT city FROM locations
                                            WHERE (SELECT location_id
                                                   FROM departments
                                                   WHERE  department_id = e.department_id) = location_id) "Orasul",
                                            
                                            (SELECT country_name 
                                            FROM countries
                                            WHERE (SELECT country_id 
                                                   FROM locations 
                                                   WHERE (SELECT location_id
                                                          FROM departments 
                                                          WHERE  department_id = e.department_id) = location_id) = country_id) "Tara"
                                                    
FROM employees e
WHERE manager_id = (SELECT employee_id
                     FROM employees
                     WHERE CONCAT(LOWER(last_name), LOWER(first_name)) = 'hunoldalexander'
                    );


-------------------------------------------------------------------------------------------
-- Ex3 : Sa se afiseze numele, salariul, codul departamentului si salariul mediu din
-- departamentul respectiv.

SELECT last_name "Nume", salary "Salariu", department_id "Cod Departament", (SELECT ROUND(AVG(salary))
                                                                              FROM employees
                                                                              WHERE e.department_id = department_id) "Salariu Mediu"
FROM employees e;


-------------------------------------------------------------------------------------------
-- Ex4 : Sa se afiseze codul, numele departamentului si numarul de angajati pentru
-- departamentele care au numar minim de angajati.

-- nu imi dau seama ce e diferit fata de primul exercitiu

-------------------------------------------------------------------------------------------
-- Ex5 : Să se creeze o cerere prin care să se afişeze numărul total de angajaţi şi, din
-- acest total, numărul celor care au fost angajaţi în 1997, 1998, 1999 si 2000. Denumiti
-- capetele de tabel in mod corespunzator. (Laborator 4 – exercitiul 23)

SELECT employee_id, hire_date
FROM employees;

SELECT COUNT(employee_id) "Total", 
       COUNT(DECODE(TO_CHAR(hire_date, 'YYYY'), 1997, employee_id)) "Anul 1997",
       COUNT(DECODE(TO_CHAR(hire_date, 'YYYY'), 1998, employee_id)) "Anul 1998",
       COUNT(DECODE(TO_CHAR(hire_date, 'YYYY'), 1999, employee_id)) "Anul 1999",
       COUNT(DECODE(TO_CHAR(hire_date, 'YYYY'), 2000, employee_id)) "Anul 2000"
FROM employees;



