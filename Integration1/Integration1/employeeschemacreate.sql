USE [employees]

/****** Object:  XmlSchemaCollection [dbo].[EmployeeXml]    Script Date: 05/08/2018 10:58:23 ******/
CREATE XML SCHEMA COLLECTION [dbo].[EmployeeXml] AS N'<?xml version="1.0" encoding="utf-16"?>
<xs:schema xmlns="PersonXml" xmlns:b="http://schemas.microsoft.com/BizTalk/2003" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="Person">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="Name">
          <xs:complexType>
            <xs:attribute name="FirstName" type="xs:string" />
            <xs:attribute name="MiddleName" type="xs:string" />
            <xs:attribute name="Surname" type="xs:string" />
          </xs:complexType>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>'
GO


