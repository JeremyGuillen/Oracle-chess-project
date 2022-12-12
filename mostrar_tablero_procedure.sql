CREATE OR REPLACE PROCEDURE MOSTRAR_TABLERO(id_tablero NUMBER) IS
    iteradorY NUMBER;
    iteradorX NUMBER;
    linea VARCHAR2(2000) := '';
    cuadricula VARCHAR2(2000) := '';
    ficha tFicha;
BEGIN
    for iteradorY in REVERSE 1..8
    LOOP
        dbms_output.put_line('----------------');
        for iteradorX in 1..8
        LOOP
            cuadricula := '|';
            ficha := ObtenerFichaPorCoordenadas(id_tablero, iteradorX, iteradorY);
            IF ficha is not null THEN
                cuadricula := cuadricula || ficha.tipo_ficha;
            ELSE
                cuadricula := cuadricula || ' ';
            END IF;
            linea := linea || cuadricula;
        end LOOP;
        linea := linea || '|';
        dbms_output.put_line(linea);
        linea := '';
    end LOOP;
    dbms_output.put_line('----------------');
END MOSTRAR_TABLERO;
/