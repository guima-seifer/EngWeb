<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>    
            </head>
            <body>
                <table border="0">
                    <tr>
                        <td width="25%" valign="top">
                            <h3><a name="indice"/>Índice</h3>
                            <ol>
                                <!-- Seleciona todas as provincias que cujo nome é diferente do anterior, comparar o conteudo normalizado da provinvia corrente com todas ja normalizadas -->
                                <xsl:apply-templates select="//prov[not(normalize-space(.)=preceding::prov/normalize-space(.))]" >        
                                    <!-- normalize-space() remove espaços nas strings -->
                                    <xsl:sort select="normalize-space(.)" order="ascending" data-type="text"/>
                                </xsl:apply-templates>
                            </ol>
                        </td>
                        <td>
                            <h2>Cultura Musical Portuguesa</h2>
                            <xsl:apply-templates mode="conteudo"></xsl:apply-templates>
                        </td>
                    </tr>
                    
                </table>
            </body> 
        </html> 
    </xsl:template>
    
    <xsl:template match="prov">
        <li>
            <xsl:value-of select="."/>
            <xsl:variable name="c" select="normalize-space(.)"/>
            <ol type="a">
                <!-- So interessam aquele cujo concelho é igual ao atual -->
                <xsl:apply-templates select="//doc[$c=normalize-space(prov)]">
                    <xsl:sort select="tit" order="ascending" data-type="text"/>
                </xsl:apply-templates>
            </ol>
        </li>
    </xsl:template>
    
    <xsl:template match="doc">
        <li>
            <a href="#{generate-id()}">
                <xsl:value-of select="tit"/>
            </a>
        </li>
    </xsl:template>
    
    <xsl:template match="doc" mode="conteudo">
        <h3>
            <a name="{generate-id(.)}"/>
            <xsl:value-of select="tit"/>
        </h3>
        <b>Autor:</b>
        <xsl:value-of select="musico"/><br/>
        <b>Provincia:</b>
        <xsl:value-of select="prov"/><br/>
        <b>Local:</b>
        <xsl:value-of select="local"/><br/>
        <b>Observação:</b>
        <xsl:value-of select="obs"/><br/>
        <b>File:</b>
        <xsl:value-of select="file"/>
        <b> Duração:</b>
        <xsl:value-of select="duracao"/><br/>
        [<a href="#indice">Voltar ao Índice</a>]<br/><hr/>
    </xsl:template>
    
    <!-- Template para conteudo -->
    <!-- O mode é usado em qualquer situaçao onde e preciso fazer entradas de indice, pois usamos o mesmo no de arvore com processamentos diferentes -->
    
    <!-- Garbage collector -->
    <xsl:template match="text()" priority="-1"/>
</xsl:stylesheet>