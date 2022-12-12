CREATE OR REPLACE PROCEDURE MOVER_CABALLO(id_tablero NUMBER, fichaActual tFicha, coordenadaObjX NUMBER, coordenadaObjY NUMBER ) IS
    ficha tFicha := null;
    diferenciaX Number := 0;
    diferenciaY Number := 0;
    invalid_movement EXCEPTION;
BEGIN
    If fichaActual is null THEN
        RAISE invalid_movement;
    END IF;

    diferenciaX := fichaActual.coordenada_x - coordenadaObjX;
    diferenciaY := fichaActual.coordenada_y - coordenadaObjY;
    DBMS_OUTPUT.PUT_LINE(diferenciaX);
    DBMS_OUTPUT.PUT_LINE(diferenciaY);
    ficha := ObtenerFichaPorCoordenadas(id_tablero, coordenadaObjX, coordenadaObjY);

    IF diferenciaX IN (2, -2) THEN
        IF diferenciaY NOT IN (1, -1) THEN
            RAISE invalid_movement;
        END IF;
    END IF;

    If diferenciaY IN (2, -2) THEN 
        IF diferenciaX NOT IN (1, -1) THEN
            RAISE invalid_movement;
        END IF;
    END IF;


    IF diferenciaX NOT IN (2, -2) AND diferenciaY NOT IN (2, -2) THEN
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
    DBMS_OUTPUT.PUT_LINE('El caballo se ha movido');
EXCEPTION
    WHEN invalid_movement THEN
        DBMS_OUTPUT.PUT_LINE('El movimiento es invalido');
END;

/