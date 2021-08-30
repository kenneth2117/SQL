USE [Db_prueba_A]
Go
--insert tabla departamneto
INSERT [dbo].[tbl_Departamento] ([Nombre], [Cantidad], [Direccion]) VALUES (N'Informatica', 10, N'san jose')
GO
INSERT [dbo].[tbl_Departamento] ([Nombre], [Cantidad], [Direccion]) VALUES (N'Administracion', 2, N'heredia')
GO
INSERT [dbo].[tbl_Departamento] ([Nombre], [Cantidad], [Direccion]) VALUES (N'Produccion', 25, N'san jose')
GO
--Insert de la tabla empleados
INSERT [dbo].[tbl_Empleados] ([Cedula], [Nombre], [FechaNacimiento], [IdDepartamento]) VALUES (N'604190112', N'kenneth', CAST(N'1995-09-21' AS Date), 1)
GO
INSERT [dbo].[tbl_Empleados] ([Cedula], [Nombre], [FechaNacimiento], [IdDepartamento]) VALUES (N'504120133', N'maria', CAST(N'1997-07-31' AS Date), 2)
GO
INSERT [dbo].[tbl_Empleados] ([Cedula], [Nombre], [FechaNacimiento], [IdDepartamento]) VALUES (N'233231242', N'Jose', CAST(N'1999-02-12' AS Date), 2)
GO
INSERT [dbo].[tbl_Empleados] ([Cedula], [Nombre], [FechaNacimiento], [IdDepartamento]) VALUES ( N'222113345', N'Daniela', CAST(N'1998-04-03' AS Date), 3)
GO