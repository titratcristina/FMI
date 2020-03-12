 select * from employees;
 
 select * from departments; 
 
 select * from jobs;
 
 select * from job_history;
 
 desc employees;
 
 cheia primara este o coloana sau o combinatie de coloane
               este unica nu se repeta
               nu poate fi null
               
cheia externa este o coloana
              poate fi null
              daca se afla intr-un tabel  atunci se afla si in tabelul pe care il refera
              se poate repeta
              
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

ex 6 S? se afi?eze numele concatenat cu job_id-ul, separate prin virgula ?i spatiu. Eticheta?i
coloana �Angajat si titlu�.

operatorul de concatenare -> ||

select last_name || ' , ' || job_id as "angajat si titlu"
from employees;

7. Sa se listeze numele si salariul angaja?ilor care c�?tig? mai mult de 2850.

SELECT last_name, salary
FROM employees
WHERE salary > 2850;

9. S? se modifice cererea de la problema 7 pentru a afi?a numele ?i salariul angaja?ilor
al c?ror salariu nu se afl? �n intervalul [1500, 2850].

SELECT last_name, salary
FROM employees
WHERE salary not between 1500 and 2850;

SELECT last_name, salary
FROM employees
WHERE salary >= 1500 and salary <= 2850;

-- LAB 2 W3 04.03.2020 --

11. Să se afişeze numele salariaţilor şi codul departamentelor pentru toti angajaţii din
departamentele 10 şi 30 în ordine alfabetică a numelor.

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

12. Să se modifice cererea de la problema 11 pentru a lista numele şi salariile angajatilor
care câştigă mai mult de 1500 şi lucrează în departamentul 10 sau 30. Se vor eticheta
coloanele drept Angajat si Salariu lunar. 

SELECT last_name "Angajat", salary "Salariul lunar"
FROM employees
WHERE DEPARTMENT_ID IN (10, 30) and salary > 1500
ORDER BY last_name;

13. Care este data curentă? Afişaţi diferite formate ale acesteia.

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


14. Să se afișeze numele şi data angajării pentru fiecare salariat care a fost angajat în
1987. Se cer 2 soluţii: una în care se lucrează cu formatul implicit al datei şi alta prin
care se formatează data.

--Varianta1:
SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE hire_date LIKE '%87%';
--WHERE hire_date LIKE ('%87%');

-- %X% -> abcXaaaabbbcc
--  X% -> Xabcaaabbbccc
-- %X  -> abcaaaabbbccX

--Varianta 2:
SELECT LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(hire_date, 'YYYY') = '1987';

-- face conversie automata daca nu are ghilimele

DESC employees; -- DESCRIE TIPUL DE DATE DIN TABELE


15. Să se afişeze numele şi job-ul pentru toţi angajaţii care nu au manager.

SELECT * FROM EMPLOYEES;

SELECT LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

16. Să se afișeze numele, salariul și comisionul pentru toti salariații care câștigă comision.
Să se sorteze datele în ordine descrescătoare a salariilor și comisioanelor.

SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

-- dupa prima ordonare daca elementele sunt egale atunci ordoneaza dupa al doilea criteriu

17. Eliminaţi clauza WHERE din cererea anterioară. Unde sunt plasate valorile NULL în
ordinea descrescătoare?

SELECT last_name, salary, commission_pct
FROM employees
--WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

-- daca exista valori null in ord desc il pune primul (e considerat cel mai mare)
-- in ordine cresc null e considerat cel mai mic

18. Să se listeze numele tuturor angajatilor care au a treia literă din nume ‘A’.
Obs: Pentru compararea şirurilor de caractere, împreună cu operatorul LIKE se utilizează
caracterele wildcard:
➢ % - reprezentând orice şir de caractere, inclusiv şirul vid;
➢ _ (underscore) – reprezentând un singur caracter şi numai unul.

SELECT last_name
FROM employees
--WHERE last_name LIKE ('__A%'); nu se gasesc angajati xu XxA ci doar Xxa
--WHERE last_name LIKE ('__a%');
--WHERE UPPER(last_name) LIKE ('__A%');
--WHERE LOWER(last_name) LIKE ('__a%');
WHERE INITCAP(last_name) LIKE ('__a%');

19. Să se listeze numele tuturor angajatilor care au cel putin 2 litere ‘L’ in nume şi
lucrează în departamentul 30 sau managerul lor este 102.

SELECT last_name, department_id, manager_id
FROM employees
WHERE UPPER(last_name) LIKE '%L%L%' AND department_id = 30 or manager_id = 102;


20. Să se afiseze numele, job-ul si salariul pentru toti salariatii al caror job conţine şirul
“CLERK” sau “REP” și salariul nu este egal cu 1000, 2000 sau 3000 $. (operatorul
NOT IN).

SELECT last_name, job_id, salary
FROM employees
WHERE (job_id LIKE '%CLERK%' OR job_id LIKE '%REP%') AND salary NOT IN (1000, 2000, 3000);


-- LABORATORUL 2 --

SELECT TO_NUMBER ('-25.789', 99.999) -- = -25.789
FROM dual;

-- LENGTH(string) incepe de la 1 :)

SELECT RPAD (LOWER('InfO'), 7, 'X')
FROM DUAL;


2. Scrieţi o cerere prin care să se afişeze prenumele salariatului cu prima litera majusculă
şi toate celelalte litere minuscule, numele acestuia cu majuscule şi lungimea
numelui, pentru angajaţii al căror nume începe cu J sau M sau care au a treia literă din
nume A. Rezultatul va fi ordonat descrescător după lungimea numelui. Se vor eticheta
coloanele corespunzător. Se cer 2 soluţii (cu operatorul LIKE şi funcţia SUBSTR).

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


3. Să se afişeze, pentru angajaţii cu prenumele „Steven”, codul şi numele acestora, precum
şi codul departamentului în care lucrează. Căutarea trebuie să nu fie case-sensitive, iar
eventualele blank-uri care preced sau urmează numelui trebuie ignorate.
---
SELECT ...
FROM ...
WHERE LTRIM(RTRIM(UPPER(first_name)))='STEVEN';
sau
SELECT ...
FROM ...
WHERE TRIM(BOTH FROM UPPER(first_name))='STEVEN';
---

4. Să se afişeze pentru toţi angajaţii al căror nume se termină cu litera 'e', codul, numele,
lungimea numelui şi poziţia din nume în care apare prima data litera 'A'. Utilizaţi alias-uri
corespunzătoare pentru coloane

SELECT EMPLOYEE_ID, LAST_NAME, LENGTH(LAST_NAME) "Lungime",
    --instr(string, 'ch', start, n) PozitieLitera
      instr(upper(last_name, 'A', 1, 1) PozitieLitera
FROM EMPLOYEES
WHERE substr(last_name, -1) = 'e';


9. Să se afişeze numărul de zile rămase până la sfârşitul anului.

select round(to_date('31-12-2020', 'dd-mm-yyyy') - sysdate, 3)
from dual;


-- dada nasterii sa vezi cate zile ai trait
-- tema ex 5

5. Să se afişeze detalii despre salariaţii care au lucrat un număr întreg de săptămâni până
la data curentă.
Obs: Soluția necesită rotunjirea diferenței celor două date calendaristice. De ce este necesar
acest lucru?

SELECT * FROM employees;

SELECT first_name, last_name
WHERE round(SYSDATE - TO_DATE(hire_date, 'dd-mm-yyyy')) / 7 =  SYSDATE - TO_DATE(hire_date, 'dd-mm-yyyy') / 7
FROM employees;

SELECT first_name, last_name
FROM employees
WHERE (SYSDATE - hire_date) / 7 = round((SYSDATE - hire_date ) / 7, 2);

SELECT round((SYSDATE - hire_date ) / 7, 2)
FROM employees;

--- LAB 3 W4 ---

SELECT last_name
FROM employees
WHERE MOD(ROUND(sysdate - hire_date), 7) = 0;


6. Să se afişeze codul salariatului, numele, salariul, salariul mărit cu 15%, exprimat cu
două zecimale şi numărul de sute al salariului nou rotunjit la 2 zecimale. Etichetaţi
ultimele două coloane “Salariu nou”, respectiv “Numar sute”. Se vor lua în considerare
salariaţii al căror salariu nu este divizibil cu 1000. 

SELECT employee_id, last_name, salary, ROUND(salary * 1.15, 2) "Salariu nou",
        ROUND(salary * 1.15/100, 2) "Numar sute"
FROM employees
WHERE MOD(salary, 1000) != 0;
--WHERE MOD(salary, 1000) <> 0;
--WHERE MOD(salary, 1000) ^= 0;

--salary + salary * 0.15 -> salary * 1.15

7. Să se listeze numele şi data angajării salariaţilor care câştigă comision. Să se
eticheteze coloanele „Nume angajat”, „Data angajarii”. Utilizaţi funcţia RPAD pentru a
determina ca data angajării să aibă lungimea de 20 de caractere.

SELECT last_name "Nume angajat", RPAD(hire_date, 20, 'X') "Data angajarii"
FROM employees
WHERE commission_pct IS NOT NULL;

8. Să se afişeze data (numele lunii, ziua, anul, ora, minutul si secunda) de peste 30 zile.
SELECT TO_CHAR(SYSDATE+30, ‘MONTH DD YYYY HH24:MI:SS’) “Data”
FROM DUAL;

SELECT TO_CHAR(SYSDATE + 30, 'MONTH DD YYYY HH24:MI:SS') DATA
FROM DUAL;


10. a) Să se afişeze data de peste 12 ore.
SELECT TO_CHAR(SYSDATE+12/24, ‘ DD/MM HH24:MI:SS’) “Data”
FROM DUAL;
 b) Să se afişeze data de peste 5 minute
Obs: Cât reprezintă 5 minute dintr-o zi?

-- 12/24 <=> 1/2
select to_char(sysdate + 12/24, 'DD/MM HH24:MI:SS') DATA
from dual;

select to_char(sysdate + (5/60) / 24, 'DD/MM HH24:MI:SS') DATA
from dual;

1h ... 60m
 x ...  5m -> 5/60 -> in raport cu ora
 
(5/60) / 24 -> in raport cu ziua

11. Să se afişeze numele şi prenumele angajatului (într-o singură coloană), data angajării şi
data negocierii salariului, care este prima zi de Luni după 6 luni de serviciu. Etichetaţi
această coloană “Negociere”;

SELECT concat(last_name, first_name), hire_date, NEXT_DAY(ADD_MONTHS(hire_date, 6), 'monday') "Negociere"
FROM employees;

12. Pentru fiecare angajat să se afişeze numele şi numărul de luni de la data angajării.
Etichetaţi coloana “Luni lucrate”. Să se ordoneze rezultatul după numărul de luni lucrate.
Se va rotunji numărul de luni la cel mai apropiat număr întreg.

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

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
13. Să se afişeze numele angajaţilor şi comisionul. Dacă un angajat nu câştigă comision, să
se scrie “Fara comision”. Etichetaţi coloana “Comision”.

SELECT last_name, NVL(to_char(commission_pct), 'Fara Comision') "Comision"
FROM employees;



14. Să se listeze numele, salariul şi comisionul tuturor angajaţilor al căror venit lunar
(salariu + valoare comision * salariu) depăşeşte 10 000;

SELECT last_name, salary, commission_pct
FROM employees
WHERE salary + salary * commission_pct > 10000;

!!!!!!!!!!!!!!!!!!!!!
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

15. Să se afişeze numele, codul functiei, salariul şi o coloana care să arate salariul după
mărire. Se ştie că pentru IT_PROG are loc o mărire de 10%, pentru ST_CLERK 15%, iar
pentru SA_REP o mărire de 20%. Pentru ceilalti angajati nu se acordă mărire. Să se
denumească coloana "Salariu renegociat";


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

16. Să se afişeze codul angajatilor şi numele departamentului pentru toţi angajaţii.

I. Condiția de Join este scrisă în clauza WHERE a instrucțiunii SELECT;


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


-- saptamana viitoare --
II. Condiția de Join este scrisă în FROM
Utilizăm ON:;

select employee_id, department_name
from employees e join departments d on (e.department_id = d.department_id);

Utilizăm USING – atunci când avem coloane cu același nume:

select employee_id,department_name
from employees e join departments d using(department_id);
Ce observați având în vedere numărul de rânduri returnate?

EMP (#ID, NUME, DEPID)
DEP (#ID, NUMEDEP)

17. Să se listeze codurile și denumirile job-urilor care există în departamentul 30;

SELECT e.job_id, job_title
FROM jobs j, employees e
WHERE department_id = 30 and e.job_id = j.job_id;


18. Să se afişeze numele angajatului, numele departamentului şi id-ul locației pentru toţi
angajaţii care câştigă comision.

SELECT last_name, department_name, location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id AND commission_pct is not null ;

19. Să se afişeze numele angajatului, titlul job-ului şi denumirea departamentului pentru toţi angajaţii
care lucrează în Oxford.

SELECT last_name, job_title, department_name
FROM employees e, jobs j, departments d, locations l
WHERE e.job_id = j.job_id and
      e.department_id = d.department_id and
      d.location_id = l.location_id and
      initcap(l.city) = 'Oxford';
      
20. Să se afişeze codul angajatului şi numele acestuia, împreună cu numele şi codul
şefului său direct. Se vor eticheta coloanele Ang#, Angajat, Mgr#, Manager.;

-- self join cand vorbin de acelasi lucru

SELECT ang.employee_id Ang#, ang.last_name Angajat, sef.employee_id Mgr#, sef.last_name Manager
FROM employees ang, employees sef
WHERE ang.manager_id = sef.employee_id;

select * from employees;

SELECT ang.employee_id Ang#, ang.last_name Angajat, sef.employee_id Mgr#, sef.last_name Manager
FROM employees ang, employees sef
WHERE ang.manager_id = sef.employee_id (+);

22. Scrieţi o cerere care afişează numele angajatului, codul departamentului în care
acesta lucrează şi numele colegilor săi de departament. Se vor eticheta coloanele
corespunzător.

select ang.last_name, ang.department_id, coleg.last_name
from employees ang, employees coleg
where ang.department_id = coleg.department_id
      and ang.employee_id > coleg.employee_id; -- am eliminat dublicatele 
      

24. Să se afişeze numele şi data angajării pentru salariaţii care au fost angajaţi după Gates.
WHERE e.hire_date > gates.hire_date AND ________; 

SELECT ang.last_name, ang.hire_date, gates.hire_date, gates.last_name
FROM employees ang, employees gates
WHERE ang.hire_date > gates.hire_date and initcap(gates.last_name) = 'Gates';


-- tema 23, 25


