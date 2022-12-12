CREATE OR REPLACE PROCEDURE cre_player_pr (vCedula NUMBER,vNombre VARCHAR2, vApellido VARCHAR2)
IS
vPartidas_ganadas jugadores.partidas_ganadas%TYPE;
vPartidas_perdidas jugadores.partidas_perdidas%TYPE;
vPartidas_empatadas jugadores.partidas_empatados%TYPE;
vPartidas_jugadas jugadores.partidas_jugadas%TYPE;

BEGIN
INSERT INTO Jugadores (cedula,nombre,apellido,partidas_ganadas, partidas_perdidas, partidas_empatados, partidas_jugadas)
VALUES (vCedula,vNombre,vApellido,0,0,0,0);
COMMIT;
END cre_player_pr;
/