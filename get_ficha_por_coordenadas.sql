CREATE OR REPLACE FUNCTION ObtenerFichaPorCoordenadas(pId_tablero NUMBER, pCoordenada_x NUMBER, pCoordenada_Y NUMBER) RETURN tFicha  IS
    fichaRecord fichas%rowtype;
    ficha tFicha;
BEGIN
    SELECT * into fichaRecord
    from fichas
    where id_tablero = pId_tablero AND coordenada_x = pCoordenada_x AND coordenada_y = pCoordenada_Y AND ESTADO = 'V';
    ficha := tFicha(fichaRecord.id_ficha, fichaRecord.coordenada_x, fichaRecord.coordenada_y, fichaRecord.estado, fichaRecord.id_tablero, fichaRecord.ID_JUGADOR, fichaRecord.tipo_ficha); 
    RETURN ficha;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN null;
END ObtenerFichaPorCoordenadas;
/