<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" encoding="UTF-8"></xsl:output>

	<xsl:template match="/filmoteca">

		<xsl:element name="html">
			<xsl:element name="head">
				<link rel="stylesheet" href="estilos.css"/>
			</xsl:element>
			<xsl:element name="body">
				<xsl:element name="h1">
					<xsl:value-of select="concat('Colección de ', propietario)"></xsl:value-of>
				</xsl:element>

				<xsl:for-each select="peliculas/pelicula">
				<xsl:sort select="duracion" data-type="number" order="ascending"></xsl:sort>
					<xsl:element name="h2">
						<xsl:value-of select="concat(@codigo, ': ', titulo)"></xsl:value-of>
						<xsl:if test="tituloOriginal">
							<xsl:value-of select="concat(', (', tituloOriginal, ')')"></xsl:value-of>
						</xsl:if>
						
					</xsl:element>

					<xsl:element name="section">
						<xsl:attribute name="id">desc</xsl:attribute>

						
						<xsl:value-of select="concat('Director: ', director)"></xsl:value-of>
						<xsl:element name="br"/>
						<xsl:value-of select="concat('Duración: ', duracion)"></xsl:value-of>
						<xsl:element name="br"/>
						<xsl:text>Cartel: enlace a </xsl:text>
						<xsl:element name="a">
							<xsl:attribute name="href"><xsl:value-of select="concat('carteles/', cartel/@fuente)"/>
							</xsl:attribute>
							<xsl:value-of select="cartel/@fuente"/>
						</xsl:element>

						<xsl:for-each select="sinopsis/parrafo">
						<xsl:element name="p">
							<xsl:value-of select="."></xsl:value-of>
						</xsl:element>
					</xsl:for-each>
						
					</xsl:element>
					<xsl:element name="section">
						<xsl:attribute name="id">reparto</xsl:attribute>
						<xsl:element name="ul">
							<xsl:for-each select="reparto/actor">
							<xsl:element name="li">
								<xsl:value-of select="."></xsl:value-of>
							</xsl:element>
						</xsl:for-each>
						</xsl:element>
					</xsl:element>
			</xsl:for-each>


			</xsl:element>
		</xsl:element>
		
	</xsl:template>
	
</xsl:stylesheet>