---
projekt: FRZK-Dissertation
uebergabe: Kapitel 1 -> Kapitel 2
dokumenttyp: vollstaendige_wissenschaftliche_und_technische_uebergabe
sprache: de
stand: "2026-11-12"
status: VERBINDLICHE_ARBEITSGRUNDLAGE_KEINE_WISSENSCHAFTLICHE_GESAMTFREIGABE
kapitel_1_status: AUTOREN_RELEASE
kapitel_1_revision_aktuell: K1_GESAMT_2026-11-09
kapitel_1_master: FRZK_Kapitel1_Iterativer_Erkenntnisprozess_2026-11-09.docx
kapitel_1_sha256: "a3fcd99db815be9750523202c88b61d89f19d178625da4b72e1238e045c57cd8"
kapitel_1_revision_historisch: K1_RELEASE_CHAPTERMAP_2026-11-06
kapitel_1_sha256_historisch: b90546627250f4820dcacec017a8124e2c1defd0110538e004623a8a2a71e269
db_export: frzk_dissertation_stand_ende_kapitel_1.sql
db_export_erstellt: "2026-11-10 09:19"
db_export_sha256: "5840b148be46b62130efc8627a18f78af88c9b947e65c9487d655bd3073bc145"
db_schema: frzk_dissertation
empirie_schema_historisch: icas / f
k2_literatur_gate: STRIKT_ORIGINALSTELLENPFLICHT
k2_wirksamkeit_gate: EMPIRISCHER_DB_NACHWEIS_PFLICHT
k2_stand: REVIEW_OFFEN
schutz: keine_personenbezogenen_rohdaten_in_uebergabe
---

# FRZK – Vollständige wissenschaftliche Übergabe von Kapitel 1 an Kapitel 2

**Übergabestand: 12. November 2026.** Dieses Dokument ist als **eigenständig verwendbare Arbeitsgrundlage** für den vollständigen Neuaufbau von Kapitel 2 gedacht. Grundlage ist die konsolidierte Fassung des *Kapitel-1-DOCX vom 09.11.2026*, abgeglichen mit dem *SQL-Export vom 10.11.2026* und dem bisherigen Kapitel-2-Prüfprotokoll. Vorhandene Kapitel-2-Prüfergebnisse werden als getrennte spätere Arbeitsstände gekennzeichnet.

> **Verbindliche Ausgangsregel:** Kapitel 1 ist **autorseitig** abgeschlossen (`RELEASED` in `chapters`), jedoch nicht automatisch wissenschaftlich vollständig geprüft. Kapitel 2 ist kein isoliertes Literaturreview, sondern erarbeitet die **mathematischen, methodischen und didaktischen Grundlagen** für Kapitel 3. Das FRZK ist in seiner allgemeinen Ebene ein **iterativer Ansatz zur Strukturierung, Visualisierung, Prüfung und Weiterentwicklung von Wissen bei der Problemstellung und Problemlösung**. Mathematische Sonderoperatoren stehen auf einer anderen, eigens zu formalisierenden Ebene.

## 0. Verwendungszweck, Quellenhierarchie und Geltungsgrenzen

### 0.1 Was dieses Dokument leistet

- Übernahme der **wissenschaftlichen Leitfrage**, der methodischen Kerndefinition und aller wesentlichen Gegenstandsgrenzen aus dem aktuellen Kapitel 1.
- **Traceability**: Verknüpfung konkreter Kapitel-1-Abschnitte, Anlagen, Gleichungen, Tabellen, Abbildungen und Quellen mit den vorgesehenen Aufgaben von Kapitel 2.
- Sichere Übergabe des Kapitel-1-**Autorenrelease**, nicht die Behauptung einer Promotions-, Originalstellen- oder Wirksamkeitsfreigabe.
- Aufnahme des durch den Autor ausdrücklich verbindlich festgelegten **strengen Originalstellen-Gates** für Kapitel 2 und der **empirischen Prüfung anhand der eigenen Datenbank**.
- Dokumentation von Versionen, SQL-Abgleich, Prüfgates, offenen Forschungsfragen und Maßnahmen für die Fortführung.

### 0.2 Autorität in absteigender Reihenfolge

1. **Aktueller Kapitel-1-Master** `FRZK_Kapitel1_Iterativer_Erkenntnisprozess_2026-11-09.docx` mit SHA-256 `a3fcd99db815be9750523202c88b61d89f19d178625da4b72e1238e045c57cd8`. Dieser Hash wurde aus der hier zugänglichen DOCX-Datei neu berechnet. Für die in dieser Übergabe verwendeten Aussagen ist das der **primäre Manuskriptbezug**.
2. **SQL-Abzug vom 10.11.2026** `frzk_dissertation_stand_ende_kapitel_1.sql`, aus `frzk_dissertation` (MariaDB 10.4.32); archivierter DB-Stand, **nicht** Nachweis einer aktuell erreichbaren Live-Datenbank.
3. **Vorheriger Kapitel-1-Release** `FRZK_Kapitel_1_FINAL_Kapitel_2_korrigiert_2026-11-06.docx` mit SHA-256 `b90546627250f4820dcacec017a8124e2c1defd0110538e045c57cd8`, Revision `K1_RELEASE_CHAPTERMAP_2026-11-06`. Dieser bleibt historische Provenienz, **ist nicht mehr der jüngste Master**.
4. **Frühere Übergabe** `Uebergabe_Kapitel2(1).md` vom 06.11.2026: weiterhin nützliche Bestandsbeschreibung, jedoch für die aktuelle Abbildungsnummerierung, Anlage 1A.2 und die Mengengerüste **teilweise veraltet**.
5. **Kapitel-2-Arbeitsstände:** Kapitel-2-Volltext vom 25.10.2026, Prüfrunden 1–3 und empirische Arbeitsfassungen vom 10.11.2026. Diese sind **nicht** identisch mit einem freigegebenen Kapitel-2-Master.
6. **Externe Veröffentlichungen:** Begründen nur die tatsächlich geprüfte konkrete Aussage. Metadaten und DOI allein ersetzen keine Originalstellenprüfung.

### 0.3 Keine stillschweigenden Annahmen

- Eine SQL-Datei ist ein **Datenbankexport**, keine Bestätigung, dass ein späteres SQL-Patch oder Kapitel-2-Import bereits in MariaDB ausgeführt wurde.
- Eine eigene Grafik ist eine **konzeptionelle** Darstellung, sofern ihre mathematische/empirische Gültigkeit nicht gesondert nachgewiesen ist.
- Ein Forschungsplan ist keine abgeschlossene Intervention; ein Feedback-Datensatz ist keine unabhängige Person.
- `PASS` einer **Strukturprüfung** bedeutet nicht `PASS` für eine Originalquelle oder für die kausale Wirksamkeit.
- Bei Konflikt zwischen älterer Übergabe und aktuellem Master **keine veralteten Kennungen** wiederverwenden; die neuesten, im SQL und DOCX nachgewiesenen Werte sind anzugeben.

## 1. Verifizierte Kapitel-1-Bestandsaufnahme

### 1.1 Revisions- und Statusbild

| Datenträger / Objekt | Im vorliegenden Stand verifizierter Befund | Schluss für Kapitel 2 |
|---|---|---|
| DOCX-Master | `FRZK_Kapitel1_Iterativer_Erkenntnisprozess_2026-11-09.docx`; SHA-256 oben | Maßgeblicher Text einschließlich iterativer Grafik und neuer Anlage 1A.2 |
| `chapters` | Kapitelnummer `1`, Titel „Einleitung“, `status=RELEASED`, `current_revision_id=5` | Autorenfreigabe respektieren, nicht still überschreiben |
| `revisions` | `K1_RELEASE_CHAPTERMAP_2026-11-06` (ID 2), `K1_A2_UPDATE_V3_2026-11-09` (ID 4, EDIT/OPEN), `K1_GESAMT_2026-11-09` (ID 5, FINAL) | Revision 5 ist der aktuelle Gesamtstand, Revision 4 die Herkunft der ergänzten A2-Anlage |
| `sections` | **49** gespeicherte Abschnitts-/Anlagenobjekte | 48 ältere Strukturdatensätze plus neue Anlage `1.A2`; Nummerierung kontrollieren |
| `paragraphs` | **281** gespeicherte Absatzdatensätze | Zuordnung zu aktuellen Abschnitts-IDs erforderlich |
| `sources` | **23** Werke, Nummern `[1]`–`[23]` | Nummern unverändert erhalten |
| `citations` | **43** Quellenverwendungen | Prüfung nach konkreter Textstelle, nicht nur pro Werk |
| `figures` / `figure_assets` | jeweils **16** Einträge | 1.F1–1.F4, fünf Bildschritte aus 1A, sieben aus 1A.2 |
| `figure_descriptions` | **32** Einträge | Auch alternativer Bildtext und Rechteprovenienz beachten |
| `equations` | **8** Einträge | 1.1–1.5 und 1.A2.1–1.A2.3 |
| `manuscript_tables` | **10** Einträge | Kapitel- und Anlagentabellen, keine K2-Tabellen |
| `claims` | **12** Einträge | Claims separat nach Geltung, Quellenstand und Beweislast auswerten |
| `validation_checks` | **16** protokollierte Prüfungen | Verschiedene Statusarten und Revisionsbezüge, kein globales PASS |
| `issues` | **6** `OPEN`-Einträge | Bleiben offen, solange keine nachweisliche Klärung protokolliert ist |

**Hinweis zu historischen Gates:** Einzelne `validation_checks` für Revision 2 nennen noch „48 Abschnitte“, „241 Absätze“, „3 Kapitelabbildungen“ und „5 Gleichungen“. Diese Aussagen beschreiben den **alten Release vom 06.11.2026**; sie dürfen für die konsolidierte Revision 5 nicht unbesehen als aktuelles Mengengerüst zitiert werden. Die oben genannten aktuellen Mengen wurden aus den im SQL-Export tatsächlich vorhandenen Datensätzen gezählt.

### 1.2 Status der wichtigsten offenen K1-Prüfungen

- `K1_LITERATURE_ORIGINAL` = `WARNING`: Originalstellen nicht lückenlos geprüft, namentlich im K1-Stand [18] Schoenfeld und [21] Bloom.
- `K1_EMPIRICAL_VALIDITY` = `WARNING`: berichtete Notenentwicklungen und positive Rückmeldungen nicht unabhängig als Wirkung validiert.
- `K1_APPENDIX_IMAGE_RIGHTS` und `K1_A2_SOURCE_RIGHTS` = `WARNING`: Rechte einzelner grafischer Bestandteile der Anlagen zu klären.
- `K1_PHYSICAL_SCOPE` = `WARNING`: technisches Referenzmodell reproduzierbar, aber historische Modellparameter und vollständige optische Validierung fehlen.
- `K1_INTERVENTION_PILOT` = `OPEN`: K/F-Aufgabenpaare und Bewertungsraster sind noch nicht validiert.
- `K1_ITERATIVE_SCHEMA` = `PASS` **nur für Herkunft/Dokumentation**: die konzeptionelle Prozessgrafik ist vorhanden; das bedeutet keine empirische oder algorithmische Validierung.
- `K1_FINAL_REVIEW` = `WARNING`: Kapitel 1 autorseitig abgeschlossen; wissenschaftliche Originalquellen-, Rechte- und Empirieprüfung teilweise noch offen.

## 2. Die verbindliche FRZK-Definition aus Kapitel 1

### 2.1 Ebene A – methodisch-didaktisches Grundgerüst (Kern)

**Zentrale Aussage:** Das FRZK beschreibt einen wiederholbaren Erkenntnis- und Problemlöseprozess. Vorwissen wird anhand einer Problemstellung geordnet, **strukturiert, visualisiert, geprüft und bei neuen Erkenntnissen ergänzt oder überarbeitet**. Die neue Darstellung kann wiederum Ausgangspunkt eines weiteren Durchlaufs sein. Der Vorgang ist damit **iterativ**; weder ein formales Koordinatensystem noch die mathematischen FRZK-Zusatzzeichen sind für jede Anwendung nötig.

Aus dem Kapitel-1-Text ergeben sich zwei **miteinander vereinbare, aber nicht identische** Sichten, die in Kapitel 2 ausdrücklich verbunden werden müssen:

| Sicht | Explizite inhaltliche Folge | Wissenschaftlicher Stellenwert |
|---|---|---|
| **Problemorientierter Bearbeitungsbogen** | Problemfrage/Ziel klären → Gegebenes/Gesuchtes unterscheiden → Voraussetzungen/Beziehungen erschließen → Lösungsweg entwickeln und durchführen → Ergebnis/Gültigkeit/Transfer prüfen | Didaktisch handhabbares Arbeitsinstrument; in Kapitel 1 für die geplante F-Bedingung konkretisiert |
| **Iterativer Erkenntnisprozess, Abbildung 1.F1** | Vorwissen/Problem → Strukturieren → Visualisieren → Prüfen → Erweitern/Revidieren → Rückkopplung zur erneuten Strukturierung, ggf. auch zurück zur Problemklärung | Konzeptionelles Ablauf- und Rückkopplungsmodell; **nicht** bereits validierter Algorithmus |

Die beiden Sichtweisen können sich überlagern. Kapitel 2 muss herausarbeiten, **welche Handlung** an welcher Stelle tatsächlich dokumentiert und **welche gedankliche Aktivität** erst hypothetisch angenommen wird. Nicht jede Aufgabe erfordert exakt fünf zeitlich getrennte Phasen, und das Schema beschreibt keinen unveränderlichen Schritt-für-Schritt-Zwang. In Abbildung 1.F1 ist die Rückkopplung von Schritt 5 zu Schritt 2 sichtbar, ein möglicher erneuter Gang zu Schritt 1 aber aus Darstellungsgründen nicht eigens eingezeichnet.

**Nicht zulässige Verkürzung:** FRZK = „Fünfschrittfolge“ ohne Iteration; FRZK = „Concept-Map“; FRZK = „lineare Funktion“; FRZK = „orthogonaler Nullvektor“. Dies sind unterschiedliche Ebenen oder Werkzeuge.

### 2.2 Ebene B – mathematische Sondererweiterungen (nicht Kern)

Gesonderte Konstruktionen wie orientierte Nullzustände, besondere Grenzzustände, gerichtete Annäherungen, typisierte Unendlichkeitszeichen, Sonderoperationen auf Vektoren und die orthogonale Ausgangsorientierung sind **nicht Teil der allgemeinen FRZK-Methode**. Klassische Voraussetzungen dürfen in Kapitel 2 geklärt werden. Eigene Definitionen, Axiome, Rechenregeln, Spezialdomänen, Beweise und Gegenbeispiele gehören in die anschließende **formale Ausarbeitung von Kapitel 3**.

Begriffliche Sperren:

- Die didaktisch leere Arbeitsfläche ist **nicht** die leere Menge und **nicht** ein physikalisches Vakuum.
- Eine subjektive Ausgangsorientierung ist **nicht** ohne Zusatzdefinition ein mathematischer Koordinatenursprung.
- Ein orientierter Nullzustand darf **nicht** wie eine gewöhnliche reelle Null verwendet oder ohne zusätzliche Information rückskaliert werden.
- Ein Grenzwertsymbol des FRZK ist **nicht** automatisch ein reeller Zahlenwert, kein Beweis für eine neue Zahlklasse und kein Ersatz der klassischen Grenzwertdefinition.
- Geometrische Skizzen und Zeitbegriffe liefern **keinen** ontologischen oder experimentellen Nachweis einer neuen Raumzeit.
- Rekursion, Fixpunkte, Orthogonalität und Kohärenzoperationen dürfen nur verwendet werden, wenn ihre jeweilige **Domäne und Gültigkeit** angegeben sind.

### 2.3 Drei zu trennende wissenschaftliche Nachweisketten

1. **Methodische Abgrenzung / Eigenständigkeit:** Vergleich mit bestehenden Modellierungszyklen, Problemlöseheuristiken, multiplen Repräsentationen, Concept-Maps, Scaffolding und Feedbackmodellen. Ein neuer Name ist kein Neuheitsbeweis.
2. **Formale Korrektheit:** Widerspruchsfreie Definitionen und beweisbare Folgerungen in klar angegebenen mathematischen Bereichen – insbesondere für die optionalen Erweiterungen in Kapitel 3.
3. **Didaktische Wirkung:** Eigene Datenbank- und Interventionsauswertungen mit angemessenem Design. Ein vorhandenes Literaturzitat, ein positiver Erfahrungsbericht oder eine zutreffende Formel ist kein kausaler Wirkungsnachweis.

## 3. Kapitel-1-Abschnitte: vollständige inhaltliche Übergabe/Traceability

| K1-Anker | Inhalt in der freigegebenen Einleitung | Verpflichtende Aufgabe in Kapitel 2 |
|---|---|---|
| **Einleitung / 1.0** | Forschungsproblem aus der Unterrichtspraxis; FRZK methodisch; neue Grafik 1.F1 zur Iteration | Begriff und Rückkopplungsregeln methodisch ausarbeiten; keine Zusatzmathematik voraussetzen |
| **1.1** | Unterrichtspraxis als Ursprung der Fragestellung | Beobachtung, Interpretation und generalisierbare Aussage trennen |
| **1.1.1** | Textaufgabe „173 Kartoffeln, acht Säcke“, farbliche Markierung; Missverständnis zu Gegebenem/Gesuchtem | Aufgabenverständnis, Situationsmodell, Visualisierung, schrittweise Strukturierung; Anlage 1A |
| **1.1.2** | Erklärung der **linearen Funktion** durch Schülerinnen; aktualisierte Anlage 1A.2 mit `f(x)=0,9x+5,5` | Variable, Parameter, Steigung, Achsenabschnitt, Definitionsbereich; Repräsentationswechsel; Gesprächsführung |
| **1.1.3–1.1.4** | Alternative Lösungswege, Zwischenbilanz | Fachliche Gültigkeit anderer Verfahren, Unterstützung ohne verfrühte Fehlerdiagnose |
| **1.2** | Historische technisch-physikalische Fragestellung; davon getrennt neues Referenzmodell | Funktionen, Abhängigkeiten, Koordinaten, parametrisierte Oberflächen, Modellgrenzen, Einheiten |
| **1.3** | Rolle des Tutors als fachlicher Begleiter | Lernbegleitung, diagnostische Interaktion und Hilfen |
| **1.4–1.4.2** | Vorwissen, Aufgabenkommunikation und Verständnisprüfung | Begriffsbildung, Rückfragen, Scaffolding/Feedback, Differenzierung |
| **1.4.3** | Didaktisches „Bezugssystem“ als subjektives Vorwissen/Erfahrung | Begriffliche Abgrenzung zu mathematischem Koordinatensystem und physikalischem Referenzsystem |
| **1.5** | Heterogene Lerngruppen, Arbeitsblätter, 90-minütige Unterrichtsorganisation, Praxisrichtwerte | Empirischer Kontext, Aufgabenmanagement, Lern- und Ergebniskontrolle; kein Wirkungsbeweis |
| **1.6.1** | Raumzeit- und Emergenzdebatte | Fachliche Einordnung nur soweit nötig, keine physikalische FRZK-Bestätigung |
| **1.6.2** | Systemtheorie und Kybernetik | Begriffsklarheit: System, Rückkopplung, Beobachter, Modell versus Metapher |
| **1.6.3** | Didaktische/bildungswissenschaftliche Ansätze | Originalstellengeprüfte Theorie im sachlichen Kontext der Grundlagen |
| **1.6.4** | Interdisziplinäre Verortung | Zwischen mathematischen, didaktischen, physikalischen und epistemologischen Aussagearten trennen |
| **1.6.5** | Vorläufige Forschungslücke/Abgrenzung | Prüffähige Merkmalsmatrix statt pauschaler Neuheitsbehauptung |
| **1.7** | Forschungsziele als drei getrennte Gegenstände | Präzise Untersuchungsfragen und Prüfgates |
| **1.7.1–1.7.7** | K/F-Intervention als **Plan**, 12-Punkte-Raster, Stichprobe, Erhebung, Statistik, Ethik | Forschungsmethode, Validität, Protokoll, inter-/intraindividuelle Analysen, Datenschutz; Durchführung nicht erfinden |
| **1.8** | Beruflicher und persönlicher Weg | Motivationshintergrund; nicht als fachlicher Beweis behandeln |
| **1.9** | Wissenschaftliche Relevanz und Abgrenzung | K2 = Grundlagen, K3 = mathematisch-formale Erweiterung und Prüfung |
| **1.10** | Arbeitsaufbau der Dissertation | Verbindliche Übergangslogik und konsistente Kapitelverweise |
| **1.11** | Zusammenfassung der Forschungsfrage | Drei Nachweisketten und offen gelassene Behauptungen zusammenführen |
| **1.LIT** | Gemeinsames K1-Literaturregister `[1]`–`[23]` | Eindeutiger globaler Quellenkatalog, keine Neubelegung vorhandener Ziffern |
| **1.A** | Inkrementelles Setup Textaufgabe, fünf Bilder | Didaktisches Fallbeispiel und Bildrechte; keine standardisierte Wirksamkeitsmessung |
| **1.A2 / Anlage 1A.2** | **Neu:** siebenstufiger Aufbau einer linearen/affinen Funktion | Iterations-/Visualisierungsbeispiel mit präziser Kennzeichnung der Autorenwerte und offenen Rechteprüfung |
| **1.B** | Pseudonymisiertes Nachweisregister von Unterrichtsrückmeldungen | Qualitative Beobachtung, Identitäts-/Quellen- und Zustimmungsgrenzen beachten |
| **1.C** | Literaturprüfung zur K1-Forschungslage | Strenge Einzelstellenprüfung, historische noch offene Fälle fortführen |
| **1.D** | Vorläufiges K/F-Forschungsprotokoll | Pilotierung, Operationalisierung, Testgüte, Auswertung, Forschungsrisiken |
| **1.E** | Technische Rechenvorschrift und Kontrollwerte | Reproduzierbares **Modellbeispiel**, kein neuer physikalischer Gesetzesbeweis |

## 4. Unterrichtsrealität als Kontext, nicht als methodischer Wirkungsbeleg

### 4.1 Unterrichtsorganisation aus Kapitel 1

- Themenstart üblicherweise mit **Concept-Map oder Kompendium**, danach themen- und defizitorientierte Arbeitsblätter und fachliche Vertiefung.
- 90 Minuten: **5 Minuten Blitzlicht, 75 Minuten Arbeitsphase, 5 Minuten Nachhilfehefter, 5 Minuten Abschlussreflexion**.
- In den beschriebenen Kleingruppen bis zu **sechs** Lernende unterschiedlicher Schularten und Klassenstufen; unterschiedliche Themen werden parallel bearbeitet.
- Kontrolle: bis etwa Klasse 6 überwiegend Tutor, Klassen 7–9 etwa **50/50**, ab Klasse 10 bis ins zweite Studienjahr ungefähr **10 % Tutor / 90 % Selbstkontrolle**. Dabei ist die Verständnisprüfung weiterhin Aufgabe des Tutors. **Praxisrichtwerte, kein getestetes Optimum.**
- **Anderes, getrenntes** Unterrichtsmodell: Übungsrechnen versus Problembearbeitung bis Klasse 4 etwa **80/20**, Klassen 5–7 etwa **50/50**, ab Klasse 8 etwa **20/80**. Nicht mit den Kontrollanteilen verwechseln.
- Das Kapazitätsargument „sechs Lernende × zehn Minuten vollständige Kontrolle = 60 Minuten“ ist eine **Rechenillustration** innerhalb der 75-minütigen Arbeitsphase.

### 4.2 Wochenbelegung, Rückmeldungen und Noten

Die in Kapitel 1 referenzierte ICAS-Ansicht zur Kalenderwoche **09.–15.11.2026** dokumentiert eine organisatorische Momentaufnahme mit **fünf Gruppen**, **27 Belegungen** und **25 unterscheidbaren Lernenden**. Das ist keine Anzahl erwiesener tatsächlicher Anwesenheiten und kein auf Jahre extrapolierbarer Stichprobenbeleg.

Die anonymisierte Materialsammlung in **Anlage 1B** umfasst `NB-01` bis `NB-16` und Kategorien `M1` bis `M7`. Die Belege sind hinsichtlich Entstehung, unmittelbarer/indirekter Wiedergabe, möglicher Mehrfachidentitäten und Nutzungsrechten heterogen; eine Angabe „16 unabhängige Personen“ wäre unbegründet. Berichtete Notenverbesserungen sind nicht unabhängig durch Originalzeugnisse nachgewiesen. Keine identifizierenden Schülertexte in Kapitel-2-Exporte übernehmen.

### 4.3 Drei getrennte Informationsarten

- **Qualitative Unterrichtsbeobachtungen und Rückmeldungen aus K1:** Quellenkontext und Hypothesengenerierung.
- **Vorhandene ICAS-/f-Bewertungsdaten:** Grundlage für retrospektive Datenqualität, Verlaufs-, Zusammenhangs- und Prognoseprüfung.
- **Erst geplante kontrollierte K/F-Unterrichtsintervention:** Möglichkeit eines spezifischen Wirksamkeitstests nach Dokumentation von Methode, Aufgaben und Vergleichsbedingungen.

## 5. Abbildungen, Gleichungen und Anlagen des aktuellen K1-Masters

### 5.1 Vier Kapitelabbildungen – ACHTUNG: aktualisierte Nummerierung!

| Kennung | Aktuelle Bedeutung | Was Kapitel 2 damit tun darf / nicht darf |
|---|---|---|
| **1.F1** | **Iterativer Erkenntnis- und Problemlöseprozess des FRZK** | Konzeptionelle Methodengrafik; Kapitel 2 muss einzelne Übergänge und Rückkopplung ausarbeiten. Kein Algorithmus- oder Wirkungsnachweis |
| **1.F2** | Ursprüngliche geometrische Ideenskizze | Historische Eigenillustration ohne vollständig rekonstruierte Rechenparameter |
| **1.F3** | Ursprüngliche dreidimensionale Visualisierung von Laufzeiten | Nicht mit der Neuberechnung gleichsetzen |
| **1.F4** | Numerisch reproduziertes Laufzeitfeld des neuen Referenzmodells | Nur für spezifizierte Formeln/Parameter und Dreiecksgebiet gültig; keine Messung |

**Korrektur gegenüber der Übergabe vom 06.11.2026:** Dort waren die technischen Grafiken noch als `1.F1`–`1.F3` bezeichnet. Im aktuellen DOCX und SQL sind diese Grafiken `1.F2`–`1.F4`; das neue `1.F1` ist die **iterative Prozessgrafik**. Kapitel-2-Texte müssen auf den aktuellen Stand verweisen.

### 5.2 Anlage 1A: „Inkrementelles Setup einer Textaufgabe“

Fünf vom Autor bereitgestellte Bildschritte: **Start/leeres Blatt → eigenen Standpunkt markieren → Situation erkennen → Gesuchtes sichtbar machen → Gegebenes ergänzen**. Es handelt sich um eine didaktisch aufbereitete Folge, nicht um datierte Originalzeichnungen der Schülerin. Rechte einzelner eingebetteter Illustrationsbestandteile sind weiterhin offen.

### 5.3 Anlage 1A.2: „Iterativer Aufbau einer linearen Funktion“ (neu am 09.11.2026)

Sieben Bildschritte der aktualisierten Autorenvorlage `A.2 lineareFunktion_erklärt(3).docx`:

1. Eigenen Standpunkt markieren (subjektive Ausgangsorientierung, kein Koordinatenursprung).
2. Eine Gerade als Gegenstand darstellen.
3. Koordinatensystem hinzufügen.
4. x- und y-Größen den Achsen zuordnen.
5. Definitionsbereich und Skalierung klären.
6. Steigung aus einem Steigungsdreieck bestimmen: `a = Δy/Δx` für `Δx ≠ 0`, in der Vorlage **a ≈ 0,9**.
7. y-Achsenabschnitt bestimmen: **b ≈ 5,5**, daher Beispieldarstellung **`f(x) = 0,9x + 5,5`**.

Die Parameter sind **aus der Autorenvorlage**, keine unabhängig vermessenen Daten der damaligen Schülerinnen. Der nachträglich erläuterte Rückprüfungs-/Iterationsschritt ist eine **didaktische Interpretation**, nicht als bereits beobachteter Rücksprung im ursprünglichen Unterricht protokolliert. Die Bildrechte sind separat zu prüfen.

### 5.4 Gleichungen im aktuellen Datenbankexport

- **1.1–1.5:** Referenzmodell zur Beobachtungsgeometrie, Oberfläche, Gaußschen Krümmung und Signal-Laufzeit (siehe Abschnitt 6 dieser Übergabe).
- **1.A2.1:** `a = Δy/Δx`, `Δx ≠ 0`; klassische Steigungsregel.
- **1.A2.2:** `f(x) = ax + b`, `a,b ∈ ℝ`; affine lineare Funktion.
- **1.A2.3:** `f(x) = 0,9x + 5,5`; **Autorenbeispiel, Wertkalibrierung nicht extern geprüft** (`OPEN`).

### 5.5 Zehn Tabellen im Kapitel-1-Datenbankbestand

| Kennung | Inhalt | Statusgrenze |
|---|---|---|
| 1.1 | Anonymisierte Kursgruppen/Belegungen | Wochenmomentaufnahme, keine Lernleistung |
| 1.2 | Qualitative Unterrichtsmerkmale | Kategorisierung von Bewertungen |
| 1.3 | Tutor- und Selbstkontrolle | Qualitative Erfahrungswerte |
| 1.4 | Übungsrechnen versus Problembearbeitung | Erfahrungsbasiertes Planungsmodell |
| A1B.1 | Nachweisregister NB-01..NB-16 | Heterogene Rückmeldungsquellen |
| A1B.2 | Kategorien M1–M7 | Eigene Inhaltskategorisierung |
| A1C.1 | Quellenprüfung Kapitel 1 | Unterschied zwischen Originalstelle und Metadaten |
| A1D.1 | K/F-Unterrichtsbedingungen | **Geplanter** Vergleich |
| A1D.2 | Bewertungsraster 0–12 | Noch **nicht validiert** |
| A1D.3 | Beobachtungsprotokollfelder | Forschungsplanung |

## 6. Technisches Referenzmodell: aus Kapitel 1.2 und Anlage 1E übergeben

### 6.1 Rolle des Modells

Das eigene Referenzmodell veranschaulicht **Problem → Modellannahmen → Parametrisierung → Rechnung → Prüfpunkte**. Es ist **nicht** die allgemeine Definition des FRZK. Die historischen Skizzen 1.F2/1.F3 werden nicht nachträglich durch das neue Modell validiert. Die berechnete `τ` ist ein idealisiertes geometrisches Laufzeitfeld und keine optische Messung.

### 6.2 Parametersatz und Definitionsgebiet

| Symbol | Bedeutung | Wert |
|---|---|---|
| `O` | Ursprung / Beobachter | `(0,0,0)` m |
| `s` | Dreiecksseitenlänge | 1 m |
| `b` | Beobachtungsebene | `x=b`, b=1 m |
| `d` | Referenzlage der Oberfläche | 3 m |
| `a` | Oberflächenparameter | 0,20 m⁻¹ |
| `x_S` | Senderlage | 5 m |
| `c` | Vakuumlichtgeschwindigkeit | 299 792 458 m/s (SI-Definition) |
| `D` | Dreieck der Parameter (u,v) | wie in den folgenden Regeln |

### 6.3 Modellgleichungen / Reproduktionsregeln

**Konstruktionsregeln** (übernommen aus Gleichungen 1.1–1.5, mit normalisierter Darstellung):

```text
h = (sqrt(3) - 1)/2
A = (-0.5, -0.5), B = (0.5, -0.5), C = (0, h)      [m]
D = {(u,v): -0.5 <= u <= 0.5, -0.5 <= v <= h - sqrt(3)*abs(u)}
P(u,v) = (b,u,v)
Q(u,v) = (d + a*(u^2-v^2),u,v)
S = (x_S,0,0)
K(u,v) = -4*a^2 / (1 + 4*a^2*(u^2+v^2))^2 < 0
tau(u,v) = (sqrt((x_S-d-a*(u^2-v^2))^2 + u^2 + v^2) + d+a*(u^2-v^2)-b)/c
F: P(u,v) -> tau(u,v)
```

**Rechenannahmen:** idealisierte gerade Teilstrecken S→Q und Q→P im euklidischen Umgebungsraum, keine Verzögerung am Flächenpunkt, keine Dämpfung, Beugung, Mehrfachwege, Abschattung oder winkelabhängige Reflexionsbedingung. Die intrinsische Sattelfläche besitzt negative Gauß-Krümmung; dies setzt keine Krümmung der umgebenden Raumzeit voraus.

**Numerische Wiederholung:** 281×281 gleichmäßig verteilte (u,v)-Koordinaten; Punkte außerhalb von D maskieren; 25 lineare Farbgrenzen von 13,34 bis 13,75 ns, Farbpalette `viridis`; Ergebnisbild 1.F3. Detaillierter Algorithmus in Anlage 1E.

**Rechnerische Prüfwerte laut K1-Master und Anlage 1E:** Mittelpunkt `τ(0,0) = 13,3425638079 ns`; Ecken A/B jeweils `13,7472449142 ns`; Ecke C `13,4519250616 ns`. Bei 281 × 281 Stützstellen liegen **39.481** Punkte im Dreiecksgebiet. Das Rasterminimum ist näherungsweise `13,3425647406 ns`, da `v=0` im gewählten Raster nicht exakt getroffen wird. Die Darstellung 1.F4 benutzt **25 festgelegte Stufengrenzen** von **13,34 ns bis 13,75 ns** und eine einheitliche Farbskala.

**Explizite Modellgrenzen:** idealisierter zweiteiliger Laufweg, keine winkelabhängige Reflexion, keine Mehrfachwege, keine Streuung oder Dämpfung. Kein Schluss auf eine aus FRZK entstandene physikalische Raumzeit oder auf die Lernwirksamkeit der Methode.

## 7. Kapitel-1-Forschungsplan K/F – unverändert als Plan übergeben

### 7.1 Versuchsbedingungen

| Bedingung | Aus Kapitel 1 hervorgehende Definition |
|---|---|
| **K** | Übliche themen- und defizitorientierte Nachhilfe, ohne vorgeschriebenen FRZK-Bearbeitungsbogen |
| **F** | Möglichst gleiche Nachhilfezeit, Aufgabenanforderungen, Hilfen und Materialien; **zusätzlich** explizit strukturierter fünfteiliger FRZK-Bogen |

Das Arbeitsblatt der Bedingung F umfasst *Problem/Ziel*, *Gegebenes/Gesuchtes*, *Annahmen/Beziehungen*, *Lösungsweg* und *Ergebnis-/Gültigkeitsprüfung*. Eine Rückkehr zu früheren Arbeitsschritten ist zulässig und soll dokumentiert werden. In K spontan auftretende FRZK-ähnliche Strukturierung darf nicht verboten, sondern muss als mögliche Kontamination protokolliert werden.

### 7.2 Zielgrößen und Messung

- **F1 (primär):** Nachvollziehbarkeit/Qualität der dokumentierten Lösung.
- **F2:** Fehlererkennung.
- **F3:** Transfer auf eine eigenständige, nicht bereits geübte Aufgabe.
- **F4:** Bearbeitungszeit, Unterstützungsbedarf und mögliche Nachteile.
- **Rubrik 0–12 Punkte:** A Gegebenes/Ziel, B Beziehungen/Gültigkeitsbedingungen, C Lösungsweg/Begründung, D Transfer; je 0–3 Punkte. Die Rubrik ist **nicht validiert**.
- Vor Prüfung: Aufgabenpaare und Ankerlösungen, Gleichwertigkeit, Rubrik, Durchführungstreue, Reihenfolge, gegebenenfalls verblindete Zweitkorrektur, Datenschutz und Einwilligungen, Clusterung wiederholter Messungen.

**Wichtiger Status:** Kapitel 1 dokumentiert **die Planung**, nicht die tatsächliche Umsetzung, Randomisierung oder ein beobachtetes F−K-Ergebnis. Zahl von ca. 25 möglichen Lernenden ist eine **geplante Gelegenheitsstichprobe**, keine endgültige Stichprobengröße.

## 8. Empirische Datenbanken: eigener Wirksamkeitsprüfungspfad (Stand vor Kapitel 2)

### 8.1 Trennung von Datenbeständen

| Bestand | Inhalt | Stand / Nachweiskette |
|---|---|---|
| `frzk_dissertation` | Manuskript-, Quellen-, Zitier-, Claim- und Revisionsverwaltung | SQL-Abzug 10.11.2026; **keine** ICAS-Rohdaten in diesen Dump hineininterpretieren |
| `f` | Didaktische/empirische Forschungsdatenbank | Bericht über `f.sql` vom **15.10.2026**, retrospektive Pilotanalyse; Rohdaten in dieser Übergabe **nicht** erneut eingelesen |
| `icas` | ICAS-Operativ-/Bewertungsdaten | Historischer Export `icas_nach_schritt_3.sql` vom **28.03.2026**, teilweise strukturell und dokumentarisch geprüft |
| K1-Anlage 1B | Anonymisierte Sammlung von Rückmeldungen | Qualitative, heterogene Kontextdaten, nicht identisch mit den quantitativen Datenbanken |
| K/F-Protokoll | Prospektive Unterrichtsintervention | Noch nicht als durchgeführte Studie nachgewiesen |

### 8.2 Dokumentierter Datenumfang aus der Forschungsanalyse vom 15.10.2026

| Tabelle/Datenbereich | Dokumentierte Einträge | Methodischer Hinweis |
|---|---:|---|
| Tabellen insgesamt | **63** | 17.440 Datenbankzeilen über alle Tabellen, keine Stichprobengröße |
| Unterrichtseinheiten | 95 | Sitzungen / Gruppenebene |
| Themenzuordnungen | 173 | Themen-/Lernzielbezüge |
| Teilnehmendenzuweisungen | 302 | Zuweisungen, keine verschiedenen Personen |
| Teilnehmendenrückmeldungen | 335 | **28 unterschiedliche Lernende** im historischen Bericht |
| Didaktikbewertungen | 214 | methodische Ratings |
| Leistungsbewertungen | 202 | eigene Leistungstabelle; Initialwerte prüfen |
| FRZK-Einzelzustände | 335 | aus Rohwerten abgeleitete Profile, keine zweite unabhängige Beobachtung |
| FRZK-Gruppenzustände | 94 | darunter auffälliger Nullfall |
| Detaillierte Lehrkraftpositionen | 3.562 | mehrere Aussagen desselben Lernkontexts; nicht 3.562 unabhängige Urteile |
| Formale Lehrkraftstammsätze | 1 | keine intertutorale Vergleichbarkeit |

Beobachtungszeitraum der zentralen Teilnehmendenrückmeldungen: **08.09.2025–05.02.2026**. Freitexthistorien reichen teilweise bis Dezember 2023 zurück und dürfen ohne dokumentierte Verbindung nicht mit der neueren Zeitreihe vermischt werden.

### 8.3 Belegte Qualitätsprobleme, die vor Interpretation zu klären sind

1. **Zuordnung:** 265 von 335 Rückmeldungen sind über die gespeicherte Zuweisungs-ID direkt zuordenbar, bei 70 fehlt der direkte Link.
2. **Mehrfacherfassungen:** Im historischen Bericht sieben doppelte Person-Zeitpunkt-Schlüssel.
3. **Konstante Methodenkodierung:** 302/302 Themenzuweisungen tragen Methode `24` („Üben“). Daraus lässt sich keine tatsächliche K/F-Bedingungsvariation rekonstruieren.
4. **SQL-DEFAULT 4:** `mtr_leistung` enthält in mehreren Bewertungsfeldern einschließlich `lernfortschritt`, `transferdenken`, `basiswissen` den Standardwert 4; `mtr_didaktik` ebenfalls in sechs Feldern. Im Bericht steht `basiswissen=4` in **201/202** Fällen. Der Wert 4 ist nicht zwangsläufig eine bewusst abgegebene Bewertung.
5. **Nullcodes:** `0` kann Fehlwert, regulärer Wert oder Testeintrag sein. Auch neun FRZK-Einzelprofile mit `(0,0,0)` besitzen im Vorbericht rechnerisch hohe Kohärenz/Stabilität; dies ist nicht als hohe Kompetenz zu interpretieren.
6. **Rekonstruktion der FRZK-Kennwerte:** Die Formel `h = (5x+4y+2z)/11` passt in 322/335 Fällen innerhalb einer Toleranz von 0,001, dreizehn Fälle weichen ab. Hohe numerische Gleichförmigkeit ist kein unmittelbarer Leistungsnachweis.
7. **Verknüpfung der beiden Urteilsperspektiven:** Historischer ICAS-Export mit 335 Teilnehmer-Rückmeldungen, 3.562 Lehrkraft-Datenmaskenzeilen und **1.058 Person-Zeitpunkt-Gruppen**. Die **275 Person-Tag-Überschneidungen** sind nur mögliche Paarungen, nicht nachgewiesene identische Unterrichtsbewertungen. 38 separate Lehrkraft-Teilnehmerberichte sind hinsichtlich der skalierten Kernfelder nicht geeignet, einfach eins zu eins gegen die Teilnehmerbewertungen gestellt zu werden.
8. **Bewertungsrichtung/Instrumente:** numerische Skalen, nachträgliche Freitexte und Einträge in getrennten Tabellen nicht ohne Codebuch/Erhebungsnachweis gleichsetzen.

### 8.4 Bereits dokumentierter Prognosetest – getrennt vom Wirksamkeitsnachweis

Eine retrospektive Pilotanalyse berichtete einen **zeitlich getrennten** Vergleich: 170 Trainings- und 95 Prüffälle; Fehlermaß **MAE** (je kleiner, desto geringer der durchschnittliche Vorhersagefehler):

| Prognoseziel | Rohbewertungen | Rohbewertungen + FRZK-Kennzahlen | Differenz (Zusatz − Basis) |
|---|---:|---:|---:|
| Lernfortschritt | 0,544 | 0,547 | +0,003 |
| Transferdenken | 0,488 | 0,501 | +0,013 |
| Themenbeherrschung | 0,495 | 0,522 | +0,027 |

Die dokumentierten 95%-Cluster-Bootstrap-Intervalle der Fehlerdifferenzen schließen **0** ein. In der historischen Analyse wurde **kein gesicherter zusätzlicher Prognosevorteil** der FRZK-Kennzahlen gefunden. Dies sagt noch **nichts Abschließendes über die didaktische Wirkung** eines strukturierten FRZK-Bearbeitungsbogens aus: **Prognosegenauigkeit ist kein kausaler Interventionsnachweis.**

### 8.5 Verbindliche Wirksamkeitsfrage für Kapitel 2

**Nicht nur:** „Lassen sich Lernwerte ordnen oder prognostizieren?“ – sondern **auch:** „Verbessert die dokumentierte zusätzliche Anwendung des iterativen FRZK-Prozesses im Vergleich zu einer angemessenen K-Bedingung Nachvollziehbarkeit, Fehlererkennung und Transfer, und zu welchem Zeit-/Hilfepreis?“

Die historischen Daten erlauben retrospektive Beschreibung, Datenqualitätsprüfung und vorläufige Prognoseprüfung. Für einen spezifischen Kausaleffekt fehlen derzeit eine verlässliche Kennzeichnung von FRZK-Anwendung und Vergleichsbedingung, vergleichbare externe Testaufgaben und eine kontrollierte Durchführung. Daher lautet der Status **nicht nachgewiesen – nicht widerlegt**.

### 8.6 Reproduktionsartefakte und offene Ausführung

- `FRZK_K2_Empirie_GATE_AUDIT_V2_READONLY_2026-11-10.sql` prüft Schema, Defaultwerte, Methodenvariation, Link-Qualität, Dubletten, Tabellenrelationen, früh/spät-Ratings und Interventions-Kennzeichen.
- `FRZK_K2_Empirie_GATE_Protokoll_2026-11-10.md` führt D1–D10 sowie Kausalitätsfreigaben.
- `FRZK_K2_Abschnitt_2_6_Empirische_Grundlage_Arbeitsfassung_2026-11-10.md` ist eine nicht freigegebene Kapitel-2.6-Arbeitsfassung.
- **Keines** dieser neu vorbereiteten Audits ist hier auf einer aktuell laufenden ICAS-/f-Datenbank ausgeführt worden. Es gibt **keine neue numerische Wirksamkeitsberechnung** in dieser Übergabe.

## 9. Strenge Literaturfreigabe: verbindliche Regel für Kapitel 2

### 9.1 Sechs Prüfschritte pro behaupteter Aussage

1. **Identität:** Vollständige Metadaten, Autoren, Auflage, Datum, DOI/ISBN, Verlag/Zeitschrift, Titel.
2. **Verfügbarkeit:** Tatsächliche Veröffentlichung und zugängliche Version nachgewiesen.
3. **Originalfundstelle:** Ausgabe, Seite/Abschnitt/Tabelle/Abbildung und verlässliche Original-URL dokumentiert.
4. **Aussagedeckung:** Deckt die konkrete Originalstelle **genau** die im Kapiteltext formulierte Aussage, einschließlich Einschränkungen, Stichprobe, Statistik und Vorbehalten?
5. **Kontextprüfung:** Keine Verwechslung von Review, Meinung, Methodenvorschlag, experimentellem Effekt und eigener Hypothese.
6. **Freigabedokumentation:** Prüfer, Zeitpunkt, Textversion, Quellenkennung, zitierte Stelle, Kontrollresultat und ggf. Autorensignatur dokumentieren.

**Strikt:** DOI vorhanden ≠ Originalseite geprüft. Abstract ≠ geprüfte konkrete Textstelle. Originalstelle geprüft ≠ pauschale Freigabe für ein gesamtes Werk. Die betreffenden Zitierstellen bleiben bis dahin **`OPEN`, `METADATA_ONLY`, `LOCATOR_CHECKED` oder `CLAIM_CHECKED`**, nicht `PASS`. `PASS` nur für den dokumentierten Aussageumfang.

### 9.2 Kapitel-1-Literatur: globale Nummern [1]–[23]

Das folgende Verzeichnis übernimmt den **bibliografischen Wortlaut der bisherigen Übergabe** zu Kapitel 1. Ein bibliografischer Eintrag ist keine neue Originalstellenbestätigung. Nummern [1]–[23] dürfen bei der Zusammenführung der Dissertation **nicht** mit anderen Werken neu belegt werden.

Die Nummern folgen dem Word-Master. **Die Nummerierung darf im Gesamtverzeichnis nicht ohne Zuordnungsprüfung wiederverwendet werden.** Ein Quellenverzeichnis dokumentiert noch nicht die Prüfung jeder behaupteten Textstelle.

[1] Rovelli, Carlo (2018). The Order of Time. London: Penguin Books.

[2] von Foerster, Heinz (1981). Observing Systems. Seaside, CA: Intersystems Publications.

[3] Maturana, Humberto R.; Varela, Francisco J. (1987). The Tree of Knowledge: The Biological Roots of Human Understanding. Boston: Shambhala.

[4] Reinmann, Gabi (2005). Innovation ohne Forschung? Ein Plädoyer für den Design-Based Research-Ansatz in der Lehr-Lernforschung. Unterrichtswissenschaft, 33(1), S. 52–69. DOI: 10.25656/01:5787.

[5] Arnold, Rolf (2012). Wie man lehrt, ohne zu belehren. 29 Regeln für eine kluge Lehre. Das LENA-Modell. 1. Auflage. Heidelberg: Carl-Auer. ISBN: 978-3-89670-838-0.

[6] Sfard, Anna (2008). Thinking as Communicating: Human Development, the Growth of Discourses, and Mathematizing. Cambridge: Cambridge University Press. DOI: 10.1017/CBO9780511499944.

[7] Luhmann, Niklas (1984). Soziale Systeme: Grundriß einer allgemeinen Theorie. Frankfurt am Main: Suhrkamp.

[8] Bruner, Jerome S. (1960). The Process of Education. Cambridge, MA: Harvard University Press. DOI: 10.4159/9780674028999.

[9] Ausubel, David P. (1963). The Psychology of Meaningful Verbal Learning. New York: Grune & Stratton.

[10] Taschner, Rudolf (2013). Der Irrtum des Pythagoras. Videoaufzeichnung. Herausgeber: math.space; archiviert im TIB AV-Portal. DOI: 10.5446/15789.

[11] Carroll, Sean (2016). The Big Picture: On the Origins of Life, Meaning, and the Universe Itself. New York: Dutton.

[12] Hattie, John (2009). Visible Learning: A Synthesis of Over 800 Meta-Analyses Relating to Achievement. London: Routledge.

[13] Rovelli, Carlo (2016). Reality Is Not What It Seems: The Journey to Quantum Gravity. London: Penguin.

[14] Verlinde, Erik P. (2017). Emergent Gravity and the Dark Universe. SciPost Physics, 2(3), Artikel 016. DOI: 10.21468/SciPostPhys.2.3.016.

[15] Bureau International des Poids et Mesures (2026). The International System of Units. 9. Auflage, aktualisierte Fassung. Sèvres: BIPM. DOI: 10.59161/AUEZ1291. URL: https://www.bipm.org/en/publications/si-brochure/

[16] Novak, Joseph D.; Cañas, Alberto J. (2008). The Theory Underlying Concept Maps and How to Construct and Use Them. Technical Report IHMC CmapTools 2006-01 Rev 01-2008. Pensacola, FL: Institute for Human and Machine Cognition. URL: https://cmap.ihmc.us/publications/researchpapers/theoryunderlyingconceptmaps.pdf.

[17] Ainsworth, Shaaron (2006). DeFT: A conceptual framework for considering learning with multiple representations. Learning and Instruction, 16(3), S. 183–198. DOI: 10.1016/j.learninstruc.2006.03.001.

[18] Schoenfeld, Alan H. (1985). Mathematical Problem Solving. Orlando: Academic Press. DOI: 10.1016/C2013-0-05012-8. ISBN: 978-0-12-628870-4.

[19] Hattie, John; Timperley, Helen (2007). The Power of Feedback. Review of Educational Research, 77(1), S. 81–112. DOI: 10.3102/003465430298487.

[20] Zimmerman, Barry J. (2002). Becoming a Self-Regulated Learner: An Overview. Theory Into Practice, 41(2), S. 64–70. DOI: 10.1207/S15430421TIP4102_2.

[21] Bloom, Benjamin S. (1984). The 2 Sigma Problem: The Search for Methods of Group Instruction as Effective as One-to-One Tutoring. Educational Researcher, 13(6), S. 4–16. DOI: 10.3102/0013189X013006004.

[22] Hoffmann, Tammy C.; Glasziou, Paul P.; Boutron, Isabelle; Milne, Ruairidh; Perera, Rafael; Moher, David et al. (2014). Better reporting of interventions: template for intervention description and replication (TIDieR) checklist and guide. BMJ, 348, g1687. DOI: 10.1136/bmj.g1687. URL: https://www.bmj.com/content/348/bmj.g1687.

[23] What Works Clearinghouse (2022). What Works Clearinghouse Procedures and Standards Handbook, Version 5.0 (revised December 2022). Washington, DC: U.S. Department of Education, Institute of Education Sciences. URL: https://ies.ed.gov/ncee/wwc/Handbooks.

### 9.3 Aus Kapitel 1 übernommene noch offene Originalstellen

- **K1 [18] Schoenfeld:** K1-Anlage 1C hatte die relevanten Originalbuchseiten nicht freigegeben. Auch wenn in einem späteren K2-Prüfvorgang eine bestimmte Stelle geprüft wird, muss diese Prüfung **nachvollziehbar dem konkreten K1-Zitat zugeordnet** werden, statt K1 rückwirkend still auf `PASS` zu setzen.
- **K1 [21] Bloom:** historisch in K1 ebenfalls ohne abschließende Originalseitenfreigabe. Aussagen zum „Zwei-Sigma-Problem“ gelten nur für das jeweils untersuchte Design und können nicht unbesehen auf heutige Nachhilfepraxis oder das FRZK übertragen werden.
- **K1 [1]–[15] und weitere Werke:** Bibliografische Existenz allein reicht nicht für konkrete naturwissenschaftliche, didaktische oder methodische Sätze. Exakte Aussagen und Ausgaben weiterhin einzeln kontrollieren.
- **K1 [16], [17], [19], [20], [22], [23]:** Im bisherigen Register sind teilweise Originalstellen, teilweise methodische Quellen dokumentiert. Den jeweiligen Status pro konkret verwendetem Satz fortschreiben – nicht für andere Behauptungen pauschal übertragen.

### 9.4 Kapitel-2-Quelleninventur, Prüfrunde 3 vom 10.11.2026 (gesonderter Stand)

| Inventur-/Prüfgröße | Stand Runde 3 |
|---|---:|
| Unterschiedliche in K2 erfasste Werke | **137** |
| Im K2-Zitierregister erfasste Verwendungen | **143** |
| Davon über Originalstelle konkret geprüfte Zitierverwendungen | **31** |
| Verwendungen mit weiterhin gesperrter Aussagefreigabe | **112** |
| Extern geprüfte Werke insgesamt | **50** |
| Werke mit originalstellenbezogener Claim-Prüfung | **29** |
| Nur Metadaten/Abstract extern abgeglichene Werke | **21** |
| Werke ohne externen Abgleich | **87** |

Die Zahlen wurden gegen die vorhandenen **Runde-3-CSV-Register** geprüft. Später im Gespräch erörterte Quellen einer vierten Runde gelten **nicht automatisch als in diesen Dateien eingearbeitet**. Eine vollständige K2-Quellenfreigabe liegt **nicht** vor.

### 9.5 Dubletten und Nummernkonflikte

- Kapitel 1: 23 historische Nummern, im neuen Gesamtbestand unverändert erhalten.
- Kapitel 2: 137 unterschiedliche Werke, darunter laut bisherigem Werkabgleich **acht** identische K1-Werke; damit vorläufig **152 eindeutige Werke** über K1 + K2, sofern Editions-/Werknormalisierung bestätigt wird.
- Frühere K2-Nummern kollidieren insbesondere bei **[15]–[23]** mit K1. Beispiel: K1 `[18]` = **Schoenfeld (1985)**, ältere K2-Nummer `[18]` = **Page et al. (2021)**. **Keine** dieser Ziffern darf ohne Kontext in einen neuen K2-Absatz übernommen werden.
- Im alten K2-Manuskript waren zudem mehrere Nummern `[142]`–`[147]` mehrfach verwendet und zwei Hinds-Verwendungen zunächst ohne eindeutige Nummer erfasst.
- Die vorgeschlagene Globalnummerierung der K2-Prüftabelle ist **ein Vorschlag**, kein bereits publiziertes/auf dem Live-Server freigegebenes Gesamtverzeichnis. Kanonisch sind **Werkidentitäten** (Autor, Titel, Edition, Jahr, DOI/ISBN), dann erst Nummern.

### 9.6 Zitationsspezifische Freigabe

Bei der redaktionellen Rekonstruktion gilt für jede Verwendung:

```text
K2-Zitierstelle:
- Kapitel/Abschnitt/Absatz (eindeutiger Textversionsbezug)
- Nachvollziehbarer Satz oder Claim
- Quellen-ID/DOI/Ausgabe und globale Literaturziffer
- Originalfundstelle und konkrete Aussagedeckung
- Einschränkungen und Gegenbelege
- Prüfer/Datum/Status: OPEN / METADATA_ONLY / LOCATOR_CHECKED /
  CLAIM_CHECKED / PASS / FAIL
- Verknüpfung zu K1 nur bei tatsächlich identischem Werk und gleicher Aussage
```

Für die Autorenformulierung gilt weiterhin: wissenschaftliche Belege mit vereinbarter Quellenkennzeichnung, im Literaturregister eindeutige `[Nr]`; **keine erfundenen Seitenangaben, Direktzitate oder Freigabe-Labels**.

## 10. Aufbau für Kapitel 2 – Arbeitszuordnung 2.0–2.10

**Achtung:** In vorhandenen Arbeitsfassungen wurden die letzten Abschnitte 2.8/2.9 teilweise unterschiedlich zugeordnet. Die folgende Tabelle ist die **aktuelle inhaltliche Übergabeempfehlung**, keine heimliche Änderung eines bestehenden Kapitel-2-Masters. Vor SQL-Import den letzten Kapitel-2-Text mit `chapters`/`sections` abgleichen und ein formales Mapping anlegen.

| K2-Abschnitt | Inhalt und Erkenntnisauftrag | K1-Herkunft / Grenze |
|---|---|---|
| **2.0 Einführung, Gegenstand und Methode** | Rolle des Grundlagenkapitels, Aussagenarten, FRZK-Kern, iterative Rückkopplung, Freigaberegeln | K1 Einleitung, 1.9–1.11, 1.F1; kein isoliertes Reviewkapitel |
| **2.1 Funktionale Beziehungen und Modellierung** | Variablen/Parameter, Funktion vs. Relation, Modellannahmen, Definitions-/Wertebereich, Dimensionsprüfung | 1.1.2, 1.2, 1.E, 1.A2 |
| **2.2 Visualisierung, Repräsentationen, Concept-Maps** | Sprache, Skizze, Tabelle, Graph, Symbol; Design, Übergänge, mögliche Überforderung | 1.1.1–1.1.2, 1.4, 1A, 1A.2 |
| **2.3 Aufgabenverständnis und Problemlösestrategien** | Problemformulierung, Gegebenes/Gesuchtes, heuristische Lösungswege, Validierung, Iteration | 1.1, 1.7.2, 1.F1 |
| **2.4 Vorwissen, Begriffsentwicklung und Kommunikation** | Lernvoraussetzungen, mathematische Sprache, Argumentieren im Gespräch, Erklärung der linearen Funktion | 1.4, 1.1.2, 1A.2 |
| **2.5 Individuelle Lernunterstützung und Feedback** | Scaffolding, Aufgabenwahl, Tutorintervention, Selbstkontrolle, Rückmeldung | 1.3–1.5, Anlage 1B |
| **2.6 Empirische Evaluation und Wirksamkeitsprüfung** | Dateninventar `f`/`icas`; Erhebungsgüte, Historien, Prognose, Methodenvariation, K/F, Bias, Ethik | 1.7, 1D; eigener Datenbankpfad, Wirkung nicht voraussetzen |
| **2.7 Mathematisches Begründen und Prüfen** | Definition/Behauptung/Beweis/Gegenbeispiel, Plausibilität vs. formale Geltung | 1.2, 1.E, 1.11; keine vorweggenommene Spezialalgebra |
| **2.8 Systemtheoretische, epistemische und diagnostische Grenzen** | Rückkopplung, Beobachtung, Fehlerkontrolle, Geltungsgrenzen, Systemmetaphern | 1.6.1–1.6.4, 1.5; physikalisch/didaktisch/formal trennen |
| **2.9 Klassische Voraussetzungen späterer mathematischer Erweiterungen** | Begriffe von Null, Grenzwert, Richtung, Vektor, Koordinatensystem, Geltungsbereich | 1.9–1.10; **nur klassische Grundlagen**, K3 definiert Zusätze |
| **2.10 Kritische Synthese und Übergang zu Kapitel 3** | Begriffsregister, Merkmalsmatrix, Evidenzgrenzen, offene Definitions- und Beweisaufträge | K1 1.11; K3 nicht als bereits bewiesen beschreiben |

**Alternativgliederung:** In der Übergabe vom 06.11.2026 wurden 2.8 „Fehler/Diagnose/Selbstkontrolle“ und 2.9 „Lernumgebungen und Transfer“ geführt. Diese Themen **dürfen nicht verloren gehen**: Sie sind in 2.5/2.6/2.8 sowie 2.3/2.6 einzubetten oder bei einer abweichenden aktuellen Mastergliederung mit einem ausdrücklichen Mapping zu erhalten. Eine unkommentierte Umnummerierung ist unzulässig.

## 11. Technische Datenbankübergabe an den K2-Neuaufbau

### 11.1 Aus der SQL-Struktur vorhandene zentrale Tabellen

| Tabelle / View | Rolle |
|---|---|
| `dissertations`, `chapters`, `sections`, `paragraphs`, `revisions` | Manuskripttext, Kapitelstruktur, Textversion |
| `sources`, `authors`, `source_authors`, `citations`, `v_citation_register` | Werkidentität, Autorenschaft, konkrete Zitate, Prüfstufen |
| `research_objects`, `object_relations`, `object_tags` | Eindeutige Objektidentität, fachliche Querverweise |
| `claims`, `formal_statements`, `proofs`, `proof_steps` | Aussagen, Annahmen, formale und Beweislast |
| `equations`, `equation_components`, `symbols`, `operators`, `conditions` | mathematische Darstellung und Geltungsbedingungen |
| `figures`, `figure_assets`, `figure_descriptions`, `manuscript_tables` | Abbildungen/Tabellen, Bildrechte und Zuordnungen |
| `validation_checks`, `issues`, `v_open_checks` | qualitätsbezogene Einzelgates und offene Aufgaben |

Das Schema bietet Strukturen zur Nachverfolgbarkeit; es beweist **nicht**, dass ein K2-Quellenregister oder K/F-Auswertung bereits korrekt in produktive Tabellen übernommen wurde.

### 11.2 Verbindliche Unveränderlichkeit des K1-Releases

- **Kapitel 1 nicht neu auf DRAFT setzen** und keine Einträge bei `chapters.chapter_number='1'` ungeprüft modifizieren.
- Bestehende Quellen `[1]`–`[23]` und historische Zitierstellen **nicht** umnummerieren; Werkdubletten über echte IDs klären.
- `current_revision_id=5` für K1 nur nach ausdrücklich neu vereinbarter Autorenrevision ändern.
- Für Kapitel 2 eine **separate Revision** und Prüfung anlegen; Abschnitts-/Objektcodes `K2.*` eindeutig führen.
- **Keine personenbezogenen ICAS-/f-Rohdaten** in die Manuskript-Tabellen übernehmen; gegebenenfalls nur aggregierte, geprüfte Ergebnistabellen mit Provenienz.
- `OPEN`/`WARNING` und eine alte `PASS`-Prüfung mit engem Gegenstand nicht in eine fachlich globale Freigabe umdeuten.

### 11.3 Prüffähige, lesende SQL-Kontrollen nach Import (Beispiele)

```sql
USE `frzk_dissertation`;

-- Kapitel- und Revisionsstände (kein UPDATE):
SELECT c.id,c.chapter_number,c.title,c.status,
       r.revision_code,r.content_sha256
FROM chapters c JOIN dissertations d ON d.id=c.dissertation_id
LEFT JOIN revisions r ON r.id=c.current_revision_id
WHERE d.project_code='FRZK' AND c.chapter_number IN ('1','2','3')
ORDER BY c.chapter_number;

-- Geöffnete K1-Prüfgates:
SELECT v.check_code,v.check_type,v.status,v.result_text
FROM validation_checks v
JOIN chapters c ON c.id=v.chapter_id
JOIN dissertations d ON d.id=c.dissertation_id
WHERE d.project_code='FRZK' AND c.chapter_number='1'
  AND v.status IN ('OPEN','WARNING','FAIL')
ORDER BY v.check_code;

-- Kapitel-2-Struktur vor Neuerstellung abgleichen:
SELECT c.chapter_number,c.status,s.section_number,s.title,s.status
FROM chapters c JOIN dissertations d ON d.id=c.dissertation_id
LEFT JOIN sections s ON s.chapter_id=c.id
WHERE d.project_code='FRZK' AND c.chapter_number='2'
ORDER BY s.sort_order,s.id;

-- Globale Quellenbelegung:
SELECT literature_number,COUNT(*) AS vorkommen
FROM sources
WHERE literature_number IS NOT NULL
GROUP BY literature_number
HAVING COUNT(*)>1;
```

**Importkonvention:** Vorab Backup; SQL-Änderungen transaktional/idempotent, eindeutige Werkidentitäten, Kollationsabgleich, FK-Reihenfolge, Prüfer/Datum und Versionshash. Keine Annahme unveränderlicher numerischer Datenbank-IDs zwischen Dumps.

### 11.4 K2-Staging ist nicht automatisch der finale K2-Import

- `FRZK_K2_Quellen_STAGING_2026-11-10.sql` und die Patches `...FORTSCHRITT...`, `...RUNDE3...` sind **Prüftabellen-Vorbereitung**, keine vollständige bibliografisch freigegebene Migration.
- Die CSV- und Excel-Prüfregister können als Kontrollmaterial dienen, sind aber **nicht** mit `citations.PASS` gleichzusetzen.
- `FRZK_K2_Empirie_GATE_AUDIT_V2_READONLY_2026-11-10.sql` arbeitet lesend; es ist in dieser Übergabe **keine Ausführung** dokumentiert.

## 12. Wissenschaftliche Arbeitsmethodik und Qualitätsregeln

### 12.1 Schreib- und Begründungsregeln

- Deutsche zusammenhängende wissenschaftliche Absätze; klare Definitionen, Begründungen, Beispiele und Schlussgrenzen; keine Aneinanderreihung isolierter Kernsätze.
- Bei Eigenbeobachtung oder Eigenkonstruktion angemessen die **Ich-Form** des Autors; objektive wissenschaftliche Aussagen nur mit belastbaren Belegen.
- Der Kern „iterative Strukturierung/Visualisierung/Prüfung“ darf nicht durch Nebendebatten über Physik oder Spezialoperationen verdrängt werden.
- Nachweisketten getrennt: **theoretisch**, **formal**, **empirisch-deskriptiv/prognostisch** und **kausal**.
- Mathematische Ausdrücke mit Domäne, Wertebereich, Annahmen, Gültigkeit; keine unbewiesenen Analogieschlüsse zwischen Didaktik, Physik und Mathematik.
- Gerade bei Beispielen nur so viel verallgemeinern, wie Datensatz, Modell oder Originalquelle zulassen.

### 12.2 Quellen- und Formelstil

- Im Fließtext Quellenkennzeichnung nach dem in der Arbeit verwendeten Format `({Quelle})[Nr]`; im Literaturregister das vereinbarte `[Nr]`-System eindeutig führen.
- Formeln bei späterem Word-DOCX zuerst **sichtbar gerendert**, darunter eine eigene Zeile **`Word-LaTeX:`**; bei mehrzeiligen Matrixumgebungen die in Word 2019 vereinbarte Syntax beachten.
- In einer MD-Übergabe Rechenregeln als LaTeX oder Klartext darstellen, ohne daraus die exakte Word-OMML-Konvertierbarkeit abzuleiten.
- Nach jeder wesentlichen Behauptung Beleg, Originalfundort und Hinweis auf Grenzen; keine fingierten Zitate oder Signaturen.

### 12.3 Datenschutz und wissenschaftliche Verantwortung

- Daten von Minderjährigen nur auf nachvollziehbarer Rechtsgrundlage und zweckgebunden auswerten; für die Dissertation soweit möglich aggregiert berichten.
- Personen-IDs nicht in öffentliches Manuskript und nicht in das MD-Übergabefile aufnehmen.
- Kleine, wiederholte und heterogene Gruppen mit richtigen Auswertungseinheiten behandeln; `n=335` Bewertungen ≠ `n=335` unabhängige Lernende.
- Forschungsergebnis kann positiv, neutral, negativ oder derzeit nicht identifizierbar sein. Keine Vorfestlegung auf einen FRZK-Vorteil.

## 13. Offene Prüfgates – priorisierte Arbeitsliste

| ID | Dringlichkeit | Status | Nächster belastbarer Schritt |
|---|---|---|---|
| K2-L01 | P0 | OPEN | Gesamtquelleninventar 137 Werke/143 Verwendungen auf Titel, Edition und tatsächliche Fundorte kontrollieren |
| K2-L02 | P0 | OPEN | Alle **112** noch gesperrten K2-Zitierverwendungen originalstellenbezogen prüfen oder Text ändern |
| K2-L03 | P0 | OPEN | K1-Werknummern `[1]`–`[23]` gegen K2-Altziffern/doppelte `[142]`–`[147]` eindeutig mappen |
| K2-L04 | P0 | OPEN | K1-[18]/[21] und andere K1-Fundorte im *jeweiligen Satzkontext* prüfen; K1-Status nur mit neuer Revision ändern |
| K2-D01 | P0 | OPEN | Tatsächliche ICAS/f-Datenbank und genaue Exportgeneration gegen die SQL-Audits abgleichen |
| K2-D02 | P0 | OPEN | Skalencodes einschließlich `NULL`, `0`, SQL-DEFAULT `4`, Erhebungsweg und Fragebogen prüfen |
| K2-D03 | P0 | OPEN | Durchführungskennzeichen für konkreten FRZK-Einsatz vs. Vergleichsunterricht feststellen; historisch offenbar nicht vorhanden |
| K2-D04 | P0 | OPEN | Unabhängige Lernstands-/Transferkriterien, Aufgaben und Zeitpunkte festlegen |
| K2-D05 | P0 | OPEN | Bei Folgestudie K/F-Aufgabenpaare, Instrumente und Bewertungsrubrik vorab versionieren und pilotieren |
| K2-E01 | P1 | OPEN | Historische Pilotprognose reproduzieren, wenn Rohdaten und Auswertungssoftware kontrolliert verfügbar sind |
| K2-E02 | P1 | OPEN | Teilnehmer-/Lehrkraftdaten nur nach belastbaren Schlüsseln, Zeit und Skalen verbinden; 275 Paar-*kandidaten* nicht als gesicherte Paare zählen |
| K2-M01 | P1 | OPEN | 1.F1 iterativen Wissenserwerb als methodisches Modell operationalisieren und Gegen-/Fehlfälle nennen |
| K2-M02 | P1 | OPEN | Konzeptuelle Iterationsschleife und konkreten K/F-Fünfschrittbogen **miteinander** erklären |
| K2-M03 | P1 | OPEN | Alle K2-Geltungsgrenzen gegenüber optionaler Mathematik des Kapitels 3 fixieren |
| K2-A01 | P1 | OPEN | Rechte der fünf Bildschritte aus 1A und sieben aus 1A.2 klären |
| K2-S01 | P1 | OPEN | Neueste K2-Mastergliederung vor Umnummerierung mit dem Stand 2.0–2.10 abgleichen |
| K2-S02 | P1 | OPEN | Kapitel-2-SQL-Import nur nach validiertem Backup, revisionssicherer Schema- und Rechtestandsprüfung |
| K2-G01 | P0 | BLOCKED | **Kein Gesamt-`PASS`**, solange Quelle/Originalstelle, methodische Gültigkeit oder Empirie ungeklärt ist |

## 14. Definition of Done für Kapitel 2

Die Fortsetzung gilt erst dann als ausreichend für die Übergabe an Kapitel 3, wenn die folgenden voneinander getrennten Prüfungen nachweisbar erledigt oder als wissenschaftlich relevante Grenzen ausdrücklich ausgewiesen sind:

- [ ] Kapitel-2-Text hat eine **eindeutige, versionierte Gliederung 2.0–2.10**, abgestimmt auf den tatsächlichen aktuellen Master.
- [ ] Der Kern des FRZK als **iterativer, strukturierender und visualisierender Erkenntnisprozess** ist konzeptuell präzise erklärt und gegenüber heuristischen Problemlösestrategien abgegrenzt.
- [ ] Der fünfgliedrige K/F-Bearbeitungsbogen ist als **operationalisiertes Werkzeug** und nicht als vollständige Definition allen FRZK-Wissens getrennt dargestellt.
- [ ] Klassische mathematische Grundlagen und fachliche Modellgrenzen sind explizit; Sonderzustände/Operatoren werden nicht aus K1-Illustrationen behauptet.
- [ ] **Jede K2-Literaturverwendung** ist mit korrektem Werk, stabiler Globalnummer und dem Status der **konkreten Originalstelle** dokumentiert.
- [ ] Der K2-Neuheitsanspruch ist mit bekannten Verfahren **merkmalsspezifisch** verglichen; keine Totalneuheit ohne Recherche.
- [ ] Die historischen ICAS/f-Daten sind hinsichtlich Einheiten, Skalen, Standardwerten, Zuordnungen und Mehrfachmessungen überprüft.
- [ ] Die bestehende Prognoseanalyse ist korrekt referiert und nicht als Unterrichtswirksamkeitsstudie ausgegeben.
- [ ] Kausale FRZK-Wirkung entweder durch angemessenes K/F-Design geprüft **oder ausdrücklich als ungetestet markiert**; keine erzwungene Positivaussage.
- [ ] Datenschutz-/Bildrechte-/Originalstellengrenzen sind dokumentiert, nicht weggelassen.
- [ ] Kapitel-2-Datenbankimporte haben nachvollziehbare Revision, Hash, Objekt-, Zitier- und Prüfbezüge; K1-Release bleibt erhalten.
- [ ] Autorenfreigabe und wissenschaftliche Endfreigabe werden separat protokolliert.

## 15. Übergabe der offenen mathematischen und methodischen Aufgaben an Kapitel 3

Die folgenden Dinge sind **keine fertigen Kapitel-2-Beweise**, sondern begründete offene Entwicklungs-/Formalisierungsaufträge:

1. Formalisierung des iterativen methodischen Modells, soweit nötig: Zustandsbeschreibung, Wiederholungsschleife, Abbruch-/Überprüfungsbedingungen; keine unvalidierte Universalalgorithmik.
2. Definition gerichteter Null-/Grenzzustände, Schreibweisen und Gültigkeitsbereiche unabhängig von der didaktischen Ausgangsmetapher.
3. Mathematische Trennung von Symbol, Orientierung, Repräsentation, Grenzprozess und einem gegebenenfalls eigens definierten Wertobjekt.
4. Gesonderte Voraussetzungen für orthogonale Ausgangsorientierung, gerichtete Vektoren und etwaige spezielle Operationen.
5. Prüfbarkeit der Rechenregeln durch Definitionen, Gegenbeispiele, Konsistenzanalyse und Beweise im jeweils gewählten Formalismus.
6. Keine Begründung formaler Ergebnisse durch pädagogische Rückmeldungen; keine Begründung einer Unterrichtswirkung durch einen korrekten mathematischen Satz.

## 16. Startauftrag zur unmittelbaren Arbeit an Kapitel 2

> Übernimm den aktuellen Kapitel-1-Master `FRZK_Kapitel1_Iterativer_Erkenntnisprozess_2026-11-09.docx` (SHA-256 `a3fcd99db815be9750523202c88b61d89f19d178625da4b72e1238e045c57cd8`) als verbindliche Ausgangsbasis. Entwickle Kapitel 2 als mathematische, methodische und didaktische **Grundlagen** des FRZK und erhalte die Autorenfreigabe von Kapitel 1 unverändert. FRZK bedeutet im Kern einen **iterativen, durch Strukturierung, Visualisierung, Prüfung und Überarbeitung getragenen Erkenntnis- und Problemlöseprozess**. Das in Kapitel 1 beschriebene Fünfschritt-Arbeitsblatt ist eine **konkrete Anwendung**, nicht die ausschließliche Grunddefinition. Vergleiche das Verfahren mit bekannten Ansätzen und führe jede wissenschaftliche Literaturverwendung nur nach **strenger Originalstellenprüfung** mit eindeutigem Werk und globaler Nummer als `PASS`. Die Wirkung des methodischen FRZK ist anhand der **eigenen ICAS-/f-Daten** zu untersuchen; unterscheide retrospektive Beschreibung, numerische Prognose und kontrollierten K/F-Wirksamkeitsnachweis. Schließe von fehlender Interventionsexposition **nicht** auf erwiesene Wirkung. Behalte die offene K2-Struktur 2.0–2.10 nur nach aktuellem Mapping bei. Führe alle rechtlichen, methodischen, mathematischen und empirischen Unsicherheiten ausdrücklich fort und bereite Kapitel 3 als eigenständige Formalisierung optionaler mathematischer Konstruktionen vor. Keine SQL-Änderung an Kapitel 1 ohne neue ausdrücklich autorisierte Revision.

## 17. Technische Quellen-/Dateiliste der Übergabe

| Datei | Herkunft / Rolle | Prüfstand |
|---|---|---|
| `FRZK_Kapitel1_Iterativer_Erkenntnisprozess_2026-11-09.docx` | K1 aktueller Autoren-Master | SHA-256 `a3fcd99db815be9750523202c88b61d89f19d178625da4b72e1238e045c57cd8` lokal bestätigt |
| `frzk_dissertation_stand_ende_kapitel_1.sql` | Export mit K1-Struktur, Objekten, Quellen und Revision 5 | Exportdatum 10.11.2026; SHA-256 `5840b148be46b62130efc8627a18f78af88c9b947e65c9487d655bd3073bc145` lokal bestätigt |
| `Uebergabe_Kapitel2(1).md` | Frühere Übergabe mit Quellenregister und Unterrichtsprotokoll | Historisch 06.11.2026; für Zahlen/Abbildungen aktualisiert |
| `FRZK_Kapitel2_VOLLTEXT_NEUAUFBAU_2026-10-25_REVIEW.docx` | älterer K2-Volltext zur Ausgangsinventur | Nicht wissenschaftlich freigegeben |
| `FRZK_K2_Quelleninventar_STRIKT_RUNDE3_2026-11-10.csv` | K2-Werkinventar (137) | externe Quellenprüfung teilweise offen |
| `FRZK_K2_Zitatpruefung_STRIKT_RUNDE3_2026-11-10.csv` | K2-Verwendungsinventar (143) | 31 Einzelbelege geprüft, 112 gesperrt (Runde-3-Stand) |
| `FRZK_K2_Originalquellenpruefung_RUNDE3_2026-11-10.md` | Nachweisstand externer Originalstellen | Originalstellen-/Aussagegrenzen dokumentiert |
| `FRZK_K2_Empirie_GATE_AUDIT_V2_READONLY_2026-11-10.sql` | nur lesender DB-Audit | vorbereitet, **nicht** live ausgeführt |
| `FRZK_K2_Empirie_GATE_Protokoll_2026-11-10.md` | D1–D10 Qualitätssperren | OPEN/REVIEW |
| `FRZK_K2_Abschnitt_2_6_Empirische_Grundlage_Arbeitsfassung_2026-11-10.md` | 2.6-Textentwurf | REVIEW, nicht FINAL |
| `FRZK_Deep_Research_Didaktikdatenbank_f_2026-10-15.docx` | historische empirische Pilotanalyse zu `f.sql` | Bericht, hier nicht neu gerechnet |
| `icas_nach_schritt_3.sql` | historischer ICAS-Rohdatenexport, intern | **Nicht Bestandteil** dieser MD; Zugriff/Befugnis separat |

## 18. Abnahme- und Sperrvermerk

**Übergabe vollständig im dokumentarischen Sinn:** Der aktuelle Kapitel-1-Gedankengang, seine methodische/optionale mathematische Trennung, Abbildungen/Anlagen, Forschungsplan, nummerierter K1-Literaturbestand, SQL-Integritätszustand und die seitdem verbindlichen Literatur- und Empirieprüfregeln sind dokumentiert.

**Keine behauptete externe Freigabe:** Die Prüfung dieses Übergabedokuments begründet weder eine vollständige Originalstellenfreigabe noch einen empirischen Wirkungsnachweis, nicht die juristische Freigabe eingebetteter Bilder und nicht die Ausführung von SQL in einem Live-System. Die übernommenen historischen Forschungswerte bleiben ausdrücklich **referierte frühere Auswertungsergebnisse**, bis ihre Berechnung aus dem autorisierten Rohdatenexport reproduziert ist.

**K2 ist daher `REVIEW / OPEN`; die eigene wissenschaftliche Gesamtfreigabe ist weiterhin gesperrt. Kapitel 1 bleibt autorseitig `RELEASED`.**

*Ende der vollständigen Übergabe Kapitel 1 → Kapitel 2.*
