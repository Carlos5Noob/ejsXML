<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" encoding="utf-8" />

	<xsl:template match="/CATALOG">
		<html>
			<head>
				<title>Ejemplo HTML XSLT</title>
			</head>
			<body>
				<h1>colección de <xsl:value-of select="OWNER" /></h1>

				<section>
					<h2>Descripción</h2>
					<xsl:for-each select="DESCRIPTION/LINE">

						<p>
							<xsl:value-of select="." />
						</p>


					</xsl:for-each>
				</section>


				<ol>
					<xsl:for-each select="CD[PRICE &lt; 9]">
						<li>
							<xsl:value-of select="concat(TITLE, ', ', ARTIST)" />
						</li>
					</xsl:for-each>
				</ol>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>