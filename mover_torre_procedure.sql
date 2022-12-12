CREATE OR REPLACE PROCEDURE MOVER_TORRE(id_tablero NUMBER, fichaActual tFicha, coordenadaObjX NUMBER, coordenadaObjY NUMBER) IS
    ficha tFicha := null;
    invalid_movement EXCEPTION;
    diferenciaX Number := 0;
    diferenciaY NUMBER := 0;
BEGIN
    IF fichaActual is null THEN
        RAISE invalid_movement;
    END IF;

    IF fichaActual.coordenada_x != coordenadaObjX AND fichaActual.coordenada_y != coordenadaObjY THEN
        RAISE invalid_movement;
    END IF;
    -- OBTENGO LA FICHA A COMER
    ficha := ObtenerFichaPorCoordenadas(id_tablero, coordenadaObjX, coordenadaObjY);

    -- ELIMINO LA FICHA EN CASO DE QUE EL PEON SE LA VAYA A COMER
    IF FICHA IS NOT NULL THEN
        IF FICHA.id_jugador != fichaActual.id_jugador THEN
            COMER_FICHA(FICHA.ID_FICHA);
        ELSE 
            RAISE invalid_movement;
        END IF;
    END IF;

    MOVER_FICHA(fichaActual.id_ficha, coordenadaObjX, coordenadaObjY);
    DBMS_OUTPUT.PUT_LINE('la torre se ha movido');
EXCEPTION
    WHEN invalid_movement THEN
        DBMS_OUTPUT.PUT_LINE('El movimiento es invalido');
END MOVER_TORRE;
/