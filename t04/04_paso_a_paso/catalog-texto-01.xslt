<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:output method="text" encoding="utf-8" />

  <xsl:template match="/CATALOG">
      <xsl:text>Titulo, Autor&#xa;</xsl:text>
      <xsl:for-each select="CD[PRICE &lt;'8']">
           
            <xsl:value-of select="concat(TITLE, ', ', ARTIST, '&#xa;' )"/>
      </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>