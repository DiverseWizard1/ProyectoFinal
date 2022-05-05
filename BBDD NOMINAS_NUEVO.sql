create database nominas;
use nominas;

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
    FechaFinal date not null,
    HorasExtra int(3) NOT NULL,
    GratificacionesExtra decimal(7, 2) NOT NULL,
    Prestaciones decimal(6, 2) NOT NULL,
    IndemnizacionTraslado decimal(6, 2) NOT NULL
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