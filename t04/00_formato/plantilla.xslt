<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Formato de salida. Probar sin indent (o "no") -->
    <xsl:output method="xml" encoding="utf-8" indent="yes" />
    <!-- Se aplica si encuentra expresión XPATH en match -->
    <xsl:template match="/root">
        <!-- Crea comentario en salida desde XSLT -->
        <xsl:comment> Comentario creado desde XSLT </xsl:comment>
        <!-- creación de elemento con xsl:element -->
        <xsl:element name="elementoroot">
            <!-- creación de hijo "directa" -->
            <hijo> Contenido textual </hijo>
            <!-- creación de elemento con xsl:element -->
            <xsl:element name="hijo">
                <xsl:text> Nodo de Texto </xsl:text>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>