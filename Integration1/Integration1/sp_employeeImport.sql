/****** Object:  StoredProcedure [dbo].[EmployeeInsert]    Script Date: 05/08/2018 08:54:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
  TEST STATEMENT:
  -------------------------------
  EXECUTE EmployeeInsert N'<Root>
    <Employee FirstName="Fred" MiddleName="brian" LastName="Flintstone" />
      
  </Root>'
  -------------------------------
  */
  CREATE PROCEDURE [dbo].[EmployeeInsert]
      @EmployeeStream VARCHAR(MAX)
  AS
  BEGIN
 
      -- Fix Incoming XML: Logic App add a "?" char at the beginning of the string
      SET @EmployeeStream = REPLACE(@EmployeeStream, '?<', '<');
 
      DECLARE @EmployeeXml XML(EmployeeXml) = CAST(@EmployeeStream AS XML(EmployeeXml));
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
          @EmployeeXml.nodes('/Person/Name') AS EmployeeObject(Header);
 
  END
GO


