<?xml version='1.0' encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <html lang="fr">
            <head>
                <meta charset="UTF-8"/>
                <title>XSL Films</title>
                <style>
                    p{
                    text-align: justify;
                    text-justify: inter-word;
                    }

                    .c-red{
                    color: red;
                    }

                    .c-blue{
                    color: darkblue;
                    }

                    .c-green{
                    color: green;
                    }

                    .info>div{
                    padding: 10px;
                    display: none;
                    }

                    .info>input:checked ~ div{
                    display: block;
                    }
                </style>
            </head>
            <body>
                <h1>Liste des films de ma base</h1>
                <table border="1">
                    <tbody>
                        <tr>
                            <td>
                                <strong>N°</strong>
                            </td>
                            <td>
                                <strong>Titre</strong>
                            </td>
                            <td>
                                <strong>Réalisateur</strong>
                            </td>
                            <td>
                                <strong>Pays</strong>
                            </td>
                            <td>
                                <strong>Genre</strong>
                            </td>
                            <td>
                                <strong>Durée</strong>
                            </td>
                            <td>
                                <strong>Affiche</strong>
                            </td>
                            <td>
                                <strong>Critique</strong>
                            </td>
                        </tr>
                        <xsl:apply-templates select="/FILMS/Film"/>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="/FILMS/Film">
        <tr>
            <td>
                <center>
                    <em>
                        <xsl:value-of select="substring(./@ID, 2)"/>
                    </em>
                </center>
            </td>
            <td>
                <b>
                    <xsl:value-of select="Titre"/>
                </b>
            </td>
            <td>
                <xsl:if test="count(Realisateur) &gt; 2">
                    <i>Film collectif</i>
                </xsl:if>
                <xsl:if test="count(Realisateur) &lt;= 2">
                    <xsl:apply-templates select="Realisateur"/>
                </xsl:if>
            </td>
            <td>
                <xsl:value-of select="Pays"/>
            </td>
            <td>
                <xsl:value-of select="Genre"/>
            </td>
            <td>
                <center>
                    <em>
                        <xsl:value-of select="Duree"/>
                    </em>
                </center>
            </td>
            <td>
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="./@Affiche"/>
                    </xsl:attribute>
                    <img width="70">
                        <xsl:attribute name="src">
                            <xsl:value-of select="./@Affiche"/>
                        </xsl:attribute>
                    </img>
                </a>
            </td>
            <td>
                <xsl:apply-templates select="Critique"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="Realisateur">
        <b>
            <xsl:value-of select="Nom"/>
        </b>
        -
        <xsl:value-of select="Prenom"/>
        <br/>
    </xsl:template>

    <xsl:template match="Critique">
        <div class="info">
            <input type="checkbox"/>
            <span>
            Voir -
                <xsl:if test="Note &gt; 2">
                    <span class="c-green">
                        <xsl:value-of select="Media"/>
                    </span>
                </xsl:if>
                <xsl:if test="Note &lt;= 2">
                    <span class="c-red">
                        <xsl:value-of select="Media"/>
                    </span>
                </xsl:if>
                <xsl:if test="not(Note)">
                    <span class="c-blue">
                        <xsl:value-of select="Media"/>
                    </span>
                </xsl:if>
            </span>
            <div>
                <h4>
                    <b>
                        Auteur:
                    </b>
                    <i>
                        <xsl:value-of select="Auteur"/>
                    </i>
                </h4>
                <p>
                    <xsl:value-of select="Texte"/>
                </p>
                <hr/>
            </div>
        </div>
    </xsl:template>


</xsl:stylesheet>