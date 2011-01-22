<?xml version='1.0'?>
<!-- Created by C. Albers mailto:chad@neomantic.com 

This stylesheet (a Docbook XSL customizaton layer) translates Docbook XML 
output produced by lyX to XHTML output.

License of the source code is "who knows" because much of it is cut-and-pasted
from Docbook XSL stylesheet which are released under multiple licenses -->

<!--  this embeds a css style sheet.  Instead of inserting it this way,
it can be inserted from a file using this line:
!ENTITY css SYSTEM "/path_to_css_file/cssfile.css" -->
<!DOCTYPE xsl:stylesheet [
<!ENTITY css ".command {
   display: block;
	font-family: monospace;
	border: thin black solid;
	padding: 1em;
	background-color: #E0E0E0;
}
code.literal,.filename,.email {
    font-family: monospace;
    display: inline;
    border: none;
    padding: 0;
}
pre.screen {
    font-family: monospace;
    padding: .5em;
}
p.title {
    display: inline;
    font-size: small;
}
p.title b {
    font-style: normal;
}
.figure-contents {
    border: thin black dotted;
    background-color: #E6E6E6;
}">
]>

<xsl:stylesheet  
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
<xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh/xhtml/onechunk.xsl"/> 

<!-- parameters -->
<!-- removes the Table of Contents -->
<xsl:param name="generate.toc"/>
<xsl:param name="section.autolabel" select="1"/> 

<xsl:param name="make.valid.html" select="1"/>


<xsl:param name="chunker.output.indent">yes</xsl:param>


<!-- enable this if you want to remove the header
<xsl:template match="*" mode="process.root">
  <xsl:call-template name="root.messages"/>
  <xsl:apply-templates select="."/>
</xsl:template>
-->

<xsl:template name="user.head.content">
<!-- This messes up the validation
<link rel="license" href="http://www.gnu.org/licenses/fdl.html" title="Legal Notice"/>
-->
<!-- the syltesheets add a xmlns="" attribute to this e-element
which messes up validation! -->
<style type="text/css">
&css;
</style>
</xsl:template>

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
  
  <!-- added this line for lyx Docbook XML -->
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

<xsl:template match="date" mode="set.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="set.titlepage.recto.style">
<xsl:apply-templates select="." mode="set.titlepage.recto.mode"/>
</div>
</xsl:template>

<!-- added template to handle date -->
<xsl:template match="date" mode="titlepage.mode">
  <xsl:call-template name="paragraph">
    <xsl:with-param name="class" select="local-name(.)"/>
    <xsl:with-param name="content">
      <xsl:apply-templates mode="titlepage.mode"/>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

</xsl:stylesheet>
