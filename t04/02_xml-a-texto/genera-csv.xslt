<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" omit-xml-declaration="yes" />
  <xsl:template match="/CATALOG">Title,Artist &#xa; <xsl:apply-templates select="CD" />
  </xsl:template>
  <xsl:template match="CD">
    <xsl:if test="YEAR&gt;1990"><xsl:value-of select="TITLE" />,<xsl:value-of select="ARTIST" /><xsl:text>
</xsl:text></xsl:if>
  </xsl:template>
</xsl:stylesheet>