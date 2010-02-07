<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text"/>

<xsl:template match="/">
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="class">
    <xsl:variable name="thisyear" select="@year"/>
    <xsl:document
        href="{@year}/index.html"
        method="html"
        encoding="utf-8"
        indent="yes">
        <html lang="en">
        <head>
            <title>Work from the MA Typeface Design class of <xsl:value-of select="@year" /></title>
            <link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon" />
            <link rel="stylesheet" href="../style.css" type="text/css" media="screen" />
            <link rel="alternate" type="application/rss+xml" title="RSS" href="http://feeds.feedburner.com/matd/" />
            <script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
            </script>
            <script type="text/javascript">
            _uacct = "UA-2180405-2";
            urchinTracker();
            </script>
        </head>
        <body class="class{@year}">
            <div id="top">
                <h1><span><xsl:value-of select="../title" /></span></h1>
                <div id="RSS"><a href="http://feeds.feedburner.com/matd/"><span>RSS feed</span></a></div>
            </div>
            <div id="middle">
                <!-- YEAR MENU -->
                <ul id="years">
                    <xsl:for-each select="../*">
                        <xsl:sort select="@year" order="descending" />
						<xsl:choose>
						    <xsl:when test="@year=$thisyear">
						        <li class="active"><xsl:value-of select="$thisyear" /></li>
						    </xsl:when>
						    <xsl:when test="@ready=0">
								<li><xsl:value-of select="@year" /></li>
						    </xsl:when>
						    <xsl:otherwise>
						        <li><a href="../{@year}/"><xsl:value-of select="@year" /></a></li>
						    </xsl:otherwise>
						</xsl:choose>
                    </xsl:for-each>
                </ul>
                <div class="column">
                    <!-- INTRO -->
                    <div class="intro">
					<h2><span>Work from the  <xsl:value-of select="$thisyear" /> class</span></h2>
					<xsl:copy-of select="../intro/node()" />
                    </div>

                    <!-- PREVIEWS -->
                    <xsl:apply-templates select="designer[position() &lt;= ceiling(count(../designer) div 2)]" />
                </div>
                <div class="column" id="secondcolumn">
                    <!-- GROUP specimen -->
                    <div class="group-specimen">
                        <xsl:apply-templates select="group-specimen" />
                    </div>

                    <!-- PREVIEWS -->
                    <xsl:apply-templates select="designer[position() &gt; ceiling(count(../designer) div 2)]" />

                </div>
                <div class="clear"></div>
            </div> <!-- middle -->
            <div id="bottom">
				<p><em>Thanks!</em></p>
				<xsl:copy-of select="thanks/node()" />
				<p class="copyright">
			        <xsl:copy-of select="../copyright/node()" />
			    </p>
            </div> <!-- bottom -->
        </body>
    </html>
    </xsl:document>
</xsl:template>

<xsl:template match="group-specimen">
   	<h2><span>Group specimen</span></h2>
    <a href="../resources/A5specimen/{../@year}/{specimen}"
        onclick="urchinTracker('specimens/{../@year}/{specimen}')">Download the <xsl:value-of select="../@year" /> group specimen (<xsl:value-of select="size" />)</a>
</xsl:template>

<xsl:template match="designer">
	<p>
	<img src="previews/{preview}" class="preview" alt="Typeface preview: {typeface}" title="Typeface preview: {typeface}" /> <br />
	<em><xsl:value-of select="name" /> (<xsl:value-of select="country" />)</em>  <xsl:apply-templates select="email" /><xsl:apply-templates select="web" /><br />
	<em><xsl:value-of select="typeface" /></em>  <xsl:apply-templates select="specimen|webspecimen|rop" /><xsl:apply-templates select="vendor" /><xsl:apply-templates select="comment" />
	</p>
</xsl:template>

<xsl:template match="designer/email"><img src="img/divider1.png" class="link" /> <a href="mailto:{.}" class="link">email</a> 
</xsl:template>

<xsl:template match="web"><img src="img/divider1.png" class="link" /> <a href="http://{.}/" class="link">web</a> 
</xsl:template>

<xsl:template match="specimen"><img src="img/divider2.png" class="pdf" /> <a href="../resources/A5specimen/{../../@year}/{.}"
        onclick="urchinTracker('specimens/{../../@year}/{.}')" class="pdf">specimen</a> 
</xsl:template>

<xsl:template match="webspecimen"><img src="img/divider1.png" class="link" /> <a href="http://{.}" class="link">web specimen</a> 
</xsl:template>

<xsl:template match="rop"><img src="img/divider2.png" class="pdf" /> <a href="../resources/RoP/{../../@year}/{.}" title="Reflection on Practice"
        onclick="urchinTracker('RoPs/{../../@year}/{.}')" class="pdf">RoP</a> 
</xsl:template>

<xsl:template match="vendor"><img src="img/divider1.png" class="link" /> <a href="http://{.}" class="link">published by <xsl:value-of select="@name" /></a>
</xsl:template>

<xsl:template match="comment">— <xsl:value-of select="../comment" />
</xsl:template>

</xsl:stylesheet>
