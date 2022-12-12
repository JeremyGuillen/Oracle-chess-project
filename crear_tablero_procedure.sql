CREATE OR REPLACE PROCEDURE CREAR_TABLERO IS
    vEstado tableros.estado%TYPE := 'A';
BEGIN
    INSERT INTO tableros(estado) VALUES (vEstado);
    COMMIT;
END;
/