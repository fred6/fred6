<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

    <xsl:template name="format-page_path">
        <xsl:param name="path"/>
        <xsl:if test="$path != ''">
            <xsl:value-of select="concat(' > ', substring-before($path, '/'))"/>
            <xsl:call-template name="format-page_path">
                <xsl:with-param name="path" select="substring-after($path, '/')"/>
            </xsl:call-template>
        </xsl:if>

    </xsl:template>

    <xsl:template match="/">
        <html>
            <head>
                <meta>
                    <xsl:attribute name="charset">
                        <xsl:value-of select="'utf-8'"/>
                    </xsl:attribute>
                </meta>
                <title>
                    <xsl:choose>
                        <xsl:when test="/root/page_title">
                            <xsl:value-of select="concat(/root/site_title, ' - ', /root/page_title)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="/root/site_title"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </title>
                <link>
                    <xsl:attribute name="href">
                        <xsl:value-of select="'/css/style.css'"/>
                    </xsl:attribute>
                    <xsl:attribute name="rel">
                        <xsl:value-of select="'stylesheet'"/>
                    </xsl:attribute>
                    <xsl:attribute name="type">
                        <xsl:value-of select="'text/css'"/>
                    </xsl:attribute>
                </link>
                <script>
                    <xsl:attribute name="type">
                        <xsl:value-of select="'text/x-mathjax-config'"/>
                    </xsl:attribute>
                    <xsl:text>
MathJax.Hub.Config({
    jax: ["input/TeX", "output/HTML-CSS"],
    extensions: ["tex2jax.js"],
    tex2jax: {
        inlineMath: [ ['\\(', '\\)'] ],
        displayMath: [ ['\\[','\\]'] ]
    },
"HTML-CSS": { availableFonts: ["TeX"] }
});
                    </xsl:text>
                </script>
                <script>
                    <xsl:attribute name="type">
                        <xsl:value-of select="'text/javascript'"/>
                    </xsl:attribute>
                    <xsl:attribute name="src">
                        <xsl:value-of select="'http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'"/>
                    </xsl:attribute>
                </script>
                <xsl:comment>
                    <![CDATA[[if lt IE 9]>
                    <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
                    <![endif]]]>
                </xsl:comment>
            </head>
            <body>
                <div>
                    <xsl:attribute name="id">
                        <xsl:value-of select="'container'"/>
                    </xsl:attribute>
                    <h1>
                        <xsl:attribute name="id">
                            <xsl:value-of select="'page_title'"/>
                        </xsl:attribute>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="'/index.html'"/>
                            </xsl:attribute>
                            <xsl:value-of select="/root/site_title"/>
                        </a>
                        <xsl:if test="/root/page_title and /root/page_title != 'index'">
                            <xsl:call-template name="format-page_path">
                                <xsl:with-param name="path" select="/root/page_path"/>
                            </xsl:call-template>
                            <xsl:value-of select="concat(' > ', /root/page_title)"/>
                        </xsl:if>
                    </h1>
                    <xsl:copy-of select="/root/content/*"/>
                </div>
            </body>

        </html>
    </xsl:template>
</xsl:stylesheet>
