-- Apagar o usuário caso ele já exista
DROP USER IF EXISTS aluno;

-- Criar usuário
CREATE USER aluno with 
CREATEDB
CREATEROLE
ENCRYPTED PASSWORD '2004';

-- Criar o Banco de Dados
CREATE DATABASE certificados
       OWNER aluno
	   TEMPLATE template0
	   ENCODING 'UTF8'
	   LC_COLLATE 'pt_BR.UTF-8'
	   LC_CTYPE 'pt_BR.UTF-8'
	   ALLOW_CONNECTIONS true;

\c uvv;

-- Criar esquema
CREATE SCHEMA AUTHORIZATION aluno;

-- Trocar esquema
ALTER USER aluno
SET SEARCH_PATH TO lojas, "$user", public;

-- Criar a tabela certificados
CREATE TABLE certificados.Certificados (
                Certificado_id        VARCHAR(38) NOT NULL,
                Curso                 VARCHAR     NOT NULL,
                Status                VARCHAR(10) NOT NULL,
                Data_de_envio         DATE        NOT NULL,
                Data_de_validao       DATE        NOT NULL,
                Motivo_da_negacao     VARCHAR     NOT NULL,
                Imagem_do_certificado BYTEA       NOT NULL,
                CONSTRAINT certificados_pk PRIMARY KEY (Certificado_id)
);

-- Adicionar comentários de cada coluna da tabela certificados
COMMENT ON COLUMN certificados.Certificados.Certificado_id        IS 'ID DO CERTIFICADO DO ALUNO'               ;
COMMENT ON COLUMN certificados.Certificados.Curso                 IS 'NOME DO CURSO DO ALUNO'                   ;
COMMENT ON COLUMN certificados.Certificados.Status                IS 'STATUS DO CERTIFICADO DO ALUNO'           ;
COMMENT ON COLUMN certificados.Certificados.Data_de_envio         IS 'DATA DE ENVIO DO CERTIFICADO DO ALUNO'    ;
COMMENT ON COLUMN certificados.Certificados.Data_de_validao       IS 'DATA DA VALIDAÇÃO DO CERTIFICADO'         ;
COMMENT ON COLUMN certificados.Certificados.Motivo_da_negao       IS 'MOTIVO DA NEGAÇÃO DO CERTIFICADO DO ALUNO';
COMMENT ON COLUMN certificados.Certificados.Imagem_do_certificado IS 'IMAGEM DO CERTIFICADO DO ALUNO'           ;

-- Criar a tabela colaborador
CREATE TABLE certificados.Colaborador (
                CPF                    VARCHAR(11)  NOT NULL,
                Nome                   VARCHAR(255) NOT NULL,
                Email                  VARCHAR(100) NOT NULL,
                Cargo                  VARCHAR      NOT NULL,
                Historico_profissional BYTEA        NOT NULL,
                Salario                NUMERIC      NOT NULL,
                Contrato               VARCHAR      NOT NULL,
                Departamento           VARCHAR      NOT NULL,
                CONSTRAINT colaborador_pk PRIMARY KEY (CPF)
);

-- Adicionar comentários de cada coluna da tabela colaborador
COMMENT ON COLUMN certificados.Colaborador.CPF                   IS 'CPF DO COLABORADOR'                              ;
COMMENT ON COLUMN certificados.Colaborador.Nome                  IS 'NOME DO COLABORADOR'                             ;
COMMENT ON COLUMN certificados.Colaborador.Email                 IS 'ENDEREÇO DE EMAIL DO COLABORADOR'                ;
COMMENT ON COLUMN certificados.Colaborador.Cargo                 IS 'CARGO DO COLABORADOR'                            ;
COMMENT ON COLUMN certificados.Colaborador.Histrico_profissional IS 'ARQUIVO DO HISTÓRICO PROFISSIONAL DO COLABORADOR';
COMMENT ON COLUMN certificados.Colaborador.Salrio                IS 'SALÁRIO DO COLABORADOR'                          ;
COMMENT ON COLUMN certificados.Colaborador.Contrato              IS 'CONTRATO DE TRABALHO DO COLABORADOR'             ;
COMMENT ON COLUMN certificados.Colaborador.Departamento          IS 'ÁREA DE DEPARTAMENTO DO COLABORADOR'             ;

-- Criar a tabela colaborador_endereco
CREATE TABLE certificados.Colaborador_endereco (
                CEP         CHAR    (8) NOT NULL,
                CPF         VARCHAR(11) NOT NULL,
                Bairro      VARCHAR     NOT NULL,
                Cidade      VARCHAR     NOT NULL,
                Rua         VARCHAR     NOT NULL,
                Numero      VARCHAR     NOT NULL,
                Apartamento VARCHAR             ,
                CONSTRAINT colaborador_endereco_pk PRIMARY KEY (CEP)
);

-- Adicionar comentários de cada coluna da tabela colaborador_endereco
COMMENT ON COLUMN certificados.Colaborador_endereco.CEP         IS 'CEP DO ENDEREÇO DO ALUNO'            ;
COMMENT ON COLUMN certificados.Colaborador_endereco.CPF         IS 'CPF DO COLABORADOR'                  ;
COMMENT ON COLUMN certificados.Colaborador_endereco.Bairro      IS 'BAIRRO DA RESIDENCIA DO COLABORADOR' ;
COMMENT ON COLUMN certificados.Colaborador_endereco.Cidade      IS 'CIDADE ONDE O COLABORADOR RESIDE'    ;
COMMENT ON COLUMN certificados.Colaborador_endereco.Rua         IS 'RUA DA RESIDENCIA DO COLABORADOR'    ;
COMMENT ON COLUMN certificados.Colaborador_endereco.Numero      IS 'NUMERO DA RESIDENCIA DO COLABORADOR' ;
COMMENT ON COLUMN certificados.Colaborador_endereco.Apartamento IS 'NUMERO DO APARTAMENTO DO COLABORADOR';

-- Criar a tabela colaborador_telefone
CREATE TABLE certificados.Colaborador_telefone (
                Numero   VARCHAR(9)  NOT NULL,
                CPF      VARCHAR(11) NOT NULL,
                DDD      VARCHAR(2)  NOT NULL,
                Cod_pais VARCHAR(3)  NOT NULL,
                CONSTRAINT colaborador_telefone_pk PRIMARY KEY (Numero)
);

-- Adicionar comentários de cada coluna da tabela colaborador_telefone
COMMENT ON COLUMN certificados.Colaborador_telefone.Numero   IS 'NÚMERO DE TELEFONE DO COLABORADOR'        ;
COMMENT ON COLUMN certificados.Colaborador_telefone.CPF      IS 'NÚMERO DE IDENTIFICAÇÃO DO COLABORADOR'   ;
COMMENT ON COLUMN certificados.Colaborador_telefone.DDD      IS 'DDD DO TELEFONE DO COLABORADOR'           ;
COMMENT ON COLUMN certificados.Colaborador_telefone.Cod_pais IS 'CÓDIGO DE TELEFONE DO PAÍS DO COLABORADOR';

-- Criar a tabela alunos
CREATE TABLE certificados.Alunos (
                Matricula  VARCHAR(9)   NOT NULL,
                Nome       VARCHAR(255) NOT NULL,
                Curso      VARCHAR      NOT NULL,
                Nascimento VARCHAR(8)   NOT NULL,
                Email      VARCHAR(100) NOT NULL,
                CONSTRAINT alunos_pk PRIMARY KEY (Matricula)
);

-- Adicionar comentários de cada coluna da tabela alunos
COMMENT ON COLUMN certificados.Alunos.Matricula  IS 'MATRICULA DO ALUNO'         ;
COMMENT ON COLUMN certificados.Alunos.Nome       IS 'NOME DO ALUNO'              ;
COMMENT ON COLUMN certificados.Alunos.Curso      IS 'CURSO DO ALUNO'             ;
COMMENT ON COLUMN certificados.Alunos.Nascimento IS 'DATA DE NASCIMENTO DO ALUNO';
COMMENT ON COLUMN certificados.Alunos.Email      IS 'ENDEREÇO DE EMAIL DO ALUNO' ;

-- Criar a tabela alunos_endereco
CREATE TABLE certificados.Alunos_endereco (
                CEP         CHAR   (8) NOT NULL,
                Matricula   VARCHAR(9) NOT NULL,
                Numero      VARCHAR    NOT NULL,
                Rua         VARCHAR    NOT NULL,
                Bairro      VARCHAR    NOT NULL,
                Cidade      VARCHAR    NOT NULL,
                Apartamento VARCHAR            ,
                CONSTRAINT alunos_endereco_pk PRIMARY KEY (CEP)
);

-- Adicionar comentários de cada coluna da tabela alunos_endereco
COMMENT ON COLUMN certificados.Alunos_endereco.CEP         IS 'CEP DO ENDEREÇO DO ALUNO'      ;
COMMENT ON COLUMN certificados.Alunos_endereco.Matricula   IS 'MATRICULA DO ALUNO'            ;
COMMENT ON COLUMN certificados.Alunos_endereco.Numero      IS 'NUMERO DA RESIDENCIA DO ALUNO' ;
COMMENT ON COLUMN certificados.Alunos_endereco.Rua         IS 'RUA DA RESIDENCIA DO ALUNO'    ;
COMMENT ON COLUMN certificados.Alunos_endereco.Bairro      IS 'BAIRRO DA RESIDENCIA DO ALUNO' ;
COMMENT ON COLUMN certificados.Alunos_endereco.Cidade      IS 'CIDADE ONDE O ALUNO RESIDE'    ;
COMMENT ON COLUMN certificados.Alunos_endereco.Apartamento IS 'NUMERO DO APARTAMENTO DO ALUNO';

-- Criar a tabela alunos_telefone
CREATE TABLE certificados.Alunos_telefone (
                Numero    VARCHAR(9) NOT NULL,
                Matricula VARCHAR(9) NOT NULL,
                DDD       VARCHAR(2) NOT NULL,
                Cod_pais  VARCHAR(3) NOT NULL,
                CONSTRAINT alunos_telefone_pk PRIMARY KEY (Numero)
);

-- Adicionar comentários de cada coluna da tabela alunos_telefone
COMMENT ON COLUMN certificados.Alunos_telefone.Numero    IS 'NUMERO DE TELEFONE DO ALUNO'        ;
COMMENT ON COLUMN certificados.Alunos_telefone.Matricula IS 'MATRICULA DO ALUNO'                 ;
COMMENT ON COLUMN certificados.Alunos_telefone.DDD       IS 'DDD DO TELEFONE DO ALUNO'           ;
COMMENT ON COLUMN certificados.Alunos_telefone.Cod_pais  IS 'CÓDIGO DO PAÍS DO TELEFONE DO ALUNO';

-- Criar a tabela universidade
CREATE TABLE certificados.Universidade (
                Matricula      VARCHAR(9)  NOT NULL,
                CPF            VARCHAR(11) NOT NULL,
                Certificado_id VARCHAR(38) NOT NULL,
                CONSTRAINT universidade_pk PRIMARY KEY (Matricula, CPF)
);

-- Adicionar comentários de cada coluna da tabela universidade
COMMENT ON COLUMN certificados.Universidade.Matricula      IS 'MATRICULA DO ALUNO'                    ;
COMMENT ON COLUMN certificados.Universidade.CPF            IS 'NÚMERO DE IDENTIFICAÇÃO DO COLABORADOR';
COMMENT ON COLUMN certificados.Universidade.Certificado_id IS 'ID DO CERTIFICADO DO ALUNO'            ;

-- Criar as Foreign Key (FK)
ALTER TABLE certificados.Universidade ADD CONSTRAINT certificados_universidade_fk
FOREIGN KEY (Certificado_id)
REFERENCES certificados.Certificados (Certificado_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE certificados.Universidade ADD CONSTRAINT colaborador_universidade_fk
FOREIGN KEY (CPF)
REFERENCES certificados.Colaborador (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE certificados.Colaborador_telefone ADD CONSTRAINT colaborador_colaborador_telefone_fk
FOREIGN KEY (CPF)
REFERENCES certificados.Colaborador (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE certificados.Colaborador_endereco ADD CONSTRAINT colaborador_colaborador_endereco_fk
FOREIGN KEY (CPF)
REFERENCES certificados.Colaborador (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE certificados.Universidade ADD CONSTRAINT aluno_universidade_fk
FOREIGN KEY (Matricula)
REFERENCES certificados.Alunos (Matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE certificados.Alunos_telefone ADD CONSTRAINT alunos_alunos_telefone_fk
FOREIGN KEY (Matricula)
REFERENCES certificados.Alunos (Matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE certificados.Alunos_endereco ADD CONSTRAINT alunos_alunos_endereco_fk
FOREIGN KEY (Matricula)
REFERENCES certificados.Alunos (Matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Adicionar as restrições
ALTER TABLE certificados
ADD CONSTRAINT status
CHECK (status IN ('INDEFERIDO', 'APROVADO', 'PENDENTE'));