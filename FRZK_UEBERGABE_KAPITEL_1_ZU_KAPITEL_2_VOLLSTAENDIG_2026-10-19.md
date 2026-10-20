# FRZK-DISSERTATION – VOLLSTÄNDIGE ÜBERGABE VON KAPITEL 1 ZU KAPITEL 2

**Projekt:** Neuaufbau der Dissertation zum Funktionalen Raum-Zeit-Kohärenzsystem (FRZK)  
**Übergabedatum:** 19. Oktober 2026  
**Ausgangskapitel:** Kapitel 1 – Einleitung  
**Zielkapitel:** Kapitel 2 – Forschungsstand, theoretische Bezüge und wissenschaftliche Einordnung (Arbeitstitel)  
**Datenbank:** `frzk_rkb_32_neu` (bestehende, fortgeschriebene MariaDB-Datenbank)  
**Verbindlicher Status Kapitel 1:** `CHAPTER_FINAL_GATE = RELEASED`, Kapitelwurzel `final`; abschließendes Prüfsystem 51: **6 von 6 PASS** (vom Autor aus phpMyAdmin übermittelt).  
**Ziel dieser Datei:** Alle für einen neuen Chat, die Kapitelplanung, eine externe Literaturrecherche, die wissenschaftliche Textarbeit und den revisionssicheren Datenbankaufbau nötigen Festlegungen ohne Rückgriff auf frühere Chatverläufe übergeben.

> **Wichtige Trennung:** Diese Datei ist ein internes Projekt- und Übergabedokument. Sie darf technische Angaben über Datenbankrevisionen, frühere Arbeitsschritte, offene Aufgaben und Prüfberichte enthalten. **Im eigentlichen Dissertationstext** dürfen diese verwaltungsinternen Angaben und Hinweise auf frühere Fassungen nicht erscheinen. Kapitel 1 ist freigegeben und wird ohne ausdrücklichen neuen Revisionsauftrag nicht mehr verändert.

---

## 1. Verbindlicher Abschlussstand von Kapitel 1

### 1.1 Fachlicher und redaktioneller Zustand

Kapitel 1 ist als wissenschaftliche **Einleitung** abgeschlossen, nicht als mathematisches Grundlagenkapitel. Es leitet den Untersuchungsgegenstand aus nachvollziehbaren eigenen Beobachtungen und technischen Modellierungserfahrungen her, führt die zentralen Forschungsfragen ein, grenzt den Anspruch des FRZK ein, erläutert das geplante Forschungsdesign und beschreibt den Aufbau der Arbeit. Die dort genannten mathematischen Besonderheiten werden lediglich angekündigt; die eigentliche Formalisierung ist Kapitel 3 vorbehalten.

**Gesicherter Umfang des freigegebenen Arbeitsstands:**

- 23 nummerierte beziehungsweise strukturelle Kapitelüberschriften einschließlich Kapitelüberschrift und Literaturverzeichnis im dokumentierten Kapitelmodell;
- 14 unterschiedliche Literaturquellen, neu **nach ihrer ersten Nennung** von `[1]` bis `[14]` geordnet;
- 18 Zitierstellen, darunter 14 Erstnennungen und vier Wiederverwendungen;
- zwei verbliebene und vom Autor als vollständig selbst erstellt bestätigte Abbildungen;
- **null aktive mathematische Gleichungen und null aktive formale Grunddefinitionen** im Einleitungskapitel;
- ein Forschungsplan für eine **geplante**, nicht bereits realisierte explorative didaktische Untersuchung mit voraussichtlich etwa 25 Lernenden;
- redaktioneller Abschluss und Autorenfreigabe in der Datenbank dokumentiert.

Die im technischen Verlauf früher einmal verzeichneten fünf Gleichungen und drei formalen Definitionen gehören **nicht** zur freigegebenen Einleitung. Sie bleiben nur als historische Datenbankobjekte erhalten. Gleichung (1.5) mit einer nicht definierten Verknüpfung `⊕` ist **keine universelle Grundgleichung des FRZK** und darf in Kapitel 2 nicht als etablierter Satz eingeführt werden.

### 1.2 Exakte Referenzdatei und Prüfsumme

**Verbindliche freigegebene Word-Datei:**  
`Kapitel_1_Einleitung_Literatur_nach_Erstnennung_2026-10-17.docx`

**SHA-256:**  
`2d855d13a616bbc684b6ceea228a664cdb31d0fc47ed46b549596e22f0b204f6`

Der Autor hat den Hashwert auf seinem Windows-Rechner unabhängig mittels `Get-FileHash` berechnet und die bytegenaue Übereinstimmung mit dieser Referenzfassung bestätigt. Diese Bestätigung wurde über eine separate DOCX-Evidenzrevision dokumentiert. Neue Arbeiten an Kapitel 2 haben diesen DOCX-Snapshot **nicht** zu ersetzen oder zu überschreiben.

### 1.3 Endgültige Abschlussprüfung

Nach dem guarded FINAL-GATE (Skript 50) meldete die Datenbank:

| Gate | Ergebnis |
|---|---|
| `CHAPTER_FINAL_GATE` | `RELEASED` |
| `AUTHOR_APPROVAL` | `PASS` |
| `LITERATURE_CONTENT` | `PASS_BY_AUTHOR` |
| `FIGURE_PROVENANCE` | `PASS_BY_AUTHOR` |
| `SOURCE_META` | `PASS_BY_AUTHOR` |

Das anschließend unabhängig ausgeführte Skript 51 lieferte:

| Abschlusskontrolle | Ergebnis |
|---|---|
| `AUTHOR_DECLARATION` | `PASS` |
| `LITERATURE_AUTHOR_PASS` | `PASS` |
| `FINAL_REVISION` | `PASS` |
| `CHAPTER_ROOT_FINAL` | `PASS` |
| `RELEASED_VALIDATION` | `PASS` |
| `RELEASED_READINESS` | `PASS` |

**Interpretation:** Die Datenbankfreigabe ist nach dem vom Autor übermittelten Prüfergebnis erfolgreich und technisch abgeschlossen. `PASS_BY_AUTHOR` bezeichnet eine dokumentierte **Autorenbestätigung**, keine unabhängige externe Überprüfung sämtlicher Originalpassagen, Metadaten oder Bildrechte. Die bereits erfolgte Freigabe darf nicht rückwirkend als anderer Nachweistyp umetikettiert werden.

### 1.4 Verbindliche Abbildungen

| Kennung | `figure_id` | Inhalt | Provenienz | Word-Medienpfad |
|---|---:|---|---|---|
| `1.F2` | 2 | Geometrischer Aufbau – Abbildung der gegebenen Werte | `original`; vom Autor vollständig selbst erstellt bestätigt | `word/media/image2.png` |
| `1.F3` | 3 | 3D-Darstellung der Signallaufzeit auf dem Betrachtungsdreieck | `original`; vom Autor vollständig selbst erstellt bestätigt | `word/media/image3.png` |

Eine früher vorhandene weitere Abbildung wurde aus der aktuellen Word-Fassung herausgenommen und nur im historischen Datenbestand behalten. Bei neuen Abbildungen in Kapitel 2 sind Herkunft, Rechtebasis, inhaltliche Funktion und Medienreferenz von Anfang an mitzuführen. Nur tatsächlich benötigte Abbildungen einsetzen.

### 1.5 Archivierung und Unveränderlichkeit

Vor der Materialisierung von Kapitel 2 sollte der Autor einen vollständigen SQL-Export der **bestehenden** Datenbank erstellen, beispielsweise `FRZK_Neuaufbau_Kapitel1_RELEASED_2026-10-19.sql`. Ein solcher Export wurde **empfohlen**, aber sein tatsächliches Vorliegen ist durch diesen Übergabestand nicht bestätigt. Keine Änderungen an den freigegebenen Kapitel-1-Zeilen, Zitatnummern oder Revisionen ohne neuen ausdrücklich beauftragten, nachprüfbaren Revisionsvorgang.

---

## 2. Inhaltliche Grundlage: Was das FRZK in dieser Dissertation sein soll

Das FRZK ist ein **methodisch-didaktischer Darstellungs- und Ordnungsrahmen zur Abbildung, Strukturierung, Bearbeitung und Erklärung funktionaler Zusammenhänge**. Es soll deutlich machen, welche Größen vorliegen, welche Größen gesucht werden, welche Voraussetzungen bestehen, welche Beziehungen verwendet werden, welche Geltungsbereiche gelten und wie sich ein Lösungsweg nachvollziehbar aufbauen lässt.

**Nicht zum allgemeinen Definitionskern gehören:** Rekursion, Fixpunktbedingungen, ein spezieller Kohärenzoperator, eine vorgegebene nichtlineare Dynamik, eine universelle Raumzeitgeometrie oder eine neue physikalische Naturtheorie. Solche Strukturen dürfen nur im Rahmen **konkreter, ausdrücklich definierter Spezialmodelle** untersucht werden. Das FRZK darf sie nicht bereits durch seine Bezeichnung erzwingen.

Die Projektgrundlage enthält zusätzliche **erst in Kapitel 3 exakt zu definierende** symbolische beziehungsweise geometrische Festlegungen:

- `+0` und `−0` als gerichtete symbolische Grenzwerte beziehungsweise Grenzrichtungen; nicht als zwei verschiedene reelle Zahlen ausgeben;
- `+∞` und `−∞` als symbolische Werte mit nur explizit festzulegenden Operationen und Geltungsgrenzen; nicht unbesehen wie gewöhnliche reelle Zahlen behandeln;
- den Nullvektor und die Frage seiner modellinternen Rolle;
- einen leeren beziehungsweise noch nicht mit Aufgabenbeziehungen belegten **Darstellungsrahmen**, der von der mathematischen **leeren Menge** sauber zu unterscheiden ist;
- eine **orthogonale Ausgangsorientierung im Grenzzustand null**, die **nicht** die Geometrie der später modellierten Beziehungen bestimmt;
- explizite Definitionen aller Variablen, Funktionen, Ziel- und Definitionsbereiche, Operatoren und Einschränkungen, bevor sie in mathematischen Behauptungen verwendet werden.

**Die Aufgabe von Kapitel 2 ist nicht, diese Festlegungen bereits axiomatisch zu beweisen.** Es soll stattdessen klären, welche vorhandenen wissenschaftlichen Ansätze für die **Darstellung funktionaler Zusammenhänge**, die **Analyse mathematischer Lernprozesse** und die **wissenschaftliche Prüfung eines didaktischen Modells** relevant sind. Dabei ist darzustellen, was die jeweilige Literatur tatsächlich untersucht und worin sich der FRZK-Anspruch davon unterscheidet.

---

## 3. Die aus Kapitel 1 unmittelbar folgenden Forschungsfragen

Die freigegebene Einleitung beschreibt vier miteinander verbundene, aber nicht identische Fragen. Kapitel 2 soll den jeweiligen Forschungsstand und die passenden theoretischen Bezugspunkte untersuchen:

1. **Darstellungsfrage:** Wie können funktionale Zusammenhänge so beschrieben werden, dass Größen, Annahmen, Definitions- und Geltungsbereiche sowie Abhängigkeiten verständlich und nachvollziehbar bleiben, ohne eine bestimmte Geometrie vorauszusetzen?
2. **Formale Frage:** Unter welchen Voraussetzungen lassen sich Definitionen, Funktionen, Modellregeln und ihre Folgerungen widerspruchsfrei und reproduzierbar angeben? Was ist bloße Modellsetzung, was überprüfter mathematischer Satz?
3. **Didaktische Frage:** Ob und unter welchen Bedingungen unterstützt eine explizite funktionale Darstellung das Aufgabenverständnis, die Begründung von Lösungswegen, die Fehlererkennung und den Transfer auf neue Aufgaben?
4. **Methodische Bewertungsfrage:** Welche Kriterien erlauben es, die Nachvollziehbarkeit von Darstellungen und Lösungswegen zu beurteilen, ohne formale Korrektheit, Unterrichtsbeobachtung und empirisch nachgewiesene Wirksamkeit zu verwechseln?

In Kapitel 2 sollen daraus **begründete Prüf- und Vergleichskategorien** entstehen. Das Kapitel darf die Fragen nicht als bereits beantwortet darstellen, nur weil der Autor eine Unterrichtsbeobachtung oder eine formale Konstruktion geschildert hat.

### Aus Kapitel 1 übernommenes, aber noch nicht ausgeführtes Forschungsdesign

Geplant ist eine explorative Untersuchung mit ungefähr **25 Lernenden**, gegebenenfalls unterschiedlichen Klassenstufen und Lernständen. Verglichen werden eine übliche fachlich angeleitete Aufgabenbearbeitung und eine Bearbeitung mit expliziter Nutzung des FRZK-Darstellungsrahmens. Die Vergleichbarkeit von Aufgaben, Tutorhilfe, Bearbeitungszeit, Ausgangsleistung und Reihenfolge ist vor einer realen Studie zu sichern.

Vorgesehene Kriterien des Bewertungsrasters, jeweils `0–3` Punkte:

| Kriterium | Punkte |
|---|---:|
| Gegebene und gesuchte Größen richtig erkennen | 0–3 |
| Funktionale Beziehungen zutreffend beschreiben | 0–3 |
| Lösungsverfahren fachlich begründen | 0–3 |
| Auf eine strukturell ähnliche neue Aufgabe übertragen | 0–3 |
| **Gesamt** | **0–12** |

Ergänzend sind Bearbeitungszeiten, Fehlerarten und Fehlerhäufigkeit, Tutorhilfen sowie qualitative Beobachtungen vorgesehen. Datenschutz, Zustimmung Minderjähriger, mögliche Interessenkonflikte in der Tutorrolle, Pseudonymisierung, Interrater-Prüfung und Störfaktoren sind **vor** einer Datenerhebung zu regeln. Kapitel 2 soll geeignete wissenschaftliche Grundlagen für diese Entscheidungen erschließen; es soll **nicht** behaupten, dass die Studie bereits durchgeführt oder das Raster bereits validiert wurde.

---

## 4. Verbindliche Abfolge und Grenzen der Dissertationskapitel

### Kapitel 1 – abgeschlossen: Einleitung

Behandelt Anlass, eigene Erfahrungen, Forschungsfrage, Zielsetzung, Abgrenzung, ersten wissenschaftlichen Kontext, geplante Methodik und Aufbau. Keine mathematische Axiomatik. Keine Fortschreibung ohne Revision.

### Kapitel 2 – neu zu erstellen: Forschungsstand und theoretische Einordnung

Erarbeitet **systematisch und kritisch** die relevante Literatur; trennt mathematische Darstellung/Modellierung, systemtheoretische beziehungsweise erkenntnistheoretische Analogien, Lern- und Unterrichtsforschung sowie Forschungsmethodik. Bewertet Anschlussmöglichkeiten **und Unterschiede**. Leitet aus belegten Befunden eine präzise Forschungslücke und die Anforderungen an den folgenden FRZK-Grundlagenaufbau ab.

### Kapitel 3 – nachfolgend: Mathematische und methodische Grundlegung

Definiert die FRZK-spezifischen Symbole, Mengen beziehungsweise Zustandsräume, Funktions- und Operatorbegriffe, gerichteten Null- und Unendlichkeitsausdrücke, den Nullvektor, die orthogonale Ausgangsorientierung im Nullgrenzzustand und die Bedingungen konkreter Modelle. Diese Grundlegung darf keine unbelegte physikalische Gültigkeit oder empirische Unterrichtswirkung behaupten.

### Spätere Kapitel – nachfolgend: Anwendungen, Methodik, Evaluation

Beschreiben konkrete Modellrealisierungen, technische und didaktische Anwendungen sowie die gegebenenfalls durchgeführte Untersuchung und ihre Daten. Explizite Trennung von formal gültiger Darstellung, sinnvoller Interpretation und empirisch belegter Wirksamkeit.

**Redaktionelle Grenzregel:** Kapitel 2 nimmt Kapitel 1 nicht noch einmal erzählerisch auf und definiert Kapitel 3 nicht vorweg. Es macht vorhandene Forschung, Unterschiede, Begrenzungen und den wissenschaftlichen Anschluss nachvollziehbar.

---

## 5. Vollständige Struktur von Kapitel 1 als Schnittstelle zu Kapitel 2

Die freigegebene Word-Fassung enthält folgende Kapitelhierarchie:

- **Kapitel 1 – Einleitung**
  - **1.1** Entstehung der Forschungsfrage aus der Unterrichtspraxis
    - **1.1.1** Praktisches Beispiel: Textaufgabe
    - **1.1.2** Praktisches Beispiel: Lineare Zusammenhänge
    - **1.1.3** Ergänzendes Beispiel: Ungewöhnliche Lösungswege
    - **1.1.4** Zwischenbilanz
  - **1.2** Lösungsweg und Ergebnis
  - **1.3** Die Rolle des Tutors und die Struktur von Nachhilfe im Kontext der individuellen Lernförderung
  - **1.4** Didaktische Differenzierung und Lernende
    - **1.4.1** Die didaktische Differenzierung zwischen Nachhilfe und regulärem Unterricht
    - **1.4.2** Die Bedeutung der Bezugssysteme und der persönlichen Relevanz
    - **1.4.3** Die Lernenden
  - **1.5** Die Lernumgebung und Unterrichtsführung
  - **1.6** Forschungsstand und wissenschaftlicher Kontext
    - **1.6.1** Physikalische Perspektiven: Emergenz von Raumzeit
    - **1.6.2** Systemtheoretische und kybernetische Ansätze
    - **1.6.3** Didaktische und bildungswissenschaftliche Modelle
    - **1.6.4** Interdisziplinäre Verortung des FRZK
  - **1.7** Forschungsziel
  - **1.8** Persönliche und berufliche Motivation
  - **1.9** Wissenschaftliche Relevanz und Abgrenzung des Vorhabens
  - **1.10** Aufbau der Arbeit
  - **1.11** Zusammenfassung
  - **Literaturverzeichnis**

Daraus ergeben sich für die Literaturarbeit in Kapitel 2 konkrete Anschlüsse: das Verstehen von Textaufgaben und funktionalen Beziehungen, individuelle Lernförderung und Rückmeldung, modellierende Darstellungen, die Rolle expliziter Annahmen und die Abgrenzung physikalischer/systemspezifischer Analogien. In Kapitel 2 sind diese Aspekte **mit neuer wissenschaftlicher Tiefe** zu behandeln, nicht aus Kapitel 1 zu kopieren.

---

## 6. Vorschlag für die wissenschaftliche Gliederung von Kapitel 2

> **Status:** Dies ist ein **Arbeitsvorschlag zur Freigabe vor Textproduktion**, keine bereits vom Autor genehmigte endgültige Untergliederung. Die Kapitel-1-Aussage „Kapitel 2 ordnet das Vorhaben in den Forschungsstand ein“ ist verbindlich; die Unterkapitelnummern sind eine daraus abgeleitete Arbeitsstruktur.

| Abschnitt | Arbeitstitel | Leitfragen und wissenschaftliche Aufgabe |
|---|---|---|
| **2.0** | Gegenstand, Auswahl und Grenzen des Forschungsstands | Welche Forschungsfelder gehören begründet zur Literaturauswahl; warum sind andere nur randständig relevant? Suchstrategie und Abgrenzung. |
| **2.1** | Funktionale Beschreibung und mathematische Modellierung | Funktionen, Abhängigkeiten, Variablen, Definitionsbereiche, Annahmen, Modelle und Repräsentationen; Unterschied zwischen Gegenstand und Darstellung. |
| **2.2** | Multiple Darstellungen und Visualisierung mathematischer Beziehungen | Sprachliche, tabellarische, symbolische und grafische Repräsentationen; Übersetzungen zwischen ihnen; Chancen und Grenzen. |
| **2.3** | Mathematisches Aufgabenverständnis und Problemlösen | Aufgabendeutung, relevantes/irrelevantes Wissen, Gegebenes und Gesuchtes, Strategiewahl, Reflexion und Transfer. |
| **2.4** | Vorwissen, Begriffsbildung und mathematische Kommunikation | Begriffsaufbau, Vorwissen, Erklärung in eigenen Worten, Kommunikationsprozesse und Grenzen rein algorithmischen Rechnens. |
| **2.5** | Individuelle Lernförderung, Tutoring, Feedback und Scaffolding | Tutorinterventionen, Lernumgebung, Unterstützungsgrad; Trennung des möglichen FRZK-Effekts von allgemeiner guter Lehrpraxis. |
| **2.6** | Forschung zur Entwicklung und Evaluation didaktischer Verfahren | Design-Based Research und alternative Designs; Vergleichsbedingungen, Messgüte, kleine Stichproben, Transparenz und Grenzen kausaler Schlüsse. |
| **2.7** | Systemtheoretische, kybernetische und beobachterbezogene Ansätze | Unter welchen Bedingungen sind Beobachterperspektive, Systemgrenze und Rückbezug brauchbare begriffliche Vergleiche; wo endet die Analogie? |
| **2.8** | Physikalische Raumzeitmodelle als begrenzter Kontext | Begriffliche Orientierung zu Raum, Zeit, Beobachtung und Emergenz; klare Differenz zur rein methodisch-didaktischen Zielsetzung des FRZK. Nicht zum Schwerpunkt aufblasen. |
| **2.9** | Vergleich der Ansätze und Abgrenzung des FRZK | Vergleichsmatrix: Zweck, Formalisierung, Darstellungsform, Bezug zu Lernprozessen, Geltungsbedingungen, empirische Befunde, offene Probleme. |
| **2.10** | Forschungslücke, Anforderungen und Übergang zu Kapitel 3 | Was vorhandene Methoden leisten; was an einer expliziten funktionalen Ordnungsdarstellung im konkreten Kontext noch zu prüfen ist; welche formalen Eigenschaften Kapitel 3 deswegen transparent definieren muss. |

**Gliederungsregel:** Die Struktur darf nach der externen Literaturrecherche zusammengezogen, geteilt oder umgeordnet werden. Ein Unterpunkt wird nur beibehalten, wenn genügend belastbare Quellen und eine klare eigene Fragestellung vorliegen. Keine künstliche Unterteilung, um Länge zu erzeugen. Abschnitt 2.8 darf nicht den Eindruck erwecken, die Dissertation wolle eine neue Raumzeittheorie begründen.

### 6.1 Empfohlene Gewichtung

Das wissenschaftliche Hauptgewicht liegt auf **mathematischer Repräsentation/Modellierung**, **mathematischer Didaktik**, **Problemlösen**, **lernbezogener Evaluation** und einer nachvollziehbaren **kritischen Synthese**. Systemtheorie und physikalische Perspektiven sind echte, aber **sekundäre Bezugsfelder**. Diese Gewichtung folgt dem in Kapitel 1 ausdrücklich begrenzten Anspruch des FRZK.

### 6.2 Erwartetes Ergebnis von Kapitel 2

Am Ende soll keine Behauptung stehen, dass es vergleichbare Darstellungsansätze bisher überhaupt nicht gebe. Stattdessen ist begründet darzulegen:

1. welche vorhandenen Ansätze bereits Teile des FRZK-Ziels behandeln;
2. worin sich ihre Zwecke, Begriffe, Untersuchungsmethoden und Befundlagen unterscheiden;
3. welche Kombination, Konkretisierung oder prüfbare didaktische Anwendung des FRZK überhaupt noch Forschungsbedarf erzeugt;
4. welche **klar definierten Anforderungen** sich daraus für Kapitel 3 und die späteren Anwendungen ableiten lassen;
5. was anhand der vorliegenden Literatur **noch nicht** behauptet werden darf.

Ist eine vermutete Neuheit schon durch vorhandene Ansätze abgedeckt, muss dies offen benannt werden. Eine Dissertation gewinnt nicht durch übersteigerte Originalitätsbehauptungen, sondern durch klar bestimmte Fragestellungen und methodisch kontrollierte Antworten.

---

## 7. Verbindliche Literaturkontinuität: 14 bereits vergebene Nummern

**Die Nummern `[1]` bis `[14]` sind im freigegebenen Kapitel 1 fest vergeben.** Die zugehörigen `source_id`-Kennungen in der Datenbank werden nicht verändert. Falls keine abweichende dissertationsweite Zitierregel beschlossen wird, erhalten neue, bislang nicht verwendete Quellen in Kapitel 2 die Nummern **ab `[15]` nach ihrer ersten neuen Nennung im laufenden Dissertationstext**. Eine in Kapitel 1 bereits benutzte Quelle behält in Kapitel 2 ihre bestehende Nummer; sie wird nicht als neue Quelle doppelt angelegt.

| Nr. | Quelle im freigegebenen Kapitel 1 | Inhaltliche Funktion / Vorsicht |
|---|---|---|
| **[1]** | Rovelli, Carlo (2018). *The Order of Time*. London: Penguin Books. | Raum/Zeit als begrifflicher Kontext; keine FRZK-Bestätigung. |
| **[2]** | von Foerster, Heinz (1981). *Observing Systems*. Seaside, CA: Intersystems Publications. | Beobachtung und Kybernetik; keine unmittelbare Lernwirkungsstudie. |
| **[3]** | Maturana, Humberto R.; Varela, Francisco J. (1987). *The Tree of Knowledge: The Biological Roots of Human Understanding*. Boston: Shambhala. | Beobachtung/Kognition als theoretischer Rahmen, Übertragung begründen. |
| **[4]** | Reinmann, Gabi (2005). *Innovation ohne Forschung? Ein Plädoyer für den Design-Based Research-Ansatz in der Lehr-Lernforschung*. *Unterrichtswissenschaft* 33(1), 52–69. DOI: `10.25656/01:5787`. | Design-Based Research; Grenzen und tatsächlichen Geltungsbereich herausarbeiten. |
| **[5]** | Arnold, Rolf (2012). *Wie man lehrt, ohne zu belehren. 29 Regeln für eine kluge Lehre. Das LENA-Modell*. Heidelberg: Carl-Auer. ISBN: `978-3-89670-838-0`. | Selbstgesteuertes Lernen und Lehrgestaltung; kein FRZK-Wirksamkeitsnachweis. |
| **[6]** | Sfard, Anna (2008). *Thinking as Communicating: Human Development, the Growth of Discourses, and Mathematizing*. Cambridge University Press. DOI: `10.1017/CBO9780511499944`. | Mathematisches Denken/Kommunikation; konkrete Aussagepassung jeweils prüfen. |
| **[7]** | Luhmann, Niklas (1984). *Soziale Systeme: Grundriß einer allgemeinen Theorie*. Frankfurt am Main: Suhrkamp. | Systemtheoretischer Vergleich; nicht mit mathematischer Funktionstheorie gleichsetzen. |
| **[8]** | Bruner, Jerome S. (1960). *The Process of Education*. Harvard University Press. DOI: `10.4159/9780674028999`. | Struktur von Lerninhalten und Begriffsaufbau. |
| **[9]** | Ausubel, David P. (1963). *The Psychology of Meaningful Verbal Learning*. New York: Grune & Stratton. | Bedeutung des Vorwissens für verstehendes Lernen. |
| **[10]** | Taschner, Rudolf (2013). *Der Irrtum des Pythagoras*. Videoaufzeichnung, math.space, TIB AV-Portal. DOI: `10.5446/15789`. | Vortrag als benanntes Beispiel; exaktes Wortzitat nur mit Zeitstempel und Rechteprüfung. |
| **[11]** | Carroll, Sean (2016). *The Big Picture: On the Origins of Life, Meaning, and the Universe Itself*. New York: Dutton. | Wissenschaftsphilosophischer Kontext, keine didaktische Evaluation. |
| **[12]** | Hattie, John (2009). *Visible Learning: A Synthesis of Over 800 Meta-Analyses Relating to Achievement*. Routledge. | Lernforschung/Feedback; konkrete Wirkungsbehauptungen differenziert belegen. |
| **[13]** | Rovelli, Carlo (2016). *Reality Is Not What It Seems: The Journey to Quantum Gravity*. London: Penguin. | Theoretisch-physikalische Bezüge, keine empirische FRZK-Prüfung. |
| **[14]** | Verlinde, Erik P. (2017). *Emergent Gravity and the Dark Universe*. *SciPost Physics* 2(3), 016. DOI: `10.21468/SciPostPhys.2.3.016`. | Spezifischer und wissenschaftlich diskutierter physikalischer Modellansatz; nicht als FRZK-Beweis. |

**Quellenstatus:** Bibliografische Metadaten und 18 Literaturstellen wurden vom Autor freigegeben (`PASS_BY_AUTHOR`). Dies ist **keine eigenständige vollständige editionsgenaue Originalpassagenprüfung**. Für wissenschaftliche Aussagen in Kapitel 2 sind die tatsächlich benötigten Quellen erneut sachgerecht zu prüfen und gegebenenfalls durch neu recherchierte Primär- oder Übersichtsarbeiten zu ergänzen. Die oben aufgeführten Angaben dienen der Revisionskontinuität; bei neuer genauer Zitierung die konkrete Ausgabe überprüfen.

---

## 8. Zitierweise und Literaturbelege: Einheitlichkeit vor der Texterstellung klären

**Vorgegebener Grundsatz:** Literatur wird im Fließtext nicht bloß genannt, sondern argumentativ eingebettet; Erstnennungen enthalten eine genaue bibliografische Angabe und eine zugehörige Literaturzahl, Wiederholungen nur die beständige Zahl. Die Nummerierung bleibt dissertationsweit konsistent.

**Zu beachtende Formatdifferenz:**

- Die tatsächlich freigegebene Kapitel-1-Word-Fassung verwendet bei Erstnennungen überwiegend die Form **`(vollständige Quellenangabe)[n]`**, bei späteren Stellen **`[n]`**.
- Als projektweite Schreibvorgabe für den FRZK-Neuaufbau wurde außerdem die Form **`{[genaue quellenangabe]}[[literaturnummer]]`** festgelegt. Diese Zeichenfolge darf nicht unbemerkt mit der in Kapitel 1 verwendeten Form vermischt werden.

**Übergabeentscheidung:** Kapitel 1 bleibt exakt unverändert. **Vor der endgültigen Abfassung des ersten belegten Abschnitts in Kapitel 2 muss festgelegt werden, welches der beiden Darstellungsformate für neue Texte gilt.** Bis dahin können Recherchetabellen bibliografisch vollständig geführt und Nummern vorläufig reserviert werden. Eine Harmonisierung der gesamten Dissertation wäre eine spätere separate, ausdrücklich freizugebende Revisionsarbeit; keine heimliche Änderung an `RELEASED`.

Weitere verbindliche Regeln:

- Keine Weblinks im Dissertationstext (Internetadressen können in der internen Prüfliste zur Recherche dokumentiert werden).
- Jede nachprüfbare wissenschaftliche Behauptung benötigt einen passenden Beleg. Nicht jede Paraphrase verlangt eine Buchseite, wohl aber jede exakte Textstelle und jedes wörtliche Zitat einen überprüfbaren Fundort.
- Keine erfundenen Seitenzahlen, Ergebnisse, DOI, ISBN oder Zitate.
- **Quellenaussage, eigene Interpretation und FRZK-Hypothese** sprachlich ausdrücklich unterscheiden.
- Bereits bekannte Autoren können mit neuem Werk zusätzlich aufgenommen werden; zwei unterschiedliche Bücher desselben Autors bleiben zwei unterschiedliche Quellen.
- Neue Literaturquellen aus Kapitel 2 in der DB nicht global auf Kapitel-1-Nummern umschreiben.

---

## 9. Verbindlicher persönlicher Schreibstil – Ich-Form

**Begleitdatei:** `FRZK_UEBERGABE_PERSOENLICHER_SCHREIBSTIL_ICHFORM_2026-10-19.md`. Das vollständige persönliche Stilprofil ist weiterhin eigenständig verbindlich und wird durch diese Übergabe nicht ersetzt.

### 9.1 Charakteristischer Sprachduktus

Mein wissenschaftlicher Text soll erkennbar **meine eigene Argumentation** bleiben. Ich gehe bevorzugt von einem nachvollziehbaren Problem aus, prüfe erste Deutungen, erkläre meine Entscheidung und ihre Voraussetzungen, arbeite die wissenschaftliche Lage ab und ziehe anschließend eine **begrenzte, nachvollziehbare** Folgerung. Ich schreibe sachlich, ohne meine reflektierende Ich-Stimme durch anonyme Passivformulierungen zu ersetzen.

Typische Übergänge sind „Zunächst ging ich davon aus …“, „Bei genauerer Betrachtung …“, „Daraus ergab sich für mich …“, „Für meine Untersuchung bedeutet das …“, „An dieser Stelle muss ich unterscheiden …“. Keine mechanische Wiederholung derselben Wendungen.

**Die Ich-Form wird sachlich eingesetzt:** „Ich untersuche“, „Ich unterscheide“, „Ich übernehme aus der Literatur“, „Ich kann daraus nicht ableiten“. Die Ich-Form ist kein Ersatz für Evidenz, keine Selbstlobformel und keine autobiografische Abschweifung.

### 9.2 Absatzgestaltung

- Zusammenhängender **Fließtext**, meist mehrere logisch verknüpfte Sätze pro Absatz.
- Keine Folge isolierter Einzelsätze und keine lehrbuchhaft aneinandergereihten Aufzählungen.
- Begriffe am konkreten wissenschaftlichen Problem erläutern.
- Gegenargumente und konkurrierende Ansätze berücksichtigen.
- Übergänge zwischen Abschnitten begründen; Literatur nicht als Namensliste reihen.
- Formale Überschriften sparsam und gemäß festgelegter Gliederung.

### 9.3 Für Kapitel 2 besonders wichtig

Kapitel 2 benötigt weniger autobiografische Unterrichtserzählung als Kapitel 1. Die persönliche Stimme soll sich **in der Auswahl, Prüfung, Gegenüberstellung und Bewertung der Forschung** zeigen, nicht in wiederholten Anekdoten. Geeignete Form: „Für meine Fragestellung ist an diesem Ansatz wesentlich, dass … Seine Ergebnisse reichen aber nicht aus, um … abzuleiten.“

### 9.4 Wissenschaftliche Trennungen

Jede Aussage muss einer tragfähigen Kategorie angehören: **Originalquellenbefund, theoretische Position, eigene Interpretation, methodische Entscheidung, Modellsetzung, mathematischer Nachweis, Hypothese oder empirisches Ergebnis**. Eine Einführung darf etwas ankündigen; ein Forschungsstand muss Quellen sorgfältig vergleichen; ein Grundlagenkapitel definiert formal; eine Evaluationsstudie prüft an Daten. Diese Geltungsformen dürfen nicht vermischt werden.

---

## 10. Verbindlicher Deep-Research-Auftrag für Kapitel 2

Für **jeden neu erstellten Abschnitt von Kapitel 2** ist vor dem endgültigen wissenschaftlichen Fließtext eine belastbare externe Literaturrecherche durchzuführen. Diese Aufgabe ist **mit dieser Übergabedatei nicht bereits erledigt**. Kapitel 1 bietet den Ausgangspunkt, ersetzt aber keine systematische Sichtung von Primärquellen, Fachbüchern, qualifizierten Forschungsüberblicken und relevanten empirischen Befunden.

### 10.1 Rechercheverfahren

1. Für den Abschnitt eine klare, abgrenzbare Such- beziehungsweise Forschungsfrage formulieren.
2. Geeignete deutsch- und englischsprachige Suchbegriffe mit Synonymen und negativen Grenzen festhalten.
3. Vorrangig Fachzeitschriften, Originalstudien, wissenschaftliche Verlage, wissenschaftliche Facharchive und belastbare Reviews auswerten; populärwissenschaftliche Quellen nur ihrer tatsächlichen Belegkraft entsprechend einordnen.
4. Bibliografische Daten anhand eines zitierfähigen Original-/Verlags-/Archivdatensatzes prüfen: Verfasser, Titel, Jahr, Publikationsort/-organ, Seiten beziehungsweise Artikelnummer, DOI/ISBN, Ausgabe.
5. Für jede in den Manuskripttext übernommene Aussage erfassen: welcher genaue Befund/Begriff wird belegt, worauf beruht er (Theorie, Review, empirische Studie, Metaanalyse), in welchen Populationen und Bedingungen wurde er untersucht, welche Einschränkungen nennt der Originaltext?
6. Befunde und Gegenbefunde nebeneinander dokumentieren. Keine unbegründete Behauptung der „allgemeinen Forschungslage“.
7. Fundstellen für spezifische Behauptungen und wörtliche Zitate kontrollieren. Unzugängliche Originalstellen als **OPEN** kennzeichnen; keine als verifiziert ausgeben.
8. Die Eignung für die **konkrete** FRZK-Frage beurteilen und im Fließtext erklären, wo ein Ansatz passt und wo die Analogie abbricht.
9. Nummerierung gegen die bereits vergebenen `[1]`–`[14]` prüfen; neue Quellen konsistent registrieren.
10. Erst dann wissenschaftlichen Fließtext im persönlichen Ich-Stil verfassen und die Aussage-Quelle-Zuordnung erneut prüfen.

### 10.2 Interne Evidenzmatrix je Quelle

Die interne Rechercheübersicht soll mindestens folgende Felder enthalten:

`Abschnitt | Claim_ID | Aussage_in_eigenen_Worten | Quelle/Source_ID | Zitiernummer | Quellentyp | Vollständige_Bibliografie | Fundstelle/Seite/DOI | Original geprüft? | Aussagepassung | Anwendungsbedingungen | Gegenbefunde/Limitierungen | Entscheidung: übernehmen/einschränken/verwerfen | Bearbeiter | Datum | Status`.

Statuswerte sinnvoll trennen: `IDENTIFIED`, `BIBLIO_VERIFIED`, `CONTENT_CHECKED`, `PASSAGE_VERIFIED`, `CLAIM_SUPPORTED`, `CLAIM_LIMITED`, `OPEN`, `REJECTED`. Keine Statusumwandlung allein aufgrund des Vorliegens einer Datenbankzeile.

### 10.3 Besonders kritisch zu prüfende Sachverhalte

- Unterschied zwischen mathematischer **Darstellung/Modellierung** und wissenschaftlicher **Erklärung oder Vorhersage**;
- Unterschiede von korrekt gelöster Rechenaufgabe, tragfähigem Begriffsverständnis, Kommunikation und Transfer;
- Effekte allgemeiner Tutorqualität, Übung, Motivation und Vorwissen versus möglicher zusätzlicher Effekt eines neuen Darstellungsverfahrens;
- Übertragbarkeit von Forschung aus regulären Klassenzimmern auf kleine Nachhilfegruppen;
- Aussagekraft explorativer kleiner Gelegenheitsstichproben;
- Unterschiede zwischen erkenntnistheoretischer Beobachtermetapher und formalem Beobachterbegriff;
- Status umstrittener physikalischer Modelle; keine „Bestätigung“ des FRZK daraus ableiten.

---

## 11. Recherchematrix: fachliche Pflichtfragen und erwartete Ergebnisse

| Themenfeld | Zu beantwortende Frage | Für Kapitel 2 notwendiger Ertrag |
|---|---|---|
| Funktionaler Zusammenhang | Wie werden Variablen, Abhängigkeiten und funktionale Beziehungen in Mathematik/Modellierung erfasst? | Sachliche Vergleichsgrundlage, kein allgemeiner Neuheitsanspruch. |
| Repräsentationen | Welche Vor- und Nachteile haben Text, Graph, Tabelle, Symbolik, Raumdarstellung und deren Verknüpfung? | Prüfkriterien für Verständlichkeit und Darstellungswechsel. |
| Modellierungszyklus | Wie gehen Aufgabenanalyse, Annahmen, mathematische Bearbeitung und Interpretation zusammen? | Bezug zum FRZK-Ziel „gegeben → gesucht → Beziehung → Lösungsweg“. |
| Problemlösen | Welche Fehler beim Aufgabenverständnis und der Strategiewahl sind belegt? | Trennung Beobachtung/Literaturbefund; plausible Messvariablen. |
| Vorwissen/Begriffsbildung | Welche Rolle spielen Vorkenntnisse und sprachliche Erklärung? | Begrenzte, quellengetragene Hypothesen. |
| Scaffolding/Tutoring | Wie beeinflussen Hilfe, Feedback und Lernsituation das Ergebnis? | Identifikation konkurrierender Erklärungen des möglichen FRZK-Effekts. |
| DBR und empirische Designs | Welche Designs sind für Entwicklung und Evaluation neuer didaktischer Werkzeuge geeignet? | Wissenschaftliche Begründung späterer Untersuchung, ohne ihre Ergebnisse vorwegzunehmen. |
| Geltungsgrenzen | Welche methodischen Grenzen bestehen für kleine, heterogene Gruppen? | Offen gelegte Grenzen und nötige Qualitätskontrollen. |
| Systemtheorie | Welche Begriffe sind tatsächlich anschlussfähig? | Saubere Analogie, ausdrücklich keine formale oder empirische Gleichsetzung. |
| Physikalische Modelle | Welche Forschungsfragen zu Raumzeit/Beobachtung sind für die Begriffsgeschichte relevant? | Eng begrenzte Kontextualisierung ohne neue Physik. |

Die Matrix ist **Arbeitsauftrag**, nicht Behauptung, dass entsprechende Literatur bereits ausgewertet worden sei.

---

## 12. Schnittstelle Kapitel 2 → Kapitel 3: Was muss begründet vorbereitet werden?

Der Abschluss von Kapitel 2 soll eine kurze, explizite Anforderungsliste für den mathematischen Aufbau liefern. Dazu gehören – soweit durch die Forschung begründet – die getrennte Dokumentation von Eingabegrößen und Beziehungen, nachvollziehbare Geltungsbereiche, überprüfbare Repräsentationswechsel, die Trennung von Darstellungsgeometrie und Problemgeometrie, eindeutig definierte Symbole und die Unterscheidung von Gültigkeitsprüfung und empirischer Wirkung.

Die **konkreten FRZK-Festlegungen** zu `+0`, `−0`, `+∞`, `−∞`, Nullvektor und orthogonaler Null-Ausgangsorientierung sind in Kapitel 3 zu präzisieren. Kapitel 2 kann auf verwandte mathematische Begriffe und vorhandene didaktische Darstellungen hinweisen, soll aber **keine projektinternen Rechenregeln vorab als mathematische Lehrsätze ausgeben**.

Für Kapitel 3 gilt zusätzlich die Projektregel, dass ältere FRZK-Dokumente, Ergebnisse, Skriptfassungen und Überarbeitungen im **Dissertationstext selbst** nicht referenziert werden dürfen. Formal entwickelte Beziehungen sind in einer neuen, eigenständig nachvollziehbaren Darstellung zu begründen. Administrative Rückverfolgbarkeit bleibt allein in Übergabe-/Provenienzdateien und der Datenbank.

---

## 13. Umgang mit Formeln, Tabellen, Bildern und technischen Notationen

Für Kapitel 2 ist in der Regel ein **text- und quellengestützter Forschungsstand** angemessen. Mathematische Formalismen nur aufnehmen, wenn sie zum sachgerechten Vergleich eines wissenschaftlichen Ansatzes tatsächlich notwendig sind. Keine formalen FRZK-Axiome im Forschungsstand.

Wenn mathematische Gleichungen erforderlich werden, gelten vor der Verwendung die jeweils gültigen Projektregeln:

- verständliche Einbettung in den Fließtext; Definition aller verwendeten Variablen und Geltungsbedingungen;
- Word-kompatible LaTeX-Schreibweise, runde Klammern für die vorgesehenen mathematischen Fließnotationen;
- jede gerenderte beziehungsweise abgesetzte Gleichung zusätzlich **vollständig als Word-LaTeX im erklärenden Fließtext** und in der separaten `Word-LaTeX:`-Zeile, falls der für den betreffenden Abschnitt verbindliche Formelsatzstandard dies verlangt;
- Gleichungsnummern nur mit geprüftem Kapitel-/Datenbanknummernkreis vergeben; nicht den Nummernstand alter Kapitel-3-Fassungen blind übernehmen;
- bei fremden Abbildungen Herkunft und Nutzungsrechte vor Aufnahme dokumentieren; eigene Abbildungen entsprechend als solche deklarieren;
- Tabellen dienen wissenschaftlichen Vergleichen, nicht zur Ersetzung ganzer Argumentationsabschnitte.

Für Kapitel 1 bleibt **null Gleichungen** der gültige Abschlusszustand.

---

## 14. Datenbank: Ausgangslage und verbindlicher Workflow für Kapitel 2

### 14.1 Datenbank und Versionsprinzip

Die Fortschreibung erfolgt in der **bestehenden** MariaDB-Datenbank `frzk_rkb_32_neu`; die leere SQL-Ausgangsdatenbank ist **nicht** die Zielinstanz für inkrementelle neue Kapitel. Kapitel 1 ist freigegeben; Quellen-, Zitat-, Revisions- und Dokumentsätze sind historisch nachvollziehbar. Die Arbeit an Kapitel 2 wird in **eigenen** Revisionsdatensätzen und Kapitel-2-Objekten gespeichert.

Die bisherige Datenbank enthält unter anderem die wissenschaftlichen Basisobjekte `repository_revisions`, `repository_validation_results`, `dissertation_sections`, `sources`, `source_usage`, `annotations`, `documents`, `figures`, `equations`, `definitions`, `symbols` sowie spezialisierte Kapitel-1-Snapshots und Freigabetabellen. **Die Existenz einer Tabelle bedeutet nicht, dass ihre genaue aktuelle Feldstruktur bereits bekannt ist**: Vor Erstellung von Kapitel-2-SQL ist das tatsächlich vorliegende Schema beziehungsweise ein aktueller Export zu prüfen.

### 14.2 Unverzichtbare Arbeitsschritte je neue Revision

1. **PRESTATE**, rein lesend: Datenbank-/Schemaidentität, freigegebenes Kapitel 1, benötigte Tabellen, freie Revisionskennung, derzeitige maximale Kapitel-2-Nummer, Quellen- und Zitiernummernstand, keine unerwarteten Änderungen.
2. **Materialisierung**, nur bei vollständigem PRESTATE-PASS: Neue Kapitel-2-Revision, Textstände, Abschnitte, Literatur-/Zitatzuordnungen und nötige Prüfmetadaten sicher und möglichst transaktional speichern.
3. **Reines Prüfsystem**, **ohne schreibende Seiteneffekte**: überprüfbare Zählungen, Nummerneindeutigkeit, referenzielle Konsistenz, Word-/Datenbankabgleich und überprüfbare inhaltliche Gates voneinander getrennt ausgeben.
4. **FINAL-GATE**, separat und geschützt: Freigabe erst nach definierten redaktionellen und wissenschaftlichen Bedingungen, keine automatische wissenschaftliche Freigabe aufgrund technischer Vollständigkeit.
5. **SUMMARY/Archivierung**: Abschlussstatus, nächste freie Nummer und Revisionsbezug dokumentieren, vollständiges Backup oder Export zum Kapitelabschluss.

### 14.3 Bewährte Fehlerprävention aus Kapitel 1

- Kein gleichzeitiges Lesen und Verändern derselben MySQL-Tabelle in einer Weise, die Fehler `#1093` auslöst; bei Bedarf IDs vorab sicher zuweisen beziehungsweise geeignete temporäre Zuordnungen verwenden.
- Keine ungültigen Hexadezimalliterale wie isoliertes `0x`; leere Zeichenketten als zulässige leere Strings speichern.
- Keine unvorbereiteten Sessionvariablen in phpMyAdmin voraussetzen. Fehlende Prüfbelege müssen zu einem nachvollziehbaren `OPEN` oder einer sicheren Abbruchmeldung führen, nicht zu erfundenen `PASS`-Werten.
- Keine historischen `source_id` oder Kapitelliteraturnummern global überschreiben; bei Bedarf neue kapitel-/revisionsbezogene Zuordnungstabellen verwenden.
- `PASS`, `PASS_BY_AUTHOR`, `OPEN` und `RELEASED` in Bedeutung und Nachweisart auseinanderhalten.
- Technische Gate-Prüfungen sollen niemals automatisch eine wissenschaftliche Originalstellenkontrolle vortäuschen.
- SQL nicht ungefragt als lange Textblöcke in den Chat schreiben; für den Nutzer **als herunterladbare `.sql`-Dateien** bereitstellen, wenn „skripte“ oder „skript“ angefordert wird.

### 14.4 Vorschlag für den Start von Kapitel 2

Vor der ersten Materialisierung das endgültige Thema, die Gliederung und die Zitierregel für Kapitel 2 freigeben. Danach den ersten Abschnitt als **2.0 Einleitung und Abgrenzung des Forschungsstands** oder, falls die Fakultätsstruktur es verlangt, **2.1** anlegen. Die Benennung `2.0` ist ein Vorschlag, **keine bereits feststehende Datenbankvorgabe**. Eine eigene Revisionsfamilie wie `RKB2-...` ist sinnvoll, aber erst nach Prüfung existierender Kennungen verbindlich zu vergeben.

---

## 15. Wissenschaftliche Qualitätssicherung je Kapitel-2-Abschnitt

| Gate | Leitfrage | Freigabekriterium |
|---|---|---|
| `SCOPE` | Gehört der Teil zum wissenschaftlichen Forschungsstand statt zur Einleitung/Formalgrundlegung? | Ja; klare Abgrenzung. |
| `STYLE_ICH` | Ist die eigene reflektierte Argumentation in Ich-Form erkennbar? | Ja; zusammenhängender Fließtext. |
| `SOURCE_METADATA` | Sind alle benutzten Quellen korrekt und eindeutig nachgewiesen? | Editionsbezogen überprüft. |
| `CLAIM_FIT` | Stützt die jeweilige Quelle die konkrete Textaussage? | Beleg oder offen markierte Einschränkung. |
| `CITATION_SEQUENCE` | Sind Literaturzahlen dissertationsweit eindeutig und korrekt? | Keine Dopplung/Umnummerierung des freigegebenen Kapitels 1. |
| `STATE_OF_RESEARCH` | Werden konkurrierende Positionen und Grenzen angemessen erörtert? | Keine einseitige Scheinbestätigung des FRZK. |
| `SCIENTIFIC_LEVELS` | Sind Definition, Modell, Beobachtung, Theorie und empirische Wirkung getrennt? | Ja. |
| `NO_PREMATURE_RESULTS` | Werden keine noch nicht erfolgten Studien oder Modellnachweise behauptet? | Ja. |
| `DOCX_DB` | Entsprechen geprüfte Dokumentfassung und DB-Snapshot einander? | Prüfsumme/Textstand dokumentiert. |
| `CH1_IMMUTABLE` | Ist der freigegebene Stand von Kapitel 1 unverändert? | Ja, eigener Vergleich nachweisen. |
| `FINAL` | Sind alle Pflichtgates tatsächlich erfüllt? | Nur dann `RELEASED`; andernfalls `OPEN`/`NOT_RELEASED`. |

Die Gate-Namen sind **fachliche Vorschläge**, keine bereits angelegten DB-Validierungscodes. Schema und vorhandene Codes zuerst abgleichen.

---

## 16. Konkreter Arbeitsplan nach Übergabe

### Phase A – Arbeitsgrundlage sichern

- Kapitel-1-Endstand (`RELEASED`, sechs unabhängige PASS) als unveränderliche Ausgangsversion übernehmen.
- Aktuelle Datenbanksicherung sicherstellen.
- Persönliches Stilprofil und die Kapitel-1-Word-Datei als Referenz bereithalten.
- Kapitel-2-Titel, Abgrenzung, Untergliederung und Zitierformat vom Autor bestätigen lassen.

### Phase B – Forschungsstand systematisch recherchieren

- Zunächst eine strukturierte Literaturrecherche mit Suchprotokoll und Claim-Matrix durchführen.
- Die 14 vorhandenen Quellen korrekt wiederverwenden, wo sie tatsächlich einschlägig sind.
- Neue Quellen nur nach belastbarer bibliografischer Prüfung aufnehmen; Zitatnummern fortlaufend zuordnen.
- Zwischen empirischer Evidenz, theoretischer Darstellung und philosophischer Analogie unterscheiden.

### Phase C – Wissenschaftliches Kapitel schreiben

- Kapitel 2 in kontrollierten Abschnitten erarbeiten.
- Text im Chat als zusammenhängende Fließprosa in **meiner Ich-Form** entwickeln.
- Zu jeder Literaturbehauptung eine nachweisbare Aussage-Quelle-Zuordnung vorhalten.
- Kapitel 1 nicht neu erzählen; stattdessen die Forschungslage vertiefen.
- Formalismen nur insoweit erläutern, wie sie für Literaturvergleich nötig sind; Axiomatik später in Kapitel 3.

### Phase D – Materialisierung und Prüfung

- PRESTATE vor jedem schreibenden SQL-Skript.
- Neue Texte und Literatur als eigene Kapitel-2-Revision registrieren.
- Materialisierung, rein lesende Prüfung, Abschlussgate und Summary streng trennen.
- Kein `RELEASED`, solange Quellen-, Autoren- oder Dokumentnachweise fehlen.

### Phase E – Übergang nach Kapitel 3 vorbereiten

- Forschungslücke und Abgrenzung in Kapitel 2 begründet zusammenfassen.
- Aus der Literatur konkrete, nachprüfbare Anforderungen für die Modellbeschreibung in Kapitel 3 ableiten.
- Keine formalen FRZK-Sätze behaupten, bevor die zugrunde liegenden Objekte und Operationen definiert sind.

---

## 17. Offene Arbeitsentscheidungen zu Beginn von Kapitel 2

Die folgenden Punkte sind **noch keine erledigten Entscheidungen** und dürfen im neuen Chat nicht als feststehende Tatsachen behandelt werden:

1. **Endgültiger Titel und Untergliederung von Kapitel 2:** Der Vorschlag in Abschnitt 6 muss autorenseitig bestätigt oder angepasst werden.
2. **Exaktes Zitierformat:** Dokumentierte Differenz zwischen der freigegebenen Kapitel-1-Notation `(vollständige Quellenangabe)[n]` und der projektweit vorliegenden Formatangabe `{[genaue quellenangabe]}[[literaturnummer]]` muss vor Veröffentlichung neuer Texte aufgelöst werden.
3. **Dissertationsweite Nummerierung:** Standardannahme ist Weiterführung der bestehenden `[1]`–`[14]`; bei einer abweichenden Gesamtregel ist die Auswirkung gesondert zu prüfen.
4. **Datenbank-Snapshot:** Die aktuelle freigegebene Kapitel-1-Revision wurde anhand von phpMyAdmin-Ausgaben bestätigt; ein neues vollständiges SQL-Backup und das aktuelle Schema für Kapitel 2 sind nicht Bestandteil dieser MD-Übergabe.
5. **Deep Research für Kapitel 2:** Noch durchzuführen; vorhandene 14 Quellen sind Grundlage, kein vollständig ausgearbeiteter Kapitel-2-Forschungsstand.
6. **Studiendurchführung:** Im Kapitel-1-Manuskript angekündigt, noch nicht als durchgeführt belegt. Kapitel 2 darf keine neuen Messwerte oder Auswertungen erfinden.
7. **Fakultätsvorgaben:** Umfang, Zitiernorm, eventuelle Pflichtstruktur und Ethikanforderungen sind anhand tatsächlich vorliegender offizieller Vorgaben zu prüfen, nicht zu vermuten.

Diese Punkte sind bewusst transparent aufgeführt, damit der neue Schreibdialog nicht dieselben fachlichen und technischen Unsicherheiten unbemerkt wieder einführt.

---

## 18. Unmittelbar verwendbare Übergabeanweisung für einen neuen Chat

> **Projekt:** Neuaufbau meiner Dissertation zum Funktionalen Raum-Zeit-Kohärenzsystem (FRZK). **Kapitel 1 ist in der bestehenden MariaDB `frzk_rkb_32_neu` endgültig `RELEASED`, und Skript 51 hat sechs unabhängige PASS-Prüfungen bestätigt. Kapitel 1 darf nicht stillschweigend verändert werden.** Die Referenzdatei lautet `Kapitel_1_Einleitung_Literatur_nach_Erstnennung_2026-10-17.docx`, SHA-256 `2d855d13a616bbc684b6ceea228a664cdb31d0fc47ed46b549596e22f0b204f6`. Die Einleitung enthält 14 nach Erstnennung nummerierte Literaturquellen, 18 Verweise, zwei von mir selbst erstellte Abbildungen und keine formalen Gleichungen. Die Literatur wurde vom Autor mit `PASS_BY_AUTHOR` freigegeben; dies ist keine unabhängige Prüfung aller Originalstellen.
>
> **Jetzt soll Kapitel 2 aufgebaut werden:** Forschungsstand und wissenschaftliche Einordnung zu funktionalen Darstellungen, mathematischer Modellierung, Visualisierung und Repräsentationen, Aufgabenverständnis, Begriffsbildung, individuellem Lernen/Feedback, Design-Based Research und Evaluation. Systemtheorie/Kybernetik und physikalische Raumzeitmodelle nur als sachlich abgegrenzte Vergleichsfelder behandeln. Das FRZK ist ein methodisch-didaktischer Darstellungs- und Ordnungsrahmen und **keine bereits bewiesene neue physikalische Theorie**. Rekursionen, Fixpunkte und Kohärenzprüfungen sind nur mögliche Spezialfälle, keine universellen Merkmale. Die mathematische FRZK-Axiomatik zu `+0`, `−0`, `+∞`, `−∞`, Nullvektor und orthogonaler Ausgangsorientierung gehört erst in Kapitel 3.
>
> **Schreibstil:** Durchgehend meine persönliche wissenschaftliche Ich-Form verwenden. Ich argumentiere problemorientiert, anschaulich, schrittweise und selbstkritisch, mit zusammenhängendem Fließtext statt isolierter Einzelsätze oder aufgezählter Behauptungen. Eigene Unterrichtsbeobachtung, wissenschaftlicher Literaturbefund, Definition, formaler Beweis, Hypothese und empirische Wirkung werden strikt getrennt. Kein Rückgriff auf frühere Dissertationsfassungen im eigentlichen Dissertationstext und keine erfundenen Beobachtungen, Literaturzitate oder Ergebnisse. Für jeden neuen Abschnitt eine gründliche externe Literaturrecherche durchführen und wissenschaftliche Aussagen durch nachweisbare Quellen belegen. Keine Weblinks im Dissertationstext.
>
> **Literatur:** Die freigegebenen Nummern `[1]`–`[14]` in Kapitel 1 bleiben erhalten. Neue Quellen werden dissertationsweit konsistent ergänzt. Die derzeit dokumentierte Differenz zwischen tatsächlichem Erstzitatformat in Kapitel 1 und dem zusätzlichen FRZK-Format muss vor dem ersten neuen belegten Textabschnitt ausdrücklich entschieden werden; Kapitel 1 wird deshalb nicht heimlich überarbeitet.
>
> **Datenbank:** Vor schreibendem SQL zuerst PRESTATE; anschließend Materialisierung, getrenntes rein lesendes Prüfsystem, geschützt ausgeführtes FINAL-GATE und Summary. SQL-Skripte als Download liefern, nicht als lange Blöcke im Chat. Kapitel 1 sowie vorhandene Revisions- und Quellen-IDs unangetastet lassen. Zunächst die Kapitel-2-Gliederung und Forschungsstrategie fachlich abstimmen; dann abschnittsweise mit belastbarer Literatur arbeiten.
>
> **Erster Arbeitsauftrag:** Erstelle einen wissenschaftlich begründeten, detaillierten und kritisch abgegrenzten Entwurf der Gliederung von Kapitel 2 auf Basis der freigegebenen Kapitel-1-Forschungsfragen. Zeige für jeden vorgeschlagenen Abschnitt, welche Original- und Überblicksliteratur recherchiert werden muss, welche konkreten Aussagen die Literatur tragen soll, welche Gegenpositionen zu untersuchen sind und welche begrenzte Folgerung in meinem Schreibstil in Ich-Form daraus entstehen soll. Keine vorzeitige formale Grundlegung des FRZK.

---

## 19. Anlagen- und Dateiregister für den nächsten Chat

**Verbindliche Dateien:**

1. `Kapitel_1_Einleitung_Literatur_nach_Erstnennung_2026-10-17.docx` – freigegebene Manuskriptreferenz, SHA-256 siehe oben.
2. `FRZK_UEBERGABE_PERSOENLICHER_SCHREIBSTIL_ICHFORM_2026-10-19.md` – differenzierte Stilanalyse und verbindlicher Ich-Form-Schreibstandard.
3. `RKB1_33_MAPPING_ERSTNENNUNG.csv` – alte/neue Nummernzuordnung der 14 Literaturquellen (historische Zuordnung, keine neue Freigabe).
4. `RKB1_45_LITERATUR_ABGLEICH_18_STELLEN_20261019.md` und `.csv` – Literaturprüfunterlagen mit ihren jeweiligen begrenzten Nachweisstufen; nicht mit unabhängiger Vollverifikation gleichsetzen.
5. `RKB1_50_FINAL_GATE_RELEASE_GUARDED.sql` und `RKB1_51_PRUEFSYSTEM_RELEASE.sql` – die tatsächlich verwendeten Freigabe- und Abschlusskontrollen als technische Referenz; nicht erneut als Neuimport ausführen.
6. Ein vom Autor vorzulegender **aktueller vollständiger DB-Export** nach Kapitel-1-Freigabe – falls für die Programmierung von Kapitel 2 benötigt.

**Interner Hinweis:** Quellen, Check-Dateien und administrative Kapitel-1-Revisionen sind Arbeitsgrundlage. Der Kapitel-2-Dissertationstext selbst zitiert **wissenschaftliche Literatur**, nicht diese internen Übergabedokumente als Nachweis einer mathematischen oder empirischen Aussage.

---

## 20. Verbindliche Schlussfestlegung

**Kapitel 1 ist abgeschlossen, als `RELEASED` bestätigt und wird ohne neuen ausdrücklichen Revisionsauftrag nicht verändert.** Kapitel 2 dient der eigenständigen, tief recherchierten und kritisch vergleichenden Darstellung des Forschungsstands. Die Abgrenzung des FRZK als methodisch-didaktischer Darstellungs- und Ordnungsrahmen bleibt erhalten. Ich schreibe in meiner persönlichen Ich-Form, aber mit überprüfbarer wissenschaftlicher Beweisführung. Erst das auf dieser Grundlage erarbeitete Kapitel 2 bereitet den formalen Neuaufbau von Kapitel 3 vor.

**Ende der vollständigen Übergabe – Kapitel 1 → Kapitel 2, 19.10.2026.**
