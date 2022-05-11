create table Empresa(

    Domicilio varchar(50) NOT NULL,

    CIF varchar(9) primary key,

    CCC bigint (11) UNIQUE NOT NULL,

    NombreEmp varchar(50) NOT NULL

);



create table Trabajador(

    NIF varchar(9) primary key,

    NumSS bigint(12) UNIQUE NOT NULL,

    GrupoProf int(1) NOT NULL,

    NivelProf int(1) NOT NULL,

    AreaProf varchar(1),

    NombreTrab varchar(50) NOT NULL,

    Apellido varchar(50) NOT NULL,

    Empresa varchar(9),

    CodPost int(5) NOT NULL

);



create table Nomina(

    IdNomina bigint (10) AUTO_INCREMENT primary key,

    TotDeveng decimal (8, 2) not null,

    TotDeduc decimal (8, 2) not null,

    TotAport decimal (6, 2) not null,

    LiquidoTot decimal (8, 2) not null,

    TotAportEmp decimal (8, 2) not null,

    FechaInicio date not null,

    FechaFin date not null,

    GratificacionesExtra decimal(7, 2) NOT NULL,

    Prestaciones decimal(6, 2) NOT NULL,

    IndemnizacionTraslado decimal(6, 2) NOT NULL

);



create table Hextra(



    id bigint (10) AUTO_INCREMENT primary key,

    NIF varchar(9),

    Empresa varchar(9),

    horasEx int(3),

    FechaInicio date,

    FechaFin date,

    constraint fk_hextra_trabajador foreign key (NIF) references Trabajador(NIF) on delete cascade on update cascade,

    constraint fk_hextra_empresa foreign key (Empresa) references Empresa(CIF) on delete cascade on update cascade

);



create table Recibe(

    NIF varchar(9),

    IdNomina bigint(10),

    Empresa varchar (9),

    FechaInicio date,

    FechaFin date,

    primary key(NIF, IdNomina, Empresa, FechaInicio, FechaFin),

    constraint fk_recibe_empresa foreign key (Empresa) references Empresa(CIF) on delete cascade on update cascade,

    constraint fk_recibe_trabajador foreign key (NIF) references Trabajador(NIF) on delete cascade on update cascade,

    constraint fk_recibe_nomina foreign key (IdNomina) references Nomina(IdNomina) on delete cascade on update cascade

);



alter table Trabajador

add constraint fk_traba_empre foreign key (Empresa) references Empresa(CIF) ON DELETE CASCADE ON UPDATE CASCADE;



insert into Empresa values

('Calle de los puentes, 34','G09186892', 73090986614, 'Comecocos.sl'),

('Pol. industrial Carrús, 101', 'V38887654', 12311156740, 'CalzadosElx y Hermanos');



insert into Trabajador VALUES

('A57488334', 251456987452, 7, 2, null, 'Pepito', 'Reyes Moreno', 'G09186892', 03296),

('D45111236', 223655870023, 3, 3, 'B', 'Rodolfo', 'Rodolfo Rodolfez', 'G09186892', 03204),

('C45125487', 111452223698, 4, 2, 'C', 'Victor', 'Roldán Caballero', 'V38887654', 03201),

('W12477458', 456454896785, 5, 3, null, 'Germán', 'Capatez Martínez', 'V38887654', 03206);



insert into Hextra (NIF, Empresa, horasEx, FechaInicio, FechaFin) VALUES

('A57488334', 'G09186892', 56, '2022-04-01', '2022-04-30'),

('A57488334', 'V38887654', 13, '2022-04-01', '2022-04-30'),

('D45111236', 'G09186892', 24, '2022-04-01', '2022-04-30'),

('C45125487', 'V38887654', 45, '2022-04-01', '2022-04-30'),

('W12477458', 'V38887654', 10, '2022-04-01', '2022-04-30');

