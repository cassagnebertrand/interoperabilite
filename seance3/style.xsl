<?xml version='1.0' encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="*">
        feuille #<xsl:value-of select="name(.)"/>#

        <xsl:if test="count(@*) > 0">
            <xsl:apply-templates select="@*"/>
        </xsl:if>
        <xsl:if test="count(@*) = 0">
            (pas d'attribut)
        </xsl:if>


        <xsl:choose>
            <xsl:when test="text() != ''">
                valeur $<xsl:value-of select="."/>$
            </xsl:when>
            <xsl:otherwise>
                (pas de valeur)
            </xsl:otherwise>
        </xsl:choose>

        <xsl:apply-templates select="./*"/>
    </xsl:template>
    <xsl:template match="@*">
        . Attribut #<xsl:value-of select="name(.)"/># Position n°<xsl:value-of select="position()"/> valeur $<xsl:value-of select="."/>$
    </xsl:template>

</xsl:stylesheet>