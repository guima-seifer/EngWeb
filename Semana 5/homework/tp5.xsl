<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output encoding="UTF-8" indent="yes" method="html"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="//meta/title"/></title>
                <meta charset="UTF-8"/>
            </head>
            <body>
                <h1 style="text-align:center;">Project Record</h1>
                <hr/>
                <xsl:apply-templates select="//meta" mode="meta"/>
                <hr/>
                <hr/>
                <h2>Workteam</h2>
                <ol>
                <xsl:apply-templates select="//workteam" mode="workteam"/>
                </ol>
                <hr/>
                <h2>Abstract</h2>
                <xsl:apply-templates select="//abstract" mode="abstract"/>
                <hr/>
                <hr/>
                <h2>Deliverables</h2>
                <ul>
                    <xsl:apply-templates select="//deliverables" mode="deliverables"/>
                </ul>
                <hr/>
            </body>
        </html>
    </xsl:template>
    
   <xsl:template match="meta" mode="meta">
      
        <table width="100%">
            <tr>
                <td width="50%">
                    <b>KEY NAME:</b>
                    <xsl:value-of select="keyname"/><br/>
                </td>
                <td width="50%">
                    <b>BEGIN DATE:</b>
                    <xsl:value-of select="bdate"/><br/>
                </td>
            </tr>
            
            <tr>
                <td width="50%">
                    <b>TITLE:</b>
                    <xsl:value-of select="title"/><br/>
                </td>
                <td width="50%">
                    <b>END DATE:</b>
                    <xsl:value-of select="edate"/><br/>
                </td>
            </tr>
            
            <tr>
                <td width="50%">
                    <b>SUBTITLE:</b>
                    <xsl:value-of select="subtitle"/><br/>
                </td>
                <td width="50%">
                    
                    <b>SUPERVISOR:</b>
                    <xsl:value-of select="supervisor"/><br/>
                </td>
            </tr>
        </table>
     
    </xsl:template>

    <xsl:template match="member" mode="workteam">
        <li>
            <xsl:value-of select="name"/><span> -
                <a href="{@email}"><xsl:value-of select="email"/></a>
                 - <xsl:value-of select="id"/></span>
        </li>  
    </xsl:template>
    
    <xsl:template match="p" mode="abstract">
        <p>
            <xsl:apply-templates/>
        </p>
        
    </xsl:template>
    
    <xsl:template match="code">
        <span style="background-color: #e6e6e6">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="b">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    
    <xsl:template match="i">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    
    <xsl:template match="u">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>
    
    <xsl:template match="ackro">
        <xsl:if test="short">
            <span style="text-transform: uppercase;">
                <xsl:value-of select="./short"/>
            </span>
        </xsl:if>
        <xsl:if test="extended">
            <b>
                - <xsl:value-of select="./extended"/> -
            </b>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="deliverable" mode="deliverables">
        <li>
            <a href="{@url}"><xsl:value-of select="."/></a>
        </li>
    </xsl:template>

</xsl:stylesheet>