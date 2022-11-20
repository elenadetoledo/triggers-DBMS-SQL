
CREATE OR REPLACE TRIGGER t4
BEFORE INSERT ON empproject
    FOR EACH ROW
    DECLARE managerid NUMBER;
    cursor z is SELECT * FROM empproject WHERE empid = :new.empid;
    em_proj z%rowtype;
    BEGIN
    SELECT mgrid INTO managerid FROM projectmanager WHERE projid = :new.projid;
    DBMS_OUTPUT.PUT_LINE('Employee '||:NEW.empid||' wants to work in Project '||:new.projid||' supervised by '||managerid);
    open z;
    fetch z into em_proj;
    while z%found loop
        DBMS_OUTPUT.PUT_LINE('Current project:'||em_proj.projid);
        fetch z into em_proj;
    end loop;
    close z;
END;
/

