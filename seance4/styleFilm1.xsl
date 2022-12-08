<?xml version='1.0' encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <html lang="fr">
            <head>
                <meta charset="UTF-8"/>
                <title>XSL Films</title>
            </head>
            <body>
                <h1>Liste des films de ma base</h1>
                <ul>
                <xsl:for-each select="/FILMS/Film">
                    <li>
                        <xsl:value-of select="Titre"/>
                    </li>
                </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>