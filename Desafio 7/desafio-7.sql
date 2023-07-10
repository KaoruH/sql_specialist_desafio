-- PARTE 1 - TRANSAÇÕES:

SET autocommit = 0;
START TRANSACTION;

INSERT INTO employee (Fname, Lname, Ssn)
 VALUES ('John', 'Doe', '123456789');
UPDATE department SET Mgr_ssn = '123456789' 
WHERE Dnumber = 1;

IF success = 0 THEN
    ROLLBACK;
ELSE
    COMMIT;
END IF;

SET autocommit = 1;

-- PARTE 2 - TRANSAÇÃO COM PROCEDURE:

DELIMITER $$

CREATE PROCEDURE procedure_transaction()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    
    START TRANSACTION;
    
    INSERT INTO employee (Fname, Lname, Ssn) VALUES ('John', 'Doe', '123456789');
    UPDATE department SET Mgr_ssn = '123456789' WHERE Dnumber = 1;
    
    COMMIT;
END$$

DELIMITER ;

-- PARTE 3 - BACKUP E RECOVERY:


