# FRZK – Verbindliche Arbeitsübergabe von Kapitel 3 zu Kapitel 4

**Projekt:** Funktionales Raum-Zeit-Kohärenzsystem (FRZK)  
**Stand der Übergabe:** 23. Oktober 2026  
**Quellkapitel:** Kapitel 3, Abschnitte **3.0–3.21**  
**Zielkapitel:** Kapitel 4 – **Methodische und didaktische Umsetzung des Funktionalen Raum-Zeit-Kohärenzsystems**  
**Datenbank:** `frzk_rkb_32_neu` (MariaDB/phpMyAdmin)  
**Zweck:** Fachlich, editorisch und technisch reproduzierbarer Arbeitsübergang von der mathematisch-axiomatischen Entwicklung zur Konzeption didaktischer Anwendungen und ihrer überprüfbaren Hypothesen.  
**Status:** **ARBEITSÜBERGABE – KEINE WISSENSCHAFTLICHE FINAL-FREIGABE.**

> **Wichtige Statusentscheidung:** Die 22 einzelnen Kapitel-3-DOCX-Dateien sind im bereitgestellten Arbeitsbestand vorhanden. Daraus folgt **nicht**, dass alle Importe in der lokalen MariaDB erfolgreich ausgeführt wurden, die Gleichungen und Abbildungen kapitelweit lückenfrei registriert sind, sämtliche Beweise unabhängig geprüft wurden oder ein `CH3_FINAL_GATE = RELEASED` existiert. Die SQL-Gesamtprüfung mit **Skript 58** steht nach dem zuletzt belegten Stand noch aus. Für Kapitel 4 darf mit der geprüften *Arbeitsgrundlage* begonnen werden; auf den Status „wissenschaftlich bewiesen“, „empirisch bestätigt“ oder „final freigegeben“ darf nur mit tatsächlichem Nachweis verwiesen werden.

---

## 1. Übertragungsbeschluss und wissenschaftliche Funktion

Kapitel 3 stellt einen formal-mathematischen Darstellungs- und Ordnungsrahmen für funktionale Zusammenhänge bereit. Es setzt sich mit gerichteten Null- und Unendlichkeitszuständen, typisierten Zuständen, partieller Arithmetik, funktionalen Grenzverläufen, richtungserhaltenden Nullzuständen von Vektoren, Ausgangsorthogonalität im Nullgrenzzustand, funktionalen Relationen, Komposition, Kohärenz, Rekursion, Fixpunkten und formaler Verträglichkeit mit klassischer Mathematik auseinander. In den Abschnitten 3.15–3.21 wird diese Struktur als Axiom-, Definitions-, Lemma-, Propositionen-, Satz- und Gegenbeispielprogramm vertieft.

**Kapitel 4 hat einen anderen Gegenstand:** Nicht eine neue Physik oder eine erneute Axiomatik, sondern die methodische Übersetzung dieses formalen Rahmens in nachvollziehbare **mathematische und physikalische Aufgabenbearbeitung, Visualisierung, Unterrichtskonzepte, Arbeitsmaterialien, Lernhandlungen und empirisch prüfbare didaktische Hypothesen**. Kapitel 4 entwickelt Verfahren; eine nachgeordnete empirische Studie überprüft mögliche Lernwirkungen. Die formale Zulässigkeit einer Darstellung ist nicht gleichbedeutend mit ihrem nachgewiesenen didaktischen Nutzen.

**Übertragungsprinzip:** Jede didaktische Anwendung muss die (a) benutzte FRZK-Definition, (b) deren Definitions- und Geltungsbereich, (c) die zugehörige klassische mathematische Aussage, (d) die zusätzliche Visualisierungs-/Deutungsebene, (e) mögliche Fehlvorstellungen und (f) das noch offene Evaluationskriterium ausdrücklich identifizierbar halten.

## 2. Verifizierbarer Textbestand des Quellkapitels

Für die Arbeitsübergabe werden die **22 tatsächlich vorliegenden DOCX-Einzeldateien** als greifbarer Textbestand behandelt. Die exakten Datenbank-Importtexte und die DOCX-Dateien sind möglicherweise nicht byteidentisch; für SQL-Integritätsfragen sind die jeweils registrierten Manuskripte in `section_change_log` beziehungsweise die ausgeführten Importskripte maßgeblich. Für künftige wortgetreue Reproduktion muss deshalb ausdrücklich angegeben werden, **welcher Stand** – DOCX oder Datenbank-Snapshot – gemeint ist.

| Abschnitt | Verbindlicher Abschnittstitel im DOCX-Arbeitsbestand | Fachlicher Übergabekern |
|---|---|---|
| 3.0 | Mathematische Grundlegung und formale Architektur des Funktionalen Raum-Zeit-Kohärenzsystems | Aufgabe, Sprache und Formalisierung |
| 3.1 | Klassischer mathematischer Kern und FRZK-Erweiterungsprinzip | Unterscheidung Standardmathematik/FRZK-spezifische Setzungen |
| 3.2 | Zustände, Typen, Projektionen und Informationsgehalt | Typen, Zustandsdaten, Projektion und Informationsverlust |
| 3.3 | Gerichtete Null- und Unendlichkeitszustände | `0₊`, `0₋`, `∞₊`, `∞₋` als ausdrücklich definierte FRZK-Symbole |
| 3.4 | Partielle FRZK-Arithmetik und Gültigkeitsbereiche | Rechenregeln nur auf ausgewiesenen Definitionsbereichen |
| 3.5 | Grenzprozesse, Herkunftsinformation und kontextabhängige Auswertung | Weg-/Funktionsabhängigkeit, besonders bei Quotienten |
| 3.6 | Vektoren und der orientierte FRZK-Nullzustand | Speicherung der Orientierung als erweiterter Zustand |
| 3.7 | Orthogonale Ausgangsorientierung im Grenzzustand null | Orthogonalität ausschließlich unter definierten Nullgrenzbedingungen |
| 3.8 | Funktionale Beziehungen und typisiertes Beziehungsnetz | Explizite funktionale Beziehungsstruktur |
| 3.9 | Komposition und Kohärenz | Kompositions- und Kohärenzbedingungen |
| 3.10 | Rekursion und Fixpunkte als besondere Strukturen | Modellabhängige Rekursion/Fixpunktbetrachtung |
| 3.11 | Verträglichkeit mit etablierter Mathematik | Einbettung, Projektion, klassische Referenzfälle |
| 3.12 | Konsistenz-, Grenz- und Gegenbeispielprüfung | Kontrollierte Gegenbeispiele und Gültigkeitsgrenzen |
| 3.13 | Mathematische Beispiele und didaktische Lesbarkeit | Erste Aufgaben-/Repräsentationsbeispiele, noch keine Lernwirkungsbelege |
| 3.14 | Ergebnis, Geltungsbereich und Übergang zur Anwendung | Zwischenbilanz; Übergang zur formalen Vertiefung |
| 3.15 | Axiomatische Systematisierung und Definitionsregister | Klassifikation formaler Aussagearten |
| 3.16 | Lemmata zu gerichteten Null- und Unendlichkeitszuständen | Beweise und Bedingungen gerichteter Symbolauswertung |
| 3.17 | Propositionen zur partiellen FRZK-Arithmetik | Teiloperationen, Kontextbindung, Gegenbeispiele |
| 3.18 | Sätze zum orientierten Nullvektor und Orientierungserhalt | Eigenständige Nullsetzungsoperation, keine gewöhnliche Skalarmultiplikation |
| 3.19 | Funktionale Beziehungen, Orthogonalität und Kohärenz | Bedingungen, Komposition, Gegenmodelle |
| 3.20 | Konsistenz, Modellkonstruktionen und Gegenbeweise | Relative Erfüllbarkeit einzelner Teiltheorien, keine globale Konsistenzfreigabe |
| 3.21 | Axiomatisches Gesamtsystem und Abhängigkeitsstruktur | Register, Abhängigkeitsgraph und offene Freigabebedingungen |

**Besonderheit:** Abschnitt 3.14 bleibt eine sachliche Zwischenbilanz; den endgültigen strukturellen Kapitelabschluss bildet nach der Erweiterung Abschnitt **3.21**. Ein erneuter Abschluss von Kapitel 3 ist nicht durch redaktionelles Umnummerieren zu behaupten.

## 3. Kontinuierliche Nummerierung und wissenschaftliche Artefakte

Der vorgesehene und in den abschnittsweisen Ergebnissen fortgeschriebene Gleichungsnummernraum reicht von **(3.1) bis (3.284)**. Der Abbildungsnummernraum reicht von **3.1 bis 3.63**. Das bedeutet **Sollbereiche**, nicht den Nachweis kapitelweiter Lückenfreiheit. Das unabhängige, lesende Gate muss tatsächlich ausgeführt und seine Ergebnismengen geprüft werden.

Die letzten tatsächlich dokumentierten Abschnittsbereiche sind:

| Abschnitt | Gleichungen | Abbildungen | Status der Einzeldatei |
|---|---|---|---|
| 3.11 | 3.132–3.145 | 3.31–3.33 | DOCX vorhanden |
| 3.12 | 3.146–3.160 | 3.34–3.36 | DOCX vorhanden; zugehöriges Audit wurde in einer Nutzer-Ausgabe als technisch bestanden belegt |
| 3.13 | 3.161–3.172 | 3.37–3.39 | DOCX vorhanden |
| 3.14 | 3.173–3.182 | 3.40–3.42 | DOCX vorhanden |
| 3.15 | 3.183–3.192 | 3.43–3.45 | DOCX vorhanden |
| 3.16 | 3.193–3.206 | 3.46–3.48 | DOCX vorhanden |
| 3.17 | 3.207–3.220 | 3.49–3.51 | DOCX vorhanden |
| 3.18 | 3.221–3.235 | 3.52–3.54 | DOCX vorhanden |
| 3.19 | 3.236–3.252 | 3.55–3.57 | DOCX vorhanden; Import-Kollationsfehler wurde mit einer korrigierten Skriptfassung adressiert |
| 3.20 | 3.253–3.268 | 3.58–3.60 | DOCX vorhanden; SQL-Textliteralfehler wurde mit einer korrigierten Skriptfassung adressiert |
| 3.21 | 3.269–3.284 | 3.61–3.63 | DOCX vorhanden; Import/Audit wurden zur Ausführung bereitgestellt |

Für Kapitel 4 beginnt eine **eigene** Nummerierung: Gleichungen **(4.1)** aufwärts, Abbildungen **4.1** aufwärts und bei Bedarf Tabellen **4.T1** aufwärts. Nummern aus Kapitel 3 dürfen nicht für neue didaktische Ableitungen recycelt werden.

## 4. Fachliche FRZK-Kernfestlegungen, die Kapitel 4 unverändert respektieren muss

### 4.1 Methodisch-didaktischer Status des FRZK

Das FRZK ist in dieser Dissertation in erster Linie ein **methodisch-didaktischer Modellierungs-, Darstellungs- und Ordnungsrahmen**, mit dem Variablen, funktionale Beziehungen, Grenzverläufe, Annahmen und Lösungswege ausdrücklich sichtbar gemacht werden sollen. **Keine neue empirisch bestätigte physikalische Theorie** ist daraus abzuleiten. Fachliche Lernvorteile werden als **Hypothesen**, nicht als Ergebnisse von Kapitel 3 behandelt.

### 4.2 Gerichtete symbolische Werte

Im FRZK werden die vier symbolischen Werte mit **tiefgestelltem Vorzeichen am Grundsymbol und hochgestelltem `FRZK`** bezeichnet:

- `0_{+}^{\mathrm{FRZK}}` – gerichteter positiver Nullzustand;
- `0_{-}^{\mathrm{FRZK}}` – gerichteter negativer Nullzustand;
- `\infty_{+}^{\mathrm{FRZK}}` – positiver Unendlichkeitszustand;
- `\infty_{-}^{\mathrm{FRZK}}` – negativer Unendlichkeitszustand.

Die Symbole sind **keine vier zusätzlichen gewöhnlichen reellen Zahlen**. In Unterrichtsmaterialien muss zwischen der **klassischen** Interpretation `x → 0⁺`, `x → 0⁻`, `x → +∞`, `x → −∞` und der **FRZK-spezifischen Zustands-/Orientierungscodierung** unterschieden werden. Eine Projektion auf klassische Grenzwerte kann FRZK-Herkunfts- oder Richtungsinformation verlieren.

### 4.3 Gültigkeitsbereich von Operationen

FRZK-Operationen sind partiell, typisiert und nötigenfalls durch Funktionskontext qualifiziert. Insbesondere führen die bloßen symbolischen Formen `0/0` und `∞/∞` **nicht** zu einem eindeutigen numerischen Ergebnis. Verschiedene Quotienten können trotz gleicher nomineller Symbolkonstellation andere Grenzwerte besitzen. Didaktische Materialien dürfen keine pauschalen, außerhalb ihres definierten Bereichs gültig erscheinenden Rechentafeln als allgemeine Arithmetik präsentieren. Dasselbe gilt für Rekursion, Komposition und Fixpunkte: Annahmen, Existenzbedingungen und Geltungsgrenzen bleiben sichtbar.

### 4.4 Orientierter FRZK-Nullvektor

Die **FRZK-Nullsetzung** eines ursprünglich von null verschiedenen Vektors bewahrt die Orientierungsinformation in einem **erweiterten, typisierten Nullzustand**. Dieser Zustand ist **nicht identisch mit dem klassischen Nullvektor**. Eine positive spätere Rückskalierung kann die gespeicherte Orientierung wieder nutzbar machen, während die ursprüngliche **Länge** ohne zusätzliche Daten nicht rekonstruierbar ist. Eine negative Rückskalierung und das Nullsetzen eines bereits klassischen Nullvektors benötigen eigens festgelegte Konventionen. **Keinesfalls** darf daraus die klassische Vektorraumregel `0 · v = 0` mit gespeichertem Richtungsanteil uminterpretiert werden. Anschaulich kann die Blickrichtung eines virtuellen Beobachters bei auf null reduzierter Sichtweite erhalten bleiben; dieses Beispiel ersetzt keinen mathematischen Beweis.

### 4.5 Orthogonale Ausgangsorientierung ausschließlich im Nullgrenzzustand

Das FRZK schreibt **keine globale Orthogonalität aller Achsen und keine allgemeine Geometrie** vor. Die orthogonale Ausgangsorientierung wird **nur im definierten Grenzzustand null** verlangt. Für mathematische und digitale Abbildungen müssen Grenzparameter, Ausgangsrichtungen, zugrunde gelegtes Skalarprodukt/Orthogonalitätskriterium und der Geltungsbereich benannt werden. Außerhalb dieses Grenzfalls dürfen Geometrie und Koordinatenrepräsentation funktional frei entstehen.

### 4.6 Funktionale Beziehungen und Kohärenz

Kohärenz ist nicht gleichbedeutend mit Stabilität, Korrelation, geometrischem Abstand oder Symmetrie. Kapitel 4 soll eine klar definierte **Beziehungsstruktur** und die betrachtete **Transformation** angeben, bevor von Kohärenzerhaltung gesprochen wird. Bloße Identitätserhaltung ist gegenüber nichttrivialer Strukturtreue unter Veränderung zu unterscheiden. Aus einer gerichteten Relation folgt **nicht automatisch** eine zeitliche, kausale oder physikalische Entwicklung.

### 4.7 Zwei Ebenen der Axiomatik

Das hochgeladene umfangreiche axiomatische Grundlagenmanuskript und die neu ausgearbeiteten Abschnitte 3.15–3.21 begründen eine **formale Prüfaufgabe**, nicht die automatische Gültigkeit jeder historischen Aussage. Zu unterscheiden sind (i) minimaler relationaler Kern, (ii) ergänzende FRZK-Zustands-/Rechenmodule, (iii) abgeleitete Ergebnisse, (iv) zusätzliche Modellbedingungen und (v) didaktische Interpretation. Ein Satz besitzt nur bei vollständig ausgewiesenen Voraussetzungen und geprüftem Beweis den Status „mathematisch verifiziert“. In Kapitel 4 können formale Aussagen zur Illustration verwendet werden, aber mit präzise genanntem Beweis- bzw. Prüfstatus.

## 5. Didaktische Transfermatrix: Formale Begriffe zu Unterrichtshandlungen

| FRZK-Objekt/Prinzip | Klassischer mathematischer Bezug | Didaktisch zulässige Umsetzung in Kapitel 4 | Prüfkriterium/typische Fehlvorstellung |
|---|---|---|---|
| `0₊^FRZK`, `0₋^FRZK` | Einseitige Grenzwerte | Einseitige Annäherung farb-/pfeilcodiert markieren; klassische Schreibweise stets mitführen | Unterscheidet Lernende Richtung der Annäherung von positivem/negativem Funktionswert? |
| `∞₊^FRZK`, `∞₋^FRZK` | Uneigentliches Wachstum/Divergenz | Asymptoten- und Vorzeichenanalyse mit explizitem Definitionsintervall | Verwechslung von „unendlich“ mit gewöhnlicher Zahl |
| Partielle Arithmetik | Grenzwertsätze, Definitionsbereich, Unbestimmtheiten | Entscheidungsbaum „zulässig / Kontext nötig / undefiniert“ | Unzulässige Algebra bei `0/0`, `∞/∞` |
| Herkunftsinformation | Funktionskontext einer Grenzwertoperation | Originalfunktion und Annäherungspfad neben dem symbolischen Zustand dokumentieren | Falscher Schluss aus gleichen Eingangssymbolen auf gleiche Ergebnisse |
| Orientierter FRZK-Nullzustand | Klassischer Vektorraum vs. erweiterter Zustand | Interaktive Richtungsanzeige mit Nullsetzungs-/Rückskalierungsoperation | Verwechslung von klassischem Nullvektor und gespeicherter Richtung |
| Ausgangsorthogonalität | Skalarprodukt / Winkel | Nur Grenzzustand mit orthogonalen Ausgangsrichtungen darstellen | Fälschliche globale Orthogonalitätsannahme |
| Relation und Kohärenz | Relationen, Abbildungen, Strukturtreue | Knoten-/Pfeildiagramm mit expliziter Transformation und Vergleich vor/nach | Relationen mit Kausalität oder Kohärenz mit Stabilität gleichsetzen |
| Komposition, Rekursion, Fixpunkte | Verkettung, Iteration, Fixpunktsätze | Schrittfolge, Voraussetzungen und Abbruch-/Existenzbedingungen sichtbar machen | Aus Iterierbarkeit vorschnell Konvergenz schließen |
| Repräsentationswechsel | Algebraische, grafische, tabellarische und verbale Darstellung | Darstellungen bidirektional übersetzen und Fehler aufdecken | Unterschiedliche Darstellungen für verschiedene mathematische Aussagen halten |
| Axiome/Lemmata/Sätze | Begründung, Beweis und Modellbeispiele | Lernende markieren Definition/Voraussetzung/Behauptung/Beweis/Gegenbeispiel | Behauptungen als bewiesen ausgeben |

**Didaktische Grundentscheidung:** Der Transfer wird **nicht allein durch Symbole und Darstellungsbilder** begründet. Jedes Verfahren muss angeben, welche Lernhandlung unterstützt und wie ein möglicher zusätzlicher Nutzen gegenüber einer sorgfältigen klassischen Darstellung erkannt werden könnte.

## 6. Verbindlicher Arbeitsplan für Kapitel 4 (13 Abschnitte plus Einleitung)

Die folgende Gliederung ist der aktuell vorgeschlagene, **noch nicht separat durch eine Datenbankrevision bestätigte** Arbeitsplan. Kapitel 4 enthält die Abschnitte **4.0–4.13** (14 Abschnitte einschließlich Einleitung).

| Abschnitt | Vorgesehener Titel | Primäres Arbeitsergebnis |
|---|---|---|
| **4.0** | Einleitung, Zielsetzung und Abgrenzung | Fragestellung, Anwendungsniveau, Abgrenzung von Theorie und Empirie |
| **4.1** | Übertragung der mathematischen FRZK-Grundlagen auf didaktische Modelle | Didaktische Modellierungsregeln, Status- und Geltungszuordnung |
| **4.2** | Funktionale Darstellung mathematischer Zusammenhänge | Einheitliches Schema: Daten, Variablen, Beziehungen, Ziel, Lösung, Prüfung |
| **4.3** | Gerichtete Null- und Unendlichkeitszustände im Mathematikunterricht | Unterrichts- und Aufgabenbeispiele zu einseitigen Grenzwerten/Asymptotik |
| **4.4** | Der orientierte Nullvektor als didaktisches Darstellungsinstrument | Vektor-/Orientierungsaufgaben und digitale Visualisierungen |
| **4.5** | Funktionale Beziehungen, Kohärenz und mathematisches Verständnis | Netzwerk- und Strukturtreuemodelle, Fehlerdiagnostik |
| **4.6** | Visualisierung und Wechsel zwischen mathematischen Repräsentationen | Koordination grafischer, algebraischer, verbaler und tabellarischer Formen |
| **4.7** | Entwicklung systematischer FRZK-Lösungsverfahren | Explizite Schrittalgorithmen und Gültigkeitskontrollen |
| **4.8** | Anwendung auf ausgewählte mathematische Aufgabenklassen | Ausführliche Beispielaufgaben, Musterlösungen, klassische Vergleichswege |
| **4.9** | Anwendung auf ausgewählte physikalische Aufgabenklassen | Physikalische Modellierungsbeispiele ohne neue Physikbehauptung |
| **4.10** | Didaktische Hypothesen und erwartete Lernwirkungen | Falsifizierbare Hypothesen, Ergebnisvariablen, mögliche Störfaktoren |
| **4.11** | Entwicklung von Unterrichtsmaterialien und digitalen Werkzeugen | Arbeitsblätter, Simulationen, Interaktions- und Beobachtungsprotokolle |
| **4.12** | Methodische Grenzen und mögliche Fehlvorstellungen | Risiken, Grenzfälle, Gegenbeispiele, Alternativeinführungen |
| **4.13** | Zusammenfassung und Übergang zur empirischen Untersuchung | Nachvollziehbarer Übergang zu Kapitel 5 |

### Arbeitsauftrag für jeden einzelnen Abschnitt 4.n

Inhaltlich muss jeder Abschnitt (1) sein didaktisches Problem präzisieren, (2) einen aus Kapitel 3 definierten FRZK-Begriff mit dessen Geltungsbereich benennen, (3) die klassische Referenzmethode fair und korrekt erläutern, (4) eine nachvollziehbare FRZK-Repräsentation oder ein Verfahren **vollständig** ausführen, (5) Beispiele und problematische Grenzfälle analysieren, (6) die didaktische Behauptung als Hypothese kenntlich machen, (7) geeignete empirische Kriterien formulieren und (8) durch belastbare wissenschaftliche Literatur eingeordnet werden.

**Wissenschaftliche Reichweite:** Kapitel 4 liefert eine entwickelte und begründete Methode. Es soll keine erfundenen Kontrollgruppenergebnisse, Fehlerraten, Effektstärken oder Unterrichtsbeobachtungen berichten.

## 7. Besonders geeignete Anwendungsszenarien

### 7.1 Einseitige Grenzwerte und die h-Methode

Der FRZK-Unterschied zwischen gerichteten positiven und negativen Nullzuständen eignet sich als didaktische Repräsentation für **`h → 0⁺` und `h → 0⁻`**. Vergleichsaufgaben könnten identische Funktionen (a) mit klassischer Grenzwertnotation, (b) mit FRZK-gestützter Orientierung und (c) mit kombinierten Darstellungen lösen lassen. Empirisch untersuchbar sind Fehlerart, Lösungsdauer, korrekte Vorzeichenanalyse, Verständlichkeit und Transfer auf neue Funktionen. Dies ist eine **Forschungshypothese**; aus bisherigen persönlichen Unterrichtsbeobachtungen folgt kein verallgemeinerbarer Wirksamkeitsnachweis.

### 7.2 Quotienten mit formal gleichem Symbolbild

Aufgaben mit unterschiedlich verlaufenden Funktionen demonstrieren, weshalb `0/0` kein eigenständiges Rechenergebnis und die Symbolform `∞/∞` unbestimmt ist. Die grafische Visualisierung und die algebraische Rechnung müssen dasselbe mathematische Problem repräsentieren. Bewusst kontrastierende Beispiele dienen der Fehlervorbeugung.

### 7.3 Vektorgeometrie und Orientierungsspeicherung

Ein Pfeil mit Richtung und Betrag wird vom FRZK-Zustandsübergang in einen Zustand mit **gespeicherter Orientierung** überführt. Im anschließenden Schritt kann der Richtungsvektor bei vorgegebener neuer Länge wieder verwendet werden. Dieses Modell eignet sich zur Diskussion von Richtung, Betrag, Zustand, Nullsetzung und Informationsverlust. Die klassische Aussage `0 · v = 0` wird als **weiterhin gültig** daneben geführt.

### 7.4 Funktionale Modelle in physikalischen Aufgaben

Geeignet sind unter anderem Arbeitsschritte, bei denen Voraussetzungen, Variablen, Größen, Diagramme und Grenzwerte getrennt dargestellt werden. Der Erkenntnisgewinn besteht möglicherweise in besserer Strukturierung – **nicht** in der Annahme neuer physikalischer Grundgesetze. Fachliche Ergebnisse müssen mit etablierter Schul-/Fachphysik übereinstimmen, soweit klassische Voraussetzungen gelten.

### 7.5 Digitale Visualisierung und Scaffolding

Mögliche Werkzeuge zeigen Zustandswechsel, zulässige Operationen, Definitionsbereich, graphische Entwicklung und verbale Erklärung gleichzeitig. Für Lernende müssen Eingaben, Repräsentationswechsel und Fehlerhinweise kontrollierbar sein. Das Digitale ist Mittel zur Prüfung didaktischer Funktionen, kein Selbstzweck.

## 8. Forschungshypothesen als Arbeitsbestand, keine Befunde

| Kennung | Hypothese für Kapitel 4/empirische Prüfung | Mess-/Beobachtungsvariable |
|---|---|---|
| H4.1 | Eine explizite Richtungsmarkierung verbessert die korrekte Bearbeitung einseitiger Grenzwerte gegenüber einer geeigneten Vergleichsdarstellung. | Fehlerquote nach Fehlertyp, Begründungsqualität |
| H4.2 | Die explizite Geltungsbereichsprüfung reduziert unzulässige Operationen mit unbestimmten Formen. | Anteil unzulässiger Vereinfachungen, Transferaufgaben |
| H4.3 | Die getrennte Repräsentation von Richtung und Betrag verbessert das Verständnis des Unterschieds zwischen klassischem Nullvektor und FRZK-Nullzustand. | Konzeptfragen, Fehlvorstellungsdiagnostik |
| H4.4 | Ein typisiertes Beziehungsnetz verbessert die Nachvollziehbarkeit von Annahmen, Beziehungen und Lösungswegen. | Korrektheit von Modellskizzen, Erklärungsqualität |
| H4.5 | Ein abgestimmter Repräsentationswechsel steigert das Verständnis gegenüber rein symbolischer Darstellung unter vergleichbaren Bedingungen. | Transferleistung, Erklärungsgüte, Bearbeitungszeit |
| H4.6 | Strukturierte FRZK-Lösungsschritte unterstützen die Kontrolle von Definitionsbereichen und Lösungsannahmen. | Validierung von Lösungen, metakognitive Kontrollhandlungen |

**Vorsicht:** Diese Hypothesen sind zu operationalisieren und so zu formulieren, dass konkurrierende Erklärungen (Vorwissen, Lehrerwirkung, Materiallänge, zusätzliche Übungszeit, Neuigkeitseffekt) prüfbar bleiben. Ein Vorteil darf nicht auf bloße zusätzliche Aufmerksamkeit oder längere Bearbeitungszeit zurückgeführt werden, ohne entsprechende Kontrollbedingungen zu beachten.

## 9. Literatur und Zitierregeln für Kapitel 4

Kapitel 4 muss die mathematischen Aussagen aus Kapitel 3 sowie die didaktischen Begründungen aus Kapitel 2 auseinanderhalten und beide aktuell mit wissenschaftlich belastbarer Literatur prüfen. Die Bestandsnummern sind aus der Datenbank zu übernehmen; Nummern dürfen **nicht frei neu vergeben** werden.

Bereits im bisherigen Projektkontext besonders relevante und in Einzelabschnitten genannte Quellen:

- **[32]** Duval (2006): *A Cognitive Analysis of Problems of Comprehension in a Learning of Mathematics* – mathematische Repräsentationsverarbeitung.
- **[35]** Ainsworth (2006): *DeFT: A conceptual framework for considering learning with multiple representations* – multiple Repräsentationen.
- **[72]** Axler: *Linear Algebra Done Right* – klassischer Vektorraumbezug; Ausgabe mit Datenbank abgleichen.
- **[88]** Enderton: *A Mathematical Introduction to Logic* – formale Ableitung und Semantik.
- **[142]** Enderton: *Elements of Set Theory* – Definitionen, Mengen-/Struktursprache.
- **[145]** Mac Lane: *Categories for the Working Mathematician* – Kompositions-/Identitätsstrukturen.
- **[150]** Rockafellar/Wets: *Variational Analysis* – erweiterte reelle Bereiche und Konventionen.
- **[151]** Burmeister: Literatur zu partiellen Algebren – genaue Metadaten bei Originalstellenprüfung kontrollieren.
- **[154]** Apostol: *Mathematical Analysis* – klassische Grenzwerttheorie.

**Keine dieser Nennungen ist bereits eine claimgenaue, signierte Literaturprüfung.** Der Bestand wird zur Recherche genutzt; Werkedition, Seitenstelle, tatsächlicher Geltungsanspruch und ordnungsgemäße Quellenverwendung sind separat zu validieren. Insbesondere sind die didaktischen Wirkmechanismen nicht allein durch eine allgemein einschlägige Theoriequelle bewiesen.

**Verbindlicher Zitierstil:** `{[genaue quellenangabe]}[[literaturnummer]]` bei erster relevanter Nennung; die projektspezifische Wiederholungsform nach Datenbank-/Stilregel. Keine Verweise auf ältere FRZK-Entwurfsfassungen im neu geschriebenen Dissertationstext. In einer **internen Arbeitsübergabe** dürfen Vorgängerstände zur Provenienzsicherung genannt werden.

## 10. Verbindliche Schreib- und Formatregeln

1. **Wissenschaftliche Ich-Form**, zusammenhängender, ausführlicher argumentativer Fließtext statt bloßer Listen oder Notizen im Dissertationsabschnitt.
2. **Abschnitte vollständig direkt im Chat ausgeben**; DOCX zusätzlich nur auf ausdrücklichen Wunsch. Der in der bisherigen Arbeit praktizierte DOCX-Workflow entbindet nicht von dieser stehenden Arbeitsregel für neue Kapiteltexte.
3. **Externe Deep-Research-Literaturprüfung**, vorzugsweise Originalquellen; mathematische und didaktische Behauptungen belegbar trennen.
4. **Formeln tatsächlich mathematisch gesetzt**, nicht als sichtbar ausgegebene Roh-LaTeX-Delimitersyntax. Zu jeder Gleichung eine separate, kopierbare Zeile `Word-LaTeX: ...` ergänzen; Formeln außerdem im Fließtext erläutern.
5. **FRZK-Symbole korrekt setzen:** tiefgestelltes `+`/`−` am Grundsymbol, hochgestelltes `FRZK`; Kurznotation nur nach expliziter Definition.
6. **Neue Nummerierung ab Kapitel 4:** `(4.1)`, `(4.2)`, … und Abbildung `4.1`, `4.2`, …; Gleichungsnummern in Darstellung, DOCX und Datenbank konsistent führen.
7. Zu jeder neuen Operation **Typ, Definitionsbereich, Voraussetzungen, Interpretationsbereich, Gegenfall** angeben.
8. Keine unbewiesene FRZK-Definition als klassisches Resultat ausgeben; keine didaktische Wirkung als empirisch bestätigt darstellen.
9. Grafiken müssen der mathematischen Aussage entsprechen und bei übernommenen Bildern Provenienz/Rechte nachweisbar dokumentieren; eigenständig erzeugte Grafiken im Manuskript deklarieren.
10. Reproduzierbare Materialien und Auswertungsinstrumente sichern; keine nur dekorativen Diagramme ohne fachlichen Zweck.

## 11. Datenbank, SQL-Übergabegate und bekannte technische Fehler

**Vorhandene Datenbank:** `frzk_rkb_32_neu`. Für Kapitel 3 werden unter anderem die Tabellen `dissertation_sections`, `equations`, `figures`, `sources`, `source_usage`, `authors`, `source_authors`, `repository_revisions`, `repository_validation_results` und `section_change_log` verwendet.

### Letzte geplante/erstellte Skripte

| Skript | Funktion |
|---|---|
| **56** | Import Abschnitt 3.21: Text, Gleichungen 3.269–3.284, Grafiken 3.61–3.63, fünf Quellen, Revision `RKB3-REV-321-IMPORT-2026-10-23` |
| **57** | Lesendes Audit Abschnitt 3.21 |
| **58** | **Gesamtes, ausschließlich lesendes Übergabe-Gate Kapitel 3.0–3.21** |

**Skript 58:** `RKB3_58_UEBERGABEGATE_KAPITEL_3_0_BIS_3_21.sql`. Es prüft 22 Abschnitte, Gleichungsnummern 3.1–3.284, Abbildungen 3.1–3.63, Abschnittsrevisionen, Manuskript-/DOCX-Referenzen, registrierte Literaturverwendungen und offene Validierungen. Es gibt insbesondere separate Ergebnisse für fehlende Nummern und problematische Datensätze aus. **Es ist kein Freigabeskript.**

### Aus bisheriger Ausführung bekannte SQL-Probleme

- **MySQL #1267:** unzulässige Mischung aus `utf8mb4_unicode_ci` und `utf8mb4_general_ci` bei Textvergleich; in späteren Skripten wurde ein geeigneter `BINARY`-Vergleich verwendet. Bei künftigem SQL auch auf Vergleiche in weiteren Ausdrücken und Subqueries achten; nicht blind alle Tabellenkollationen ändern.
- **MySQL #1054:** Textliterale `model`, `original`, `draft` und `diagram` waren in einem frühen 3.20-Import unquotiert und wurden als Spaltenbezeichner behandelt. In SQL alle Enum-/Status-/Provenienztexte korrekt als Literale schreiben. Eine korrigierte Skriptfassung wurde bereitgestellt; der tatsächliche Gesamterfolg ist nicht durch ein aktuelles finales Audit belegt.
- **Revisions-/Vorgängerabhängigkeit:** Zuerst Existenz, Status und passende Vorgängerrevision prüfen; keine stillschweigenden 0-Zeilen-Importe als Erfolg zählen.
- **DML-Konsistenz:** Keine Self-Read-Operation auf derselben `repository_revisions`-Zieltabelle in einem nicht unterstützten Kontext; Vorgänger-ID vor Einfügen in Variable auflösen.
- **Idempotenz/Integrität:** Nummernkollisionen, Doppelliteratur, vorhandene Revisionen und SHA-Referenzen prüfen; keine `FOREIGN_KEY_CHECKS`-Manipulationen, keine automatischen Freigaben, keine ungeprüften Massenstatusänderungen.

### Nachzuweisende Gate-Abfolge

1. Sicherstellen, dass Abschnitt 3.21 tatsächlich importiert und durch Skript 57 als vorhanden kontrolliert wurde.
2. Skript **58** auf der lokalen Datenbank ausführen und **die vollständige Ergebnisausgabe** dokumentieren.
3. Technisches Kapitel-Gate nur bei bestätigter Abschnittsvollständigkeit, lückenfreier Nummerierung, korrekter Zuordnung, Text-/Hash-Referenzintegrität und revisionsseitiger Konsistenz als bestanden behandeln.
4. Danach eigenständige **mathematische Beweisprüfung**, **Quellen-/Originalstellenprüfung**, **Rechte-/Autorenerklärung** und **ausdrückliche Autorenfreigabe** organisieren.
5. Kapitel 3 erst dann auf `final`/`RELEASED` setzen, wenn die zuständigen Gates tatsächlich positiv nachgewiesen sind.

**Letzte belastbare Gesamtaussage:** Der Übergabe-Gate-Entwurf und die Einzeldateien liegen vor; ein positives Gesamtaudit ist mit dem übermittelten Kontext **nicht** belegt. `CH3_FINAL_GATE = RELEASED` darf nicht angenommen werden.

### Technisches Startprinzip für Kapitel 4

Für Kapitel 4 eine eigenständige Abschnittswurzel `4` und die Abschnitte `4.0–4.13` **nach Datenbankschema und Vorgängerprüfung** anlegen. Revisionscodes im Stil `RKB4-REV-...` erst nach tatsächlicher Bestandsprüfung festlegen. Kapitel-3-Quellen und ihre IDs werden referenziert, nicht dupliziert. Ein neuer K4-Import soll bei Konflikten ein deutliches **BLOCK** melden und kein vermeintliches **PASS** nach 0 Einfügungen.

## 12. Offene Forschungs- und Freigabefragen

1. **Formaler Beweisstatus:** Die in 3.15–3.21 benannten Lemmata, Propositionen und Sätze benötigen einen abschnitts- und claimgenauen Korrektheitscheck; eine einzelne explizite Modellkonstruktion ist kein globaler Konsistenzbeweis.
2. **Kopplung des relationalen Kerns mit Zustandsmodulen:** Aus der beschriebenen Minimalrelation folgt nicht ohne Beweis die gesamte partielle Arithmetik, Orientierungsspeicherung oder Grenzorthogonalität. Modulkohärenz bleibt kontrollpflichtig.
3. **Axiomminimalität/Unabhängigkeit:** Die Zahl der in einem vorliegenden Manuskript benannten Primäraxiome darf nicht unbesehen für den gesamten erweitert typisierten FRZK-Formalismus übernommen werden.
4. **Mathematische Beispiele:** Für das didaktische Material müssen alle Funktionswerte, Definitionsbereiche, Grenzwege und Bildachsen überprüft werden.
5. **Originalquellen:** Editionen und Seitenstellen zu den formalen und didaktischen Aussagen verifizieren; `citation_checked = 0` nicht automatisch auf 1 ändern.
6. **Unterrichtsdesign:** Zielgruppen, Klassenstufen, Vorkenntnisse, Lernziele, Zeitumfang und Vergleichsgruppen müssen für jede Erprobung festgelegt werden; keine beliebigen Leistungsdaten erfinden.
7. **Empirische Auswertung:** Geeignete Indikatoren, Aufgabenäquivalenz, Auswertungsregeln und Ethik/Datenschutz vor Datenerhebung planen.
8. **Kapitelabschluss:** Kapitel 3 erst nach Gate-Belegen und Autorentscheidung wissenschaftlich finalisieren. Kapitel 4 kann als klar markierte anschließende *Arbeitsphase* starten.

## 13. Empfohlene unmittelbare Umsetzung von Kapitel 4

**Schritt A – Kapitel-4-Masterplan:** Die oben genannte Gliederung 4.0–4.13 als Arbeitsplan mit Quellenbedarf, Formeln, Grafiken, didaktischen Verfahren und Evaluationstransfer strukturieren.

**Schritt B – Abschnitt 4.0 vollständig schreiben:** Gegenstand, Ziel, Ebenentrennung und didaktische Forschungsfrage so präzisieren, dass die Leser zwischen formaler FRZK-Definition, mathematischer Korrektheit und empirischem Nutzen unterscheiden können.

**Schritt C – Abschnitt 4.1:** Explizite Transfermatrix `FRZK-Konstrukt → klassische Referenz → Repräsentation → Lernhandlung → typische Fehlinterpretation → Prüfhypothese` wissenschaftlich fundieren.

**Schritt D – Konkrete Prototypaufgaben:** Zunächst einseitige Grenzwerte, anschließend unbestimmte Quotientenformen und orientierte Vektorzustände; jeweils klassische und FRZK-Darstellung parallel ausarbeiten und ihre Aussagen prüfen.

**Schritt E – Empirische Anschlussfähigkeit:** Bereits beim Entwurf dokumentieren, welche Veränderungen und Lernhandlungen beobachtbar sind; abschließende Messung/Auswertung getrennt in Kapitel 5 vorsehen.

## 14. Übergabegates und Entscheidung

| Gate | Sollbedingung | Übergabestatus 23.10.2026 |
|---|---|---|
| **K3-DOCX-BESTAND** | 22 einzelne Abschnittsdateien | **Im Arbeitsbestand vorhanden** |
| **K3-DB-ABSCHNITTE** | 3.0–3.21 vollständig in Datenbank | **Gesamtaudit offen** |
| **K3-GLEICHUNGEN** | 3.1–3.284 ohne Lücken/Duplikate und mit Word-LaTeX | **Skript 58 ausführen** |
| **K3-ABBILDUNGEN** | 3.1–3.63 ohne Lücken/Duplikate, Dateireferenzen | **Skript 58 ausführen** |
| **K3-REVISIONEN** | Nachweisbare durchgehende Revisionskette | **Skript 58 ausführen** |
| **K3-LITERATUR** | Claimgenaue verifizierte Originalstellen | **Offen** |
| **K3-MATHEMATIK** | geprüfte Sätze, Modellgrenzen, Gegenbeispiele | **Offen** |
| **K3-AUTOREN** | Dokumentierte Autorenentscheidung und Rechte | **Offen** |
| **K3-FINAL** | Sämtliche notwendigen Gates PASS und explizite Freigabe | **NICHT RELEASED** |
| **K4-ARBEITSBEGINN** | Quellenbestand, Statusgrenzen und Arbeitsplan dokumentiert | **Als Arbeitsphase möglich** |

**Verbindlicher Übergabebeschluss:** Kapitel 3 (3.0–3.21) wird **als vollständig ausgearbeiteter, formal zu prüfender Arbeitsbestand** an die didaktisch-methodische Entwicklung in Kapitel 4 übergeben. Der Transfer umfasst ausdrücklich sämtliche FRZK-Geltungsgrenzen und die unabhängige Fortführung offener Beweis-, Literatur- und Datenbankprüfungen. **Es erfolgt keine stillschweigende FINAL-Freigabe.**

---

## 15. Kurzanweisung für die Wiederaufnahme in einem neuen Chat oder Projekt

> **Arbeitsauftrag:** Setze das FRZK-Dissertationsprojekt ab Kapitel 4 fort. Grundlage ist die Übergabedatei `FRZK_UEBERGABE_KAPITEL_3_ZU_KAPITEL_4_2026-10-23.md` mit dem Arbeitsbestand von Kapitel 3.0–3.21, den Gleichungsnummern 3.1–3.284 und den Abbildungen 3.1–3.63. Kapitel 3 ist mathematisch und bibliografisch noch nicht final freigegeben; das lesende Datenbank-Gesamtaudit Skript 58 steht nach letztem belegtem Stand aus. Beginne mit Kapitel 4.0 – Einleitung, Zielsetzung und Abgrenzung. Behalte Ich-Form, vollständige Ausarbeitung direkt im Chat, wissenschaftliche Literaturrecherche, projektspezifisches Zitierformat, mathematisch gesetzte Formeln mit zusätzlicher Word-LaTeX-Zeile sowie strikte Trennung von klassischer Mathematik, FRZK-spezifischen Definitionen und empirisch zu prüfenden didaktischen Hypothesen bei. Neue Gleichungen beginnen bei (4.1), neue Abbildungen bei 4.1. Keine Aussagen über FINAL-/RELEASED-Status ohne bestandene Gates.

**Ende der Arbeitsübergabe 3 → 4.**
