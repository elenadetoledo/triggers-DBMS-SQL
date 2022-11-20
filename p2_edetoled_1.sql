
CREATE OR REPLACE TRIGGER zipdept
BEFORE INSERT ON employee 
FOR EACH ROW
DECLARE n INTEGER;
BEGIN
    SELECT count(*) INTO n FROM employee WHERE homezipcode = :new.homezipcode AND deptid = :new.deptid;
    IF (n > 0)
    THEN raise_application_error(-20602,'Employees with same zipcode already work in same department'); 
    END IF; 
END;
/




