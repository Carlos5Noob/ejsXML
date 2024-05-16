<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>
  <xsl:template match="/CATALOG">
    <xsl:comment>Generando desde XSLT: transformo, ordeno y filtro</xsl:comment>
    <coleccion>
      <propietario>
          <xsl:value-of select="OWNER"/>, <xsl:value-of select="OWNER/@country"/>
      </propietario>
      <localiza>
        <xsl:value-of select="URL/URL"/>
      </localiza>
      <xsl:for-each select="CD[YEAR>1995]">
      <xsl:sort  select="YEAR" />
       <disco>
        <editado>
                  <xsl:value-of select="YEAR"/>
        </editado>
        <autorTitulo>
                  <xsl:value-of select="ARTIST"/>
          <xsl:text>: </xsl:text>
          <xsl:value-of select="TITLE"/>
        </autorTitulo>

        </disco>
      </xsl:for-each>
    </coleccion>
  </xsl:template>
</xsl:stylesheet>
