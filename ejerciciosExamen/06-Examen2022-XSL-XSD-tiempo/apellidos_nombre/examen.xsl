<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes" encoding="UTF-8"></xsl:output>
   
<xsl:template match="/">
<prediccion>
  <!-- Genera una sección para cada fuente -->
  <xsl:for-each select="tiempo/fuente">
    <!-- Comentario con el nombre y la web de la fuente -->
    <xsl:comment>
      <xsl:value-of select="concat(nombre, ': ', web)"/>
    </xsl:comment>
    
    <!-- Itera sobre cada dato de la fuente -->
    <xsl:for-each select="dato">
      <muestra>
        <xsl:attribute name="fecha">
          <xsl:value-of select="fecha"/>
        </xsl:attribute>
        <fiabilidad>
          <xsl:value-of select="../@fiabilidad"/>
        </fiabilidad>
        <rango>
          <xsl:number value="position"/>.- 
          <xsl:value-of select="concat('De ', maxima, ' a ', minima, ' (', maxima/@escala, ').')"/>
        </rango>
        <sopla>
          <!-- Itera sobre cada elemento de viento -->
          <xsl:for-each select="viento">
            <hora>
              <xsl:value-of select="concat(@hora, ': ', .)"/>
            </hora>
          </xsl:for-each>
        </sopla>
      </muestra>
    </xsl:for-each>
  </xsl:for-each>
</prediccion>
</xsl:template>

</xsl:stylesheet>