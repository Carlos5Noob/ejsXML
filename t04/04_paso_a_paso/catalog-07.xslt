<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" />

  <!-- <xsl:strip-space elements="*"/> -->

  <xsl:template match="/CATALOG">

    <xsl:element name="coleccion">
      <xsl:element name="propietario">
        <xsl:value-of select="concat(OWNER, '(',OWNER/@country, ')')" />
      </xsl:element>
      <xsl:element name="localiza">
        <xsl:value-of select="URL/LOCATION" />
      </xsl:element>
      <!--      Bucle para recorrer el catálogo      -->
      <xsl:for-each select="CD[YEAR &lt; '1986']">
        <xsl:sort select="PRICE" data-type="number" order="descending"/>
        <xsl:sort select="ARTIST" />
        <xsl:element name="disco">
          <xsl:choose>
              <xsl:when test="PRICE&lt;8">¡OFERTA!  </xsl:when>
              <xsl:when test="PRICE&lt;10">¡Buen precio! </xsl:when>
              <xsl:otherwise>
                <xsl:text>¡Novedad! </xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          <xsl:value-of select="concat(PRICE, ' - ', ARTIST, ': ', TITLE, ' - ', YEAR)" />
        </xsl:element>
      </xsl:for-each>
    </xsl:element>

  </xsl:template>

</xsl:stylesheet>