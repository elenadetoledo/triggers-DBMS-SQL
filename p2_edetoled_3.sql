
CREATE OR REPLACE TRIGGER t3
AFTER UPDATE OF deptid ON employee --algo de q es before update
    FOR EACH ROW
    DECLARE olddepartment VARCHAR2(40 BYTE);newdepartment VARCHAR2(40 BYTE) ;
    BEGIN
    SELECT deptid INTO olddepartment FROM department WHERE deptid = :new.deptid;
    SELECT deptid INTO newdepartment FROM department WHERE deptid = :old.deptid;
    IF (olddepartment <> newdepartment)
    THEN DBMS_OUTPUT.PUT_LINE('Employee '||:NEW.empname ||' old department: '||olddepartment);
    END IF;
END;
/




