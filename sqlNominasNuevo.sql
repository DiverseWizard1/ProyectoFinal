create table trabajador(

    NIF varchar(9) primary key,

    NumSS bigint(12) UNIQUE NOT NULL,

    GrupoProf int(1) NOT NULL,

    NivelProf int(1) NOT NULL,

    AreaProf varchar(1),

    NombreTrab varchar(50) NOT NULL,

    ApellidoTrab varchar(50) NOT NULL,

    CodPost int(5) NOT NULL

);

create table nomina(

    IdNomina bigint (10) AUTO_INCREMENT primary key,

    TotDeduc decimal (8, 2) not null,

    TotAportEmp decimal (8, 2) not null,

    FechaInicio date not null,

    FechaFin date not null,

    GratifExtra decimal(7, 2) NOT NULL,

    TotAport decimal (6, 2) not null,

    TotDeveng decimal (8, 2) not null,

    Prestaciones decimal(6, 2) NOT NULL,

    IndemniTraslado decimal(6, 2) NOT NULL,

    LiquidoTot decimal (8, 2) not null,

    NIF varchar (9),

    CONSTRAINT fk_nomina_trabajador foreign key (NIF) references trabajador(NIF) on update cascade on delete cascade

);

create table empresa(

    CIF varchar(9) primary key,

    CCC bigint (11) UNIQUE NOT NULL,

    Domicilio varchar(50) NOT NULL,

    NombreEmp varchar(50) NOT NULL

);

create table trabaja(

    NIF varchar(9),

    CIF varchar(9),

    CantHoras int(3) NOT NULL,

    FechaHoras date NOT NULL,

    PRIMARY KEY(NIF, CIF),

    CONSTRAINT fk_trabaja_trabajador foreign key (NIF) references trabajador(NIF) on update cascade on delete cascade,

    CONSTRAINT fk_trabaja_empresa foreign key (CIF) references empresa(CIF) on update cascade on delete cascade

);



insert into empresa (Domicilio, CIF, CCC, NombreEmp)

values ('Calle de los puentes, 34','G09186892',73090986614,'Comecocos.sl'),

       ('Pol. industrial Carrús, 101','V38887654',12311156740,'CalzadosElx y Hermanos');



insert into trabajador (NIF, NumSS, GrupoProf, NivelProf,AreaProf,NombreTrab,ApellidoTrab,CodPost)

VALUES ('A57488334',251456987452,7,2,'','Pepito','Reyes Moreno',03296),

       ('D45111236',223655870023,3,3,'B','Rodolfo','Rodolfo Rodolfez',03204),

       ('C45125487',111452223698,4,2,'C','Victor','Roldán Caballero',03201),

       ('W12477458',456454896785,5,3,'','Germán','Capatez Martínez',03206);



insert into trabaja (NIF, CIF, CantHoras, FechaHoras)

VALUES ('A57488334','G09186892',56,'2022-04-01'),

       ('A57488334','V38887654',13,'2022-04-01'),

       ('D45111236','G09186892',24,'2022-04-01'),

       ('C45125487','V38887654',45,'2022-04-01'),

       ('W12477458','V38887654',10,'2022-04-01');