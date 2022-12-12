CREATE OR REPLACE PROCEDURE CREAR_FICHA(vCoordenada_x NUMBER, vCoordenada_y NUMBER, vIdTablero Number, vIdJugador VARCHAR2, vTipoFicha char) IS
    vEstado Partidas.estado%type := 'V';
BEGIN
    INSERT INTO 
        FICHAS(coordenada_x, coordenada_y, estado, id_tablero, id_jugador, tipo_ficha)
        VALUES (vCoordenada_x, vCoordenada_y, vEstado, vIdTablero, vIdJugador, vTipoFicha);
    COMMIT;
END;
/