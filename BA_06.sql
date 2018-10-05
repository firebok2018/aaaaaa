CREATE DATABASE DB_NEGOCIO
GO
USE DB_NEGOCIO
SET DATEFORMAT YMD
GO
CREATE TABLE CATEGORIAS
(
IDCATEGORIA INT PRIMARY KEY,
NOMBRECATEGORIA VARCHAR(15),
DESCRIPCION TEXT,
FECHACOMPRA DATETIME)


CREATE SCHEMA VENTAS
GO

CREATE SCHEMA RRHH
GO
CREATE SCHEMA COMPRAS
GO
ALTER SCHEMA COMPRAS
TRANSFER CATEGORIAS
GO
SELECT*FROM COMPRAS.CATEGORIAS

INSERT COMPRAS.CATEGORIAS VALUES ('99','CEREALES')

INSERT COMPRAS.CATEGORIAS (IDCATEGORIA,NOMBRECATEGORIA,DESCRIPCION)
--VALUES ('99', 'CEREALES','SADAD')

INSERT INTO COMPRAS.CATEGORIAS VALUES(1,'BEBIDAS','GASEOSAS,CAFE,TE,CERVEZAS Y MALTAS',DEFAULT)
INSERT INTO COMPRAS.CATEGORIAS VALUES(2, 'CONDIMENTOS','SALSAS DULCES Y PICANTESDELICIAS COMIDAS PARA UNTAR Y ADEREZOS',DEFAULT)
INSERT INTO COMPRAS.CATEGORIAS  VALUES(3, 'REPOSTERIA','POSTERS, DULCES Y PAN DULCE',DEFAULT)
INSERT INTO COMPRAS.CATEGORIAS VALUES(4,'LACTEOS','QUESOS',DEFAULT)
GO
SELECT*FROM COMPRAS.CATEGORIAS
INSERT INTO COMPRAS.CATEGORIAS VALUES(5,'GRANOS/CEREALES','PAN , GALLETAS , PASTA Y CEREALES', DEFAULT),
(6,'CARNES','CARNES PREPARADAS',DEFAULT),(7,'FRUTAS/VERDURAS','FRUTAS SECAS Y QUESO DE SOJA',DEFAULT),
(8,'PESCADO/MARISCO','PESCADO MARISCOY ALGAS', DEFAULT)
SELECT*FROM COMPRAS.CATEGORIAS



INSERT COMPRAS.CATEGORIAS(IDCATEGORIA,NOMBRECATEGORIA)
SELECT CategoryID, CategoryName FROM Northwind.dbo.Categories
GO

CREATE TABLE Ventas.paises (
  Idpais char(3) primary key,
  NombrePais varchar(40) not null
  )
go

INSERT INTO Ventas.paises VALUES('001', 'Peru')
INSERT INTO Ventas.paises VALUES('002', 'Argentina')
INSERT INTO Ventas.paises VALUES('003', 'Chile')
INSERT INTO Ventas.paises VALUES('004', 'USA')
INSERT INTO Ventas.paises VALUES('005', 'España')
INSERT INTO Ventas.paises VALUES('006', 'Francia')
INSERT INTO Ventas.paises VALUES('007', 'Colombia')
INSERT INTO Ventas.paises VALUES('008', 'Canada')
INSERT INTO Ventas.paises VALUES('009', 'China')
go

CREATE TABLE Ventas.clientes (
  IdCliente varchar(5) primary key,
  NomCliente varchar(40) not null,
  DirCliente varchar(60) not null,
  idpais char(3) references Ventas.paises,
  fonoCliente varchar(25) not null
)
go


select*from VENTAS.clientes
select*from VENTAS.paises


BULK INSERT
VENTAS.clientes
FROM 'D:\Clientes.txt'
with (fieldterminator =',');
go

Delete from VENTAS.clientes
where  IdCliente like 'C0%'
go

select*from VENTAS.clientes

CREATE TABLE CONSUMER(
ID INT IDENTITY,
FULLNAME VARCHAR(50))
GO
INSERT dbo.CONSUMER
SELECT Nomcliente FROM VENTAS.clientes
GO 
SELECT*FROM CONSUMER

TRUNCATE TABLE dbo.CONSUMER
GO
SELECT*FROM dbo.CONSUMER
DELETE FROM dbo.CONSUMER

select*from VENTAS.clientes

update VENTAS.clientes
set NomCliente='bembos burger',
DirCliente='las  begonias 444',
idpais='001',
fonoCliente='(51)12385555'
where IdCliente='C003'
go
select*from VENTAS.clientes


create table COMPRAS.PROVEEDORES(
IDPROVEEDOR INT PRIMARY KEY,
NOMPROVEEDOR VARCHAR(40),
DIRPROVEEDOR VARCHAR(60),
NOMCONTACTO VARCHAR(80),
CARGOCONTACTO VARCHAR(50),
IDPAIS CHAR(3) NOT NULL,
FONOPROVEEDOR VARCHAR(15),
FAXPROVEEDOR VARCHAR(15)
)
CREATE TABLE COMPRAS.PRODUCTOS(
IDPRODUCTO INT PRIMARY KEY,
NOMPRODUCTO VARCHAR(40),
IDPROVEEDOR INT NOT NULL,
IDCATEGORIA INT NOT NULL,
CANTXUNIDAD VARCHAR(20),
PRECIOUNIDAD DECIMAL(10,0),
UNIDADESENEXISTENCIA SMALLINT,
UNIDADESENDEDIDO SMALLINT
)
SELECT*FROM COMPRAS.PROVEEDORES
SELECT*FROM COMPRAS.PRODUCTOS

INSERT INTO Compras.proveedores VALUES('1', 'Exotic Liquids', 'Charlotte Cooper', 'Gerente de compras', '49 Gilbert St.', '003', '(171) 555-2222', '')
INSERT INTO Compras.proveedores VALUES('2', 'New Orleans Cajun Delights', 'Shelley Burke', 'Administrador de pedidos', 'P.O. Box 78934', '008','(100) 555-4822', '')
INSERT INTO Compras.proveedores VALUES('3', 'Grandma Kellys Homestead', 'Regina Murphy', 'Representante de ventas', '707 Oxford Rd.', '001', '(313) 555-5735', '(313) 555-3349')
INSERT INTO Compras.proveedores VALUES('4', 'Tokyo Traders', 'Yoshi Nagase', 'Gerente de marketing', '9-8 Sekimai\r\nMusashino-shi', '007', '(03) 3555-5011', '')
INSERT INTO Compras.proveedores VALUES('5', 'Cooperativa de Quesos Las Cabras', 'Antonio del Valle Saavedra', 'Administrador de exportaciones', 'Calle del Rosal 4', '007', '(98) 598 76 54', '')
INSERT INTO Compras.proveedores VALUES('6', 'Mayumis', 'Mayumi Ohno', 'Representante de marketing', '92 Setsuko\r\nChuo-ku', '004', '(06) 431-7877', '')
INSERT INTO Compras.proveedores VALUES('7', 'Pavlova, Ltd.', 'Ian Devling', 'Gerente de marketing', '74 Rose St.\r\nMoonie Ponds', '008', '(03) 444-2343', '(03) 444-6588')
INSERT INTO Compras.proveedores VALUES('8', 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Representante de ventas', '29 Kings Way', '003', '(161) 555-4448', '')
INSERT INTO Compras.proveedores VALUES('9', 'PB Knäckebröd AB', 'Lars Peterson', 'Agente de ventas', 'Kaloadagatan 13', '009','031-987 65 43', '031-987 65 91')
INSERT INTO Compras.proveedores VALUES('10', 'Refrescos Americanas LTDA', 'Carlos Diaz', 'Gerente de marketing', 'Av. das Americanas 12.890', '003', '(11) 555 4640', '')
INSERT INTO Compras.proveedores VALUES('11', 'Heli Süßwaren GmbH & Co. KG', 'Petra Winkler', 'Gerente de ventas', 'Tiergartenstraße 5', '002', '(010) 9984510', '')
INSERT INTO Compras.proveedores VALUES('12', 'Plutzer Lebensmittelgroßmärkte AG', 'Martin Bein', 'Ger. marketing internacional', 'Bogenallee 51', '007', '(069) 992755', '')
INSERT INTO Compras.proveedores VALUES('13', 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinador de mercados', 'Frahmredder 112a', '002', '(04721) 8714', '')
INSERT INTO Compras.proveedores VALUES('14', 'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Representante de ventas', 'Viale Dante, 75', '006', '(0544) 60323', '(0544) 60603')
INSERT INTO Compras.proveedores VALUES('15', 'Norske Meierier', 'Beate Vileid', 'Gerente de marketing', 'Hatlevegen 5', '006', '(0)2-953010', '')
INSERT INTO Compras.proveedores VALUES('16', 'Bigfoot Breweries', 'Cheryl Saylor', 'Repr. de cuentas regional', '3400 - 8th Avenue\r\nSuite 210', '009', '(503) 555-9931', '')
INSERT INTO Compras.proveedores VALUES('17', 'Svensk Sjöföda AB', 'Michael Björn', 'Representante de ventas', 'Brovallavägen 231', '005', '08-123 45 67', '')
INSERT INTO Compras.proveedores VALUES('18', 'Aux joyeux ecclesiastiques', 'Guylène Nodier', 'Gerente de ventas', '203, Rue des Francs-Bourgeois', '008', '(1) 03.83.00.68', '(1) 03.83.00.62')
INSERT INTO Compras.proveedores VALUES('19', 'New England Seafood Cannery', 'Robb Merchant', 'Agente de cuentas al por mayor', 'Order Processing Dept.\r\n2100 Paul Revere Blvd.', '004',  '(617) 555-3267', '(617) 555-3389')
INSERT INTO Compras.proveedores VALUES('20', 'Leka Trading', 'Chandra Leka', 'Propietario', '471 Serangoon Loop, Suite #402',  '001',  '555-8787', '')
INSERT INTO Compras.proveedores VALUES('21', 'Lyngbysild', 'Niels Petersen', 'Gerente de ventas', 'Lyngbysild\r\nFiskebakken 10', '008', '43844108', '43844115')
INSERT INTO Compras.proveedores VALUES('22', 'Zaanse Snoepfabriek', 'Dirk Luchte', 'Gerente de contabilidad', 'Verkoop\r\nRijnweg 22', '008', '(12345) 1212', '(12345) 1210')
INSERT INTO Compras.proveedores VALUES('23', 'Karkki Oy', 'Anne Heikkonen', 'Gerente de produccion', 'Valtakatu 12', '001',  '(953) 10956', '')
INSERT INTO Compras.proveedores VALUES('24', 'Gday, Mate', 'Wendy Mackenzie', 'Representante de ventas', '170 Prince Edward Parade\r\nHunters Hill', '002',  '(02) 555-5914', '(02) 555-4873')
INSERT INTO Compras.proveedores VALUES('25', 'Ma Maison', 'Jean-Guy Lauzon', 'Gerente de marketing', '2960 Rue St. Laurent', '004',  '(514) 555-9022', '')
INSERT INTO Compras.proveedores VALUES('26', 'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Administrador de pedidos', 'Via dei Gelsomini, 153', '008', '(089) 6547665', '(089) 6547667')
INSERT INTO Compras.proveedores VALUES('27', 'Escargots Nouveaux', 'Marie Delamare', 'Gerente de ventas', '22, rue H. Voiron', '009',  '', '')
INSERT INTO Compras.proveedores VALUES('28', 'Gai pâturage', 'Eliane Noz', 'Representante de ventas', 'Bat. B\r\n3, rue des Alpes', '007', '38.76.98.06', '38.76.98.58')
INSERT INTO Compras.proveedores VALUES('29', 'Forêts derables', 'Chantal Goulet', 'Gerente de contabilidad', '148 rue Chasseur', '003', '(514) 555-2955', '(514) 555-2921')
go


INSERT INTO Compras.productos VALUES('1', 'Te Dharamsala', '1', '1', '10 cajas x 20 bolsas', '18', '39', '0')
INSERT INTO Compras.productos VALUES('2', 'Cerveza tibetana Barley', '1', '1', '24 - bot. 12 l', '19', '17', '40')
INSERT INTO Compras.productos VALUES('3', 'Sirope de regaliz', '1', '2', '12 - bot. 550 ml', '10', '13', '70')
INSERT INTO Compras.productos VALUES('4', 'Especias Cajun del chef Anton', '2', '2', '48 - frascos 6 l', '22', '53', '0')
INSERT INTO Compras.productos VALUES('5', 'Mezcla Gumbo del chef Anton', '2', '2', '36 cajas', '21', '0', '0')
INSERT INTO Compras.productos VALUES('6', 'Mermelada de grosellas de la abuela', '3', '2', '12 - frascos 8 l', '25', '120', '0')
INSERT INTO Compras.productos VALUES('7', 'Peras secas organicas del tio Bob', '3', '7', '12 - paq. 1 kg', '30', '15', '0')
INSERT INTO Compras.productos VALUES('8', 'Salsa de arandanos Northwoods', '3', '2', '12 - frascos 12 l', '40', '6', '0')
INSERT INTO Compras.productos VALUES('9', 'Buey Mishi Kobe', '4', '6', '18 - paq. 500 g', '97', '29', '0')
INSERT INTO Compras.productos VALUES('10', 'Pez espada', '4', '8', '12 - frascos 200 ml', '31', '31', '0')
INSERT INTO Compras.productos VALUES('11', 'Queso Cabrales', '5', '4', 'paq. 1 kg', '21', '22', '30')
INSERT INTO Compras.productos VALUES('12', 'Queso Manchego La Pastora', '5', '4', '10 - paq. 500 g', '38', '86', '0')
INSERT INTO Compras.productos VALUES('13', 'Algas Konbu', '6', '8', 'caja 2 kg', '6', '24', '0')
INSERT INTO Compras.productos VALUES('14', 'Cuajada de judias', '6', '7', '40 - paq. 100 g', '23', '35', '0')
INSERT INTO Compras.productos VALUES('15', 'Salsa de soja baja en sodio', '6', '2', '24 - bot. 250 ml', '15', '39', '0')
INSERT INTO Compras.productos VALUES('16', 'Postre de merengue Pavlova', '7', '3', '32 - cajas 500 g', '17', '29', '0')
INSERT INTO Compras.productos VALUES('17', 'Cordero Alice Springs', '7', '6', '20 - latas 1 kg', '39', '0', '0')
INSERT INTO Compras.productos VALUES('18', 'Langostinos tigre Carnarvon', '7', '8', 'paq. 16 kg', '62', '42', '0')
INSERT INTO Compras.productos VALUES('19', 'Pastas de te de chocolate', '8', '3', '10 cajas x 12 piezas', '9', '25', '0')
INSERT INTO Compras.productos VALUES('20', 'Mermelada de Sir Rodneys', '8', '3', '30 cajas regalo', '81', '40', '0')
INSERT INTO Compras.productos VALUES('21', 'Bollos de Sir Rodneys', '8', '3', '24 paq. x 4 piezas', '10', '3', '40')
INSERT INTO Compras.productos VALUES('22', 'Pan de centeno crujiente estilo Gustafs', '9', '5', '24 - paq. 500 g', '21', '104', '0')
INSERT INTO Compras.productos VALUES('23', 'Pan fino', '9', '5', '12 - paq. 250 g', '9', '61', '0')
INSERT INTO Compras.productos VALUES('24', 'Refresco Guarana Fantastica', '10', '1', '12 - latas 355 ml', '4', '20', '0')
INSERT INTO Compras.productos VALUES('25', 'Crema de chocolate y nueces NuNuCa', '11', '3', '20 - vasos  450 g', '14', '76', '0')
INSERT INTO Compras.productos VALUES('26', 'Ositos de goma Gumbär', '11', '3', '100 - bolsas 250 g', '31', '15', '0')
INSERT INTO Compras.productos VALUES('27', 'Chocolate Schoggi', '11', '3', '100 - piezas 100 g', '43', '49', '0')
INSERT INTO Compras.productos VALUES('28', 'Col fermentada Rössle', '12', '7', '25 - latas 825 g', '45', '26', '0')
INSERT INTO Compras.productos VALUES('29', 'Salchicha Thüringer', '12', '6', '50 bolsas x 30 salch', '123', '0', '0')
INSERT INTO Compras.productos VALUES('30', 'Arenque blanco del noroeste', '13', '8', '10 - vasos 200 g', '25', '10', '0')
INSERT INTO Compras.productos VALUES('31', 'Queso gorgonzola Telino', '14', '4', '12 - paq. 100 g', '12', '0', '70')
INSERT INTO Compras.productos VALUES('32', 'Queso Mascarpone Fabioli', '14', '4', '24 - paq. 200 g', '32', '9', '40')
INSERT INTO Compras.productos VALUES('33', 'Queso de cabra', '15', '4', '500 g', '2', '112', '0')
INSERT INTO Compras.productos VALUES('34', 'Cerveza Sasquatch', '16', '1', '24 - bot. 12 l', '14', '111', '0')
INSERT INTO Compras.productos VALUES('35', 'Cerveza negra Steeleye', '16', '1', '24 - bot. 12 l', '18', '20', '0')
INSERT INTO Compras.productos VALUES('36', 'Escabeche de arenque', '17', '8', '24 - frascos 250 g', '19', '112', '0')
INSERT INTO Compras.productos VALUES('37', 'Salmon ahumado Gravad', '17', '8', '12 - paq. 500 g', '26', '11', '50')
INSERT INTO Compras.productos VALUES('38', 'Vino Côte de Blaye', '18', '1', '12 - bot. 75 cl', '263', '17', '0')
INSERT INTO Compras.productos VALUES('39', 'Licor verde Chartreuse', '18', '1', '750 cc por bot.', '18', '69', '0')
INSERT INTO Compras.productos VALUES('40', 'Carne de cangrejo de Boston', '19', '8', '24 - latas 4 l', '18', '123', '0')
INSERT INTO Compras.productos VALUES('41', 'Crema de almejas estilo Nueva Inglaterra', '19', '8', '12 - latas 12 l', '9', '85', '0')
INSERT INTO Compras.productos VALUES('42', 'Tallarines de Singapur', '20', '5', '32 - 1 kg paq.', '14', '26', '0')
INSERT INTO Compras.productos VALUES('43', 'Cafe de Malasia', '20', '1', '16 - latas 500 g', '46', '17', '10')
INSERT INTO Compras.productos VALUES('44', 'Azúcar negra Malacca', '20', '2', '20 - bolsas 2 kg', '19', '27', '0')
INSERT INTO Compras.productos VALUES('45', 'Arenque ahumado', '21', '8', 'paq. 1k', '9', '5', '70')
INSERT INTO Compras.productos VALUES('46', 'Arenque salado', '21', '8', '4 - vasos 450 g', '12', '95', '0')
INSERT INTO Compras.productos VALUES('47', 'Galletas Zaanse', '22', '3', '10 - cajas 4 l', '9', '36', '0')
INSERT INTO Compras.productos VALUES('48', 'Chocolate holandes', '22', '3', '10 paq.', '12', '15', '70')
INSERT INTO Compras.productos VALUES('49', 'Regaliz', '23', '3', '24 - paq. 50 g', '20', '10', '60')
INSERT INTO Compras.productos VALUES('50', 'Chocolate blanco', '23', '3', '12 - barras 100 g', '16', '65', '0')
INSERT INTO Compras.productos VALUES('51', 'Manzanas secas Manjimup', '24', '7', '50 - paq. 300 g', '53', '20', '0')
INSERT INTO Compras.productos VALUES('52', 'Cereales para Filo', '24', '5', '16 - cajas 2 kg', '7', '38', '0')
INSERT INTO Compras.productos VALUES('53', 'Empanada de carne', '24', '6', '48 porc.', '32', '0', '0')
INSERT INTO Compras.productos VALUES('54', 'Empanada de cerdo', '25', '6', '16 tartas', '7', '21', '0')
INSERT INTO Compras.productos VALUES('55', 'Pate chino', '25', '6', '24 cajas x 2 tartas', '24', '115', '0')
INSERT INTO Compras.productos VALUES('56', 'Gnocchi de la abuela Alicia', '26', '5', '24 - paq. 250 g', '38', '21', '10')
INSERT INTO Compras.productos VALUES('57', 'Raviolis Angelo', '26', '5', '24 - paq. 250 g', '19', '36', '0')
INSERT INTO Compras.productos VALUES('58', 'Caracoles de Borgoña', '27', '8', '24 porc.', '13', '62', '0')
INSERT INTO Compras.productos VALUES('59', 'Raclet de queso Courdavault', '28', '4', 'paq. 5 kg', '55', '79', '0')
INSERT INTO Compras.productos VALUES('60', 'Camembert Pierrot', '28', '4', '15 - paq. 300 g', '34', '19', '0')
INSERT INTO Compras.productos VALUES('61', 'Sirope de arce', '29', '2', '24 - bot. 500 ml', '28', '113', '0')
INSERT INTO Compras.productos VALUES('62', 'Tarta de azúcar', '29', '3', '48 tartas', '49', '17', '0')
INSERT INTO Compras.productos VALUES('63', 'Sandwich de vegetales', '7', '2', '15 - frascos 625 g', '43', '24', '0')
INSERT INTO Compras.productos VALUES('64', 'Bollos de pan de Wimmer', '12', '5', '20 bolsas x 4 porc.', '33', '22', '80')
INSERT INTO Compras.productos VALUES('65', 'Salsa de pimiento picante de Luisiana', '2', '2', '32 - bot. 8 l', '21', '76', '0')
INSERT INTO Compras.productos VALUES('66', 'Especias picantes de Luisiana', '2', '2', '24 - frascos 8 l', '17', '4', '100')
INSERT INTO Compras.productos VALUES('67', 'Cerveza Laughing Lumberjack', '16', '1', '24 - bot. 12 l', '14', '52', '0')
INSERT INTO Compras.productos VALUES('68', 'Barras de pan de Escocia', '8', '3', '10 cajas x 8 porc.', '12', '6', '10')
INSERT INTO Compras.productos VALUES('69', 'Queso Gudbrandsdals', '15', '4', 'paq. 10 kg', '36', '26', '0')
INSERT INTO Compras.productos VALUES('70', 'Cerveza Outback', '7', '1', '24 - bot. 355 ml', '15', '15', '10')
INSERT INTO Compras.productos VALUES('71', 'Crema de queso Fløtemys', '15', '4', '10 - paq. 500 g', '21', '26', '0')
INSERT INTO Compras.productos VALUES('72', 'Queso Mozzarella Giovanni', '14', '4', '24 - paq. 200 g', '34', '14', '0')
INSERT INTO Compras.productos VALUES('73', 'Caviar rojo', '17', '8', '24 - frascos150 g', '15', '101', '0')
INSERT INTO Compras.productos VALUES('74', 'Queso de soja Longlife', '4', '7', 'paq. 5 kg', '10', '4', '20')
INSERT INTO Compras.productos VALUES('75', 'Cerveza Klosterbier Rhönbräu', '12', '1', '24 - bot. 0,5 l', '7', '125', '0')
INSERT INTO Compras.productos VALUES('76', 'Licor Cloudberry', '23', '1', '500 ml', '18', '57', '0')
INSERT INTO Compras.productos VALUES('77', 'Salsa verde original Frankfurter', '12', '2', '12 cajas', '13', '32', '0')
go

SELECT*FROM COMPRAS.PROVEEDORES
SELECT*FROM COMPRAS.PRODUCTOS

update COMPRAS.PRODUCTOS
set PRECIOUNIDAD=PRECIOUNIDAD*1.10
where IDPROVEEDOR in (select IDPROVEEDOR
from compras.proveedores
where idpais in (select IDPAIS
from VENTAS.paises where NombrePais='Colombia'))

select*from VENTAS.paises

declare  @cod char(3), @pais varchar(20)
set @cod='004'
set @pais='usa'
merge ventas.paises as target
using (select @cod, @pais) as source (idpais,nombrepais)
on(target.idpais=@cod)
when matched then
update set nombrepais='bolivia'
when not matched then insert values (@cod,@pais);