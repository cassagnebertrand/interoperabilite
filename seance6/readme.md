xsltproc seance5/styleFilm4.xsl seance5/film1.xml > seance5/style4.html

        <xsl:copy>
            <xsl:copy-of select="*[name() != 'Realisateur']"/>
        </xsl:copy>

        <xsl:copy>
            <xsl:copy-of select="@*">
            </xsl:copy-of>
        </xsl:copy>

<!DOCTYPE DATAS SYSTEM "newFilm.dtd">