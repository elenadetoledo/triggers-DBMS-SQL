CREATE OR REPLACE TRIGGER t5
BEFORE INSERT OR UPDATE ON empproject
    FOR EACH ROW
    DECLARE cursor z is SELECT * FROM empproject WHERE empid = :new.empid AND projid = :new.projid;
    projects z%rowtype;
    BEGIN
    open z;
    fetch z INTO projects;
    WHILE z%found loop
        IF(:NEW.startdate < projects.enddate AND (:NEW.enddate > projects.startdate OR :NEW.enddate is NULL) )
            THEN RAISE_APPLICATION_ERROR(-20605,'No employee can work on the same project in overlapping periods');
        END IF;
        fetch z into projects;
    end loop;
    close z;
END;
/