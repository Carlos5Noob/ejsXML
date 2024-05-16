<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

  <!-- <xsl:strip-space elements="*"/> -->

  <xsl:template match="/CATALOG">


    <xsl:element name="coleccion">
      <xsl:element name="propietario">
        <xsl:value-of select="OWNER"/>
        <xsl:text>(</xsl:text>
        <xsl:value-of select="OWNER/@country"/>
        <xsl:text>)</xsl:text>
        <!-- <xsl:value-of select="concat(OWNER, '(',OWNER/@country, ')') "/> -->
      </xsl:element>
      <localiza>
        <xsl:value-of select="URL/LOCATION"/>
      </localiza>
    </xsl:element>
    
  </xsl:template>

</xsl:stylesheet>
