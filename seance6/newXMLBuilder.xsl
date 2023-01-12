<?xml version='1.0' encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="UTF-8" standalone="yes"/>

    <xsl:strip-space elements="*"/>


    <xsl:template match="/FILMS">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE DATAS [
                &lt;!ELEMENT DATAS (Realisateurs,Acteurs,Films) >

                &lt;!ELEMENT Films (Film)* >
                &lt;!ELEMENT Realisateurs (Realisateur)* >
                &lt;!ELEMENT Acteurs      (Acteur)+ >


                &lt;!ELEMENT Film (Titre, (Scenario)*, Genre, Pays, Duree, Resume, (Palmares)*,
                        (Sortie)?, (Image)*, (Montage)*, (Musique)*, (Producteur)+, Distributeur, (Critique)*)>
                &lt;!ELEMENT Realisateur  (Nom, Prenom)>
                &lt;!ELEMENT Scenario     (Nom, Prenom)>
                &lt;!ELEMENT Image        (Nom, Prenom)>
                &lt;!ELEMENT Montage      (Nom, Prenom)>


                &lt;!ELEMENT Acteur       (Nom, (Prenom)?)>


                &lt;!ELEMENT Critique     (Media, Auteur, (Note)?, (Titre)?, Texte) >
                &lt;!ELEMENT Resume       ((Titre)?, Texte) >
                &lt;!ELEMENT Genre        (#PCDATA) >
                &lt;!ELEMENT Note         (#PCDATA) >
                &lt;!ELEMENT Media        (#PCDATA) >
                &lt;!ELEMENT Auteur       (#PCDATA) >
                &lt;!ELEMENT Texte        (#PCDATA) >
                &lt;!ELEMENT Pays         (#PCDATA) >
                &lt;!ELEMENT Sortie       (#PCDATA) >
                &lt;!ELEMENT Palmares     (#PCDATA) >
                &lt;!ELEMENT Distributeur (#PCDATA) >
                &lt;!ELEMENT Producteur   (#PCDATA) >
                &lt;!ELEMENT Titre        (#PCDATA) >
                &lt;!ELEMENT Duree        (#PCDATA) >
                &lt;!ELEMENT Nom          (#PCDATA) >
                &lt;!ELEMENT Prenom       (#PCDATA) >
                &lt;!ELEMENT Musique      (#PCDATA) >

                &lt;!ATTLIST Film
                        ID                  ID #REQUIRED
                        Langue (fr|uk|vo)   #REQUIRED
                        Affiche             CDATA "none"
                        ID_Realisateurs     IDREFS #IMPLIED
                        ID_Acteurs          IDREFS #IMPLIED>
                &lt;!ATTLIST Realisateur
                ID                ID #REQUIRED >

                &lt;!ATTLIST Acteur
                ID              ID #REQUIRED >
                ]></xsl:text>
        <DATAS>
            <Realisateurs>
                <xsl:apply-templates select="Film/Realisateur[not(@ID = preceding::Realisateur/@ID)]"/>
            </Realisateurs>
            <Acteurs>
                <xsl:apply-templates select="Film/Acteurs/Acteur[not(@ID = preceding::Acteurs/Acteur/@ID)]"/>
            </Acteurs>
            <Films>
                <xsl:apply-templates select="Film"/>
            </Films>
        </DATAS>
    </xsl:template>

    <xsl:template match="Realisateur">
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="Acteur">
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="Film">
        <xsl:copy>

            <xsl:copy-of select="@*"/>
            <xsl:if test="count(./Realisateur) > 0">
                <xsl:attribute name="ID_Realisateurs">
                    <xsl:apply-templates select="./Realisateur" mode="attribut"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="count(./Acteurs/Acteur) > 0">
                <xsl:attribute name="ID_Acteurs">
                    <xsl:apply-templates select="./Acteurs/Acteur" mode="attribut"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="*[(name() != 'Realisateur') and (name() != 'Acteurs')]"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Realisateur" mode="attribut">
        <xsl:value-of select="@ID"/>
        <xsl:text> </xsl:text>
    </xsl:template>

    <xsl:template match="Acteur" mode="attribut">
        <xsl:value-of select="@ID"/>
        <xsl:text> </xsl:text>
    </xsl:template>

</xsl:stylesheet>