CREATE OR REPLACE PROCEDURE FINALIZAR_PARTIDA(pId_partida NUMBER, id_ganador VARCHAR2, id_perdedor VARCHAR2) IS
victorias_ganador NUMBER := 0;
ganador_partidas Number := 0;
perdedor_partidas Number := 0;
derrotas_perdedor Number := 0;
BEGIN
    UPDATE PARTIDAS SET ESTADO = 'T' where id_partida = pId_partida;

    SELECT partidas_ganadas, partidas_jugadas into victorias_ganador, ganador_partidas
    from jugadores
    where cedula = id_ganador;

    SELECT partidas_perdidas, partidas_jugadas into derrotas_perdedor, perdedor_partidas
    from jugadores
    where cedula = id_perdedor;

    victorias_ganador := victorias_ganador + 1;
    derrotas_perdedor := derrotas_perdedor + 1;
    perdedor_partidas := perdedor_partidas + 1;
    ganador_partidas := ganador_partidas + 1;
    UPDATE JUGADORES SET PARTIDAS_GANADAS = victorias_ganador, PARTIDAS_JUGADAS = ganador_partidas where cedula = id_ganador;
    UPDATE JUGADORES SET partidas_perdidas = derrotas_perdedor, PARTIDAS_JUGADAS = perdedor_partidas where cedula = id_perdedor;
    COMMIT;
END FINALIZAR_PARTIDA;
/