CREATE OR REPLACE PROCEDURE INICIAR_PARTIDA(vJugador1 VARCHAR2, vJugador2 VARCHAR2) IS
    vIdTablero NUMBER;
    vCoordenadaX NUMBER := 1;
BEGIN
    CREAR_TABLERO();
    select id_tablero into vIdTablero from (select * from tableros order by id_tablero DESC) where ROWNUM = 1;
    CREAR_PARTIDA(vJugador1, vJugador2, vIdTablero);

    -- CREANDO FICHAS PARA EL JUGADOR 1
    -- TORRES
    CREAR_FICHA(1, 8, vIdTablero, vJugador1, 'T');
    CREAR_FICHA(8, 8, vIdTablero, vJugador1, 'T');
    -- CABALLOS
    CREAR_FICHA(2, 8, vIdTablero, vJugador1, 'C');
    CREAR_FICHA(7, 8, vIdTablero, vJugador1, 'C');
    -- ALFILES
    CREAR_FICHA(3, 8, vIdTablero, vJugador1, 'A');
    CREAR_FICHA(6, 8, vIdTablero, vJugador1, 'A');
    -- REINA
    CREAR_FICHA(4, 8, vIdTablero, vJugador1, 'D');
    -- REY
    CREAR_FICHA(5, 8, vIdTablero, vJugador1, 'R');
    -- CREAR PEONES
    FOR i IN  1..8
    LOOP
        CREAR_FICHA(i, 7, vIdTablero, vJugador1, 'P');
    END LOOP;

    -- CREANDO FICHAS PARA EL JUGADOR 2
    -- TORRES
    CREAR_FICHA(1, 1, vIdTablero, vJugador2, 'T');
    CREAR_FICHA(8, 1, vIdTablero, vJugador2, 'T');
    -- CABALLOS
    CREAR_FICHA(2, 1, vIdTablero, vJugador2, 'C');
    CREAR_FICHA(7, 1, vIdTablero, vJugador2, 'C');
    -- ALFILES
    CREAR_FICHA(3, 1, vIdTablero, vJugador2, 'A');
    CREAR_FICHA(6, 1, vIdTablero, vJugador2, 'A');
    -- REINA
    CREAR_FICHA(4, 1, vIdTablero, vJugador2, 'D');
    -- REY
    CREAR_FICHA(5, 1, vIdTablero, vJugador2, 'R');
    -- CREAR PEONES
    FOR i IN  1..8
    LOOP
        CREAR_FICHA(i, 2, vIdTablero, vJugador2, 'P');
    END LOOP;
    COMMIT;
END;
/