<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="xml" encoding="utf-8" indent="yes" />

    <xsl:template match="xbel">

        <xsl:element name="favoritos">
            <xsl:attribute name="propietario">
                <xsl:value-of select="owner"></xsl:value-of>
            </xsl:attribute>

            <xsl:element
                name="fecha">
                <xsl:value-of select="@added"></xsl:value-of>
            </xsl:element>

            <xsl:for-each
                select="folder">
                <xsl:comment><xsl:text>Comentario: </xsl:text></xsl:comment>
               <xsl:comment> <xsl:value-of select="title"></xsl:value-of></xsl:comment> 

            <xsl:for-each
                    select="bookmark">
                    <xsl:sort select="ranking" data-type="number" order="descending"></xsl:sort>
                <xsl:if
                        test="ranking">
                        <xsl:element name="item">
                            <xsl:element name="puntos"><xsl:value-of select="ranking"></xsl:value-of></xsl:element>
                        <xsl:element
                                name="titulo"><xsl:value-of select="title"></xsl:value-of></xsl:element>
                        <xsl:element
                                name="url"><xsl:value-of select="@href"></xsl:value-of></xsl:element>
                        <xsl:element
                                name="etiquetas"><xsl:for-each select="tag">
                                    <xsl:value-of select="concat(., '#')"></xsl:value-of>
                                </xsl:for-each></xsl:element>
                        </xsl:element>
                    </xsl:if>
                </xsl:for-each>

            </xsl:for-each>


        </xsl:element>


    </xsl:template>


</xsl:stylesheet>