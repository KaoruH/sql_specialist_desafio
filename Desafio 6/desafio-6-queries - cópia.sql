
CREATE VIEW num_employees_per_dept_loc AS
SELECT d.Dnumber, d.Dname, dl.Dlocation, COUNT(e.Ssn) AS num_employees
FROM department d
JOIN dept_locations dl ON d.Dnumber = dl.Dnumber
JOIN employee e ON d.Dnumber = e.Dno
GROUP BY d.Dnumber, d.Dname, dl.Dlocation;

CREATE VIEW dept_manager_list AS
SELECT d.Dnumber, d.Dname, e.Fname, e.Lname AS Manager
FROM department d
JOIN employee e ON d.Mgr_ssn = e.Ssn;


CREATE VIEW projects_with_most_employees AS
SELECT p.Pname, COUNT(w.Essn) AS num_employees
FROM project p
JOIN works_on w ON p.Pnumber = w.Pno
GROUP BY p.Pnumber
ORDER BY COUNT(w.Essn) DESC;

CREATE VIEW project_dept_manager AS
SELECT p.Pname, d.Dname, e.Fname, e.Lname AS Manager
FROM project p
JOIN department d ON p.Dnum = d.Dnumber
JOIN employee e ON d.Mgr_ssn = e.Ssn;


DELIMITER $$
CREATE TRIGGER before_remove_employee
BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
    INSERT INTO employee_history (Fname, Lname, Ssn, Action)
    VALUES (OLD.Fname, OLD.Lname, OLD.Ssn, 'DELETE');
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_update_employee
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    IF NEW.Salary > 100000 THEN
        SET NEW.Salary = 100000;
    END IF;
END $$
DELIMITER ;

