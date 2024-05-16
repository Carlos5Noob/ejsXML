<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Formato de salida. Probar sin indent (o "no") -->
    <xsl:output method="xml" encoding="utf-8" indent="yes" />

    <xsl:template match="/activos">

        <xsl:element name="plantilla">
            <xsl:attribute name="contacto">

                <xsl:for-each select="tel">
                    <xsl:if test="@uso = 'empresa'">
                        <xsl:value-of select="concat(../director, ' - Tel empresa: ', .)"></xsl:value-of>
                    </xsl:if>
                </xsl:for-each>
            </xsl:attribute>

                <xsl:element
                name="localizaciones">

                <xsl:for-each select="edificio">
                    <xsl:element name="map">
                        <xsl:value-of
                            select="concat(position(), ' Code: ', @code, ' - ', url_localiza )"></xsl:value-of>
                    </xsl:element>
                </xsl:for-each>


            </xsl:element>
                <xsl:element
                name="listado">



                <xsl:for-each select="edificio/elemento">
                <xsl:sort select="cantidad" data-type="number" order="descending"/>

                    <xsl:if test="cantidad &gt; 1">
                        <xsl:element name="item">

                            <xsl:value-of
                                select="concat(nombre, ' (', cantidad, ') ', '#', serial_number, ' Categorias: ')"></xsl:value-of>
                            <xsl:for-each
                                select="tipo">
                                <xsl:value-of select="."></xsl:value-of>
                                <xsl:if
                                    test="position() != last()">

                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:if>
               
            </xsl:for-each>
    

            </xsl:element>


        </xsl:element>

    </xsl:template>


</xsl:stylesheet>