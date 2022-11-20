CREATE OR REPLACE TRIGGER t6
BEFORE INSERT ON empproject
FOR EACH ROW 
DECLARE empdept NUMBER; cursor z is SELECT E.deptid AS mdepartment FROM projectmanager M, employee E WHERE M.projid = :NEW.projid AND E.empid = M.mgrid AND  M.enddate is NULL;
m_proj z%rowtype;
BEGIN
SELECT deptid INTO empdept FROM employee WHERE empid = :new.empid;
open z;
fetch z into m_proj;
IF (m_proj.mdepartment <>empdept)
THEN RAISE_APPLICATION_ERROR(-20606,'No employee can work on a project managed by a manager who is not in the same department as the employee');
END IF;
close z;
END;
/
