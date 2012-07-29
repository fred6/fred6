<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <div>
            <xsl:attribute name="id">
                <xsl:value-of select="'page'"/>
            </xsl:attribute>
            <div>
                <xsl:attribute name="id">
                    <xsl:text>desc</xsl:text>
                </xsl:attribute>
                <xsl:text>blather - quasi-daily linguistic secretions. Vital information for your everyday life.</xsl:text>
            </div>
            <div>
                <xsl:value-of disable-output-escaping="yes" select="/page/content"/>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>

