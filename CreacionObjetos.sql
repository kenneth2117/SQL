USE [Db_prueba_A]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Departamento]') AND type in (N'U'))
	ALTER TABLE [dbo].[tbl_Empleados] DROP CONSTRAINT [FK_tbl_Empleados_tbl_Departamento]
	go
	DROP TABLE dbo.tbl_Departamento;
GO
CREATE TABLE [dbo].[tbl_Departamento](
	[Id] [int] primary key IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Cantidad] [int] NULL,
	[Direccion] [varchar](50) NULL)
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Empleados]') AND type in (N'U'))
	DROP TABLE [dbo].[tbl_Empleados]
GO
CREATE TABLE [dbo].[tbl_Empleados](
    [Id] [int] primary key identity NOT NULL,
	[Cedula] [varchar](12) unique NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NULL,
	[IdDepartamento] [int] NOT NULL)
GO
ALTER TABLE [dbo].[tbl_Empleados] ADD CONSTRAINT [FK_tbl_Empleados_tbl_Departamento] FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[tbl_Departamento] ([Id])
GO
--ALTER TABLE [dbo].[tbl_Empleados] DROP CONSTRAINT [UC_Cedula]
ALTER TABLE [dbo].[tbl_Empleados]  ADD CONSTRAINT UC_Cedula UNIQUE (Cedula ASC);
GO
CREATE PROCEDURE sp_Upd_Departamneto
	@Id  int,
	@Nombre  varchar (50),
	@Cantidad  int,
	@Direccion  varchar (50)
AS
BEGIN	
  if exists(select Id from dbo.tbl_Departamento)
	UPDATE [dbo].[tbl_Departamento]
	   SET [Nombre] = @Nombre
		  ,[Cantidad] = @Cantidad
		  ,[Direccion] = @Direccion
	 WHERE Id = @Id
END
GO

CREATE PROCEDURE sp_Del_Empleados
	 @Id int 
AS
BEGIN
	if exists(select Id from dbo.tbl_Empleados)
		 DELETE FROM dbo.tbl_Empleados WHERE Id = @Id;
END
GO
