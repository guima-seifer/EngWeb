<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output encoding="UTF-8" indent="yes" method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>    
            </head>
            <body>
                <table border="1">
                    <tr><th>Alojamento</th> <th>Local</th> <th>Contacto</th> <th>Web</th></tr>
                    <xsl:apply-templates/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="poiso">
        <tr>
            <td><xsl:value-of select="desc"/></td>
            <td><xsl:value-of select="local"/></td>
            <td>
                <xsl:if test="telefone">
                    <ul>
                        <!-- se existir algum filho aplicar o template a cada um -->
                        <xsl:apply-templates select="telefone"></xsl:apply-templates>
                    </ul>
                </xsl:if>
            </td>
            <td>
                <xsl:if test="xref">
            <a href="{xref/@href}">
                <xsl:value-of select="xref/@href"/>
            </a>
                </xsl:if>
            </td>  
        </tr>
    </xsl:template>
    
    <xsl:template match="telefone">
        <li>
            <xsl:value-of select="."/>
        </li>
    </xsl:template>
    
</xsl:stylesheet>