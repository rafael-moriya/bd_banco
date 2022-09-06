CREATE TABLE IF NOT EXISTS pacientes(
	id serial PRIMARY KEY,
	nome varchar(40) NOT NULL,
	sexo varchar(1),
	obito boolean,
	insertedAt TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS profissionais(
	id serial PRIMARY KEY,
	nome varchar(50)
);

CREATE TABLE IF NOT EXISTS especialidades(
	id serial PRIMARY KEY,
	nome varchar(50)
);

CREATE TABLE IF NOT EXISTS consultas(
	id serial PRIMARY KEY,
    
	especialidade_id integer,
	pac_id integer,
	profiss_id integer	
);

CREATE TABLE IF NOT EXISTS obitos(
	id serial PRIMARY KEY,
	obs text
);


ALTER TABLE consultas  
   ADD CONSTRAINT FkEspecialidadeDaConsulta
      FOREIGN KEY (especialidade_id) REFERENCES especialidades (ID);


ALTER TABLE consultas  
   ADD CONSTRAINT FkProfissionalDaConsulta 
      FOREIGN KEY (profiss_id) REFERENCES profissionais (ID);

CREATE OR REPLACE  FUNCTION trgValidadeDadosConsulta() RETURNS trigger $trgValidadeDadosConsulta;

DECLARE
pac_row record;
espec_row record;
BEGIN
    RAISE NOTICE 'nossa trigger rodou!!!';
RETURN new;

END;
$trgValidadeDadosConsulta LANGUAGE plpgsql;

CREATE TRIGGER ValidadeDadosConsulta
BEFORE INSERT OR UPDATE ON consultas
FOR EACH ROW
EXECUTE PROCEDURE trgValidadeDadosConsulta();