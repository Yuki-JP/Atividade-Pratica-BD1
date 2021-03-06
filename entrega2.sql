CREATE TABLE TECNICO_RESPONSAVEL(
	CPF CHAR(11),
    NOME VARCHAR(50),
    IDADE INTEGER,
    
    PRIMARY KEY(CPF)
);


CREATE TABLE PAIS(
	CAPITAL VARCHAR(50),
    NOME VARCHAR(50),
    CONTINENTE VARCHAR(50),
    
    PRIMARY KEY(CAPITAL)
);


CREATE TABLE CLUBE(
	CEP CHAR(11),
    NOME VARCHAR(50),
    ENDERECO VARCHAR(50),
    
    CAPITAL_PAIS VARCHAR(50),
    CPF_TECNICO CHAR(11),
    
    PRIMARY KEY(CEP),
    
    FOREIGN KEY(CAPITAL_PAIS) REFERENCES PAIS(CAPITAL),
    FOREIGN KEY(CPF_TECNICO) REFERENCES TECNICO_RESPONSAVEL(CPF)
);


CREATE TABLE CBTM(
	CEP CHAR(11),
    ATLETAS INTEGER,
    ENDERECO VARCHAR(50),
    
    PRIMARY KEY(CEP)
);


CREATE TABLE PESSOA(
	CPF CHAR(11),
    NOME VARCHAR(50),
    IDADE INTEGER,
    
    CEP_CBTM CHAR(11),
    CEP_CLUBE CHAR(11),
    
    PRIMARY KEY(CPF),
    
    FOREIGN KEY(CEP_CBTM) REFERENCES CBTM(CEP),
    FOREIGN KEY(CEP_CLUBE) REFERENCES CLUBE(CEP)
);


CREATE TABLE TECNICO_INTERNACIONAL(
	CERTIFICADO_ITTF VARCHAR(50),
    NOME VARCHAR(50),
    NIVEL_CERTIFICADO INTEGER,
    CPF CHAR(11),
    
    PRIMARY KEY(CPF),
    
    FOREIGN KEY(CPF) REFERENCES PESSOA(CPF) ON DELETE CASCADE
);


CREATE TABLE ATLETA_PROFISSIONAL(
	TRA INTEGER,
    NOME VARCHAR(50),
    RANK_ INTEGER,
    
    CPF_TREINADOR CHAR(11),
    CPF CHAR(11),
    NOME_MARCA VARCHAR(50),
    CAPITAL_PAIS VARCHAR(50),
    WTT_ORGANIZACAO INTEGER,
    NOME_CAMPEONATO VARCHAR(50),
    
    PRIMARY KEY(CPF),
    
    FOREIGN KEY(CPF_TREINADOR) REFERENCES TECNICO_INTERNACIONAL(CPF),
    FOREIGN KEY(NOME_MARCA) REFERENCES MARCA(NOME),
    FOREIGN KEY(CAPITAL_PAIS) REFERENCES PAIS(CAPITAL),
	FOREIGN KEY(WTT_ORGANIZACAO) REFERENCES ORGANIZACAO(WTT),
	FOREIGN KEY(NOME_CAMPEONATO) REFERENCES CAMPEONATO_INTERNACIONAL(NOME),
    FOREIGN KEY(CPF) REFERENCES PESSOA(CPF) ON DELETE CASCADE
);


CREATE TABLE PONTOS(
	RANK_ INTEGER,
    QTDE INTEGER,
    
    CPF CHAR(11),
    
    PRIMARY KEY(CPF, RANK_),
    
    FOREIGN KEY(CPF) REFERENCES PESSOA(CPF) ON DELETE CASCADE
);


CREATE TABLE TORNEIOS_NACIONAIS(
	NOME VARCHAR(50),
    ENDERECO VARCHAR(50),
	DATA_ DATE,
    
    PRIMARY KEY(NOME)
);


CREATE TABLE PARTICIPA(
	NOME_TORNEIO VARCHAR(50),
    CPF_PESSOA CHAR(11),
    
    PRIMARY KEY(NOME_TORNEIO, CPF_PESSOA),
    
    FOREIGN KEY(NOME_TORNEIO) REFERENCES TORNEIOS_NACIONAIS(NOME),
    FOREIGN KEY(CPF_PESSOA) REFERENCES PESSOA(CPF)
    );
    
    
CREATE TABLE ORGANIZACAO(
	WTT INTEGER,
    LOCAL_ VARCHAR(50),
    ATLETAS_CADASTRADOS INTEGER,
    
    PRIMARY KEY(WTT)
);


CREATE TABLE CAMPEONATO_INTERNACIONAL(
	NOME VARCHAR(50),
    LOCAL_ VARCHAR(50),
    DATA_ DATE,
    
    PRIMARY KEY(NOME),
    
    WTT_ORGANIZACAO INTEGER,
    CAPITAL_PAIS VARCHAR(50),
    
    FOREIGN KEY(WTT_ORGANIZACAO) REFERENCES ORGANIZACAO(WTT),
    FOREIGN KEY(CAPITAL_PAIS) REFERENCES PAIS(CAPITAL)
);


CREATE TABLE TIPO(
	NOME VARCHAR(50),
    NOME_CAMPEONATO VARCHAR(50),
    
    PRIMARY KEY(NOME, NOME_CAMPEONATO),
    
    FOREIGN KEY(NOME_CAMPEONATO) REFERENCES CAMPEONATO_INTERNACIONAL(NOME) ON DELETE CASCADE
);


CREATE TABLE MARCA(
	NOME VARCHAR(50),
    SEDE VARCHAR(50),
    PRODUTOS VARCHAR(50),
    
    PRIMARY KEY(NOME)
);