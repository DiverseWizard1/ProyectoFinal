-- Nomina(IdNomina(p), TotDeduc, TotAportEmp, FechaInicio, FechaFin, GratifExtra, TotAport, TotDeveng, Prestaciones, IndemniTraslado, LiquidoTot, NIF(e))
-- Trabajador(NIF(p), NumSS, GrupoProf, NivelProf, AreaProf, NombreTrab, ApellidoTrab, CodPost)
-- Empresa(CIF(p), CCC, Domicilio, NombreEmp)
-- Trabaja(Primary_key(NIF(e), CIF(e)), CantHoras, FechaHoras)
create table Trabajador(
    NIF varchar(9) primary key,
    NumSS bigint(12) UNIQUE NOT NULL,
    GrupoProf int(1) NOT NULL,
    NivelProf int(1) NOT NULL,
    AreaProf varchar(1),
    NombreTrab varchar(50) NOT NULL,
    ApellidoTrab varchar(50) NOT NULL,
    CodPost int(5) NOT NULL
);
create table Nomina(
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
    CONSTRAINT fk_nomina_trabajador foreign key (NIF) references Trabajador(NIF) on update cascade on delete cascade
);
create table Empresa(
    CIF varchar(9) primary key,
    CCC bigint (11) UNIQUE NOT NULL,
    Domicilio varchar(50) NOT NULL,
    NombreEmp varchar(50) NOT NULL
);
create table Trabaja(
    NIF varchar(9),
    CIF varchar(9),
    CantHoras int(3) NOT NULL,
    FechaHoras date NOT NULL,
    PRIMARY KEY(NIF, CIF),
    CONSTRAINT fk_trabaja_trabajador foreign key (NIF) references Trabajador(NIF) on update cascade on delete cascade,
    CONSTRAINT fk_trabaja_empresa foreign key (CIF) references Empresa(CIF) on update cascade on delete cascade
);