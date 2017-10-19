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
</xsl:stylesheet>