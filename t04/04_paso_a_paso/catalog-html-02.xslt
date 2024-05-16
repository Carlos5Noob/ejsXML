<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="xml" encoding="utf-8" indent="yes" omit-xml-declaration="yes" />

	<xsl:template match="/CATALOG">		
	  <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE HTML&gt; &#10;</xsl:text>
		<html lang="es">
			<head>
				<meta charset="UTF-8" />
				<title>Ejemplo HTML XSLT</title>
			</head>
			<body>
        <h1>colección de <xsl:value-of select="OWNER" /></h1>
				<ol>
					<xsl:for-each select="CD">
						<li>
							<xsl:value-of select="concat(TITLE, ', ', ARTIST)" />
						</li>
					</xsl:for-each>
				</ol>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>