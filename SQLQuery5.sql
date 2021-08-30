select CONVERT(nvarchar(30),getdate(), 110) as USAformat;

SELECT FORMAT(getdate(), 'dd/MM/yyyy');

SELECT DATEADD(Year, 1, GETDATE()) AS NewDate;

select o.CustomerID as id_cliente, o.OrderDate,o.ShipCity as ciudad_barco,
o.ShipName as nombre_barco,c.ContactName as nombre_contacto,c.Phone as telefono 
from dbo.Orders o 
inner join dbo.Customers c on o.CustomerID = c.CustomerID
where o.OrderDate between '2/12/1996'and '1/9/1997' 
order by o.OrderDate;

--si tiene muchos datos puede tirar error
select o.CustomerID as id_cliente, o.OrderDate,o.ShipCity as ciudad_barco,
o.ShipName as nombre_barco,c.ContactName as nombre_contacto,c.Phone as telefono 
from dbo.Orders o 
inner join dbo.Customers c on o.CustomerID = c.CustomerID
where o.OrderDate between '22/12/1996'and '1/1/1997' 
order by o.OrderDate for json path;


select c.CustomerID as id_cliente, o.OrderDate,
c.ContactName as nombre_contacto,c.Phone as telefono,o.ShipCountry as pais_entrega,
case
when o.ShipCountry = 'france' then 'se encuentra retrasado'
else ''
end as Country_Problems 
from dbo.Orders o 
inner join dbo.Customers c on o.CustomerID = c.CustomerID
where o.OrderDate between '2/12/1996'and '1/9/1997' 
order by o.OrderDate;


select o.CustomerID,o.ShipCountry, count(o.OrderID) as cantidad, GETDATE(), datediff (DAY,'1995/10/28','1996/10/28') from dbo.Orders o 
group by o.CustomerID, o.ShipCountry
order by o.CustomerID

select count(o.OrderID) as cantidad, o.CustomerID, o.ShipRegion from dbo.Orders o 
where o.ShipRegion is not null
group by o.CustomerID, o.ShipRegion
 
 select distinct o.ShipCountry from dbo.Orders o

 select ROUND(avg(o.Freight),2) from dbo.Orders o



 CREATE PROCEDURE sp_ins_empleadoTransaction 
	-- Add the parameters for the stored procedure here
	@p_cedula int,
	@p_nombre varchar(50) , 
	@p_edad int,
    @p_posicion varchar(50),
	@msg AS VARCHAR(100) OUTPUT
AS
BEGIN 
begin tran
 begin try
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
declare @id int;
    -- Insert statements for procedure here
if Not EXISTS(select r.cedula from [dbo].[tbl_empleados] r where r.cedula = @p_cedula)

      INSERT INTO [dbo].[tbl_empleados] 
           ([cedula],[nombre],[edad],[posicion])
     VALUES(@p_cedula,@p_nombre,
           @p_edad,@p_posicion);

		   set @msg = 'registro correctamente'

		  commit tran		
	end try
	begin catch
set @msg = 'ocurrio un error: '+ERROR_MESSAGE();
       rollback tran
end catch
END 

GO




Create PROCEDURE [dbo].[sp_ins_empleadoTransaction] 
	-- Add the parameters for the stored procedure here
	@p_cedula int,
	@p_nombre varchar(50) , 
	@p_edad int,
    @p_posicion varchar(50),
	@msg AS int OUTPUT
AS
BEGIN 
 begin try
		
    -- Insert statements for procedure here
	/*IF EXISTS(select r.cedula from [dbo].[tbl_empleados] r where r.cedula = @p_cedula)*/

	INSERT INTO [dbo].[tbl_empleados] 
           ([cedula],[nombre],[edad],[posicion])
     VALUES(@p_cedula,@p_nombre,
           @p_edad,@p_posicion);
		   set @msg = 0;
	
	end try
	begin catch
		set @msg = 1;
end catch
END 


CREATE PROCEDURE usp_CustomerCreate
	   @FirstName varchar(20),
	   @LastName varchar(20),
	   @Email	varchar(20),
	   @PhoneNumber int
	 
AS
BEGIN
INSERT INTO Customer  (
	   FirstName,
	   LastName,
	   Email,
	   PhoneNumber)
    VALUES (
	   @FirstName,
	   @LastName,
	   @Email,
	   @PhoneNumber)
 
SET @CustomerID = SCOPE_IDENTITY()
 
SELECT 
	   FirstName = @FirstName,
	   LastName = @LastName,
	   Email	= @Email,
	   PhoneNumber =@PhoneNumber
FROM Customer 
WHERE  CustomerID = @CustomerID
END


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [CompanyName],
     o.OrderID, o.OrderDate, o.ShipRegion
  FROM [Northwind].[dbo].[Shippers] s
  left join dbo.Orders o on o.ShipVia = s.ShipperID
  where o.ShipRegion is null;

  -- Aumentamos en un 10% los precios de los libros de editorial "Planeta":
update libros set precio=precio+(precio*0.1)
  from libros 
  inner join editoriales as e
  on codigoeditorial=e.codigo
  where nombre='Planeta';



