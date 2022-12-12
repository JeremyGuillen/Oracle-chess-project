CREATE OR REPLACE PROCEDURE CREAR_PARTIDA(vid_jugador1 VARCHAR2, vid_jugador2 VARCHAR2, vid_tablero Number) IS
    vFecha Date;
    vEstado Partidas.estado%type := 'A';
BEGIN
    SELECT SYSDATE INTO vFecha from dual;
    INSERT INTO partidas(id_jugador1, id_jugador2, id_tablero, fecha, estado) VALUES (vid_jugador1, vid_jugador2, vid_tablero, vFecha, vEstado);
    COMMIT;
END;
/