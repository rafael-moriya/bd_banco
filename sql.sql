create table pacientes(cod_pacientes int identity(1,1) PRIMARY KEY,nomePaciente varchar(100),sexo varchar (100),obito bit,);
create table profissionais(cod_profissionais int identity(1,1) PRIMARY KEY,nomeProfissional varchar(100),insertdat datetime,);
create table especialidades(cod_especialidades int identity(1,1) PRIMARY KEY,nomeEspecialidade varchar(100),insertdat datetime,);
create table consultas (cod_consultas int identity(1,1) PRIMARY KEY,cod_especialidades int,cod_pacientes int,cod_profissionais int,	insertdat datetime);
create table obitos (cod_obitos int identity(1,1) PRIMARY KEY,obs text);

ALTER TABLE consultas ADD CONSTRAINT FKEspecialidadeDaConsulta FOREIGN KEY (cod_especialidades) REFERENCES especialidades (cod_especialidades);
ALTER TABLE consultas ADD CONSTRAINT FKProfissionalDaConsulta FOREIGN KEY (cod_profissionais) REFERENCES profissionais(cod_profissionais);

insert into pacientes (nomePaciente, sexo, obito) values ('rafael','masculino',0), ('kaua','masculino',0), ('henrique','masculino',0)

insert into profissionais(nomeProfissional, insertdat) values ('mauricio',getdate()), ('soares',getdate()), ('oliceira',getdate())

insert into especialidades (nomeEspecialidade, insertdat) values ('cirurgia cardiovascular', getdate()), ('Patologia',getdate()), ('Pediatria',getdate())

insert into consultas (cod_especialidades, cod_pacientes, cod_profissionais, insertdat) values (2,1,1,getdate()), (1,2,1,getdate()), (3,2,1,getdate())



select * from pacientes
select * from profissionais
select * from especialidades
select * from consultas
/*
drop table pacientes 
drop table profissionais 
drop table especialidades
drop table consultas
drop table obitos
*/