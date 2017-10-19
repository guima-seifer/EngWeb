<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:output encoding="UTF-8" indent="yes" method="html"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>    
            </head>
            <body>
                <table border="0.5">
                    <tr>
                        <td width="30%" valign="top">
                            <h3><a name="indice"/>Índice</h3>
                            <ol>
                                <!-- Seleciona todos os concelhos que cujo concelho é diferente do anterior, comparar o conteudo normalizado do concelho corrente com todos os concelhos ja normalizados -->
                                <xsl:apply-templates select="//CONCEL[not(normalize-space(.)=preceding::CONCEL/normalize-space(.))]" >        
                                    <!-- normalize-space() remove espaços nas strings -->
                                    <xsl:sort select="normalize-space(.)" order="ascending" data-type="text"/>
                                </xsl:apply-templates>
                            </ol>
                        </td>
                        <td>
                            <h2>Arqueositios de Portugal</h2>
                            <xsl:apply-templates mode="conteudo"></xsl:apply-templates>
                        </td>
                    </tr>
                    
                </table>
            </body> 
        </html> 
    </xsl:template>
    
    <xsl:template match="CONCEL">
        <li>
             <xsl:value-of select="."/>
            <xsl:variable name="c" select="normalize-space(.)"/>
            <ol type="a">
                <!-- So interessam aquele cujo concelho é igual ao atual -->
                <xsl:apply-templates select="//ARQELEM[$c=normalize-space(CONCEL)]">
                <xsl:sort select="IDENTI" order="ascending" data-type="text"/>
                </xsl:apply-templates>
            </ol>
        </li>
    </xsl:template>
    
    <xsl:template match="ARQELEM">
        <li>
            <a href="#{generate-id()}">
                <xsl:value-of select="IDENTI"/>
            </a>
        </li>
    </xsl:template>
    
    <xsl:template match="ARQELEM" mode="conteudo">
        <h3>
            <a name="{generate-id(.)}"/>
            <xsl:value-of select="IDENTI"/>
        </h3>
        <b>Concelho:</b>
        <xsl:value-of select="CONCEL"/><br/>
        <b>Freguesia:</b>
        <xsl:value-of select="FREGUE"/><br/>
        <b>Lugar:</b>
        <xsl:value-of select="LUGAR"/><br/>
        <b>Acesso:</b>
        <xsl:value-of select="ACESSO"/><br/>
        <b>Descrição:</b>
        <xsl:value-of select="DESARQ"/><br/>
        [<a href="#indice">Voltar ao Índice</a>]<br/><hr/>
    </xsl:template>
    
    <!-- Template para conteudo -->
    <!-- O mode é usado em qualquer situaçao onde e preciso fazer entradas de indice, pois usamos o mesmo no de arvore com processamentos diferentes -->
   
    <!-- Garbage collector -->
    <xsl:template match="text()" priority="-1"/>
</xsl:stylesheet>