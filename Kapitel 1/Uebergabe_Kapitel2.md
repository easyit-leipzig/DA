---
projekt: FRZK-Dissertation
uebergabe: Kapitel 1 → Kapitel 2
dokumenttyp: wissenschaftliche_und_technische_uebergabe
sprache: de
stand: 2026-11-06
kapitel_1_status: AUTOREN_RELEASE
kapitel_1_revision: K1_RELEASE_CHAPTERMAP_2026-11-06
kapitel_1_master: FRZK_Kapitel_1_FINAL_Kapitel_2_korrigiert_2026-11-06.docx
kapitel_1_sha256: b90546627250f4820dcacec017a8124e2c1defd0110538e004623a8a2a71e269
datenbank: frzk_dissertation
kapitel_2_status: Fortsetzung/Grundlagenkapitel; aus dieser Übergabe allein nicht als FINAL bestätigt
quellenregel: keine fingierten Originalzitate oder Prüffreigaben
---

# FRZK – Vollständige Übergabe von Kapitel 1 an Kapitel 2

**Stand:** 06.11.2026 · **Verbindlicher Ausgangspunkt:** die korrigierte, autorseitig abgeschlossene Fassung von Kapitel 1.  
**Auftrag:** Kapitel 2 auf dem methodischen FRZK-Verständnis von Kapitel 1 aufbauen, mathematische, methodische und didaktische Grundlagen erarbeiten und den Übergang zur formalen Ausarbeitung in Kapitel 3 vorbereiten.  
**Wichtige Korrektur:** Kapitel 2 ist **kein isoliertes Literaturprüfungs-Kapitel**. Literatur gehört als Begründung, Einordnung und kritische Gegenüberstellung in die Grundlagenarbeit.

> **Statusgrenze:** „Kapitel 1 abgeschlossen“ bedeutet Autoren-Release, nicht extern begutachtete Promotion oder vollständige Originalquellen-, Rechte- und Wirksamkeitsfreigabe. Bereits offene Prüfungen bleiben offen; die Übergabe darf sie nicht in `PASS` umdeuten.

## 0. Quellenhierarchie, Integrität und Übergabebestand

1. **Maßgeblicher Manuskriptstand:** `FRZK_Kapitel_1_FINAL_Kapitel_2_korrigiert_2026-11-06.docx`. SHA-256 `b90546627250f4820dcacec017a8124e2c1defd0110538e004623a8a2a71e269` (am 06.11.2026 hier erneut geprüft).
2. **Datenbank-Importstand:** `frzk_kapitel_1_import_Kapitel_2_korrigiert_2026-11-06.sql`; Revisionscode `K1_RELEASE_CHAPTERMAP_2026-11-06`. Der Import basiert auf dem normalisierten Schema `frzk_dissertation_schema_empty.sql`.
3. **Paket/Manifest:** `FRZK_Kapitel_1_DB_Importpaket_Kapitel_2_korrigiert_2026-11-06.zip` und `frzk_kapitel_1_manifest_Kapitel_2_korrigiert_2026-11-06.json`. Das Manifest ist eine Bestandsliste, kein eigenständiger wissenschaftlicher Beleg.
4. **Bildanhang:** acht in Kapitel 1 eingebettete Bilddateien, dokumentiert im Manifest unter `figure_files` (1.F1–1.F3 und 1A.1–1A.5).
5. **Quellen der Praxisbeobachtung:** Originalanlage `Anlage 1.A - Inkrementelles Setup einer Textaufgabe(1).docx`, die vom Autor bereitgestellte Sammlung `meine Bewertungen.txt` und ein ICAS-Kursplan-Screenshot. Für Kapitel 2 nur die bereits anonymisierten und kritisch eingeordneten Aussagen aus Kapitel 1/Anlage 1B verwenden; personenbezogene Rohdaten **nicht** übertragen.
6. **Abgrenzung:** Diese Übergabe ist ein eigenständiges Arbeits- und Quellenprotokoll, kein Austausch des maßgeblichen Kapitels 1 und kein Ersatz des SQL-Imports.

### Bestandsaufnahme aus dem zum Master gehörenden Manifest

| Objekt | Umfang | Bedeutung für Kapitel 2 |
|---|---:|---|
| Abschnitte inkl. Unterabschnitte und Anlagen | 48 | Kapitel-1-Gliederung und Anlagen als Referenzbasis |
| Datenbank-Textabsätze | 241 | Absatzbezogene Rückverweise möglich |
| Nummerierte Literaturquellen | 23 | Zitationsnummern [1]–[23] nicht ungeprüft neu vergeben |
| Zitierverwendungen | 43 | Verwendung ist nicht gleich geprüfte Originalstelle |
| Abbildungen (davon 5 in Anlage 1A) | 8 | 3 Kapitelabbildungen und 5 Bildschritte |
| Abbildungsbeschreibungen | 16 | Bildunterschriften/Alternativtexte als eigene DB-Daten |
| Gleichungen | 5 | Gleichungen (1.1)–(1.5) des technischen Referenzmodells |
| Tabellen | 10 | Kapitel- und Anlagentabellen |
| Registrierte wissenschaftliche Claims | 12 | Status je Claim prüfen, nicht pauschal als bewiesen behandeln |

**Wichtig:** Der numerische Bestand beschreibt Kapitel 1, **nicht** einen bereits importierten oder freigegebenen Kapitel-2-Stand. Die exakte aktuelle Kapitel-2-Datei wurde für diese Übergabe nicht vorgelegt.

## 1. Verbindliche Grundentscheidung: FRZK besitzt zwei getrennte Ebenen

### 1.1 Allgemeines methodisches FRZK-Grundgerüst

Das FRZK ist primär ein **methodischer Ansatz zur Problemstellung und Problemlösung**. Kapitel 1 formuliert fünf aufeinanderfolgende Arbeitsphasen:

1. **Problemfrage und Ziel präzisieren:** Was ist zu erklären, zu bestimmen oder zu entscheiden?
2. **Gegebenes und Gesuchtes trennen:** Angaben, Größen, Randinformationen und Zielgrößen ausdrücklich erfassen.
3. **Voraussetzungen und Beziehungen prüfen:** Definitionsbereiche, Annahmen, funktionale Abhängigkeiten und Sachkontext offenlegen.
4. **Lösungsweg entwickeln und durchführen:** Geeignete Verfahren auswählen, begründen und anwenden.
5. **Ergebnis, Gültigkeit und Übertragbarkeit prüfen:** Probe, Plausibilität, Fehlerdiagnose, Grenzen und gegebenenfalls Transfer.

Diese Sequenz bezeichnet die für Kapitel 2 maßgebliche **Problemorientierung**. Sie ist nicht mit einer einzelnen Grafik, einer Concept-Map, einem leeren Blatt, einer Rekursion oder einem besonders formalisierten Koordinatensystem gleichzusetzen. Methoden sind zunächst zu beschreiben, fachlich zu begründen und kritisch mit bestehenden Problemlöseansätzen zu vergleichen. Ihre Neuheit und Wirksamkeit sind nicht vorab bewiesen.

### 1.2 Gesonderte mathematische FRZK-Erweiterungen

Spezielle Symbol- und Operationskonstruktionen – im Projekt insbesondere gerichtete Grenz-/Nullzustände, Vektoroperationen, orthogonale Ausgangsorientierung und gegebenenfalls Kohärenz- oder Fixpunktkonstruktionen – **gehören nicht zum universellen methodischen Grundgerüst**. Kapitel 2 kann die zugrunde liegende klassische Mathematik und die fachlichen Voraussetzungen erarbeiten; Kapitel 3 muss die speziellen FRZK-Setzungen, Typen, Operatoren, Axiome, Geltungsbereiche und Beweise separat definieren und prüfen.

**Verbindliche Negativabgrenzungen:**

- Keine Gleichsetzung des leeren Darstellungsblatts mit der mathematisch leeren Menge oder einem physikalischen Vakuum.
- Keine Behauptung, ein didaktischer Bezugssystem-Begriff sei automatisch ein mathematisches Koordinatensystem.
- Keine Behauptung, FRZK-Zusatzsymbole seien neue reelle Zahlen oder unterlägen ohne Beweis den üblichen Rechenregeln.
- Keine Ableitung einer physikalisch entstandenen Raumzeit aus einer Modellzeichnung oder aus dem Namen des FRZK.
- Rekursion, Fixpunkte, Orthogonalität und besondere Kohärenzregeln nur für **explizit definierte** Sonderfälle, nicht als universelle Merkmale aller Problemstellungen.
- Keine Übertragung eines erfolgreichen Unterrichtsbeispiels auf eine unbegrenzte mathematische oder physikalische Gültigkeit.

### 1.3 Drei unabhängige Nachweisketten

| Nachweiskette | Zu prüfende Aussage | Was als Nachweis **nicht** reicht |
|---|---|---|
| Methodische Eigenständigkeit | Ist der FRZK-Problemlöseweg präzise, nachvollziehbar und gegenüber bekannten Verfahren hinreichend unterscheidbar? | Allein die fünf Arbeitsschritte oder die neue Bezeichnung |
| Formale Korrektheit mathematischer Erweiterungen | Sind Symbolik, Wertebereiche, Operatoren und Folgerungen innerhalb definierter Bereiche widerspruchsfrei? | Illustrationen, Metaphern, Schulnoten oder Lernendenfeedback |
| Didaktische Wirksamkeit | Hat eine zusätzliche FRZK-Anwendung unter kontrollierten Vergleichsbedingungen einen messbaren Nutzen? | Positive Nachhilfebewertungen, Notenberichte oder korrekte Modellformeln |

Diese Trennung ist aus Kapitel 1 (insbesondere Einleitung, 1.6.5, 1.7, 1.9–1.11) verbindlich zu übernehmen.

## 2. Forschungsfrage und wissenschaftlicher Anspruch für Kapitel 2

**Problemraum:** Lernende können mathematische Angaben, Variablen und Formeln oft reproduzieren, ohne die Beziehungen und den Lösungsweg hinreichend zu erklären. Unterrichtsbeobachtungen motivieren diese Frage, ersetzen aber keine allgemeine Lerntheorie und keine repräsentative Erhebung.

**Methodische Leitfrage:** Wie lassen sich Problemstellung, Größen, Voraussetzungen, Beziehungen, Lösungsschritte und Ergebniskontrolle fachlich eindeutig und didaktisch nachvollziehbar strukturieren?

**Kritische Anschlussfrage:** Welche dieser Leistungen sind bereits durch etablierte Modelle (Concept-Maps, Repräsentationswechsel, Problemlöseheuristiken, Feedback, Selbstregulation) erfasst und in welcher **präzise überprüfbaren Differenz** besteht der FRZK-Anspruch?

**Mathematische Anschlussfrage:** Welche klassischen Begriffe und Voraussetzungen müssen vorliegen, bevor in Kapitel 3 gesonderte FRZK-Zustände und -Operatoren definiert werden können?

**Nicht zulässig:** aus der Auswahl vorhandener Literatur abzuleiten, ein mit FRZK identisches Verfahren existiere weltweit nicht. Das wäre eine nicht nachgewiesene Neuheitsbehauptung.

## 3. Konkrete Grundlagenanforderungen für Kapitel 2

### 3.1 Mathematische Grundlagen

Kapitel 2 soll – soweit für den methodischen Problembezug relevant – die Grundlagen **begrifflich präzise** darstellen: Mengen und Abbildungen; Variable, Parameter, Konstante; Definitions- und Wertebereich; funktionale Abhängigkeit und Modellannahme; Relation versus Funktion; skalare und vektorielle Größen; Koordinatensystem und geometrisches Bezugssystem; Modellbildung, Darstellung, Interpretation und Prüfung; Grenzwert als klassischer mathematischer Begriff mitsamt seinem Geltungsbereich. Das ist eine **Anforderung an Kapitel 2**, keine Aussage, dass diese Themen bereits vollständig in Kapitel 1 bewiesen worden seien.

Für physikalische Modellgrößen sind dimensionsrichtige Einheiten, klare Mess- und Rechendefinitionen sowie die Trennung zwischen idealisierter Annahme und experimentellem Befund nötig. Die SI-Größen im technischen Beispiel sind nicht als Bestätigung einer FRZK-Physik zu verstehen.

### 3.2 Methodische Grundlagen

Vorausgesetzt werden eine nachvollziehbare Aufgabenanalyse, die Trennung von Ziel-/Nebenbedingungen, Entscheidungsregeln beim Wechsel der Darstellungsform, dokumentierte Begründung des Lösungswegs und eine explizite Fehler-/Gültigkeitskontrolle. Das methodische FRZK muss auch ohne Sonderzeichen und ohne physikalische Interpretation funktionieren.

### 3.3 Didaktische Grundlagen

Begriffsbildung und Vorwissen; Übergang zwischen Text, Formel, Grafik und Sachmodell; schülerseitige Erklärungen und Argumentation; Problemverständnis, heuristische Strategien und Transfer; gestufte Hilfen, Feedback und Selbstregulation; individuelle Förderplanung; fachliche Fehlerdiagnostik; einführende Concept-Maps/Kompendien **versus** individuelle Arbeitsblätter in der weiteren Lernarbeit.

### 3.4 Wissenschaftliche Methodik und Forschungskontext

Qualitative Eigenbeobachtung, Rückmeldungen und berichtete Notenentwicklung sind **verschiedene Datenarten**. Literatur ist jeweils an eine konkret unterstützte Aussage zu binden. Bei Originalzitat oder enger Paraphrase sind genaue Primärstelle, Ausgabe und Gültigkeitsbereich erforderlich. Pädagogische Wirksamkeit und theoretische Plausibilität bleiben getrennt.

## 4. Abschnittsgenaue Herkunft aus Kapitel 1 (Traceability)

| Kapitel-1-Stelle | Übernommene Aussage / Material | Erwartete Verarbeitung in Kapitel 2 |
|---|---|---|
| **Einleitung (1.0)** | FRZK primär methodischer Problemlöseansatz; Sondermathematik separiert | Definition des methodischen Gegenstands vor allen Erweiterungen |
| **1.1.1** | Kartoffelaufgabe, Grundschule, Angaben/Ziel werden zunächst nicht getrennt | Aufgabenverständnis, sprachliche Einbettung, Situationsmodell; Anlage 1A als Illustration |
| **1.1.2** | Verbindlich **lineare Funktion**, nicht lineare Gleichung; Formel wird erkannt, Bedeutung nicht erläutert | Variablen, Parameter, funktionale Abhängigkeiten, Repräsentationen, Fachsprache |
| **1.1.3–1.1.4** | Ungewöhnliche Lösungswege und Zwischenbilanz | Alternative Lösungswege fachlich prüfen; Motivation ≠ empirisches Ergebnis |
| **1.2** | Technische Entstehungsgeschichte + neues reproduzierbares Referenzmodell | Modellbildung, Domäne, Funktion, Geometrie, Modellannahmen; keine ontologische Raumzeitbehauptung |
| **1.3–1.4.2** | Rolle des Tutors; Vertiefung, Verständniskontrolle, persönliches Vorwissen | Scaffolding, Feedback, Lernkommunikation, individuelle Förderung |
| **1.4.3** | Didaktisches „Bezugssystem“ als Vorwissen/Erfahrung, nicht als Koordinatensystem | Begriffliche Differenzierung; Concept-Map versus leeres Aufgabenblatt |
| **1.5** | Heterogene Kleingruppen, planvolle Arbeitsblätter, 90-Minuten-Verlauf, Selbstkontrolle, Bewertungen | Lernumgebung als Kontext, nicht als FRZK-Effekt; Selbstregulation und Diagnostik |
| **1.6.1–1.6.2** | Physikalische/systemtheoretische Bezüge nur Einordnung | Geltungsansprüche sauber voneinander trennen |
| **1.6.3–1.6.5** | Bestehende pädagogische Ansätze und FRZK-Forschungslücke | Keine Doppelung als isoliertes Literaturreview; kritischer Vergleich im jeweiligen Grundlagenthema |
| **1.7.1–1.7.7** | Exploratives K/F-Vergleichsdesign, 0–12-Punkte-Raster, Ethik | Begriffe, Annahmen und Güteanforderungen begründen; Interventionsdaten noch nicht vorhanden |
| **1.8** | Persönliche Berufserfahrung als Motivation | Nicht als Fachbeweis übernehmen |
| **1.9–1.10** | Kapitel 2 = mathematische, methodische, didaktische Grundlagen; Kapitel 3 = Formalisierung und Erweiterungen | Kapitelübergang explizit; keine falsche Kapitelbezeichnung |
| **1.11** | Drei Prüfbereiche bleiben eigenständig | Synthese am Ende von Kapitel 2 und offene Formalisierungsaufträge an Kapitel 3 |

## 5. Arbeitszuordnung zu Kapitel 2 (2.0–2.10)

**Statushinweis:** Kapitel 1 nennt die thematischen Grundlagenbereiche; im Projekt gab es Arbeitsgliederungen 2.0–2.10 mit teilweise abweichender Zuordnung der späteren Abschnitte. Diese Tabelle ist daher eine **Arbeits- und Schnittstellenzuordnung**, **keine Anweisung, einen bereits vorhandenen Kapitel-2-Master stillschweigend umzunummerieren**. Vor Änderungen bestehende Kapitel-2-Texte gegen die aktuelle Gliederung prüfen.

| Abschnittsanker | In Kapitel 2 zu bearbeiten | Verbindliche Übergabe / Abgrenzung |
|---|---|---|
| **2.0 Gegenstand, Methode, Grenzen** | Aufgabenstellung des Grundlagenkapitels, Typen wissenschaftlicher Aussagen | Grundlagen des *methodischen* FRZK; kein eigenständiges Literaturprüfkapitel |
| **2.1 Funktionale Zusammenhänge und mathematische Modellierung** | Funktionen, Relationen, Größen, Parameter, Definitionsbereich, Einheiten | Technischer Referenzfall aus 1.2 nur als Fallbeispiel; mathematische Voraussetzungen sauber definieren |
| **2.2 Repräsentationen, Visualisierung, Concept-Maps** | Text–Symbol–Bild–Tabelle; Wechsel und Fehlinterpretationen | Concept-Map/Kompendium am Themenstart; kein Synonym für FRZK |
| **2.3 Aufgabenverständnis und Problemlösen** | Problemmodell, Gegebenes/Gesuchtes, Heuristiken, Lösungen, Transfer | FRZK-Fünfschrittmodell mit bestehenden Verfahren vergleichen |
| **2.4 Vorwissen, Begriffsbildung, Kommunikation** | Lernen mit Vorwissen, mathematische Sprache, Parameterdeutung | Beispielfrage „lineare Funktion“; Ursache der Beobachtung offen |
| **2.5 Individuelle Förderung, Scaffolding, Feedback** | differenzierte Hilfen, Lernbegleitung, Rückfragen, Verständnisprüfung | Drei Jahre Praxis sind qualitative Kontextbeschreibung, kein Kausaleffekt |
| **2.6 Entwicklungsforschung und empirische Evaluation** | Design-/Interventionsbeschreibungen, Messvalidität, Bias, Ethik | Geplantes K/F-Design und TIDieR/WWC als Methodikbezüge, nicht als FRZK-Wirkungsbeweis |
| **2.7 Mathematisches Argumentieren und Begründungen** | Geltung, Argument, Beweis, Gegenbeispiel; Unterschied zur empirischen Bestätigung | Spezialaxiome/-operatoren bleiben für Kapitel 3 vorbehalten |
| **2.8 Fehler, Diagnose und Selbstkontrolle** | Fehlerarten, Plausibilität, Tutor-/Selbstkontrolle, Rückmeldung | Zwei verschiedenen Prozentmodelle aus 1.5 nicht vermengen |
| **2.9 Lernumgebungen und Transfer** | heterogene Gruppen, Arbeitsmaterialien, Selbstregulation, Lernen im Anwendungskontext | ICAS-Belegung ist nur eine Wochenbelegung; kein Leistungsnachweis |
| **2.10 Synthese und Übergang zu Kapitel 3** | konsolidierte Begriffe, Abgrenzung, offene Definitionen/Geltungsfragen | explizite Liste dessen, was **erst Kapitel 3** definiert und beweist |

**Querschnittsbezüge:** Systemtheorie/Kybernetik, Beobachterbegriff und Raum/Zeit gehören – soweit notwendig – in die jeweils fachlich passende Grundlage, nicht in eine künstliche physikalische FRZK-Bestätigung. Bereits anders nummerierte Abschnitte des vorhandenen Kapitel-2-Projekts sind in einer Mapping-Tabelle zu verknüpfen, nicht ohne Prüfung zu überschreiben.

## 6. Empirische Unterrichtsgrundlage – nur in ihrem belegten Umfang

### 6.1 Tatsächliche Unterrichtsorganisation

- Der Themenstart erfolgt mit einer **Concept-Map oder einem Kompendium**. Anschließend Unterricht **themenbezogen und defizitorientiert mit individuell angepassten Arbeitsblättern**, fachlicher Vertiefung und allgemeiner Verständniskontrolle. Die Arbeitsblätter orientieren sich auch an Arbeitsgeschwindigkeit und fachlichem Lernstand.
- 90-Minuten-Einheit nach Kapitel 1: **5 Minuten Blitzlicht + 75 Minuten Arbeitsphase + 5 Minuten Nachhilfehefter + 5 Minuten Abschlussreflexion**.
- Maximal **sechs** Lernende gleichzeitig; Klassenstufen und gegebenenfalls Fächer innerhalb einer Gruppe unterschiedlich.
- Ergebniskontrolle nach Erfahrungsmodell: bis etwa Klasse 6 weitgehend Tutor; Klassen 7–9 etwa 50 % Tutor/50 % Lernende; ab Klasse 10 bis einschließlich zweitem Studienjahr etwa 10 % Tutor/90 % Lernende. **Dies sind ungefähre qualitative Praxiswerte**, keine gemessenen Optimalquoten. Verständniskontrolle bleibt auch bei hoher Selbstkontrolle Tutoraufgabe.
- Anderes, getrenntes Erfahrungsmodell: Anteil Übungsrechnen versus Problembearbeitung bis Klasse 4 etwa 80/20; Klassen 5–7 etwa 50/50; ab Klasse 8 etwa 20/80. **Nicht** mit dem Kontrollanteil verwechseln.
- Zeitargument: sechs Lernende × angenommene zehn Minuten vollständige persönliche Ergebniskontrolle = 60 Minuten; in einer 75-minütigen Arbeitsphase bleiben dann nur 15 Minuten für andere Aufgaben. Dies ist ein **illustratives Kapazitätsmodell**, keine gemessene mittlere Kontrollzeit.

### 6.2 Kursplan als organisatorische Momentaufnahme

Die eingereichte ICAS-Ansicht für die **zukünftige Woche 09.–15.11.2026** zeigt fünf Gruppen, jeweils fünf oder sechs Belegungen: insgesamt 27 Belegungen und 25 anhand der Einträge unterscheidbare Lernende, Klassenstufen 5–12; eine Gruppe verbindet Mathematik- und Physikbetreuung. **Nicht** daraus ableiten: 25 tatsächlich anwesende Personen, konstante dreijährige Gruppenstruktur, Leistung oder FRZK-Wirksamkeit. Kapitel-1-Nachweis: Tabelle 1.1.

### 6.3 Fremdrückmeldungen, Notenberichte und Nachweisstatus

Kapitel 1 leitet aus der anonymisierten Sammlung sieben qualitative Unterrichtsmerkmale ab: individuelle Vorbereitung; verlässliche Stundenstruktur/Reflexion; mehrperspektivische Erklärungen; Aufgreifen eigener Lösungswege; persönliche Betreuung; geordnete Dokumentation; wahrgenommener Nutzen/berichtete Notenentwicklung. Dokumentationsorte: Tabelle 1.2 und Anlage 1B (`NB-01` bis `NB-16`, Kodierung `M1` bis `M7`).

**Einschränkungen:** Nur ein Teil der Materialien sind unmittelbare Lernenden-/Elterntexte; anderes sind redigierte Gesprächszusammenfassungen, unbestätigte Erweiterungen, öffentliche Rezensionstexte aus einer Sammlung oder Verwaltungsnotizen. Mindestens einzelne Identitäten/Quellen überschneiden sich; **keine 16 unabhängigen Personen** behaupten. Wo schriftliche Nutzungszustimmung dokumentiert ist, gilt sie zunächst nur für die konkret vorgelegte Aussage; eine allgemeine datenschutzrechtliche Freigabe folgt daraus nicht. Notenverbesserungen sind berichtet, nicht anhand von Zeugnissen unabhängig geprüft. Es gibt keine kontrollierte Zurechnung zum FRZK.

## 7. Prüfrelevante mathematische Beispielbasis aus 1.2 und Anlage 1E

### 7.1 Rolle und Grenzen

Das technische Beispiel demonstriert die methodische Folge „Problem → Annahmen → Modell → Rechnung → Prüfung“. **Es definiert nicht das gesamte FRZK.** Die historischen Abbildungen 1.F1 und 1.F2 stammen aus einer ursprünglichen Ideengeschichte; deren Originalrechenparameter sind nicht dokumentiert. Ein neues, unabhängiges Referenzmodell ist zur Reproduzierbarkeit festgelegt. Geometrische Bilddarstellung ≠ physikalische Raumzeit-Erzeugung; modellierte Laufzeit ≠ Messung.

### 7.2 Modellparameter und Größen (wie in Kapitel 1)

| Zeichen | Bedeutung | Wert / Bereich |
|---|---|---|
| `O` | Beobachter/Ursprung | `(0,0,0)` m |
| `s` | Seitenlänge des Beobachtungsdreiecks | 1 m |
| `b` | Position der Beobachtungsebene | 1 m; `x=b` |
| `d` | Referenzlage der gekrümmten Fläche | 3 m |
| `a` | Krümmungsparameter | 0,20 m⁻¹ |
| `x_S` | Senderlage auf x-Achse | 5 m |
| `c` | Vakuumlichtgeschwindigkeit | 299 792 458 m/s, exakt nach SI |
| `D` | dreieckiger (u,v)-Bereich | siehe Grenzvorschrift unten |

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

**Im Manuskript dokumentierte Kontrollwerte:** Mittelpunkt 13,3425638079 ns; Ecken A/B je 13,7472449142 ns; Ecke C 13,4519250616 ns. Im angegebenen Gitter 39 481 gültige Punkte; Rasterminimum ca. 13,3425647406 ns (v=0 nicht exakt im Raster). Diese Angaben dokumentieren die Reproduzierbarkeit dieses **Referenzfalls**, nicht eine externe Validierung der Physik oder der historischen Grafiken.

**Anschluss für Kapitel 2:** Den Fall nutzen, um Definitionsbereich, Parametrisierung, Funktion, Rechenmodell, Bedingung, mathematische versus physikalische Aussagen und Modellgrenzen sauber einzuführen. Keine universellen FRZK-Gesetze daraus folgern.

## 8. Forschungsdesign und Methodenprotokoll aus Kapitel 1

### 8.1 Was bereits geplant (nicht durchgeführt) ist

- **Grundgesamtheit der möglichen Teilnehmer:** kleine, nicht repräsentative Gelegenheitsstichprobe von **etwa 25 Lernenden**; die sichtbaren Kursbelegungen sind nicht automatisch Teilnehmer.
- **K – Kontrolle:** übliche, themen- und defizitorientierte Nachhilfe ohne verpflichtenden FRZK-Problemlösebogen; eigenständige Strukturierungen bleiben erlaubt und werden protokolliert.
- **F – FRZK:** **gleiche** sonstige Nachhilfe, gleiche Aufgabenanforderung, Zeit, Tutorhilfe und Zugang zu Materialien/Lösungen; zusätzlich der fünfstufige FRZK-Bogen (Problemfrage/Ziel, Angaben und Gesuchtes, Annahmen/Beziehungen, Lösungsweg, Gültigkeits-/Ergebnisprüfung).
- **Forschungsfragen:** F1 primär Nachvollziehbarkeit; F2 Fehlererkennung; F3 Transfer; F4 zusätzlicher Zeit-/Hilfebedarf und mögliche Nachteile.
- **Primäres Bewertungsraster (Anlage 1D):** A Angaben/Ziel, B Beziehungen/Gültigkeitsbedingungen, C Verfahren/Begründung, D Transfer auf **gesonderte** neue Aufgabe; je 0–3 Punkte, Summe 0–12. Skala ist **nicht validiert**.
- **Vorbedingungen:** fachlich vergleichbare Aufgabenpaare, protokollierte Reihenfolge und Hilfen, zweite unabhängige Bewertung soweit möglich, Ankerbeispiele, Datenschutz/Einwilligungen, Pilotierung und Versionsfixierung.
- **Auswertung:** zunächst deskriptiv; bei geeigneten Paaren Differenzen F−K; Berichte auch Nullbefunde, Verschlechterungen, Wechselwirkungen und fehlende Werte. Keine unbelegte Kausalwirkung, Randomisierung oder Repräsentativität behaupten.

### 8.2 Was Kapitel 2 hierzu leisten soll

Die Grundlagen zu Lernstandsdiagnose, feedbackgestützter Förderung, Aufgabenvergleichbarkeit, Gütekriterien, Transfer, Selbstregulation und möglichem Übertragungseffekt zwischen K/F fachlich entwickeln; dabei den geplanten Unterrichtsversuch nicht als bereits durchgeführt schildern. Quellen [22] und [23] dienen der Nachvollziehbarkeit bzw. Einordnung von Interventionsberichten und Bewertungsstandards, nicht als Nachweis des FRZK.

## 9. Übernommene Quellen: bibliografisches Kapitel-1-Register

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

### 9.1 Literaturgruppen und Deckung

- **Physik/Philosophie/Systemtheorie:** [1]–[3], [7], [11], [13], [14]; Hintergrund und kritische Begriffsklärung, **kein** Raumzeit-/FRZK-Wirksamkeitsnachweis.
- **Didaktik/Forschungsmethodik:** [4]–[6], [8], [9], [12], [16]–[23]. Quellen zur Einordnung des Problemlösens, Darstellungswechsels, Lernbegleitung, Feedback, Selbstregulation, Interventionsberichten und Standards; nicht alle sind Beweise der einzelnen methodischen FRZK-Behauptungen.
- **Illustrative populärwissenschaftliche Quelle:** [10] Taschner; keine Studie zur FRZK-Wirkung.
- **Einheiten-/Modellnormierung:** [15] BIPM; Quelle für den exakten Zahlenwert von `c`, **kein** FRZK-Forschungsbeleg.

### 9.2 Nachweisstatus aus Anlage 1C

| Quelle | Status in Kapitel 1 | Weiteres Vorgehen |
|---|---|---|
| [16] Novak/Cañas | Originalstelle im Manuskript als geprüft gekennzeichnet | Prüfstelle in Kapitel 2 bei paraphrasierten Kernaussagen mit genauer Fundstelle führen |
| [17] Ainsworth | Originalauszug/Abstract geprüft | Nutzen und Grenzen multipler Darstellungen differenziert darstellen |
| **[18] Schoenfeld** | **Originalseiten offen**; bibliografische/thematische Deckung | Primärtext beschaffen, exakte Seiten lokalisieren, keine unbestätigten Direktzitate |
| [19] Hattie/Timperley | Originalstellen im Register als geprüft gekennzeichnet | Zwischen Feedbackebenen und Lernwirkung differenzieren |
| [20] Zimmerman | Originalstelle als geprüft gekennzeichnet | Selbstkontrolle nicht mit Selbstregulationsleistung gleichsetzen |
| **[21] Bloom** | **Originalseiten offen**; bibliografische Deckung | Primärtextstelle prüfen, historischen Geltungsbereich beachten |
| [22] Hoffmann et al. | Methodischer Berichtsrahmen | als Dokumentationshilfe, nicht Wirksamkeitsbeleg |
| [23] WWC | Methoden-/Standardhintergrund | keine Behauptung, dass die eigene Studie die Standards schon erfüllt |
| [1]–[15] insgesamt | vollständige exakte Originalstellenprüfung **nicht für alle** belegt | pro konkreter Textaussage, Ausgabe und Locator prüfen |

**Zitierregel für Fortsetzungen:** Originalaussagen nur mit tatsächlich geprüfter Originalquelle und Locator verwenden; sonst als Metadaten-/Hintergrundbeleg oder `OFFEN` kennzeichnen. Bisherige Gesamtzitation [1]–[23] beibehalten, neue Quellen erst nach nummern- und editionssicherem Abgleich registrieren. Die Literaturverwendungen in der SQL-Tabelle `citations` dürfen bei `METADATA_ONLY`, `OPEN` oder vergleichbarem Status nicht auf `PASS` hochgesetzt werden, ohne einen neuen Nachweis.

## 10. Abbildungen, Tabellen und Anlagen als weiterzugebende Objekte

### 10.1 Abbildungen und Verfügbarkeit

| Kennung | Inhalt | Methodischer Status | Übergabehinweis |
|---|---|---|---|
| **1.F1** | Ursprüngliche geometrische Ideenskizze | historische Autorendarstellung | keine vollständigen numerischen Originalparameter |
| **1.F2** | Historische Visualisierung modellierter Laufzeiten | illustrative Autorendarstellung | nicht als Berechnungsnachweis von 1.F3 ausgeben |
| **1.F3** | reproduzierte Laufzeitverteilung des neuen Referenzmodells | numerische Eigenproduktion | mit Anlage 1E reproduzierbar; keine echte optische Messung |
| **1A.1–1A.5** | fünf Schritte des „Inkrementellen Setups einer Textaufgabe“ | vom Autor bereitgestellte Bildfolge | Rechte von enthaltenen Cliparts/Teilbildern noch offen |

Zu jeder Abbildung gehören Bild-/Dateiprovenienz, Bildunterschrift, Beschreibung, Rechte-/Prüfstatus. Die Bilddateien und SHA-256-Werte sind im Manifest verzeichnet; **nicht allein aus einem Dateinamen Besitz an Fremdillustrationen ableiten**.

### 10.2 Zehn Tabellen

| Kennung | Gegenstand | Quelle/Status |
|---|---|---|
| 1.1 | 5 anonymisierte Kursgruppen / 27 Belegungen | Screenshot, einmaliger Wochenstand |
| 1.2 | 7 qualitative Unterrichtsmerkmale | Kategorisierung von Fremdrückmeldungen |
| 1.3 | Altersbezogene Tutor- versus Selbstkontrolle | qualitative Praxisrichtwerte |
| 1.4 | Übungsrechnen versus Problembearbeitung | qualitative Planungsrichtwerte |
| A1B.1 | Quellen- und Statusregister NB-01 bis NB-16 | pseudonymisierte qualitative Materialsammlung |
| A1B.2 | Kategorien M1–M7 und Quellenzuordnung | eigene Kategorisierung |
| A1C.1 | Literatur-Originalstellenprüfung [16]–[21] | differenzierte Quellendeckung |
| A1D.1 | Bedingungen K/F | **geplantes** Design |
| A1D.2 | Bewertungsraster 0–12 | **nicht validiert** |
| A1D.3 | Mindestfelder der Beobachtungsprotokolle | **Planung** |

### 10.3 Anlagen

- **Anlage 1A:** Bildfolge der Grundschul-Textaufgabe (fünf visualisierte Schritte). Keine datierte Originalschrift der Schülerin; ergänzende Rechnung 173 = 8·21 + 5 **nicht** als von der Schülerin beobachtete Lösung darstellen.
- **Anlage 1B:** anonymisiertes Register der Bewertungen und Belegstufen; Originaldatei mit Personenbezug separat geschützt.
- **Anlage 1C:** Aussage-Quelle-Matrix und Originalstellenstatus [16]–[21].
- **Anlage 1D:** vorläufiges Protokoll des Unterrichtsvergleichs K/F; keine Datenerhebungsergebnisse.
- **Anlage 1E:** reproduzierbare Berechnung des technischen Referenzmodells, Raster-/Farbvorschrift, Kontrollwerte, physikalische Grenzen.

## 11. Datenbank-Übergabe und technische Anschlussregeln

### 11.1 Maßgebliches Schema und Importgrenzen

- Ziel-DB: **`frzk_dissertation`**, **nicht** ohne ausdrückliche Entscheidung eine alternative FRZK-Datenbank.
- Schema: `frzk_dissertation_schema_empty.sql`; MySQL 8.x/MariaDB 10.6+, `utf8mb4`, `utf8mb4_unicode_ci`.
- Der letzte Kapitel-1-Import trägt Revision `K1_RELEASE_CHAPTERMAP_2026-11-06` und Kapitel `1` mit `chapters.status=RELEASED` / Autorenrevision `FINAL`.
- **Die tatsächliche Ausführung dieses SQL-Imports auf dem Datenbankserver ist mit dieser Übergabe nicht nachgewiesen.** Paketbereitstellung ≠ importierte DB.
- Die Skriptlogik ist für Kapitel 1 bestimmt. Vor einem Import des Kapitels 2 dürfen Tabellen, IDs und Revisionsinformationen von Kapitel 1 nicht pauschal geleert oder überschrieben werden.

### 11.2 Datenbankobjekte, auf die Kapitel 2 abgestimmt werden muss

| Tabelle / View | Zweck für Kapitel 2 |
|---|---|
| `dissertations`, `chapters`, `sections`, `paragraphs`, `revisions` | Kapitel-, Abschnitts- und revisionssichere Textverwaltung |
| `research_objects` | gemeinsame Objektidentitäten; K2-Codes eindeutig und ohne Konflikt zu K1 |
| `sources`, `authors`, `source_authors` | Quellen und Autorenschaft, literaturnummern- und DOI-sicher |
| `citations` / `v_citation_register` | abschnitts- und absatzgenaue Verwendungen, Originalfundorte, Prüfstufen |
| `claims`, `formal_statements`, `proofs`, `proof_steps` | Aussagearten, Beweise, Gegenbeweise und Status, soweit in Kapitel 2 fachlich nötig |
| `equations`, `equation_components`, `symbols`, `operators`, `conditions` | mathematische Grundlagen, Operator-/Symbolgrenzen und Formeln |
| `figures`, `figure_assets`, `figure_descriptions`, `manuscript_tables` | Abbildungen, Tabellen, Beschreibungen, Rechteprovenienz |
| `validation_checks`, `issues` / `v_open_checks` | Kapitel-2-Prüfgates; `OPEN`/`WARNING` nicht als `PASS` behandeln |
| `object_relations` | Beziehungen zwischen Grundlagen, Definitionen und späteren K3-Objekten |

### 11.3 Sichere Kontrollabfragen nach einem tatsächlichen Import

```sql
USE frzk_dissertation;

-- Stand der Autorenrevision von Kapitel 1
SELECT ch.id, ch.chapter_number, ch.title, ch.status,
       rv.revision_code, rv.source_filename, rv.content_sha256
FROM chapters AS ch
JOIN dissertations AS d ON d.id = ch.dissertation_id
LEFT JOIN revisions AS rv ON rv.id = ch.current_revision_id
WHERE d.project_code = 'FRZK' AND ch.chapter_number = '1';

-- Noch offene Kapitel-1-Prüfungen
SELECT v.check_code, v.check_type, v.status, v.result_text
FROM validation_checks AS v
JOIN chapters AS ch ON ch.id = v.chapter_id
JOIN dissertations AS d ON d.id = ch.dissertation_id
WHERE d.project_code = 'FRZK' AND ch.chapter_number = '1'
  AND v.status IN ('OPEN','WARNING','FAIL')
ORDER BY v.check_code;

-- vorhandener Kapitel-2-Stand vor Import/Änderung
SELECT ch.chapter_number, ch.status, COUNT(s.id) AS section_count
FROM chapters AS ch
JOIN dissertations AS d ON d.id=ch.dissertation_id
LEFT JOIN sections AS s ON s.chapter_id=ch.id
WHERE d.project_code='FRZK' AND ch.chapter_number IN ('1','2','3')
GROUP BY ch.id, ch.chapter_number, ch.status
ORDER BY ch.chapter_number;
```

**Wichtig:** Keine Annahme, dass die reale Live-Datenbank dieselbe leere Struktur oder dieselben ID-Nummern wie die SQL-Datei hat. Vor produktivem Import Backup, Collation/FK-Prüfung, Dublettenprüfung, `source_authors` und `citations` gegen die tatsächlich vorhandenen Tabellen und die gewünschte Kapitel-2-Revision prüfen.

### 11.4 Mindestanforderungen an Kapitel-2-Import und Freigabe

1. **Text:** Abschnittscodes, Volltexte, Absatzkennungen, Versionshash, Provenienz und aktuelle Autorenrevision hinterlegen.
2. **Wissenschaftliche Aussagen:** prüfbare Behauptungen, eigene Setzungen, Annahmen und Interpretationen trennen; für jedes geeignete Objekt Geltungsbereich benennen.
3. **Literatur:** Autorentabellen, konkrete zitierte Stelle, Quelle, Editionsstand, Abschnitt/Absatzbezug und Belegstatus; keine `METADATA_ONLY`-Vermutung als Originalstellen-PASS behandeln.
4. **Medien:** Abbildungen einschließlich Bildbeschreibung, Bildquelle, eindeutige Dateipfade, Rechte- und Prüfstatus.
5. **Formalia:** Gleichungs-, Abbildungs-, Tabellen- und Literaturzählung global/kapitelweise konsistent; genaue Verweise Kapitel 1 ↔ Kapitel 2 ↔ Kapitel 3.
6. **Freigabe:** Technische Importkonsistenz getrennt von wissenschaftlicher Originalstellenprüfung und tatsächlicher Autoren-/Prüfersignatur. Nur nach real nachgewiesener Prüfung endgültig auf `FINAL/PASS` setzen.

## 12. Liste offener Fragen – mit Priorität, Status und Zuständigkeit

| ID | Priorität | Offen / notwendige Maßnahme | Bezug |
|---|---|---|---|
| O-01 | Hoch | Originaltext-/Seitenstellen [18] Schoenfeld und [21] Bloom prüfen; keine Zitatfiktion | Anlage 1C, K1-SQL `K1_ORIGINAL_18_21` |
| O-02 | Hoch | Weitere Kapitel-1-Originalstellen erst nach Quellenprüfung wissenschaftlich endgültig freigeben | SQL `K1_ORIGINAL_OTHER` |
| O-03 | Hoch | Drittbild-/Clipart-Rechte in Anlage 1A vor externer Veröffentlichung klären | SQL `K1_ANNEX_1A_RIGHTS` |
| O-04 | Hoch | Bei Forschung mit Minderjährigen Einwilligungen, Datenschutz, freiwillige Teilnahme und gegebenenfalls Ethikprüfung verbindlich klären | 1.7.7 |
| O-05 | Hoch | FRZK-Problemlösebogen K/F, Aufgabenpaare, Ankerbeispiele und Bewertungsverfahren pilotieren/versionieren | 1.7, Anlage 1D |
| O-06 | Mittel | Elternberichtete Notenentwicklung nur nach datenschutzkonformer Originaldatensichtung quantifizieren | Anlage 1B |
| O-07 | Mittel | Neuheitsanspruch gegen einschlägige Problemlöseverfahren anhand klarer Merkmalsmatrix prüfen | 1.6.5, Kapitel 2 |
| O-08 | Mittel | Historische Modellparameter 1.F1/1.F2 beschaffen, falls eine Rekonstruktion behauptet werden soll; sonst getrennt belassen | 1.2, Anlage 1E |
| O-09 | Mittel | Kapitel-2-Gliederung und bereits existierende Textversionen/Importstände vor Weiterführung abgleichen | Übergabe-Schnittstelle |
| O-10 | Mittel | Kapitel-3-Grenz- und Vektorerweiterungen **nicht** ohne gesonderte Typ-/Geltungs-/Beweisprüfung in K2-Grundgerüst eingliedern | 1.9–1.10 |
| O-11 | Mittel | Verifizieren, ob Kapitel-1-SQL auf dem echten Server gelaufen ist und welche Prüfgates tatsächlich offen sind | `frzk_dissertation` |
| O-12 | Niedrig | Bei weiteren Revisionen Kapitel-1-Hash/Revisionscode unverändert als historischen Prüfstand erhalten, statt alte Freigabe still umzudefinieren | Provenienz |

## 13. Qualitäts- und Sprachregeln für die Fortführung

- Kapitel 2 in deutscher wissenschaftlicher Prosa verfassen, mit vollständigen Erklärungen statt aneinandergereihter Kernsätze.
- Den Ich-Bezug des Autors bei Eigenbeobachtungen und Eigenkonstruktionen beibehalten; allgemeine Wissenschaftsaussagen quellengebunden formulieren.
- Eigene FRZK-Setzungen von klassischen Definitionen und von Literaturbelegen durchgängig markieren.
- Erst Aussage und fachliche Bedeutung, dann geeignete mathematische Definition/Beispiel, danach Grenzen, Quellen und offene Prüfungen.
- Für Formeln die in der Dissertation vereinbarte Darstellung beachten: **sichtbar gerenderte Gleichung**, anschließend **`Word-LaTeX:` in einer eigenen Zeile** bei einer späteren DOCX-Ausgabe; jeder Operator mit Domäne, Wertebereich und Bedingungen.
- Bei Behauptungen zu Null/Grenzwert/Richtung unterscheiden: klassische Mathematik, besondere FRZK-Notation, physikalische Interpretation. Typisierte Symbole nicht unmarkiert wie reelle Zahlen verwenden.
- Quellen möglichst an konkreten Aussagen verorten; volle bibliografische Angaben und [Nr.] im gemeinsamen Literaturregister. Keine fingierten Originalzitate, Seiten, Reviews, Freigaben oder empirischen Ergebnisse.
- Alle neuen Diagramme und Tabellen mit Nummer, verständlicher Beschriftung, Beleg-/Provenienzangabe und bei Bedarf maschinenlesbaren Assets hinterlegen.
- Keine Übertragung identifizierbarer Schülerinformationen in Kapitel-2-Manuskript oder öffentliches Übergabeartefakt.
- „Methodik“ darf je nach Kontext Problemlöseverfahren oder empirische Forschungsmethode meinen; begrifflich unterscheiden.
- Immer: Dokumentversion, Datum, Quellenstand, offene Einschränkungen dokumentieren; keine historischen Stände still überschreiben.

## 14. Definition of Done für den Übergang von Kapitel 2 zu Kapitel 3

Kapitel 2 kann als Grundlagenbasis für Kapitel 3 übergeben werden, wenn mindestens folgende Punkte nachvollziehbar erfüllt sind:

- [ ] Methodisches FRZK-Grundgerüst unabhängig von Sondermathematik begrifflich exakt erarbeitet.
- [ ] Funktionen, Abhängigkeiten, Definitionsbereiche, Darstellungen, fachliche Gültigkeit und Modellgrenzen ausreichend erklärt.
- [ ] Mathematische, methodische und didaktische Grundlagen mit konkreten Quellen und exakten Prüfstatus hinterlegt.
- [ ] Bekannte Verfahren und behaupteter Zusatznutzen des FRZK differenziert gegenübergestellt, ohne unbewiesenen Neuheitsanspruch.
- [ ] Unterschiede zwischen Concept-Map/Kompendium, Aufgabenblatt, FRZK-Problemlösebogen und formaler mathematischer Erweiterung konsistent.
- [ ] Empirischer Kontext als qualitative Praxisbeobachtung bzw. Forschungsplanung korrekt ausgewiesen.
- [ ] An Kapitel 3 zu übergebende Definitionen, offene Spezialzeichen, Operatoren, Typfragen, Gültigkeitsgrenzen und Gegenbeispiele explizit aufgelistet.
- [ ] Kapitel-2-Volltext und Register (Quellen/Autoren/Zitate, Formeln, Tabellen, Abbildungen/Beschreibungen) mit DB-Prüfgates nachvollziehbar importiert.
- [ ] Offene Originalstellen, Rechte und nicht validierte Aussagen weiterhin sichtbar (`OPEN`/`WARNING`) und nicht als `PASS` ausgegeben.
- [ ] Autorenfreigabe und eine eventuell erforderliche wissenschaftliche Freigabe als **verschiedene** Ereignisse dokumentiert.

## 15. Direkt verwendbarer Startauftrag für die Arbeit an Kapitel 2

> Verfasse beziehungsweise überarbeite FRZK-Kapitel 2 als **mathematische, methodische und didaktische Grundlagen des FRZK**. Verwende Kapitel 1 (Word-Master mit SHA-256 laut Kopf dieser Übergabe) als verbindliche Ausgangsbasis und berücksichtige diese Übergabe vollständig. FRZK ist **primär ein methodischer Ansatz zur Problemstellung und Problemlösung**. Besondere Grenzwert-/Vektorsymbole sind **gesonderte mathematische Erweiterungen**, deren Formalisierung und Prüfung Kapitel 3 vorbehalten bleibt. Baue die Grundlagen systematisch, anspruchsvoll und quellengebunden auf; Kapitel 2 ist **kein eigenständiges Literaturreview**. Behalte die vereinbarte 2.0–2.10-Struktur nur bei, soweit sie zum tatsächlichen neuesten Kapitel-2-Master passt. Für jede wissenschaftliche Aussage konkrete Quellen- und Originalstellenprüfung dokumentieren; neue Quellen mit dem bestehenden Nummernregister [1]–[23] abstimmen. Generiere weder erfundene Zitate noch unbewiesene Wirksamkeits- oder Neuheitsbehauptungen. Bereite den Übergang zu Kapitel 3 und die spätere DB-Integration in `frzk_dissertation` vor. Nicht ausgeführte Prüfungen bleiben `OPEN` oder `WARNING`.

## 16. Übergabebestätigung / Einschränkung

Diese MD-Datei ist gegen das tatsächlich vorhandene Kapitel-1-DOCX und das zum gleichen Stand gehörende Importmanifest aufgebaut worden. Die Zählwerte und der Word-SHA-256-Wert wurden aus dem bereitliegenden Dateibestand überprüft. Die Ausführung des Imports auf einem fremden Datenbankserver und der aktuelle Stand des Kapitel-2-Manuskripts konnten aus den hier vorliegenden Dateien **nicht** verifiziert werden. Für Kapitel 2 ist dieses Dokument deshalb eine **verbindliche Schnittstellenbeschreibung aus Kapitel 1**, jedoch keine automatische Freigabe oder Umschreibung bestehender Kapitel-2-Dateien.

**Ende der Übergabe – Kapitel 1 → Kapitel 2.**