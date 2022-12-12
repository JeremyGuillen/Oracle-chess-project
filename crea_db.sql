CREATE TABLE Jugadores (
    cedula VARCHAR2(12) not null,
    nombre VARCHAR2(45) not null,
    apellido VARCHAR2(45) not null,
    partidas_ganadas NUMBER(3) not null,
    partidas_perdidas NUMBER(3) not null,
    partidas_empatados NUMBER(3) not null,
    partidas_jugadas NUMBER(3) not null,
    CONSTRAINT jugadores_pk PRIMARY KEY (cedula)
);

CREATE TABLE Tableros(
    id_tablero NUMBER GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
    estado VARCHAR2(2) not null,
    CONSTRAINT tablero_pk PRIMARY KEY (id_tablero)
);

CREATE TABLE Partidas(
    id_partida NUMBER(3) GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
    id_jugador1 VARCHAR2(12) not null,
    id_jugador2 VARCHAR2(12) not null,
    id_tablero NUMBER not null,
    fecha DATE NOT NULL,
    estado VARCHAR2(2) NOT NULL,
    CONSTRAINT partidas_pk PRIMARY KEY (id_partida),
    CONSTRAINT fk_id_jugador_1 FOREIGN KEY (id_jugador1) REFERENCES Jugadores(cedula),
    CONSTRAINT fk_id_jugador_2 FOREIGN KEY (id_jugador2) REFERENCES Jugadores(cedula),
    CONSTRAINT fk_id_tablero FOREIGN KEY (id_tablero) REFERENCES Tableros(id_tablero)
);

CREATE TABLE Fichas(
    id_ficha NUMBER(10) GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
    coordenada_x NUMBER(1) not null,
    coordenada_y NUMBER(1) not null,
    estado CHAR(2) NOT NULL,
    id_tablero NUMBER NOT NULL,
    id_jugador VARCHAR2(12) NOT NULL,
    tipo_ficha CHAR(1) NOT NULL,
    CONSTRAINT fichas_pk PRIMARY KEY (id_ficha),
    CONSTRAINT fk_id_tablero_fichas FOREIGN KEY (id_tablero) REFERENCES Tableros(id_tablero),
    CONSTRAINT fk_id_jugador_fichas FOREIGN KEY (id_jugador) REFERENCES Jugadores(cedula)
);

