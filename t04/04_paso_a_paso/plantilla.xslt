<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Formato de salida. Probar sin indent (o "no") -->
    <xsl:output method="xml" encoding="utf-8" indent="yes" />
    <!-- Se aplica si encuentra expresión XPATH en match -->

    <xsl:template match="/CATALOG">

        <xsl:element name="micol">
            <!-- <xsl:text>Mi primer intento...</xsl:text> -->

            <xsl:element
                name="propietario">

                <xsl:text>El dueno es </xsl:text>


                <xsl:value-of
                    select="concat('Dueno:',OWNER, ' (', OWNER/@country, ') '   )"></xsl:value-of>


            </xsl:element>

            <!--  <xsl:element
                name="localiza">

                <xsl:value-of select="concat(URL/TYPE, '://', URL/LOCATION)"></xsl:value-of>


            </xsl:element> -->


            <xsl:element
                name="localiza">
                <xsl:attribute name="tipo">
                    <xsl:value-of select="URL/TYPE"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of
                    select="URL/LOCATION"></xsl:value-of>
            </xsl:element>

            <xsl:element
                name="comentarios">

                <xsl:for-each select="DESCRIPTION/LINE">

                    <xsl:element name="parrafo">
                        <xsl:value-of select="."></xsl:value-of>
                    </xsl:element>
                </xsl:for-each>

            </xsl:element>






            <xsl:for-each
                select="CD[PRICE &lt; 20]">
                <xsl:sort select="PRICE" data-type="number" order="ascending"></xsl:sort>
                <xsl:sort
                    select="TITLE"></xsl:sort>    


                <xsl:element name="disco">
                    <xsl:element name="descripcion">

                        <xsl:value-of select="concat(position(), ' - ')"></xsl:value-of>

                    <xsl:if
                            test="PRICE &lt; 8">OFERTA: </xsl:if>

                    <xsl:choose>
                            <xsl:when test="YEAR&lt;1980">RELIQUIA! </xsl:when>
                            <xsl:when test="YEAR&gt;1980 and YEAR&lt;1990">ANTIGUAYA! </xsl:when>
                            <xsl:otherwise>MODERNO! </xsl:otherwise>
                        </xsl:choose>

                    <xsl:value-of
                            select="concat(PRICE, ' - ', TITLE,' (', ARTIST, ') ')"></xsl:value-of>

                    </xsl:element>
                    <xsl:element
                        name="banda">


                        <xsl:if
                            test="BAND">
                            <xsl:text>Banda: </xsl:text>
                        </xsl:if>
                    
                <xsl:for-each
                            select="BAND/MUSICIAN">


                            <xsl:if test="position()!=last()">

                                <xsl:value-of select="concat(., ', ')"></xsl:value-of>


                            </xsl:if>
                    <xsl:if
                                test="position()=last()"><xsl:value-of select="."></xsl:value-of></xsl:if>
                        </xsl:for-each>

                    </xsl:element>


                </xsl:element>


            </xsl:for-each>


        </xsl:element>


    </xsl:template>
</xsl:stylesheet>