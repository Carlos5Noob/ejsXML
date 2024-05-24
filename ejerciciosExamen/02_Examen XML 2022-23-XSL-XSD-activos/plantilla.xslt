<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="xml" encoding="utf-8" indent="yes" />

    <xsl:template match="activos">

        <xsl:element name="plantilla">
            <xsl:for-each select="tel">
                <xsl:if test="@uso='empresa'">
                    <xsl:attribute name="contacto"><xsl:value-of
                            select="concat(../director, ' - Tel empresa: ', .)"></xsl:value-of></xsl:attribute>
                </xsl:if>
            </xsl:for-each>
           

            <xsl:element
                name="localizaciones">

                <xsl:for-each select="edificio">
                    <xsl:element name="map">
                        <xsl:value-of
                            select="concat(position(), ' Code: ', @code, ' - ', url_localiza)"></xsl:value-of>
                    </xsl:element>
                </xsl:for-each>


            </xsl:element>






            <xsl:element
                name="listado">

                <xsl:for-each select="edificio">
                    <xsl:comment><xsl:value-of select="concat('Edificio con código ', @code)"></xsl:value-of></xsl:comment>

                    <xsl:for-each
                        select="elemento[cantidad &gt; 1]">
                        <xsl:sort select="cantidad" data-type="number" order="descending"></xsl:sort>
                        <xsl:element
                            name="item">
                            <xsl:value-of
                                select="concat(nombre, ' (', cantidad, ') ', ' #' , serial_number, ' ')"></xsl:value-of>
                            <xsl:for-each
                                select="tipo">
                                <xsl:value-of select="concat(., ', ')"></xsl:value-of>
                            </xsl:for-each>
                        </xsl:element>
                    </xsl:for-each>

                </xsl:for-each>


            </xsl:element>


        </xsl:element>


    </xsl:template>

</xsl:stylesheet>