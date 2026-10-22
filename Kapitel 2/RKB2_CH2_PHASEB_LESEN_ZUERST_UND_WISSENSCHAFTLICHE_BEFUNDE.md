# Kapitel 2 – Phase B: Wissenschaftlicher Abschlussaudit (20.10.2026)

**Status: Vorpruefung technisch vollstaendig; Dissertation Kapitel 2 weiterhin DRAFT.** Aus den vom Nutzer bereitgestellten 25 PASS-Checks folgt: 141 Claimeintraege in_review, 135 Quelleneintraege in_review, 0 open in den Registern, 0 supported/accepted, 0 citation_checked=1, 0 Quellen verified.

## Wichtig: Was die automatischen Kontrollen nicht beweisen
SHA-256-Gleichheit beweist nur, dass der Text bytegleich mit der betreffenden IMPORTDATEI ist; sie beweist nicht die Identitaet zu einer frueheren ausfuehrlicheren Chatfassung. Ebenso sind DOI, Verlagstitel und Abstract-Indikationen keine Einzelbelege fuer jede Behauptung.

## Ausfuehrung (alle SQL-Skripte streng lesend)
1. `RKB2_CH2_PHASEB_00_BESTAND_UND_FINGERPRINTS.sql` – Gesamtsicht, Fingerprints und Registerstaende.
2. `RKB2_CH2_PHASEB_01_141_CLAIMS_135_QUELLEN_EXPORT.sql` – Alle Originalclaims und 135 unterschiedlichen Werke zum CSV-Export.
3. `RKB2_CH2_PHASEB_02_11_MANUSKRIPTE_17_WISSENSCHAFTSGATES.sql` – Hashabgleich aller Importtexte und 17 Wissenschaftsgates.
4. `RKB2_CH2_PHASEB_03_STRICT_FINAL_READINESS.sql` – Strenge Pruefung auf abgenommene Claims, Quellen und Reviewer-Nachweise.

## Referenzdateien und Import-Hashes
|Abschnitt|Importdatei|UTF-8 Bytes|SHA-256|
|:---|:---|---:|:---|
|2.0|`RKB2_20_ABSCHNITT_MANUSKRIPT.md`|18151|`d16e8ffeff24c45d405f536c1e7921abf894aa4808e6516772cf47b4a8b6768b`|
|2.1|`RKB2_21_MANUSKRIPT_AUS_SQL_IMPORT.md`|38770|`16703a280cfef8b302770f11eaaf9c3723e343785861753911ad1254a346e143`|
|2.2|`RKB2_22_ABSCHNITT_MANUSKRIPT_SQL_IDENTISCH.md`|42184|`80970d0719b7a780eda5a8d771f4561bda30cb6d359a96b2fbcbf92c31315059`|
|2.3|`RKB2_23_ABSCHNITT_MANUSKRIPT.md`|51548|`0e1b807d6b0d4ffc133c80dd482a1fc143c9b2b39becec5598ce0a66fa15823e`|
|2.4|`RKB2_24_ABSCHNITT_MANUSKRIPT.md`|56900|`b4f9c21d9de2c7c3bbcc3177bf378ae7470763c1d056cd99b64a9a2355217f8c`|
|2.5|`RKB2_25_ABSCHNITT_MANUSKRIPT.md`|60769|`c38f6ff1362035926324b94374337e44336d0dc36c806c02f88a79b73ba6a314`|
|2.6|`RKB2_26_ABSCHNITT_MANUSKRIPT.md`|58635|`97b50e210b72ecd90d4959282e9ca5d3e11c7d54ef4b9fa1acaa019a63eba735`|
|2.7|`RKB2_27_ABSCHNITT_MANUSKRIPT.md`|25408|`cabf32528857bbb4648529ec95ab6623490ad158cc1ae2176912606e6f82fcd0`|
|2.8|`RKB2_28_ABSCHNITT_MANUSKRIPT_KONSOLIDIERT.md`|21504|`3b5c4b4b55f48ddf79ea70e8a7edd8b111c30415903478fc81d4962a7bff8817`|
|2.9|`RKB2_29_ABSCHNITT_MANUSKRIPT_KANONISCH.md`|21276|`74ba34df4f9afc3b3b8baadd926dbf3366dbb9ffbd9e93d7546cb85a875e0364`|
|2.10|`RKB2_210_MANUSKRIPT_IMPORTFASSUNG.md`|16849|`02c7dbaaceb1f9b1134d26854d35fc241c2f7a64360898b5699560b40577ddeb`|

## Zwingende inhaltliche Pruef- und Redaktionspunkte
- **Volltext / Autorfreigabe:** Der Abgleich zwischen Chatmanuskript, Importfassung und spaeterer Endfassung muss fuer alle 11 Abschnitte explizit und unter Nachweis erfolgen; **2.1** hat eine nachgewiesene Abweichung zwischen aelterer Begleitdatei (knapp 23 KB) und Importdatei (38.770 Bytes; Import enthaelt zusaetzlich [28]–[31]); **2.7–2.10** koennen gegenueber den urspruenglichen Langfassungen gekuerzt sein. Keine automatische Textersetzung ohne Autorfreigabe.
- **[17] Torraco:** Verlagsabstract vorhanden, voller Seitenabgleich nachholen.
- **[29], [30] IEEE / Goldberg:** Die IEEE-Gleitkomma-Nullzeichen duerfen nicht mit eigens definierten gerichteten FRZK-Nullzustaenden gleichgesetzt werden.
- **[60], [64]:** Heft-/Jahrgangsmetadata mit Original-PDF bzw. Originalzeitschrift abgleichen; widerspruechliche Katalogangaben klären.
- **[81]:** Angaben 0,48 (Abstract) und 0,55 (gewichteter Gesamtschaetzer) im verwendeten Beleg nicht vermischen.
- **[90], [94], [95]:** Seitenzahl- bzw. Editionsjahr-Konflikte in Plomp, Creswell/Plano Clark und Yin klaeren.
- **[117]:** Giere: Ausgabe 1988 vs. 1990 unterscheiden.
- **[143], [145]:** Halmos / Mac Lane: DOI elektronischer Nachdrucke nicht als DOI der urspruenglich zitierten gedruckten Ausgabe darstellen.
- **[146]:** Konservative Erweiterung bei Gengelbach/Weber kann FRZK-Konsistenz nicht ohne eigenen formalen Beweis begruenden.
- **Geltungsbereich:** FRZK als methodisch-didaktischer Rahmen, keine neue bestaetigte Physik; mathematischer Beweis und empirische Lehrwirksamkeit sind separate Forschungsaufgaben.

## Schutz gegen verfruehte FINAL-Freigabe
Weder diese SQL-Skripte noch die dazugehoerige Anleitung aendern `source_usage.citation_checked`, `sources.verification_status`, die Reviewstatusfelder, Signaturen, 17 Gates oder Kapitelstatus. `CALL rkb2_ch2_final_release()` ist im aktuellen Stand weiterhin unzulaessig. Fuer eine echte Freigabe sind 135 belegte Quellenpruefungen, 141 claimgenaue Originalstellenpruefungen, unabhängige Abzeichnung, Volltextidentitaet und die 17 Wissenschaftsgates erforderlich.

**Nächster Arbeitsschritt nach diesem Audit:** Prioritaet (a) Volltextquelle des Langmanuskripts beschaffen und Differenzen beheben; (b) Quellen- und Claim-Export fuer seitengetreue Originalstellenpruefung verwenden; (c) nach dokumentierter Peer Review die Evidence-Register-Eintraege einzeln freigeben und die 17 wissenschaftlichen Gates pruefen.
