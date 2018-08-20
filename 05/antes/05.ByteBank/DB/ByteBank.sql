    create table CONTA (
        CONTA_ID int identity not null,
        SALDO_DISPONIVEL float,
        DATA_FECHAMENTO datetime,
        ULTIMA_MOVIMENTACAO datetime,
        DATA_ABERTURA datetime not null,
        SALDO_PENDENTE float,
        STATUS varchar(10),
        CLIENTE_ID int,
        FILIAL_ID int not null,
        FUNCIONARIO_ID int not null,
        PRODUTO_COD varchar(10) not null,
        primary key (CONTA_ID)
    );

    create table CONTA_TRANSACAO (
        TRANSACAO_ID numeric(19,0) identity not null,
        QUANTIA float not null,
        DATA_FUNDO_DISPONIVEL datetime not null,
        TRANSACAO_DATA datetime not null,
        TRANSACAO_TIPO_COD varchar(10),
        CONTA_ID int,
        EXECUCAO_FILIAL_ID int,
        CAIXA_FUNCIONARIO_ID int,
        primary key (TRANSACAO_ID)
    );

    create table FILIAL (
        FILIAL_ID int identity not null,
        ENDERECO varchar(30),
        CIDADE varchar(20),
        NOME varchar(20) not null,
        UF varchar(10),
        CEP varchar(12),
        primary key (FILIAL_ID)
    );

    create table EMPRESA (
        DATA_ABERTURA datetime,
        NOME varchar(255) not null,
        ESTADO_ID varchar(10) not null,
        CLIENTE_ID int not null,
        primary key (CLIENTE_ID)
    );

    create table CLIENTE (
        CLIENTE_ID int identity not null,
        ENDERECO varchar(30),
        CIDADE varchar(20),
        CLIENTE_TIPO_COD varchar(1) not null,
        UF_ID varchar(12) not null,
        COD_POSTAL varchar(10),
        UF varchar(20),
        primary key (CLIENTE_ID)
    );

    create table DEPARTAMENTO (
        DEPARTAMENTO_ID int identity not null,
        NOME varchar(20) not null,
        primary key (DEPARTAMENTO_ID)
    );

    create table FUNCIONARIO (
        FUNCIONARIO_ID int identity not null,
        DATA_DESLIGAMENTO datetime,
        NOME varchar(20) not null,
        SOBRENOME varchar(20) not null,
        DATA_INICIO datetime not null,
        CARGO varchar(20),
        FILIAL_ID int,
        DEPARTAMENTO_ID int,
        SUPERIOR_FUNCIONARIO_ID int,
        primary key (FUNCIONARIO_ID)
    );

    create table INDIVIDUAL (
        DATA_NASCIMENTO datetime,
        NOME varchar(30) not null,
        SOBRENOME varchar(30) not null,
        CLIENTE_ID int not null,
        primary key (CLIENTE_ID)
    );

    create table ENCARREGADO (
        ENCARREGADO_ID int identity not null,
        DATA_DESLIGAMENTO datetime,
        NOME varchar(30) not null,
        SOBRENOME varchar(30) not null,
        DATA_INICIO datetime not null,
        CARGO varchar(20),
        CLIENTE_ID int,
        primary key (ENCARREGADO_ID)
    );

    create table PRODUTO (
        PRODUTO_COD varchar(10) not null,
        DATA_LANCAMENTO datetime,
        DATA_DESCONTINUADO datetime,
        NOME varchar(50) not null,
        TIPO_PRODUTO_COD varchar(255),
        primary key (PRODUTO_COD)
    );

    create table TIPO_PRODUTO (
        TIPO_PRODUTO_COD varchar(255) not null,
        NOME varchar(50),
        primary key (TIPO_PRODUTO_COD)
    );

    alter table CONTA 
        add constraint CONTA_CLIENTE_FK 
        foreign key (CLIENTE_ID) 
        references CLIENTE;

    alter table CONTA 
        add constraint CONTA_FILIAL_FK 
        foreign key (FILIAL_ID) 
        references FILIAL;

    alter table CONTA 
        add constraint CONTA_FUNCIONARIO_FK 
        foreign key (FUNCIONARIO_ID) 
        references FUNCIONARIO;

    alter table CONTA 
        add constraint CONTA_PRODUTO_FK 
        foreign key (PRODUTO_COD) 
        references PRODUTO;

    alter table CONTA_TRANSACAO 
        add constraint CONTA_TRANSACAO_CONTA_FK 
        foreign key (CONTA_ID) 
        references CONTA;

    alter table CONTA_TRANSACAO 
        add constraint CONTA_TRANSACAO_FILIAL_FK 
        foreign key (EXECUCAO_FILIAL_ID) 
        references FILIAL;

    alter table CONTA_TRANSACAO 
        add constraint CONTA_TRANSACAO_FUNCIONARIO_FK 
        foreign key (CAIXA_FUNCIONARIO_ID) 
        references FUNCIONARIO;

    alter table EMPRESA 
        add constraint EMPRESA_FUNCIONARIO_FK 
        foreign key (CLIENTE_ID) 
        references CLIENTE;

    alter table FUNCIONARIO 
        add constraint FUNCIONARIO_FILIAL_FK 
        foreign key (FILIAL_ID) 
        references FILIAL;

    alter table FUNCIONARIO 
        add constraint FUNCIONARIO_DEPARTAMENTO_FK 
        foreign key (DEPARTAMENTO_ID) 
        references DEPARTAMENTO;

    alter table FUNCIONARIO 
        add constraint FUNCIONARIO_FUNCIONARIO_FK 
        foreign key (SUPERIOR_FUNCIONARIO_ID) 
        references FUNCIONARIO;

    alter table INDIVIDUAL 
        add constraint INDIVIDUAL_CLIENTE_FK 
        foreign key (CLIENTE_ID) 
        references CLIENTE;

    alter table ENCARREGADO 
        add constraint ENCARREGADO_CLIENTE_FK 
        foreign key (CLIENTE_ID) 
        references CLIENTE;

    alter table PRODUTO 
        add constraint PRODUTO_TIPO_PRODUTO_FK 
        foreign key (TIPO_PRODUTO_COD) 
        references TIPO_PRODUTO;


 
-- ======================================================================== 
-- ========================================================================
-- ========================================================================
 

/* begin data population */

-- DEPARTAMENTO data

-- Disable 
SET IDENTITY_INSERT DEPARTAMENTO  ON;

---------------------
insert into DEPARTAMENTO (DEPARTAMENTO_ID, NOME)
values (1, 'Operations');
---------------------
insert into DEPARTAMENTO (DEPARTAMENTO_ID, NOME)
values (2, 'Loans');
---------------------
insert into DEPARTAMENTO (DEPARTAMENTO_ID, NOME)
values (3, 'Administration');

insert into DEPARTAMENTO (DEPARTAMENTO_ID, NOME)
values (4, 'IT');


-- Enable
SET IDENTITY_INSERT DEPARTAMENTO  OFF;

-- FILIAL data 

SET IDENTITY_INSERT FILIAL  ON;

---------------------
insert into FILIAL (FILIAL_id, NOME, ENDERECO, CIDADE, UF, CEP)
values (1, 'Headquarters', '3882 Main St.', 'Waltham', 'MA', '02451');
---------------------
insert into FILIAL (FILIAL_id, NOME, ENDERECO, CIDADE, UF, CEP)
values (2, 'Woburn FILIAL', '422 Maple St.', 'Woburn', 'MA', '01801');
---------------------
insert into FILIAL (FILIAL_id, NOME, ENDERECO, CIDADE, UF, CEP)
values (3, 'Quincy FILIAL', '125 Presidential Way', 'Quincy', 'MA', '02169');
---------------------
insert into FILIAL (FILIAL_id, NOME, ENDERECO, CIDADE, UF, CEP)
values (4, 'So. NH FILIAL', '378 Maynard Ln.', 'Salem', 'NH', '03079');

SET IDENTITY_INSERT FILIAL  OFF;


-- FUNCIONARIO data  

SET IDENTITY_INSERT FUNCIONARIO  ON;
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (1, 'Michael', 'Smith', Convert(Datetime,'2001-06-22',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Administration'), 
  'President', 
  (select FILIAL_id from FILIAL where NOME = 'Headquarters'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (2, 'Susan', 'Barker',Convert(Datetime, '2002-09-12',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Administration'), 
  'Vice President', 
  (select FILIAL_id from FILIAL where NOME = 'Headquarters'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (3, 'Robert', 'Tyler',Convert(Datetime, '2000-02-09',120),
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Administration'), 
  'Treasurer', 
  (select FILIAL_id from FILIAL where NOME = 'Headquarters'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (4, 'Susan', 'Hawthorne',Convert(Datetime, '2002-04-24',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Operations'), 
  'Operations Manager', 
  (select FILIAL_id from FILIAL where NOME = 'Headquarters'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (5, 'John', 'Gooding',Convert(Datetime, '2003-11-14',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Loans'), 
  'Loan Manager', 
  (select FILIAL_id from FILIAL where NOME = 'Headquarters'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (6, 'Helen', 'Fleming',Convert(Datetime, '2004-03-17',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Operations'), 
  'Head Teller', 
  (select FILIAL_id from FILIAL where NOME = 'Headquarters'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (7, 'Chris', 'Tucker',Convert(Datetime, '2004-09-15',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Operations'), 
  'Teller', 
  (select FILIAL_id from FILIAL where NOME = 'Headquarters'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (8, 'Sarah', 'Parker',Convert(Datetime, '2002-12-02',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Operations'), 
  'Teller', 
  (select FILIAL_id from FILIAL where NOME = 'Headquarters'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (9, 'Jane', 'Grossman',Convert(Datetime, '2002-05-03',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Operations'), 
  'Teller', 
  (select FILIAL_id from FILIAL where NOME = 'Headquarters'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (10, 'Paula', 'Roberts',Convert(Datetime, '2002-07-27',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Operations'), 
  'Head Teller', 
  (select FILIAL_id from FILIAL where NOME = 'Woburn FILIAL'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (11, 'Thomas', 'Ziegler',Convert(Datetime, '2000-10-23',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Operations'), 
  'Teller', 
  (select FILIAL_id from FILIAL where NOME = 'Woburn FILIAL'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (12, 'Samantha', 'Jameson',Convert(Datetime, '2003-01-08',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Operations'), 
  'Teller', 
  (select FILIAL_id from FILIAL where NOME = 'Woburn FILIAL'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (13, 'John', 'Blake',Convert(Datetime, '2000-05-11',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Operations'), 
  'Head Teller', 
  (select FILIAL_id from FILIAL where NOME = 'Quincy FILIAL'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (14, 'Cindy', 'Mason',Convert(Datetime, '2002-08-09',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Operations'), 
  'Teller', 
  (select FILIAL_id from FILIAL where NOME = 'Quincy FILIAL'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (15, 'Frank', 'Portman',Convert(Datetime, '2003-04-01',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Operations'), 
  'Teller', 
  (select FILIAL_id from FILIAL where NOME = 'Quincy FILIAL'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (16, 'Theresa', 'Markham',Convert(Datetime, '2001-03-15',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Operations'), 
  'Head Teller', 
  (select FILIAL_id from FILIAL where NOME = 'So. NH FILIAL'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (17, 'Beth', 'Fowler',Convert(Datetime, '2002-06-29',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Operations'), 
  'Teller', 
  (select FILIAL_id from FILIAL where NOME = 'So. NH FILIAL'));
---------------------
insert into FUNCIONARIO (FUNCIONARIO_ID, NOME, SOBRENOME, DATA_INICIO, 
  DEPARTAMENTO_ID, CARGO, FILIAL_ID)
values (18, 'Rick', 'Tulman',Convert(Datetime, '2002-12-12',120), 
  (select DEPARTAMENTO_ID from DEPARTAMENTO where NOME = 'Operations'), 
  'Teller', 
  (select FILIAL_id from FILIAL where NOME = 'So. NH FILIAL'));
  
  
SET IDENTITY_INSERT FUNCIONARIO  OFF;  
  

-- create data for self-referencing foreign key 'superior_FUNCIONARIO_ID'  
create   table emp_tmp(FUNCIONARIO_ID int, NOME varchar (20), SOBRENOME varchar (20)); 

---------------------
update FUNCIONARIO set superior_FUNCIONARIO_ID =
 (select FUNCIONARIO_ID from emp_tmp where SOBRENOME = 'Smith' and NOME = 'Michael')
where ((SOBRENOME = 'Barker' and NOME = 'Susan')
  or (SOBRENOME = 'Tyler' and NOME = 'Robert'));
---------------------
update FUNCIONARIO set superior_FUNCIONARIO_ID =
 (select FUNCIONARIO_ID from emp_tmp where SOBRENOME = 'Tyler' and NOME = 'Robert')
where SOBRENOME = 'Hawthorne' and NOME = 'Susan';
---------------------
update FUNCIONARIO set superior_FUNCIONARIO_ID =
 (select FUNCIONARIO_ID from emp_tmp where SOBRENOME = 'Hawthorne' and NOME = 'Susan')
where ((SOBRENOME = 'Gooding' and NOME = 'John')
  or (SOBRENOME = 'Fleming' and NOME = 'Helen')
  or (SOBRENOME = 'Roberts' and NOME = 'Paula') 
  or (SOBRENOME = 'Blake' and NOME = 'John') 
  or (SOBRENOME = 'Markham' and NOME = 'Theresa')); 
---------------------
update FUNCIONARIO set superior_FUNCIONARIO_ID =
 (select FUNCIONARIO_ID from emp_tmp where SOBRENOME = 'Fleming' and NOME = 'Helen')
where ((SOBRENOME = 'Tucker' and NOME = 'Chris') 
  or (SOBRENOME = 'Parker' and NOME = 'Sarah') 
  or (SOBRENOME = 'Grossman' and NOME = 'Jane'));  
---------------------
update FUNCIONARIO set superior_FUNCIONARIO_ID =
 (select FUNCIONARIO_ID from emp_tmp where SOBRENOME = 'Roberts' and NOME = 'Paula')
where ((SOBRENOME = 'Ziegler' and NOME = 'Thomas')  
  or (SOBRENOME = 'Jameson' and NOME = 'Samantha'));   
---------------------
update FUNCIONARIO set superior_FUNCIONARIO_ID =
 (select FUNCIONARIO_ID from emp_tmp where SOBRENOME = 'Blake' and NOME = 'John')
where ((SOBRENOME = 'Mason' and NOME = 'Cindy')   
  or (SOBRENOME = 'Portman' and NOME = 'Frank'));    
---------------------
update FUNCIONARIO set superior_FUNCIONARIO_ID =
 (select FUNCIONARIO_ID from emp_tmp where SOBRENOME = 'Markham' and NOME = 'Theresa')
where ((SOBRENOME = 'Fowler' and NOME = 'Beth')   
  or (SOBRENOME = 'Tulman' and NOME = 'Rick'));    

drop table emp_tmp;

-- PRODUTO type data 
---------------------
insert into TIPO_PRODUTO (TIPO_PRODUTO_COD, NOME)
values ('CONTA','CLIENTE CONTAs');
---------------------
insert into TIPO_PRODUTO (TIPO_PRODUTO_COD, NOME)
values ('LOAN','Individual and EMPRESA Loans');
---------------------
insert into TIPO_PRODUTO (TIPO_PRODUTO_COD, NOME)
values ('INSURANCE','Insurance Offerings');

-- PRODUTO data  
---------------------
insert into PRODUTO (PRODUTO_COD, NOME, TIPO_PRODUTO_COD, DATA_LANCAMENTO)
values ('CHK','checking CONTA','CONTA',Convert(Datetime,'2000-01-01',120));
---------------------
insert into PRODUTO (PRODUTO_COD, NOME, TIPO_PRODUTO_COD, DATA_LANCAMENTO)
values ('SAV','savings CONTA','CONTA',Convert(Datetime,'2000-01-01',120));
---------------------
insert into PRODUTO (PRODUTO_COD, NOME, TIPO_PRODUTO_COD, DATA_LANCAMENTO)
values ('MM','money market CONTA','CONTA',Convert(Datetime,'2000-01-01',120));
---------------------
insert into PRODUTO (PRODUTO_COD, NOME, TIPO_PRODUTO_COD, DATA_LANCAMENTO)
values ('CD','certificate of deposit','CONTA',Convert(Datetime,'2000-01-01',120));
---------------------
insert into PRODUTO (PRODUTO_COD, NOME, TIPO_PRODUTO_COD, DATA_LANCAMENTO)
values ('MRT','home mortgage','LOAN',Convert(Datetime,'2000-01-01',120));
---------------------
insert into PRODUTO (PRODUTO_COD, NOME, TIPO_PRODUTO_COD, DATA_LANCAMENTO)
values ('AUT','auto loan','LOAN',Convert(Datetime,'2000-01-01',120));
---------------------
insert into PRODUTO (PRODUTO_COD, NOME, TIPO_PRODUTO_COD, DATA_LANCAMENTO)
values ('BUS','EMPRESA line of credit','LOAN',Convert(Datetime,'2000-01-01',120));
---------------------
insert into PRODUTO (PRODUTO_COD, NOME, TIPO_PRODUTO_COD, DATA_LANCAMENTO)
values ('SBL','small EMPRESA loan','LOAN',Convert(Datetime,'2000-01-01',120));

-- residential CLIENTE data  

SET IDENTITY_INSERT CLIENTE ON;

---------------------
insert into CLIENTE (CLIENTE_ID, UF_ID, CLIENTE_TIPO_COD,
  ENDERECO, CIDADE, UF, COD_POSTAL)
values (1, '111-11-1111', 'I', '47 Mockingbird Ln', 'Lynnfield', 'MA', '01940');
---------------------
insert into individual (CLIENTE_ID, NOME, SOBRENOME, DATA_NASCIMENTO)
select CLIENTE_ID, 'James', 'Hadley', Convert(Datetime,'1972-04-22',120) from CLIENTE
where UF_ID = '111-11-1111';
---------------------
insert into CLIENTE (CLIENTE_ID, UF_ID, CLIENTE_TIPO_COD,
  ENDERECO, CIDADE, UF, COD_POSTAL)
values (2, '222-22-2222', 'I', '372 Clearwater Blvd', 'Woburn', 'MA', '01801');
---------------------
insert into individual (CLIENTE_ID, NOME, SOBRENOME, DATA_NASCIMENTO)
select CLIENTE_ID, 'Susan', 'Tingley', Convert(Datetime,'1968-08-15',120) from CLIENTE
where UF_ID = '222-22-2222';
---------------------
insert into CLIENTE (CLIENTE_ID, UF_ID, CLIENTE_TIPO_COD,
  ENDERECO, CIDADE, UF, COD_POSTAL)
values (3, '333-33-3333', 'I', '18 Jessup Rd', 'Quincy', 'MA', '02169');
---------------------
insert into individual (CLIENTE_ID, NOME, SOBRENOME, DATA_NASCIMENTO)
select CLIENTE_ID, 'Frank', 'Tucker',Convert(Datetime, '1958-02-06',120) from CLIENTE
where UF_ID = '333-33-3333';
---------------------
insert into CLIENTE (CLIENTE_ID, UF_ID, CLIENTE_TIPO_COD,
  ENDERECO, CIDADE, UF, COD_POSTAL)
values (4, '444-44-4444', 'I', '12 Buchanan Ln', 'Waltham', 'MA', '02451');
---------------------
insert into individual (CLIENTE_ID, NOME, SOBRENOME, DATA_NASCIMENTO)
select CLIENTE_ID, 'John', 'Hayward',Convert(Datetime,'1966-12-22',120) from CLIENTE
where UF_ID = '444-44-4444';
---------------------
insert into CLIENTE (CLIENTE_ID, UF_ID, CLIENTE_TIPO_COD,
  ENDERECO, CIDADE, UF, COD_POSTAL)
values (5, '555-55-5555', 'I', '2341 Main St', 'Salem', 'NH', '03079');
---------------------
insert into individual (CLIENTE_ID, NOME, SOBRENOME, DATA_NASCIMENTO)
select CLIENTE_ID, 'Charles', 'Frasier',Convert(Datetime, '1971-08-25',120) from CLIENTE
where UF_ID = '555-55-5555';
---------------------
insert into CLIENTE (CLIENTE_ID, UF_ID, CLIENTE_TIPO_COD,
  ENDERECO, CIDADE, UF, COD_POSTAL)
values (6, '666-66-6666', 'I', '12 Blaylock Ln', 'Waltham', 'MA', '02451');
---------------------
insert into individual (CLIENTE_ID, NOME, SOBRENOME, DATA_NASCIMENTO)
select CLIENTE_ID, 'John', 'Spencer',Convert(Datetime, '1962-09-14',120)from CLIENTE
where UF_ID = '666-66-6666';
---------------------
insert into CLIENTE (CLIENTE_ID, UF_ID, CLIENTE_TIPO_COD,
  ENDERECO, CIDADE, UF, COD_POSTAL)
values (7, '777-77-7777', 'I', '29 Admiral Ln', 'Wilmington', 'MA', '01887');
---------------------
insert into individual (CLIENTE_ID, NOME, SOBRENOME, DATA_NASCIMENTO)
select CLIENTE_ID, 'Margaret', 'Young',Convert(Datetime, '1947-03-19' ,120)from CLIENTE
where UF_ID = '777-77-7777';
---------------------
insert into CLIENTE (CLIENTE_ID, UF_ID, CLIENTE_TIPO_COD,
  ENDERECO, CIDADE, UF, COD_POSTAL)
values (8, '888-88-8888', 'I', '472 Freedom Rd', 'Salem', 'NH', '03079');
---------------------
insert into individual (CLIENTE_ID, NOME, SOBRENOME, DATA_NASCIMENTO)
select CLIENTE_ID, 'Louis', 'Blake',Convert(Datetime, '1977-07-01' ,120)from CLIENTE
where UF_ID = '888-88-8888';
---------------------
insert into CLIENTE (CLIENTE_ID, UF_ID, CLIENTE_TIPO_COD,
  ENDERECO, CIDADE, UF, COD_POSTAL)
values (9, '999-99-9999', 'I', '29 Maple St', 'Newton', 'MA', '02458');
---------------------
insert into individual (CLIENTE_ID, NOME, SOBRENOME, DATA_NASCIMENTO)
select CLIENTE_ID, 'Richard', 'Farley',Convert(Datetime, '1968-06-16',120) from CLIENTE
where UF_ID = '999-99-9999';

-- corporate CLIENTE data 
---------------------
insert into CLIENTE (CLIENTE_ID, UF_ID, CLIENTE_TIPO_COD,
  ENDERECO, CIDADE, UF, COD_POSTAL)
values (10, '04-1111111', 'B', '7 Industrial Way', 'Salem', 'NH', '03079');
---------------------
insert into CLIENTE (CLIENTE_ID, UF_ID, CLIENTE_TIPO_COD,
  ENDERECO, CIDADE, UF, COD_POSTAL)
values (11, '04-2222222', 'B', '287A Corporate Ave', 'Wilmington', 'MA', '01887');
---------------------
insert into CLIENTE (CLIENTE_ID, UF_ID, CLIENTE_TIPO_COD,
  ENDERECO, CIDADE, UF, COD_POSTAL)
values (12, '04-3333333', 'B', '789 Main St', 'Salem', 'NH', '03079');
---------------------
insert into CLIENTE (CLIENTE_ID, UF_ID, CLIENTE_TIPO_COD,
  ENDERECO, CIDADE, UF, COD_POSTAL)
values (13, '04-4444444', 'B', '4772 Presidential Way', 'Quincy', 'MA', '02169');

SET IDENTITY_INSERT CLIENTE OFF;


SET IDENTITY_INSERT ENCARREGADO ON;

---------------------
insert into EMPRESA (CLIENTE_ID, NOME, ESTADO_ID, DATA_ABERTURA)
select CLIENTE_ID, 'Chilton Engineering', '12-345-678',Convert(Datetime, '1995-05-01',120) from CLIENTE
where UF_ID = '04-1111111';
---------------------
insert into ENCARREGADO (ENCARREGADO_id, CLIENTE_ID, NOME, SOBRENOME,
  CARGO, DATA_INICIO)
select 1, CLIENTE_ID, 'John', 'Chilton', 'President', Convert(Datetime,'1995-05-01',120)
from CLIENTE
where UF_ID = '04-1111111';

---------------------
insert into EMPRESA (CLIENTE_ID, NOME, ESTADO_ID, DATA_ABERTURA)
select CLIENTE_ID, 'Northeast Cooling Inc.', '23-456-789',Convert(Datetime, '2001-01-01' ,120)from CLIENTE
where UF_ID = '04-2222222';
---------------------
insert into ENCARREGADO (ENCARREGADO_id, CLIENTE_ID, NOME, SOBRENOME,
  CARGO, DATA_INICIO)
select 2, CLIENTE_ID, 'Paul', 'Hardy', 'President',Convert(Datetime, '2001-01-01',120)
from CLIENTE
where UF_ID = '04-2222222';

---------------------
insert into EMPRESA (CLIENTE_ID, NOME, ESTADO_ID, DATA_ABERTURA)
select CLIENTE_ID, 'Superior Auto Body', '34-567-890',Convert(Datetime, '2002-06-30',120) from CLIENTE
where UF_ID = '04-3333333';
---------------------
insert into ENCARREGADO (ENCARREGADO_id, CLIENTE_ID, NOME, SOBRENOME,
  CARGO, DATA_INICIO)
select 3, CLIENTE_ID, 'Carl', 'Lutz', 'President',Convert(Datetime, '2002-06-30',120)
from CLIENTE
where UF_ID = '04-3333333';

---------------------
insert into EMPRESA (CLIENTE_ID, NOME, ESTADO_ID, DATA_ABERTURA)
select CLIENTE_ID, 'AAA Insurance Inc.', '45-678-901',Convert(Datetime, '1999-05-01',120) from CLIENTE
where UF_ID = '04-4444444';
---------------------
insert into ENCARREGADO (ENCARREGADO_id, CLIENTE_ID, NOME, SOBRENOME,
  CARGO, DATA_INICIO)
select 4, CLIENTE_ID, 'Stanley', 'Cheswick', 'President',Convert(Datetime, '1999-05-01',120)
from CLIENTE
where UF_ID = '04-4444444';



SET IDENTITY_INSERT ENCARREGADO OFF;
 
-- ======================================================================== 
-- ======= CONTA.
-- ========================================================================

-- residential CONTA data 
---------------------
insert into CONTA ( PRODUTO_COD, CLIENTE_ID, DATA_ABERTURA,
  ULTIMA_MOVIMENTACAO, status, FILIAL_ID,
  FUNCIONARIO_ID, SALDO_DISPONIVEL, SALDO_PENDENTE)
select   a.prod_cd, c.CLIENTE_ID, a.DATA_ABERTURA, a.last_date, 'ACTIVE',
  e.FILIAL_id, e.FUNCIONARIO_ID, a.avail, a.pend
from CLIENTE c cross join 
 (select top 1 b.FILIAL_id, e.FUNCIONARIO_ID 
  from FILIAL b inner join FUNCIONARIO e on e.FILIAL_ID = b.FILIAL_id
  where b.CIDADE = 'Woburn' ) e
  cross join
 (select 'CHK' prod_cd,Convert(Datetime, '2000-01-15',120) DATA_ABERTURA,Convert(Datetime, '2005-01-04',120) last_date,
    100 avail, 100 pend  union all
  select 'SAV' prod_cd,Convert(Datetime, '2000-01-15',120) DATA_ABERTURA,Convert(Datetime, '2004-12-19',120) last_date,
    100.00 avail, 100 pend   union all
  select 'CD' prod_cd,Convert(Datetime, '2004-06-30',120) DATA_ABERTURA,Convert(Datetime, '2004-06-30' ,120)last_date,
    3000.00 avail, 3000.00 pend   ) a
where c.UF_ID = '111-11-1111';
---------------------
insert into CONTA (  PRODUTO_COD, CLIENTE_ID, DATA_ABERTURA,
  ULTIMA_MOVIMENTACAO, status, FILIAL_ID,
  FUNCIONARIO_ID, SALDO_DISPONIVEL, SALDO_PENDENTE)
select   a.prod_cd, c.CLIENTE_ID, a.DATA_ABERTURA, a.last_date, 'ACTIVE',
  e.FILIAL_id, e.FUNCIONARIO_ID, a.avail, a.pend
from CLIENTE c cross join 
 (select top 1  b.FILIAL_id, e.FUNCIONARIO_ID 
  from FILIAL b inner join FUNCIONARIO e on e.FILIAL_ID = b.FILIAL_id
  where b.CIDADE = 'Woburn' ) e
  cross join
 (select 'CHK' prod_cd,Convert(Datetime, '2001-03-12',120) DATA_ABERTURA,Convert(Datetime, '2004-12-27' ,120)last_date,
    50 avail, 50 pend   union all
  select 'SAV' prod_cd,Convert(Datetime, '2001-03-12',120) DATA_ABERTURA,Convert(Datetime, '2004-12-11' ,120)last_date,
    200.00 avail, 200.00 pend   ) a
where c.UF_ID = '222-22-2222';
---------------------
insert into CONTA (  PRODUTO_COD, CLIENTE_ID, DATA_ABERTURA,
  ULTIMA_MOVIMENTACAO, status, FILIAL_ID,
  FUNCIONARIO_ID, SALDO_DISPONIVEL, SALDO_PENDENTE)
select   a.prod_cd, c.CLIENTE_ID, a.DATA_ABERTURA, a.last_date, 'ACTIVE',
  e.FILIAL_id, e.FUNCIONARIO_ID, a.avail, a.pend
from CLIENTE c cross join 
 (select top 1  b.FILIAL_id, e.FUNCIONARIO_ID 
  from FILIAL b inner join FUNCIONARIO e on e.FILIAL_ID = b.FILIAL_id
  where b.CIDADE = 'Quincy' ) e
  cross join
 (select 'CHK' prod_cd,Convert(Datetime, '2002-11-23' ,120)DATA_ABERTURA,Convert(Datetime, '2004-11-30' ,120)last_date,
    1057.75 avail, 1057.75 pend   union all
  select 'MM' prod_cd,Convert(Datetime, '2002-12-15',120) DATA_ABERTURA,Convert(Datetime, '2004-12-05' ,120)last_date,
    2212.50 avail, 2212.50 pend  ) a
where c.UF_ID = '333-33-3333';
---------------------
insert into CONTA (  PRODUTO_COD, CLIENTE_ID, DATA_ABERTURA,
  ULTIMA_MOVIMENTACAO, status, FILIAL_ID,
  FUNCIONARIO_ID, SALDO_DISPONIVEL, SALDO_PENDENTE)
select   a.prod_cd, c.CLIENTE_ID, a.DATA_ABERTURA, a.last_date, 'ACTIVE',
  e.FILIAL_id, e.FUNCIONARIO_ID, a.avail, a.pend
from CLIENTE c cross join 
 (select top 1  b.FILIAL_id, e.FUNCIONARIO_ID 
  from FILIAL b inner join FUNCIONARIO e on e.FILIAL_ID = b.FILIAL_id
  where b.CIDADE = 'Waltham' ) e
  cross join
 (select 'CHK' prod_cd,Convert(Datetime, '2003-09-12' ,120)DATA_ABERTURA,Convert(Datetime, '2005-01-03' ,120)last_date,
    50 avail, 50 pend   union all
  select 'SAV' prod_cd,Convert(Datetime, '2000-01-15' ,120)DATA_ABERTURA,Convert(Datetime, '2004-10-24',120) last_date,
    50 avail, 50 pend   union all
  select 'MM' prod_cd,Convert(Datetime, '2004-09-30',120) DATA_ABERTURA,Convert(Datetime, '2004-11-11' ,120)last_date,
    5487.09 avail, 5487.09 pend ) a
where c.UF_ID = '444-44-4444';
---------------------
insert into CONTA (  PRODUTO_COD, CLIENTE_ID, DATA_ABERTURA,
  ULTIMA_MOVIMENTACAO, status, FILIAL_ID,
  FUNCIONARIO_ID, SALDO_DISPONIVEL, SALDO_PENDENTE)
select   a.prod_cd, c.CLIENTE_ID, a.DATA_ABERTURA, a.last_date, 'ACTIVE',
  e.FILIAL_id, e.FUNCIONARIO_ID, a.avail, a.pend
from CLIENTE c cross join 
 (select top 1  b.FILIAL_id, e.FUNCIONARIO_ID 
  from FILIAL b inner join FUNCIONARIO e on e.FILIAL_ID = b.FILIAL_id
  where b.CIDADE = 'Salem' ) e
  cross join
 (select 'CHK' prod_cd, Convert(Datetime,'2004-01-27' ,120)DATA_ABERTURA,Convert(Datetime, '2005-01-05' ,120)last_date,
    2237.97 avail, 2897.97 pend ) a
where c.UF_ID = '555-55-5555';
---------------------
insert into CONTA (  PRODUTO_COD, CLIENTE_ID, DATA_ABERTURA,
  ULTIMA_MOVIMENTACAO, status, FILIAL_ID,
  FUNCIONARIO_ID, SALDO_DISPONIVEL, SALDO_PENDENTE)
select   a.prod_cd, c.CLIENTE_ID, a.DATA_ABERTURA, a.last_date, 'ACTIVE',
  e.FILIAL_id, e.FUNCIONARIO_ID, a.avail, a.pend
from CLIENTE c cross join 
 (select top 1  b.FILIAL_id, e.FUNCIONARIO_ID 
  from FILIAL b inner join FUNCIONARIO e on e.FILIAL_ID = b.FILIAL_id
  where b.CIDADE = 'Waltham' ) e
  cross join
 (select 'CHK' prod_cd,Convert(Datetime, '2002-08-24' ,120)DATA_ABERTURA,Convert(Datetime, '2004-11-29',120) last_date,
    122.37 avail, 122.37 pend   union all
  select 'CD' prod_cd,Convert(Datetime, '2004-12-28' ,120)DATA_ABERTURA,Convert(Datetime, '2004-12-28',120) last_date,
    10000.00 avail, 10000.00 pend  ) a
where c.UF_ID = '666-66-6666';
---------------------
insert into CONTA (  PRODUTO_COD, CLIENTE_ID, DATA_ABERTURA,
  ULTIMA_MOVIMENTACAO, status, FILIAL_ID,
  FUNCIONARIO_ID, SALDO_DISPONIVEL, SALDO_PENDENTE)
select   a.prod_cd, c.CLIENTE_ID, a.DATA_ABERTURA, a.last_date, 'ACTIVE',
  e.FILIAL_id, e.FUNCIONARIO_ID, a.avail, a.pend
from CLIENTE c cross join 
 (select top 1  b.FILIAL_id, e.FUNCIONARIO_ID 
  from FILIAL b inner join FUNCIONARIO e on e.FILIAL_ID = b.FILIAL_id
  where b.CIDADE = 'Woburn' ) e
  cross join
 (select 'CD' prod_cd,Convert(Datetime, '2004-01-12' ,120)DATA_ABERTURA, Convert(Datetime,'2004-01-12' ,120)last_date,
    5000.00 avail, 5000.00 pend ) a
where c.UF_ID = '777-77-7777';
---------------------
insert into CONTA (  PRODUTO_COD, CLIENTE_ID, DATA_ABERTURA,
  ULTIMA_MOVIMENTACAO, status, FILIAL_ID,
  FUNCIONARIO_ID, SALDO_DISPONIVEL, SALDO_PENDENTE)
select   a.prod_cd, c.CLIENTE_ID, a.DATA_ABERTURA, a.last_date, 'ACTIVE',
  e.FILIAL_id, e.FUNCIONARIO_ID, a.avail, a.pend
from CLIENTE c cross join 
 (select top 1  b.FILIAL_id, e.FUNCIONARIO_ID 
  from FILIAL b inner join FUNCIONARIO e on e.FILIAL_ID = b.FILIAL_id
  where b.CIDADE = 'Salem' ) e
  cross join
 (select 'CHK' prod_cd,Convert(Datetime, '2001-05-23' ,120)DATA_ABERTURA,Convert(Datetime, '2005-01-03' ,120)last_date,
    3487.19 avail, 3487.19 pend   union all
  select 'SAV' prod_cd,Convert(Datetime, '2001-05-23' ,120)DATA_ABERTURA,Convert(Datetime, '2004-10-12' ,120)last_date,
    387.99 avail, 387.99 pend  ) a
where c.UF_ID = '888-88-8888';
---------------------
insert into CONTA (  PRODUTO_COD, CLIENTE_ID, DATA_ABERTURA,
  ULTIMA_MOVIMENTACAO, status, FILIAL_ID,
  FUNCIONARIO_ID, SALDO_DISPONIVEL, SALDO_PENDENTE)
select   a.prod_cd, c.CLIENTE_ID, a.DATA_ABERTURA, a.last_date, 'ACTIVE',
  e.FILIAL_id, e.FUNCIONARIO_ID, a.avail, a.pend
from CLIENTE c cross join 
 (select top 1  b.FILIAL_id, e.FUNCIONARIO_ID 
  from FILIAL b inner join FUNCIONARIO e on e.FILIAL_ID = b.FILIAL_id
  where b.CIDADE = 'Waltham' ) e
  cross join
 (select 'CHK' prod_cd,Convert(Datetime, '2003-07-30',120) DATA_ABERTURA,Convert(Datetime, '2004-12-15' ,120)last_date,
    125.67 avail, 125.67 pend   union all
  select 'MM' prod_cd,Convert(Datetime, '2004-10-28' ,120)DATA_ABERTURA,Convert(Datetime, '2004-10-28' ,120)last_date,
    9345.55 avail, 9845.55 pend   union all
  select 'CD' prod_cd,Convert(Datetime, '2004-06-30' ,120)DATA_ABERTURA,Convert(Datetime, '2004-06-30' ,120)last_date,
    1500.00 avail, 1500.00 pend  ) a
where c.UF_ID = '999-99-9999';

-- corporate CONTA data  
---------------------
insert into CONTA (  PRODUTO_COD, CLIENTE_ID, DATA_ABERTURA,
  ULTIMA_MOVIMENTACAO, status, FILIAL_ID,
  FUNCIONARIO_ID, SALDO_DISPONIVEL, SALDO_PENDENTE)
select   a.prod_cd, c.CLIENTE_ID, a.DATA_ABERTURA, a.last_date, 'ACTIVE',
  e.FILIAL_id, e.FUNCIONARIO_ID, a.avail, a.pend
from CLIENTE c cross join 
 (select top 1  b.FILIAL_id, e.FUNCIONARIO_ID 
  from FILIAL b inner join FUNCIONARIO e on e.FILIAL_ID = b.FILIAL_id
  where b.CIDADE = 'Salem' ) e
  cross join
 (select 'CHK' prod_cd,Convert(Datetime, '2002-09-30' ,120)DATA_ABERTURA, Convert(Datetime,'2004-12-15' ,120)last_date,
    23575.12 avail, 23575.12 pend   union all
  select 'BUS' prod_cd,Convert(Datetime, '2002-10-01' ,120)DATA_ABERTURA,Convert(Datetime, '2004-08-28' ,120)last_date,
    0 avail, 0 pend  ) a
where c.UF_ID = '04-1111111';
---------------------
insert into CONTA (  PRODUTO_COD, CLIENTE_ID, DATA_ABERTURA,
  ULTIMA_MOVIMENTACAO, status, FILIAL_ID,
  FUNCIONARIO_ID, SALDO_DISPONIVEL, SALDO_PENDENTE)
select   a.prod_cd, c.CLIENTE_ID, a.DATA_ABERTURA, a.last_date, 'ACTIVE',
  e.FILIAL_id, e.FUNCIONARIO_ID, a.avail, a.pend
from CLIENTE c cross join 
 (select top 1  b.FILIAL_id, e.FUNCIONARIO_ID 
  from FILIAL b inner join FUNCIONARIO e on e.FILIAL_ID = b.FILIAL_id
  where b.CIDADE = 'Woburn' ) e
  cross join
 (select 'BUS' prod_cd,Convert(Datetime, '2004-03-22',120) DATA_ABERTURA,Convert(Datetime, '2004-11-14',120) last_date,
    9345.55 avail, 9345.55 pend ) a
where c.UF_ID = '04-2222222';
---------------------
insert into CONTA (  PRODUTO_COD, CLIENTE_ID, DATA_ABERTURA,
  ULTIMA_MOVIMENTACAO, status, FILIAL_ID,
  FUNCIONARIO_ID, SALDO_DISPONIVEL, SALDO_PENDENTE)
select   a.prod_cd, c.CLIENTE_ID, a.DATA_ABERTURA, a.last_date, 'ACTIVE',
  e.FILIAL_id, e.FUNCIONARIO_ID, a.avail, a.pend
from CLIENTE c cross join 
 (select top 1  b.FILIAL_id, e.FUNCIONARIO_ID 
  from FILIAL b inner join FUNCIONARIO e on e.FILIAL_ID = b.FILIAL_id
  where b.CIDADE = 'Salem' ) e
  cross join
 (select 'CHK' prod_cd,Convert(Datetime, '2003-07-30',120) DATA_ABERTURA,Convert(Datetime, '2004-12-15' ,120)last_date,
    38552.05 avail, 38552.05 pend ) a
where c.UF_ID = '04-3333333';
---------------------
insert into CONTA (  PRODUTO_COD, CLIENTE_ID, DATA_ABERTURA,
  ULTIMA_MOVIMENTACAO, status, FILIAL_ID,
  FUNCIONARIO_ID, SALDO_DISPONIVEL, SALDO_PENDENTE)
select   a.prod_cd, c.CLIENTE_ID, a.DATA_ABERTURA, a.last_date, 'ACTIVE',
  e.FILIAL_id, e.FUNCIONARIO_ID, a.avail, a.pend
from CLIENTE c cross join 
 (select top 1  b.FILIAL_id, e.FUNCIONARIO_ID 
  from FILIAL b inner join FUNCIONARIO e on e.FILIAL_ID = b.FILIAL_id
  where b.CIDADE = 'Quincy' ) e
  cross join
 (select 'SBL' prod_cd,Convert(Datetime, '2004-02-22',120) DATA_ABERTURA,Convert(Datetime, '2004-12-17',120) last_date,
    50000.00 avail, 50000.00 pend ) a
where c.UF_ID = '04-4444444';

-- ======================================================================== 
-- ======= CONTA_TRANSACAO.
-- ========================================================================

-- put $100 in all checking/savings CONTAs on date CONTA opened  
---------------------
insert into CONTA_TRANSACAO (  TRANSACAO_DATA, CONTA_id, TRANSACAO_TIPO_COD,
  QUANTIA, DATA_FUNDO_DISPONIVEL)
select   a.DATA_ABERTURA, a.CONTA_id, 'CDT', 100, a.DATA_ABERTURA
from CONTA a
where a.PRODUTO_COD IN ('CHK','SAV','CD','MM');

-- end data population  

 
