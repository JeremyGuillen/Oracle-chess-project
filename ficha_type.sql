CREATE OR REPLACE type tFicha as object (
    id_ficha NUMBER(10),
    coordenada_x NUMBER(1),
    coordenada_y NUMBER(1),
    ESTADO char(2),
    ID_TABLERO NUMBER,
    ID_JUGADOR VARCHAR2(12),
    TIPO_FICHA CHAR(1)
);
/