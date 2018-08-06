USE [employees]
GO

/****** Object:  StoredProcedure [dbo].[EmployeeInsert]    Script Date: 06/08/2018 21:20:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



/*
  TEST STATEMENT:
  -------------------------------
  EXECUTE EmployeeInsert N'<Person>
    <Name FirstName="Fred" MiddleName="brian" Surname="Flintstone" />
      
  </Person>'
  -------------------------------
  */
  CREATE PROCEDURE [dbo].[EmployeeInsert]
      @EmployeeStream VARCHAR(MAX)
  AS
  BEGIN
      -- Fix Incoming XML: Logic App add a "?" char at the beginning of the string
      SET @EmployeeStream = REPLACE(@EmployeeStream, '?<', '<');
 
      DECLARE @EmployeeXml XML = @EmployeeStream;
      DECLARE @EmployeeId UNIQUEIDENTIFIER = NEWID();
 
      INSERT INTO Employees
      (
          EmployeeId,
          FirstName,
		  MiddleName,
          LastName
      )
      SELECT
          @EmployeeId,
          FirstName = EmployeeObject.Header.value('./@FirstName', 'varchar(50)'),
          MiddleName = EmployeeObject.Header.value('./@MiddleName', 'varchar(50)'),
          LastName = EmployeeObject.Header.value('./@Surname', 'varchar(50)')
      FROM
          @EmployeeXml.nodes('//Name') AS EmployeeObject(Header);
 
  END


GO


