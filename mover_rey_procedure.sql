CREATE OR REPLACE PROCEDURE MOVER_REY(id_tablero NUMBER, fichaActual tFicha, coordenadaObjX NUMBER, coordenadaObjY NUMBER) IS
    iteradorY NUMBER;
    iteradorX NUMBER;
    ficha tFicha := null;
    invalid_movement EXCEPTION;
    diferenciaX Number := 0;
    diferenciaY NUMBER := 0;
BEGIN
    IF fichaActual is null THEN
        RAISE invalid_movement;
    END IF;
    -- OBTENGO LA FICHA A COMER
    ficha := ObtenerFichaPorCoordenadas(id_tablero, coordenadaObjX, coordenadaObjY);
    -- REVISO SI LA COORDENADA EN Y ES CORRECTA
    diferenciaY := fichaActual.coordenada_y - coordenadaObjY;
    IF diferenciaY > 1 OR diferenciaY < -1 THEN
        RAISE invalid_movement;
    END IF;

    -- OBTENGO LA DIFERENCIA DE COORDENADAS EN X
    diferenciaX := fichaActual.coordenada_x - coordenadaObjX;
    
    -- SI LA DIFERENCIA ES MAYOR A 1 O MENOR QUE -1 ES UN MOVIEMIENTO INVALIDO
    IF diferenciaX > 1 OR diferenciaX < -1 THEN
        RAISE invalid_movement;
    END IF;

    -- ELIMINO LA FICHA EN CASO DE QUE EL PEON SE LA VAYA A COMER
    IF FICHA IS NOT NULL THEN
        IF FICHA.id_jugador != fichaActual.id_jugador THEN
            COMER_FICHA(FICHA.ID_FICHA);
        ELSE 
            RAISE invalid_movement;
        END IF;
    END IF;

    MOVER_FICHA(fichaActual.id_ficha, coordenadaObjX, coordenadaObjY);
    DBMS_OUTPUT.PUT_LINE('El rey se ha movido');
EXCEPTION
    WHEN invalid_movement THEN
        DBMS_OUTPUT.PUT_LINE('El movimiento es invalido');
END MOVER_REY;
/