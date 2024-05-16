<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Formato de salida. Probar sin indent (o "no") -->
    <xsl:output method="xml" encoding="utf-8" indent="yes" />
    <!-- Se aplica si encuentra expresión XPATH en match -->

    <xsl:template match="/proyecto">

        <xsl:element name="memoria">
            <xsl:attribute name="fecha">
                <xsl:value-of select="datos_proyecto/fecha_publicacion"></xsl:value-of>
            </xsl:attribute>
        <xsl:element
                name="titular">
                <xsl:value-of select="datos_proyecto/titulo"></xsl:value-of>
                <xsl:choose>

                    <xsl:when test="@lang ='es'">
                        <xsl:text>(Castellano)</xsl:text>
                    </xsl:when>

                    <xsl:when test="@lang ='fr'">
                        <xsl:text>(Francés)</xsl:text>
                    </xsl:when>

                    <xsl:otherwise>
                        <xsl:text>Idioma desconocido</xsl:text>
                    </xsl:otherwise>
                        
                </xsl:choose>   
            </xsl:element>
        <xsl:element
                name="autores">
                <xsl:for-each select="datos_proyecto/autor">
                    <xsl:value-of select="concat(apellidos, ' ', nombre, ' ')"></xsl:value-of>
                    <xsl:if
                        test="position()!= last()">
                        <xsl:text> y </xsl:text>
                    </xsl:if>

                </xsl:for-each>
            </xsl:element>
            <xsl:for-each
                select="datos_proyecto/bibliografia/referencia">
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:value-of select="@enlace"></xsl:value-of>
                    </xsl:attribute>
                   <xsl:value-of
                        select="."></xsl:value-of>
                </xsl:element>
            </xsl:for-each>

         <xsl:element
                name="blockquote">
                <xsl:element name="p">
                    <xsl:value-of select="dedicatoria/parrafo"></xsl:value-of>
                </xsl:element>
            </xsl:element>

         <xsl:element
                name="texto">

                <xsl:for-each select="apartado">
                    <xsl:element name="h2">
                        <xsl:value-of select="concat('(', @id, ') ')"></xsl:value-of>
                    <xsl:value-of
                            select="titulo"></xsl:value-of>
                    </xsl:element>
                <xsl:element
                        name="h3">
                        <xsl:value-of select="seccion/titulo"></xsl:value-of>
                    </xsl:element>
                <xsl:for-each
                        select="seccion/parrafo">
                        <xsl:if test="@estilo != 'revisar'">
                            <xsl:element name="p">
                                <xsl:value-of select="."></xsl:value-of>
                            </xsl:element>
                        </xsl:if>
                    </xsl:for-each>

                </xsl:for-each>


            </xsl:element>

        </xsl:element>


    </xsl:template>
</xsl:stylesheet>