<?xml version='1.0'?> 
<xsl:stylesheet  
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" > 

<!-- Created by C. Albers mailto:chad@neomantic.com

This stylesheet (a Docbook XSL customizaton layer) translates Docbook XML 
output produced by lyX to into an XSL-FO stylesheet that can be convert, by fop,
into a pdf document.

License of the source code is "who knows" because much of it is cut-and-pasted
from Docbook XSL stylesheet which are released under multiple licenses -->
    
<xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/fo/docbook.xsl"/> 

<!-- parameters -->
<!-- hides hyperlinks -->
<xsl:param name="ulink.show" select="0"/>

<!-- removes the Table of Contents -->
<xsl:param name="generate.toc"/>
<!-- adds numbers to section lables -->
<xsl:param name="section.autolabel" select="1"/>


<!-- overrode template from titlepage.template.xsl -->
<xsl:template name="article.titlepage.recto">
  <xsl:choose>
    <xsl:when test="articleinfo/title">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="articleinfo/title"/>
    </xsl:when>
    <xsl:when test="artheader/title">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="artheader/title"/>
    </xsl:when>
    <xsl:when test="info/title">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="info/title"/>
    </xsl:when>
    <xsl:when test="title">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="title"/>
    </xsl:when>
  </xsl:choose>

  <xsl:choose>
    <xsl:when test="articleinfo/subtitle">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="articleinfo/subtitle"/>
    </xsl:when>
    <xsl:when test="artheader/subtitle">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="artheader/subtitle"/>
    </xsl:when>
    <xsl:when test="info/subtitle">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="info/subtitle"/>
    </xsl:when>
    <xsl:when test="subtitle">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="subtitle"/>
    </xsl:when>
  </xsl:choose>

  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="articleinfo/corpauthor"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="artheader/corpauthor"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="info/corpauthor"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="articleinfo/authorgroup"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="artheader/authorgroup"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="info/authorgroup"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="articleinfo/author"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="artheader/author"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="info/author"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="articleinfo/othercredit"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="artheader/othercredit"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="info/othercredit"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="articleinfo/releaseinfo"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="artheader/releaseinfo"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="info/releaseinfo"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="articleinfo/copyright"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="artheader/copyright"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="info/copyright"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="articleinfo/legalnotice"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="artheader/legalnotice"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="info/legalnotice"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="articleinfo/pubdate"/>
  <!-- added this line to parse the date element -->
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="articleinfo/date"/>
  
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="artheader/pubdate"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="info/pubdate"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="articleinfo/revision"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="artheader/revision"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="info/revision"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="articleinfo/revhistory"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="artheader/revhistory"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="info/revhistory"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="articleinfo/abstract"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="artheader/abstract"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="info/abstract"/>
</xsl:template>

<!-- added template to handle date element-->
<xsl:template match="articleinfo/date" mode="article.titlepage.recto.auto.mode">
    <fo:block xmlns:fo="http://www.w3.org/1999/XSL/Format" xsl:use-attribute-sets="set.titlepage.recto.style">
    <xsl:apply-templates select="." mode="set.titlepage.recto.mode"/>
    </fo:block>
</xsl:template>

<!-- overroad template to handle the command element -->
<xsl:template match="command">
<fo:block xsl:use-attribute-sets="command.style">
  <xsl:call-template name="inline.boldseq"/>
  </fo:block>
</xsl:template>

<!-- added different set of styles for the command element -->
<xsl:attribute-set name="command.style">
  <xsl:attribute name="background-color">#E0E0E0</xsl:attribute>
  <xsl:attribute name="border">thin black solid</xsl:attribute>
  <xsl:attribute name="wrap-option">wrap</xsl:attribute>
  <xsl:attribute name="padding">.5em</xsl:attribute>
   <xsl:attribute name="font-family">monospace</xsl:attribute>
   <xsl:attribute name="text-align">left</xsl:attribute>
</xsl:attribute-set>

<!-- added to change the Figure titles which were scaled to large -->
<xsl:attribute-set name="formal.title.properties" use-attribute-sets="normal.para.spacing"> 
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="font-size">
        <xsl:value-of select="$body.font.master * 1"/> <!-- decreased -->
        <xsl:text>pt</xsl:text>
    </xsl:attribute>
    <xsl:attribute name="hyphenate">false</xsl:attribute>
    <xsl:attribute name="space-after.minimum">0.4em</xsl:attribute>
    <xsl:attribute name="space-after.optimum">0.6em</xsl:attribute>
    <xsl:attribute name="space-after.maximum">0.8em</xsl:attribute>
</xsl:attribute-set>

<!-- altered to handle screen elements while keeping treating 
programlist and synopsis elements the same -->
<!-- NOTE: in order for this to working properly, though, for 
source code in screen elements, the xml document should be run through
xmllint with the noblanks flag enabled-->
<xsl:template match="programlisting|screen|synopsis">
  <xsl:param name="suppress-numbers" select="'0'"/>
  
  <xsl:choose>
  <xsl:when test="local-name() = 'screen'">
  <xsl:variable name="id"><xsl:call-template name="object.id"/></xsl:variable>
  <xsl:variable name="content">
    <xsl:choose>
      <xsl:when test="$suppress-numbers = '0'
                      and @linenumbering = 'numbered'
                      and $use.extensions != '0'
                      and $linenumbering.extension != '0'">
        <xsl:call-template name="number.rtf.lines">
          <xsl:with-param name="rtf">
	    <xsl:call-template name="apply-highlighting"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
	<xsl:call-template name="apply-highlighting"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$shade.verbatim != 0">
      <fo:block id="{$id}"
                xsl:use-attribute-sets="monospace.verbatim.properties shade.verbatim.style">
        <xsl:choose>
          <xsl:when test="$hyphenate.verbatim != 0 and function-available('exsl:node-set')">
            <xsl:apply-templates select="exsl:node-set($content)" mode="hyphenate.verbatim"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="$content"/>
          </xsl:otherwise>
        </xsl:choose>
      </fo:block>
    </xsl:when>
    <xsl:otherwise>
      <fo:block id="{$id}"
                xsl:use-attribute-sets="screen.monospace.verbatim.properties">
        <xsl:choose>
          <xsl:when test="$hyphenate.verbatim != 0 and function-available('exsl:node-set')">
            <xsl:apply-templates select="exsl:node-set($content)" mode="hyphenate.verbatim"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="$content"/>
          </xsl:otherwise>
        </xsl:choose>
      </fo:block>
    </xsl:otherwise>
  </xsl:choose>


  </xsl:when>
  <xsl:otherwise>
  <xsl:variable name="id"><xsl:call-template name="object.id"/></xsl:variable>
  <xsl:variable name="content">
    <xsl:choose>
      <xsl:when test="$suppress-numbers = '0'
                      and @linenumbering = 'numbered'
                      and $use.extensions != '0'
                      and $linenumbering.extension != '0'">
        <xsl:call-template name="number.rtf.lines">
          <xsl:with-param name="rtf">
	    <xsl:call-template name="apply-highlighting"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
	<xsl:call-template name="apply-highlighting"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$shade.verbatim != 0">
      <fo:block id="{$id}"
                xsl:use-attribute-sets="monospace.verbatim.properties shade.verbatim.style">
        <xsl:choose>
          <xsl:when test="$hyphenate.verbatim != 0 and function-available('exsl:node-set')">
            <xsl:apply-templates select="exsl:node-set($content)" mode="hyphenate.verbatim"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="$content"/>
          </xsl:otherwise>
        </xsl:choose>
      </fo:block>
    </xsl:when>
    <xsl:otherwise>
      <fo:block id="{$id}"
                xsl:use-attribute-sets="monospace.verbatim.properties">
        <xsl:choose>
          <xsl:when test="$hyphenate.verbatim != 0 and function-available('exsl:node-set')">
            <xsl:apply-templates select="exsl:node-set($content)" mode="hyphenate.verbatim"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="$content"/>
          </xsl:otherwise>
        </xsl:choose>
      </fo:block>
    </xsl:otherwise>
  </xsl:choose>

  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- changes from default have been noted -->
<xsl:attribute-set name="screen.monospace.verbatim.properties" use-attribute-sets="verbatim.properties monospace.properties">
    <xsl:attribute name="text-align">start</xsl:attribute>
    <!-- changed from no-wrap to prevent overflow -->
    <xsl:attribute name="wrap-option">wrap</xsl:attribute>
    <!-- added borders -->
    <xsl:attribute name="border">thin dotted solid</xsl:attribute>
    <!-- decreased size of font -->
    <xsl:attribute name="font-size">9pt</xsl:attribute>
    <!-- added shading -->
    <xsl:attribute name="background-color">#E6E6E6</xsl:attribute>
    <!-- added padding -->
    <xsl:attribute name="padding">.5em</xsl:attribute>
</xsl:attribute-set>

<!-- styles hyperlinks like webpages -->
<xsl:attribute-set name="xref.properties">
 <xsl:attribute name="color">blue</xsl:attribute> 
 <xsl:attribute name="text-decoration">underline</xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
