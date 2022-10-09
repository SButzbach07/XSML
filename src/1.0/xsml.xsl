<?xml version="1.0" encoding="UTF-8"?>

<!--
	XSL Stylesheet for eXtensible Site Markup Language
	Version 1.0
	Created by Scot Butzbach
	
	To use: <?xml-stylesheet type="text/xsl" href="xsml.xsl"?>
-->

<xsl:stylesheet version="3.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- Set output to XHTML 1.0 Transitional and indent output -->
	<xsl:output method="xhtml" version="1.0" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />

	<!-- <audio> Element -->
	<xsl:template match="audio">
		<audio controls="controls">
			<source>
				<xsl:attribute name="src">
					<xsl:value-of select="@location" />
				</xsl:attribute>
				<xsl:attribute name="type">
					<xsl:value-of select="@type" />
				</xsl:attribute>
			</source>
		</audio>
	</xsl:template>
	
	<!-- <bold> Element -->
	<xsl:template match="bold">
		<p><b><xsl:value-of select="text()" /></b></p>
	</xsl:template>

	<!-- <break> Element -->
	<xsl:template match="break">
		<xsl:choose>
			<xsl:when test="@type='block'">
				<br />
			</xsl:when>
			<xsl:when test="@type='inline'">
				<hr />
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- <button> Element -->
	<xsl:template match="button">
		<button>
			<xsl:attribute name="onclick">
				<xsl:value-of select="@action" />
			</xsl:attribute>
			<xsl:value-of select="text()" />
		</button>
	</xsl:template>

	<!-- <embed> Element -->
	<xsl:template match="embed">
		<script src="https://unpkg.com/@ruffle-rs/ruffle" type="text/javascript"></script>
		<object>
			<xsl:attribute name="data">
				<xsl:value-of select="@location" />
			</xsl:attribute>
		</object>
	</xsl:template>

	<!-- <header> Element -->
	<xsl:template match="header">
		<xsl:choose>
			<xsl:when test="@level=1">
				<h1><xsl:value-of select="text()" /></h1>
			</xsl:when>
			<xsl:when test="@level=2">
				<h2><xsl:value-of select="text()" /></h2>
			</xsl:when>
			<xsl:when test="@level=3">
				<h3><xsl:value-of select="text()" /></h3>
			</xsl:when>
			<xsl:when test="@level=4">
				<h4><xsl:value-of select="text()" /></h4>
			</xsl:when>
			<xsl:when test="@level=5">
				<h5><xsl:value-of select="text()" /></h5>
			</xsl:when>
			<xsl:when test="@level=6">
				<h6><xsl:value-of select="text()" /></h6>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- <highlight> Element -->
	<xsl:template match="highlight">
		<p><mark><xsl:value-of select="text()" /></mark></p>
	</xsl:template>

	<!-- <hyperlink> Element -->
	<xsl:template match="hyperlink">
		<a>
			<xsl:attribute name="href">
				<xsl:value-of select="@location" />
			</xsl:attribute>
			<xsl:attribute name="target">
				<xsl:value-of select="@target" />
			</xsl:attribute>
			<xsl:value-of select="text()" />
		</a>
	</xsl:template>

	<!-- <image> Element -->
	<xsl:template match="image">
		<img>
			<xsl:attribute name="src">
				<xsl:value-of select="@location" />
			</xsl:attribute>
			<xsl:attribute name="alt">
				<xsl:value-of select="@alt-text" />
			</xsl:attribute>
		</img>
	</xsl:template>

	<!-- <italic> Element -->
	<xsl:template match="italic">
		<p><i><xsl:value-of select="text()" /></i></p>
	</xsl:template>

	<!-- <list> Element -->
	<xsl:template match="list">
		<xsl:choose>
			<xsl:when test="@type='ordered'">
				<ol>
					<!-- <item> Element -->
					<xsl:for-each select="item">
						<li><xsl:value-of select="text()" /></li>
					</xsl:for-each>
				</ol>
			</xsl:when>
			<xsl:when test="@type='unordered'">
				<ul>
					<!-- <item> Element -->
					<xsl:for-each select="item">
						<li><xsl:value-of select="text()" /></li>
					</xsl:for-each>
				</ul>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- <quote> Element -->
	<xsl:template match="quote">
		<xsl:choose>
			<xsl:when test="@type='block'">
				<blockquote><xsl:value-of select="text()" /></blockquote>
			</xsl:when>
			<xsl:when test="@type='inline'">
				<q><xsl:value-of select="text()" /></q>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- <strikethrough> Element -->
	<xsl:template match="strikethrough">
		<p><del><xsl:value-of select="text()" /></del></p>
	</xsl:template>

	<!-- <subscript> Element -->
	<xsl:template match="subscript">
		<p><sub><xsl:value-of select="text()" /></sub></p>
	</xsl:template>

	<!-- <superscript> Element -->
	<xsl:template match="superscript">
		<p><sup><xsl:value-of select="text()" /></sup></p>
	</xsl:template>

	<!-- <table> Element -->
	<xsl:template match="table">
		<table border="1">
			<!-- <row> Element -->
			<xsl:for-each select="row">
				<tr>
					<!-- <cell> Element -->
					<xsl:for-each select="cell">
						<xsl:choose>
							<xsl:when test="@type='header'">
								<th><xsl:value-of select="text()" /></th>
							</xsl:when>
							<xsl:when test="@type='normal'">
								<td><xsl:value-of select="text()" /></td>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>

	<!-- <text> Element -->
	<xsl:template match="text">
		<p><xsl:value-of select="text()" /></p>
	</xsl:template>

	<!-- <underline> Element -->
	<xsl:template match="underline">
		<p><ins><xsl:value-of select="text()" /></ins></p>
	</xsl:template>

	<!-- <video> Element -->
	<xsl:template match="video">
		<video controls="controls">
			<source>
				<xsl:attribute name="src">
					<xsl:value-of select="@location" />
				</xsl:attribute>
				<xsl:attribute name="type">
					<xsl:value-of select="@type" />
				</xsl:attribute>
			</source>
		</video>
	</xsl:template>

	<!-- <webframe> Element -->
	<xsl:template match="webframe">
		<iframe>
			<xsl:attribute name="src">
				<xsl:value-of select="@source" />
			</xsl:attribute>
		</iframe>
	</xsl:template>

	<!-- <xsml> (Main) Element -->
	<xsl:template match="xsml">
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US">
			<xsl:attribute name="lang">
				<xsl:value-of select="@language" />
			</xsl:attribute>
			<head>
				<title><xsl:value-of select="@title" /></title>
				<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1" />
			</head>
			<body>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
