CREATE OR REPLACE PROCEDURE COMER_FICHA(pId_ficha NUMBER) IS
BEGIN
    update fichas set estado = 'M' where id_ficha = pId_ficha;
    COMMIT;
END;
/