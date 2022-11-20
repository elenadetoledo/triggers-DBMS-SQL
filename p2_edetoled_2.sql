
CREATE OR REPLACE TRIGGER graduatetowork
BEFORE INSERT ON empproject
FOR EACH ROW
DECLARE counter NUMBER;
BEGIN
SELECT count(*) INTO counter FROM graduate WHERE graduate.empid = :NEW.empid AND gradyear IS NOT NULL;
IF (counter <= 0)
THEN RAISE_APPLICATION_ERROR(-20602,'No employee can start on a project before they graduate from University');
END IF;
END;
/
