<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="/catalog">
    <html>
      <head>
        <title>Ejemplo XSL</title>
        <style>
          th {background-color: silver; color: white}
          th, td { border: 1px dashed silver; padding: 0.5em;}        
        </style>
      </head>
      <body>
        <h1>Ejemplo XSL</h1>
        <table>
          <tr>
            <th>Orden</th>
            <th>Título</th>
            <th>Autor</th>
            <th>Año</th>
          </tr>
          <xsl:for-each select="cd">
          <xsl:sort select="year" />
          <tr> 
          <td><xsl:number value="position()" format="1"/></td>
            <td>
              <xsl:value-of select="title"/>
            </td>
            <td>
              <xsl:value-of select="artist"/>
            </td>
            <td>
              <xsl:value-of select="year"/>
            </td>            
            </tr>
            
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
