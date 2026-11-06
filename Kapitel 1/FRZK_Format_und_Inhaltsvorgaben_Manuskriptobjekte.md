# FRZK-Dissertation – Formatierungs- und Inhaltsvorgaben für Manuskriptobjekte

**Status:** verbindlicher Arbeitsstandard für die weitere Manuskripterstellung und den Datenbankimport  
**Ableitung:** aus den vorliegenden DOCX-Dateien der Kapitel 1, 2 und 3; bei widersprüchlichen älteren Varianten hat der formal weiterentwickelte Stand aus Kapitel 3 Vorrang.  
**Zusatzabgleich:** mit dem leeren FRZK-Datenbankschema für Gleichungen, formale Aussagen, Abbildungen, Tabellen, Literatur, Symbole und Prüfstatus.

---

## 1. Grundprinzip

Jedes wissenschaftliche Objekt muss im Manuskript nicht nur **sichtbar**, sondern auch **inhaltlich eindeutig identifizierbar, beschreibbar und prüfbar** sein.

Für alle Objekte gelten deshalb vier Ebenen:

1. **Darstellung im Fließtext**
2. **eindeutige Nummer/Kennung**
3. **inhaltliche Erläuterung und Geltungsbereich**
4. **Metadaten für Register/Datenbank/Prüfung**

Ein mathematisches oder grafisches Objekt darf nicht nur dekorativ oder isoliert erscheinen. Es muss in den argumentativen Zusammenhang des Abschnitts eingebunden sein.

---

# 2. Gleichungen und Formeln

## 2.1 Sichtbare Darstellung

Abgesetzte Gleichungen werden als **echte Word-Mathematik (OMath)** beziehungsweise als visuell gesetzte mathematische Formel dargestellt.

Für die Word-Darstellung gilt als Zielstandard:

- eigener Absatz für die Gleichung;
- Schrift für die mathematische Zone: **Cambria Math**;
- Grundgröße im vorliegenden Dokumentbestand: **12 pt**;
- Variablen mathematisch kursiv, Operatoren und Systemkennzeichen entsprechend mathematischer Konvention aufrecht;
- keine Fettschrift für den mathematischen Ausdruck, sofern nicht fachlich ausdrücklich erforderlich;
- Gleichungsnummer in runden Klammern, z. B. **(3.224)**;
- Gleichungsnummer gehört **nicht** zum mathematischen Ausdruck und **nicht** in die Word-LaTeX-Zeile;
- Gleichungen werden im Text mit **„Gleichung (3.224)“** referenziert.

Im Kapitel-3-Dokument existiert eine Word-Formatvorlage **„Formel“**. Beobachtete Eigenschaften dieser Vorlage:

- Cambria Math;
- kursiv;
- linker Einzug ca. **2,50 cm**;
- zusätzlicher Erstzeileneinzug ca. **1,25 cm**;
- Tabulatorposition ca. **12,50 cm**;
- Abstand vor der Formel ca. **18 pt**;
- Abstand nach der Formel ca. **18 pt**.

Diese Maße sind Layoutwerte des aktuellen DOCX-Bestands. Bei einer späteren globalen Dissertation-Formatvorlage dürfen sie technisch angepasst werden; die semantische Struktur aus Formel + Nummer + Word-LaTeX bleibt verbindlich.

---

## 2.2 Verbindliche Reihenfolge einer abgesetzten Gleichung

Jede abgesetzte Gleichung folgt grundsätzlich diesem Ablauf:

1. **Einführender Fließtext**
2. **visuell gesetzte Gleichung**
3. **Gleichungsnummer**
4. **unmittelbar darunter die Zeile `Word-LaTeX:`**
5. **Erläuterung der mathematischen Bedeutung**
6. **Voraussetzungen/Gültigkeitsbereich**
7. **gegebenenfalls Definition der verwendeten Symbole**
8. **gegebenenfalls Beweis, Folgerung, Beispiel oder Gegenbeispiel**

### Muster

```text
[Einführender Satz, der Zweck und Voraussetzungen der Gleichung nennt.]

[visuell gesetzte Word-Gleichung]                                      (3.xxx)

Word-LaTeX: <kopierbare Word-LaTeX-Fassung>

Gleichung (3.xxx) beschreibt ...
Dabei gilt ...
Die Aussage ist nur unter folgenden Voraussetzungen zulässig: ...
```

Eine Gleichung darf nicht ohne erklärenden Kontext im Manuskript stehen.

---

## 2.3 `Word-LaTeX:` – Pflichtzeile

Für jede abgesetzte Gleichung wird unmittelbar unter der sichtbaren Gleichung eine eigenständige Zeile ausgegeben:

```text
Word-LaTeX: <Formel>
```

Beispiel aus dem Kapitel-3-Standard:

```text
Word-LaTeX: Z_F:V^\times\longrightarrow\mathcal N_F,\qquad Z_F(v):=\mathbf 0_F[\operatorname{dir}(v)]
```

### Regeln

- Präfix exakt: **`Word-LaTeX:`**
- danach genau die Formel, nicht die Gleichungsnummer;
- keine zusätzliche Erklärung in derselben Zeile;
- keine Markdown-Codezeichen im späteren Word-Manuskript;
- die Fassung muss in Word möglichst direkt in eine mathematische Zone übertragbar sein;
- sichtbare Gleichung und Word-LaTeX müssen semantisch identisch sein;
- Zeilenumbruch nur bei technisch notwendiger Überlänge;
- mathematische Befehle dürfen durch einen Zeilenumbruch nicht zerstört werden.

---

## 2.4 Bevorzugte Word-LaTeX-Schreibweisen

### Mengen und Zahlenräume

```text
\mathbb R
\mathbb N
\mathbb C
```

### FRZK-Symbole

```text
0_{+}^{\mathrm{FRZK}}
0_{-}^{\mathrm{FRZK}}
\infty_{+}^{\mathrm{FRZK}}
\infty_{-}^{\mathrm{FRZK}}
```

Die Vorzeicheninformation steht **tiefgestellt**, das Systemkennzeichen **FRZK hochgestellt**.

Kurzschreibweisen mit hochgestelltem `F` dürfen nur verwendet werden, wenn im betreffenden Abschnitt ausdrücklich erklärt wurde, dass `F` für FRZK steht.

### Operatoren

Für benannte mathematische Operatoren:

```text
\operatorname{dir}
\operatorname{read}
\operatorname{rec}
\operatorname{dom}
\operatorname{Status}
```

Für aufrechte System- oder Textkennzeichen:

```text
\mathrm{FRZK}
\mathrm{Def}
\mathrm{Ax}
\mathrm{Lem}
```

Für kurzen Text innerhalb einer mathematischen Formel:

```text
\text{...}
```

Für Normen:

```text
\lVert v\rVert
```

Für Implikationen und Abbildungen:

```text
\Longrightarrow
\longrightarrow
\hookrightarrow
```

Für typografische Abstände:

```text
\quad
\qquad
```

---

## 2.5 Inhaltliche Pflichtangaben zu einer Gleichung

Eine Gleichung soll – soweit fachlich relevant – folgende Informationen besitzen:

- **Gleichungsnummer**
- **Titel/Kurzbezeichnung**
- **mathematischer Ausdruck**
- **Word-LaTeX**
- **verständliche Beschreibung**
- **Gleichungstyp**, z. B. Definition, Bedingung, Projektion, Operator, Grenzwert, Implikation, Verträglichkeitsbedingung, Resultat
- **Provenienz**, z. B. klassische Mathematik, Literatur, eigene FRZK-Definition, hergeleitet
- **Voraussetzungen**
- **Definitions-/Gültigkeitsbereich**
- **verwendete Symbole**
- **Ergebnis-/Zieltyp**
- **Validierungsstatus**
- **Bezug zu Definition, Lemma, Satz, Beweis, Beispiel oder Gegenbeispiel**

---

## 2.6 Gleichungen im Fließtext

Wichtige mathematische Beziehungen sollen zusätzlich im erläuternden Fließtext sprachlich eingeordnet werden.

Beispiel:

```text
Gleichung (3.xxx) definiert die Nullsetzung ausschließlich für von null verschiedene
Ausgangsvektoren. Die Abbildung besitzt daher den Definitionsbereich ...
```

Nicht zulässig ist ein Abschnitt, der nur aus aufeinanderfolgenden Formeln ohne Interpretation besteht.

---

## 2.7 Geltungsgrenzen

Bei FRZK-spezifischen Operationen ist besonders anzugeben:

- ob es sich um eine **Definition** oder eine **hergeleitete Aussage** handelt;
- ob die Operation **total** oder **partiell** ist;
- welche Eingabetypen zulässig sind;
- welche Voraussetzungen vorliegen müssen;
- welche Fälle ausdrücklich **nicht definiert** sind;
- ob die Aussage nur in einem bestimmten Modell gilt;
- welche Information durch Projektion oder Operation verloren geht.

Insbesondere dürfen symbolische Formen wie `0/0` oder `∞/∞` nicht durch eine bloße Symbolregel ohne Funktions- beziehungsweise Kontextdaten eindeutig ausgewertet werden.

---

# 3. Formale Aussagen

## 3.1 Zulässige Aussagearten

Der Kapitel-3-Standard unterscheidet ausdrücklich:

- **Definition**
- **Axiom**
- **Annahme / Zusatzannahme**
- **Lemma**
- **Proposition**
- **Satz**
- **Korollar**
- **Interpretation**
- **Vermutung**
- **offenes Problem**
- **Prinzip / Regel**, sofern benötigt

Die Bezeichnung einer Aussage bestimmt ihren logischen Status. Eine Überschrift allein macht eine Behauptung nicht zu einem bewiesenen Satz.

---

## 3.2 Format einer Definition

```text
Definition 3.xx.y – Kurztitel. [vollständiger Definitionstext]
```

Formatierung:

- `Definition 3.xx.y – Kurztitel.` fett;
- Definitionstext anschließend normal;
- bei Bedarf unmittelbar danach Gleichung + Word-LaTeX;
- Definitionsbereich und Geltungsbereich ausdrücklich angeben;
- neu eingeführte Symbole erklären.

Eine Definition benötigt keinen Beweis, darf aber keine nicht definierten Folgerungen als bereits bewiesen ausgeben.

---

## 3.3 Format eines Lemmas / einer Proposition / eines Satzes / Korollars

```text
Lemma 3.xx.y – Kurztitel. [Aussage]

Beweis. [vollständige Begründung]
```

oder im kompakten Fließformat:

```text
Lemma 3.xx.y – Kurztitel. [Aussage] Beweis. [Begründung]
```

Formatierung im aktuellen Kapitel-3-Bestand:

- Typ, Nummer und Titel fett;
- `Beweis.` beziehungsweise `Begründung.` fett;
- Beweistext normal.

### Inhaltlich erforderlich

- Voraussetzungen;
- genaue Behauptung;
- Geltungsbereich;
- verwendete frühere Definitionen/Sätze;
- vollständige oder ausdrücklich als Skizze markierte Begründung;
- Ergebnis;
- gegebenenfalls Einschränkungen.

---

## 3.4 Beweisstatus

Mögliche Statusangaben:

- nicht erforderlich;
- fehlt;
- Beweisskizze;
- teilweise bewiesen;
- bewiesen;
- widerlegt;
- offen.

Ein Lemma, eine Proposition oder ein Satz darf nicht allein aufgrund seiner Bezeichnung als bewiesen behandelt werden.

---

# 4. Abbildungen

## 4.1 Grundstruktur

Eine Abbildung besteht im Zielstandard aus mindestens:

1. **Bild/Grafik**
2. **Abbildungsnummer**
3. **Kurz-/Registertitel**
4. **inhaltlicher Bildbeschreibung**
5. **Provenienzangabe**
6. **gegebenenfalls Rechte-/Quellenangabe**
7. **Einordnung im Fließtext**

Beispielstruktur aus Kapitel 3:

```text
[Grafik]

Abbildung 3.52 – Orientierung unter Nullsetzung

Abbildung 3.52: Eigene Darstellung der expliziten Speicherung der Ausgangsrichtung
trotz Nullamplitude.
```

---

## 4.2 Nummerierung

Die im Manuskript vorhandene Nummer wird als stabile Kennung beibehalten.

Beispiele:

- `Abbildung 3.52`
- `Abbildung 3.61`
- frühe Bestandsformen wie `Abb. 3.0.2`

Für neu erzeugte Elemente soll innerhalb eines Abschnitts/Kapitels **eine einheitliche Schreibweise** verwendet werden. Als Zielstandard wird die ausgeschriebene Form **„Abbildung“** bevorzugt.

Keine automatische Umnummerierung vorhandener freigegebener Objekte ohne explizite Migrationsentscheidung.

---

## 4.3 Kurz-/Registertitel

Format:

```text
Abbildung <Nr.> – <Kurztitel>
```

Der Kurztitel soll den Gegenstand knapp identifizieren.

Beispiele:

```text
Abbildung 3.52 – Orientierung unter Nullsetzung
Abbildung 3.61 – Beweisabhängigkeiten
Abbildung 3.63 – Freigabekette
```

---

## 4.4 Beschriftung / Beschreibung

Die zweite Abbildungszeile beschreibt den fachlichen Inhalt:

```text
Abbildung <Nr.>: <Beschreibung>. <Provenienz>.
```

Eine gute Beschreibung beantwortet – soweit relevant:

- Was ist dargestellt?
- Welche Elemente sind zu sehen?
- Was bedeuten Pfeile, Achsen, Farben oder Flächen?
- Welche Beziehung soll illustriert werden?
- Welche Aussage soll die Abbildung **nicht** suggerieren?
- Ist die Darstellung schematisch, maßstäblich oder rein illustrativ?

Bei formalen Diagrammen ist eine semantische Klarstellung besonders wichtig, z. B.:

```text
Die Pfeile bezeichnen Begründungsabhängigkeiten, nicht zeitliche oder physikalische Entstehung.
```

---

## 4.5 Provenienz

Jede Abbildung benötigt einen eindeutigen Provenienzstatus.

Mögliche Kategorien:

- **Eigene Darstellung**
- **Eigenständig erstelltes Schema**
- **Generierte Darstellung**
- **nach Quelle adaptiert**
- **Fremdabbildung**
- **gemischte Darstellung**

Für eigene Abbildungen kann die Beschriftung beispielsweise enden mit:

```text
Eigene Darstellung.
```

oder:

```text
Eigenständig erstelltes Schema.
```

Für adaptierte oder fremde Abbildungen sind zusätzlich genaue Quelle und Rechte-/Lizenzstatus zu dokumentieren.

---

## 4.6 Alt-Text

Für jede endgültige Abbildung soll zusätzlich ein Alt-Text vorliegen.

Der Alt-Text ist:

- kurz;
- sachlich;
- nicht identisch mit einer langen Interpretation;
- ausreichend, um die wesentliche Struktur ohne Bild zu verstehen.

Beispiel:

```text
Alt-Text: Zwei gerichtete FRZK-Nullzustände werden über Projektionspfeile auf
denselben klassischen Nullwert abgebildet.
```

---

## 4.7 Technische Asset-Angaben

Für Register/Datenbank sollen nach Möglichkeit gespeichert werden:

- Dateiname;
- relativer Pfad;
- Dateityp/MIME-Type;
- Pixelbreite und -höhe;
- Dateigröße;
- SHA-256;
- eingebettete Word-Medienreferenz;
- Erstellungswerkzeug;
- Rolle des Assets: primär, Quelle, Raster, Vektor, Datenbasis etc.

Diese Angaben müssen nicht vollständig im Dissertationstext sichtbar erscheinen.

---

# 5. Tabellen

## 5.1 Grundstruktur

Tabellen benötigen:

- Tabellennummer;
- Titel;
- eindeutige Spaltenüberschriften;
- Beschreibung/Funktion im Fließtext;
- gegebenenfalls Quellenhinweis;
- gegebenenfalls Erläuterung von Abkürzungen;
- Validierungsstatus.

Beispielhafte Registerstruktur aus Kapitel 3:

| Kennung | Gegenstand | Status / Prüfbedarf |
|---|---|---|
| D-... | ... | ... |
| A-... | ... | ... |
| P-... | ... | ... |

Tabellen sollen Informationen strukturieren, nicht Fließtext ohne sachlichen Grund ersetzen.

---

# 6. Beispiele, Gegenbeispiele und Modellkonstruktionen

Jedes Beispiel sollte – soweit passend – enthalten:

- Nummer/Kennung;
- Typ: Beispiel, Gegenbeispiel, Modell, Testfall, Anwendung;
- Ausgangsproblem;
- Konstruktion;
- Ergebnis;
- Interpretation;
- Geltungsbereich;
- Validierungsstatus.

Ein Gegenbeispiel muss ausdrücklich nennen, **welche Behauptung** es widerlegt oder begrenzt.

Ein erfolgreiches Beispiel beweist keine universelle Aussage.

---

# 7. Symbole und Notation

Jedes zentrale Symbol soll bei Einführung eindeutig dokumentiert werden.

Pflichtangaben:

- Symbol/Kennung;
- visuell dargestelltes Symbol;
- LaTeX/Word-LaTeX;
- Name;
- Typ: Skalar, Vektor, Menge, Funktion, Zustand, Parameter, Index, Relation, Konstante;
- Definition;
- Definitionsbereich;
- Zielbereich;
- Einheit, falls vorhanden;
- Geltungsbereich;
- Abschnitt der Einführung.

FRZK-Symbole dürfen nicht stillschweigend mit klassischen Zahlen oder Vektoren identifiziert werden, wenn sie zusätzliche Zustandsinformation tragen.

---

# 8. Zitate und Literaturangaben

## 8.1 Erstnennung

Für die Erstnennung gilt der in Kapitel 2 verwendete Standard:

```text
{[vollständige bibliografische Angabe]}[[Literaturnummer]]
```

Beispielstruktur:

```text
{[Autor; Autor (Jahr). Titel. Zeitschrift/Buch, Band(Ausgabe), Seiten.
DOI/ISBN.]}[[15]]
```

---

## 8.2 Wiederholte Verwendung

Nach erfolgter Erstnennung kann die bereits vergebene Literaturnummer verwendet werden:

```text
[15]
```

Mehrere Quellen:

```text
[15][16]
```

Die Nummer darf nicht erfunden werden. Ist die Datenbanknummer noch nicht festgelegt, muss dies als offener Prüfpunkt dokumentiert werden.

---

## 8.3 Inhaltliche Quellenprüfung

Zu jeder wissenschaftlich relevanten Quellenverwendung sollten dokumentiert werden:

- genaue Quelle;
- konkrete Fundstelle/Locator;
- Seitenbereich;
- gegebenenfalls wörtliches Zitat;
- Paraphrase;
- welche Behauptung die Quelle tatsächlich stützt;
- ob Erstnennung;
- ob Originalstelle geprüft wurde;
- Prüfstatus.

Bibliografische Existenz einer Quelle und behauptungsgenaue Belegbarkeit sind getrennte Prüfungen.

---

# 9. Wissenschaftlicher Status eines Abschnitts

Bei formal oder methodisch kritischen Abschnitten soll direkt nach der Abschnittsüberschrift ein Statushinweis stehen.

Muster:

```text
Wissenschaftlicher Status: Forschungs- und Prüffassung. ...
```

oder:

```text
Wissenschaftlicher Status: Eigenständige formale Definitionen und ausdrücklich
bedingte Beweisführung. Ein globaler Konsistenzbeweis wird nicht behauptet.
```

Der Status soll insbesondere kenntlich machen:

- was definiert ist;
- was bewiesen ist;
- was nur unter Zusatzannahmen gilt;
- was noch geprüft werden muss;
- was ausdrücklich **nicht** beansprucht wird.

---

# 10. Gültigkeitsbedingungen und Annahmen

Annahmen und Gültigkeitsgrenzen dürfen nicht nur implizit im Fließtext verborgen sein.

Für ein formales Objekt sollen, soweit erforderlich, getrennt dokumentiert werden:

- Annahme;
- Definitionsbereich;
- Vorbedingung;
- Nachbedingung;
- Typbeschränkung;
- Randbedingung;
- Gültigkeitsbereich;
- Ausschlussfall.

Wenn eine mathematische Operation nur partiell definiert ist, gehört der Definitionsbereich zur Operation selbst.

---

# 11. Verweise und Abhängigkeiten

Formale Objekte sollen über eindeutige Verweise miteinander verbunden werden.

Beispiele:

- `Gleichung (3.224)`
- `Definition 3.18.3`
- `Lemma 3.18.1`
- `Satz 3.18.1`
- `Abbildung 3.52`

Für das Register sollten Beziehungen wie folgende erfassbar sein:

- hängt ab von;
- verwendet;
- definiert;
- beweist;
- wird gestützt durch;
- illustriert;
- ist Beispiel für;
- ist Gegenbeispiel zu;
- wird hergeleitet aus;
- ist äquivalent zu;
- projiziert auf;
- verweist auf.

---

# 12. Abgleich mit dem FRZK-Datenbankschema

Die Manuskriptstruktur soll mit den vorhandenen Datenbankobjekten kompatibel bleiben.

## 12.1 Gleichungen

Zuordnung zu:

```text
equation_number
title
equation_latex
word_latex
unicode_math
plain_description
equation_type
provenance
assumptions_text
validity_domain_text
validation_status
```

Zusätzlich können Gleichungsbestandteile separat gespeichert werden:

```text
component_symbol
component_name
component_description
component_type
unit_text
domain_text
```

---

## 12.2 Formale Aussagen

Zuordnung zu:

```text
statement_number
statement_type
title
statement_text
premises_text
conclusion_text
scope_text
provenance
proof_required
proof_status
validation_status
```

---

## 12.3 Abbildungen

Zuordnung zu:

```text
figure_number
title
figure_type
caption
description
alt_text
interpretation_text
provenance_type
provenance_notes
rights_status
validation_status
```

Zusätzlich:

```text
figure_assets
figure_descriptions
```

---

## 12.4 Tabellen

Zuordnung zu:

```text
table_number
title
caption
description
table_data_json
source_note
validation_status
```

---

## 12.5 Literatur/Zitate

Zuordnung zu:

```text
source_id
section_id
paragraph_id
target_object_id
citation_order
citation_role
citation_text_exact
locator_text
page_from
page_to
section_locator
quoted_text
paraphrase_text
supported_claim_text
is_first_use
original_location_checked
verification_status
```

---

# 13. Qualitätskontrolle vor Freigabe

## 13.1 Gleichungen

- [ ] Gleichung visuell gesetzt
- [ ] eindeutige Gleichungsnummer vorhanden
- [ ] `Word-LaTeX:` unmittelbar darunter
- [ ] Word-LaTeX stimmt semantisch mit sichtbarer Formel überein
- [ ] Gleichung wird im Fließtext eingeführt oder erläutert
- [ ] Voraussetzungen/Gültigkeitsbereich angegeben
- [ ] alle neuen Symbole definiert
- [ ] Typ der Gleichung bestimmt
- [ ] Provenienz bestimmt
- [ ] keine unzulässige Verallgemeinerung

## 13.2 Formale Aussagen

- [ ] Typ korrekt: Definition/Axiom/Lemma/Proposition/Satz/Korollar/...
- [ ] Nummer eindeutig
- [ ] Titel vorhanden
- [ ] Aussage vollständig
- [ ] Voraussetzungen ausdrücklich genannt
- [ ] Beweis vorhanden oder Status offen markiert
- [ ] keine Statusaufwertung nur durch Überschrift

## 13.3 Abbildungen

- [ ] Nummer vorhanden
- [ ] Kurz-/Registertitel vorhanden
- [ ] fachliche Beschreibung vorhanden
- [ ] Abbildung im Fließtext eingeordnet
- [ ] Provenienz dokumentiert
- [ ] Rechte-/Quellenstatus dokumentiert
- [ ] Alt-Text vorhanden
- [ ] Aussagegrenzen der Grafik klar, falls Missverständnisse möglich sind
- [ ] Asset eindeutig zugeordnet

## 13.4 Literatur

- [ ] Erstnennung im Format `{[...]}[[n]]`
- [ ] Wiederholungsnummer stimmt
- [ ] Quelle bibliografisch geprüft
- [ ] Fundstelle/Locator vorhanden, soweit erforderlich
- [ ] Behauptung wird von der Quelle tatsächlich gestützt
- [ ] Originalstellenprüfung dokumentiert

## 13.5 Gesamtprüfung

- [ ] keine doppelte Objektkennung
- [ ] keine verwaiste Gleichung
- [ ] keine verwaiste Abbildung
- [ ] keine undefinierten zentralen Symbole
- [ ] keine Abbildung ohne Provenienz
- [ ] kein Satz ohne Beweisstatus
- [ ] keine Literaturbehauptung ohne Quellenstatus
- [ ] Geltungsgrenzen und offene Punkte sichtbar

---

# 14. Kompakte Vorlagen zum Kopieren

## 14.1 Gleichung

```text
[Einführender Fließtext.]

[VISUELL GESETZTE GLEICHUNG]                                            (K.NR)

Word-LaTeX: <WORD-LATEX>

Gleichung (K.NR) beschreibt ...
Voraussetzungen: ...
Gültigkeitsbereich: ...
Verwendete Symbole: ...
Status/Provenienz: ...
```

## 14.2 Definition

```text
Definition K.A.B – Titel. Vollständige Definition mit Definitionsbereich,
Objekttyp und Geltungsbereich.

[gegebenenfalls visuell gesetzte Formel]                                (K.NR)

Word-LaTeX: <WORD-LATEX>
```

## 14.3 Lemma/Satz

```text
Lemma K.A.B – Titel. Vollständige Behauptung unter ausdrücklich genannten
Voraussetzungen.

Beweis. Vollständige Herleitung mit Verweisen auf die tatsächlich benötigten
Definitionen, Gleichungen und früheren Resultate.
```

## 14.4 Abbildung

```text
[ABBILDUNG]

Abbildung K.NR – Kurztitel

Abbildung K.NR: Fachliche Beschreibung der dargestellten Struktur.
Bedeutung der Pfeile/Achsen/Farben: ...
Aussagegrenze: ...
Provenienz: Eigene Darstellung / adaptiert nach ... / Fremdabbildung ...
```

## 14.5 Tabelle

```text
Tabelle K.NR – Titel

| Spalte 1 | Spalte 2 | Spalte 3 |
|---|---|---|
| ... | ... | ... |

Tabelle K.NR: Inhaltliche Funktion/Beschreibung.
Quelle/Provenienz: ...
```

## 14.6 Literaturerstnennung

```text
{[vollständige bibliografische Angabe]}[[n]]
```

## 14.7 Wiederholungszitat

```text
[n]
```

---

# 15. Vorrangregeln bei widersprüchlichen Bestandsformaten

In den vorhandenen DOCX-Dateien treten ältere und neuere Varianten nebeneinander auf. Für neue oder überarbeitete Inhalte gelten daher folgende Vorrangregeln:

1. **Kapitel-3-Formalstandard vor älterem Kapitel-1-Layout**
2. **`Abbildung` vor `Abb.`**
3. **Gleichung + Nummer + `Word-LaTeX:` als verbindliche Einheit**
4. **vollständige Provenienz statt bloßer Bildunterschrift**
5. **formaler Aussage-Typ + Nummer + Titel + Beweisstatus**
6. **expliziter Geltungsbereich statt stillschweigender Allgemeingültigkeit**
7. **stabile vorhandene Objektkennungen nicht ohne Migration ändern**
8. **fachliche Semantik hat Vorrang vor rein typografischer Vereinheitlichung**

---

# 16. Minimaler Freigabestandard

Ein Manuskriptobjekt ist erst freigabefähig, wenn mindestens Folgendes erfüllt ist:

**Gleichung:** Nummer + visuelle Formel + Word-LaTeX + Erklärung + Geltungsbereich.  
**Definition:** Nummer + Titel + eindeutiger Gegenstand + Bereich + verwendete Symbole.  
**Lemma/Satz:** Nummer + Aussage + Voraussetzungen + Beweis/Beweisstatus.  
**Abbildung:** Nummer + Titel + Beschreibung + Provenienz + Textbezug.  
**Tabelle:** Nummer + Titel + Spaltenbedeutung + Beschreibung + Quelle/Provenienz.  
**Zitat:** Quelle + Literaturnummer + behauptungsgenauer Bezug + Prüfstatus.  

Damit bleibt die Darstellung im DOCX, die wissenschaftliche Argumentation und die Datenbankrepräsentation desselben Objekts konsistent.
