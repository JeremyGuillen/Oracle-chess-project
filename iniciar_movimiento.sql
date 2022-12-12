DECLARE
    coordenada_x NUMBER := &coordenadaX;
    coordenada_y NUMBER := &coordenadaY;
    coordenada_obj_x NUMBER := &coordenadaObjX;
    coordenada_obj_y NUMBER := &coordenadaObjY;
    idTablero NUMBER := &id_tablero;
    fichaAMover tFicha;
    invalid_ficha EXCEPTION;
BEGIN
    fichaAMover := ObtenerFichaPorCoordenadas(idTablero, coordenada_x, coordenada_y);
    IF fichaAMover is null THEN
        RAISE invalid_ficha;
    END IF;
    CASE fichaAMover.tipo_ficha
        WHEN 'P' THEN
            MOVER_PEON(idTablero, fichaAMover, coordenada_obj_x, coordenada_obj_y);
        WHEN 'R' THEN
            MOVER_REY(idTablero, fichaAMover, coordenada_obj_x, coordenada_obj_y);
        WHEN 'C' THEN
            MOVER_CABALLO(idTablero, fichaAMover, coordenada_obj_x, coordenada_obj_y);
        WHEN 'T' THEN
            MOVER_TORRE(idTablero, fichaAMover, coordenada_obj_x, coordenada_obj_y);
        ELSE raise invalid_ficha;
    END CASE;

EXCEPTION
    WHEN invalid_ficha THEN
        DBMS_OUTPUT.PUT_LINE('Esta ficha no se puede mover');
END;

/