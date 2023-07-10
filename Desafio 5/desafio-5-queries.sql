
CREATE INDEX idx_employee_dno ON employee(Dno) USING HASH;
CREATE INDEX idx_dept_locations_dlocation ON dept_locations(Dlocation) USING HASH;
CREATE INDEX idx_employee_dno_ssn ON employee(Dno, Ssn) USING HASH;
ALTER TABLE department ADD INDEX idx_department_employees (Dnumber);
ALTER TABLE employee ADD INDEX idx_employee_salary (Salary DESC);
ALTER TABLE project ADD INDEX idx_project_location (Plocation);
ALTER TABLE dependent ADD INDEX idx_dependent_employee (Essn);
ALTER TABLE works_on ADD INDEX idx_works_on_employee (Essn);

SELECT Dno, COUNT(*) AS TotalEmployees
FROM employee
GROUP BY Dno
ORDER BY TotalEmployees DESC
LIMIT 1;

SELECT Dlocation, GROUP_CONCAT(DISTINCT Dname) AS Departments
FROM department
JOIN dept_locations ON department.Dnumber = dept_locations.Dnumber
GROUP BY Dlocation;

SELECT d.Dname, e.Fname, e.Lname
FROM department d
JOIN employee e ON d.Dnumber = e.Dno
ORDER BY d.Dname, e.Lname, e.Fname;

SELECT Dname, COUNT(*) AS TotalEmployees
FROM department
JOIN employee ON department.Dnumber = employee.Dno
GROUP BY Dname
ORDER BY TotalEmployees DESC
LIMIT 1;

SELECT Dname, Dlocation
FROM department
JOIN dept_locations ON department.Dnumber = dept_locations.Dnumber;

SELECT department.Dname, employee.Fname, employee.Lname
FROM department
JOIN employee ON department.Dnumber = employee.Dno
ORDER BY department.Dname;


delimiter \\
create procedure procedure_insert_project(
    in pname_p varchar(15),
    in pnumber_p int,
    in plocation_p varchar(15),
    in dnum_p int,
    in action_p int
)
begin
    create temporary table temp_project as select * from project where 1=0;
    
    case action_p
        when 1 then
            -- Ação 1: Select
            insert into temp_project select * from project where Pnumber = pnumber_p;
        when 2 then
            -- Ação 2: Update
            update project set
                Pname = pname_p,
                Plocation = plocation_p,
                Dnum = dnum_p
            where Pnumber = pnumber_p;
            insert into temp_project select * from project where Pnumber = pnumber_p;
        when 3 then
            -- Ação 3: Delete
            delete from project where Pnumber = pnumber_p;
    end case;
    
    select * from temp_project;
    drop table temp_project;
end \\
delimiter ;

call procedure_insert_project('ProductX', 1, 'Bellaire', 5, 1);
