<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0" version="1.0" xmlns:ns0="http://Integration1.PersonXml" xmlns:s0="http://Integration1.Person">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Company" />
  </xsl:template>
  <xsl:template match="/s0:Company">
    <ns0:Person>
      <xsl:for-each select="Employee">
        <Name>
          <xsl:attribute name="FirstName">
            <xsl:value-of select="FirstName/text()" />
          </xsl:attribute>
          <xsl:attribute name="MiddleName">
            <xsl:value-of select="MiddleName/text()" />
          </xsl:attribute>
          <xsl:attribute name="Surname">
            <xsl:value-of select="LastName/text()" />
          </xsl:attribute>
        </Name>
      </xsl:for-each>
    </ns0:Person>
  </xsl:template>
</xsl:stylesheet>