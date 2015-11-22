<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8" />


<xsl:template match="/">
	<xsl:apply-templates select="/html/body" />
</xsl:template>



<xsl:template match="/html/body">
	<xsl:apply-templates select="div[@id='wrapper']/div[@id='page']/div[@id='corps']/ul[@id='epreuves']" />
</xsl:template>



<xsl:template match="div[@id='wrapper']/div[@id='page']/div[@id='corps']/ul[@id='epreuves']">
  <xsl:apply-templates select="li" />
  <xsl:text></xsl:text>
</xsl:template>



<xsl:template match="li">
	<xsl:if test="normalize-space(span[@class='section']) != 'VTT'">
		<xsl:apply-templates select="span" />
		<xsl:text>
		</xsl:text>
	</xsl:if>
</xsl:template>


<xsl:template match="span">
  <xsl:if test="@class='section'">
   	Section : <xsl:value-of select="normalize-space(.)" />
	</xsl:if>
  <xsl:if test="@class='nom'">
    Nom : <xsl:value-of select="normalize-space(a)" />
    Référence : <xsl:value-of select="concat('http://v3.velo101.fr',a/@href)" />
  </xsl:if>

  <xsl:if test="@class='date'">
    Date : <xsl:value-of select="normalize-space(.)" />
  </xsl:if>

</xsl:template>






</xsl:stylesheet>

