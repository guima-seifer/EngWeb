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
                    <tr>
                        <td width="30%" valign="top">
                            <h3><a name="indice"/>Índice de Histórias</h3>
                            <ol>
                                <xsl:apply-templates select="//h"/>
                            </ol>
                        </td>
                        <td>
                            <h3>
                                História de vida de <xsl:value-of select="/mp/hv/autor[@tipo='Depoente']"/>
                                <xsl:apply-templates mode="conteudo"/>
                            </h3>
                        </td>
                    </tr>
                    
                </table>
            </body>
        </html> 
    </xsl:template>
    
    <xsl:template match="h">
        <li>
            <a href="#{generate-id()}">
            <xsl:value-of select="@tit"/>
            </a>
        </li>
    </xsl:template>
    
    <!-- Template para conteudo -->
    <!-- O mode é usado em qualquer situaçao onde e preciso fazer entradas de indice, pois usamos o mesmo no de arvore com processamentos diferentes -->
    <xsl:template match="h" mode="conteudo">
        <h3>
            <a name="{generate-id()}"/>
            <xsl:value-of select="@tit"/>
            [<a href="#indice">Voltar ao Índice</a>]
        </h3>
        <xsl:apply-templates mode="conteudo"/>         
    </xsl:template>
    
    <xsl:template match="pergunta" mode="conteudo">
    <p> 
        <b>Pergunta: </b>
        <xsl:value-of select="."/>
    </p>
   
    </xsl:template>
    <!-- Garbage collector -->
    <xsl:template match="text()" priority="-1"/>
</xsl:stylesheet>