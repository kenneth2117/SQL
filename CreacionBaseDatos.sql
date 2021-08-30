	USE [master]
	GO
	IF EXISTS (SELECT * FROM sysdatabases WHERE (name = 'Db_prueba_A')) 
	begin
		DROP DATABASE Db_prueba_A;
	end
	go
	CREATE DATABASE Db_prueba_A;
	go
	USE [Db_prueba_A]



