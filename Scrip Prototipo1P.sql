create database Ventas;

use Ventas;

create table Clientes(
Idcliente int primary key not null,
NombreCliente varchar(50) not null,
Fecha_Nacimiento date not null,
Direccion varchar (90) not null,
telefono varchar(16) not null
)Engine = InnoDB;

create table Empresa(
IdEmpresa int primary key not null,
NombreEmpresa varchar(55) not null,
Direccion varchar(55) not null
)Engine = InnoDB;

create table Producto(
IdProducto int not null,
NombreProducto varchar(30) not null,
Marca varchar(30) not null,
Linea varchar(30) not null,
costo double(10,2) not null,
PrecioProducto double(10,2) not null,
FacultadCompra varchar(30) not null,
FacultadVenta varchar(30) not null,
Fecha_Caducidad date not null,
primary key (IdProducto)
)Engine = InnoDB;

create table Bodega(
IdBodega int primary key not null,
NombreB varchar(30) not null,
seccionB varchar(128) not null
)Engine = InnoDB;

create table Existencia(
IdExistencia int primary key not null,
IdProducto int not null,
IdBodega int not null,
foreign key (IdProducto) references Producto (IdProducto),
foreign key (IdBodega) references Bodega (IdBodega)
)Engine = InnoDB;

create table moneda(
IdMoneda int primary key not null,
Nombre varchar(30) not null,
estado boolean not null,
monedaCambio double(10,2) not null,
Simbolo varchar(2) not null
)Engine = InnoDB;

create table movimientomoneda(
IdMoneda int not null,
fecha int not null,
movimientocambio int not null,
primary key (IdMoneda, fecha),
foreign key (IdMoneda) references moneda (IdMoneda)
)Engine = InnoDB;

create table Serie(
Codigo Varchar(30) primary key not null,
anio date not null
)Engine = InnoDB;

create table Ventaencabezado(
CodigoVenta int not null,
IdEmpresa int not null,
Codigo Varchar(30) not null,
Fechaventa date not null,
TipoVenta varchar(10) not null,
Total double (10,2) not null,
IdMoneda int not null,
IdCliente int not null,
primary key (CodigoVenta,IdEmpresa, Codigo),
foreign key (IdEmpresa) references empresa (IdEmpresa),
foreign key (Codigo) references Serie (Codigo),
foreign key (IdMoneda) references moneda (IdMoneda),
foreign key (IdCliente) references Clientes (IdCliente)
)Engine = InnoDB;

create table Ventadetalle(
Orden int not null,
CodigoVenta int not null,
IdProducto int not null,
CantidadFacDet int not null,
CostoFacDet double (10,2) not null,
PrecioFactDet double(10,2) not null,
primary key (Orden, CodigoVenta, IdProducto),
foreign key (CodigoVenta) references Ventaencabezado (CodigoVenta),
foreign key (IdProducto) references Producto (IdProducto)
)Engine = InnoDB;