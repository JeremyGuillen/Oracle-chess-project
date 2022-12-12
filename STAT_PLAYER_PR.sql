CREATE OR REPLACE PROCEDURE stat_player_pr (id VARCHAR2)
IS

vcedula Jugadores.cedula%TYPE := id;

CURSOR info_player IS
SELECT cedula, nombre,apellido, sum(partidas_ganadas)Ganes, sum(partidas_perdidas)Derrotas, sum(partidas_empatados)Empates, sum(partidas_jugadas)Total
FROM Jugadores
WHERE cedula = id
GROUP BY cedula, nombre,apellido,partidas_ganadas,partidas_perdidas,partidas_empatados,partidas_jugadas;

BEGIN

dbms_output.put_line(chr(10));
dbms_output.put_line('----------------- ESTADISTICAS DEL JUGADOR -----------------');

FOR i IN info_player LOOP
dbms_output.put_line('ID: '||i.cedula);
dbms_output.put_line('Jugador: '||i.nombre|| ',' ||i.apellido);
dbms_output.put_line('Total de Partidas Ganadas: '||i.Ganes);
dbms_output.put_line('Total de Partidas Perdidas: '||i.Derrotas);
dbms_output.put_line('Total de Partidas Empatadas: '||i.Empates);
dbms_output.put_line('------------------------------------------------------------');
dbms_output.put_line('>> Total de Partidas jugadas: '||i.Total);
END LOOP;


EXCEPTION
WHEN No_Data_Found THEN
dbms_output.put_line('Jugador no encontrado: ' || vcedula);
WHEN others THEN
dbms_output.put_line('Error Inesperado.' || sqlerrm);


COMMIT;
END stat_player_pr;
/