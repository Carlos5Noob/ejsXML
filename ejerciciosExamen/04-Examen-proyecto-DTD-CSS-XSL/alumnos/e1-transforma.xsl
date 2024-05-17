<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:output method="html" media-type="UTF-8"></xsl:output>

  <xsl:template match="proyecto">

    <xsl:element name="html">
      <xsl:element name="head">
        <xsl:element name="title">Título de la página</xsl:element>
        <style>
          h1 {color:blue; background-color: yellow;}
          ul li {color: red}
          ul li p{color: black}
        </style>
      </xsl:element>
      <xsl:element
        name="body">

        <xsl:element name="h1">Proyecto: <xsl:value-of select="datos_proyecto/titulo"></xsl:value-of></xsl:element>

        <xsl:element
          name="p">
          <xsl:value-of select="concat('Idioma: ', @lang)"></xsl:value-of>
        </xsl:element>

        <xsl:element
          name="p"> Autores: <xsl:for-each select="datos_proyecto/autor">
            <xsl:value-of select="concat(apellidos, ', ',  nombre, '. ')"></xsl:value-of>
          </xsl:for-each>

        </xsl:element>

      <xsl:element
          name="ol">
          <xsl:for-each select="apartado">
            <xsl:element name="li">
              <xsl:value-of select="titulo"></xsl:value-of>
            </xsl:element>

          <xsl:element
              name="ul">
              <xsl:for-each select="seccion/titulo">
                <xsl:element name="li">
                  <xsl:value-of select="."></xsl:value-of>
            <xsl:for-each select="../parrafo">
                    <xsl:element name="p"><xsl:value-of select="."></xsl:value-of></xsl:element>
                  </xsl:for-each>
                </xsl:element>
              </xsl:for-each>
            </xsl:element>

          </xsl:for-each>
        </xsl:element>

      </xsl:element>
    </xsl:element>


  </xsl:template>


</xsl:stylesheet>