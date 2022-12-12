CREATE OR REPLACE PROCEDURE MOVER_FICHA(idFicha NUMBER, pCoordenada_x NUMBER, pCoordenada_y NUMBER) is
BEGIN
    update fichas set coordenada_x = pCoordenada_x, coordenada_y = pCoordenada_y where id_ficha = IdFicha;
    COMMIT;
END;

/