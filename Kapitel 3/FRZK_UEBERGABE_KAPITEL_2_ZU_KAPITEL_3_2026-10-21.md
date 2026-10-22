# FRZK – Verbindliche Übergabe von Kapitel 2 zu Kapitel 3

**Stand:** 21. Oktober 2026  
**Projekt:** Funktionales Raum-Zeit-Kohärenzsystem (FRZK)  
**Datenbank:** `frzk_rkb_32_neu` (MariaDB 10.4 / phpMyAdmin)  
**Zweck:** Reproduzierbare Übernahme des wissenschaftlichen, textlichen und technischen Bestandes von Kapitel 2 als Grundlage des eigenständigen Neuaufbaus von Kapitel 3.

> **Statusabgrenzung:** Diese Übergabe dokumentiert einen gesicherten Kapitel-2-Textbestand. Sie ist **keine Behauptung**, dass das Kapitel-2-Abschlussgate `RELEASED` erreicht hat. Insbesondere ist die Ausführung des Skripts zur Statusänderung `draft` → `review` noch nicht durch eine nachfolgende SQL-Ausgabe bestätigt. Literatur- und Autorenfreigabe sind nach letztem belegtem Gate offen.

## 1. Verbindliche Textbasis

Für Kapitel 2 gelten ausschließlich die elf in `frzk_rkb_32_neu` protokollierten Importfassungen der Abschnitte **2.0 bis 2.10** (Variante A). Frühere, eventuell längere Chatentwürfe sind **keine** wort- oder byteidentischen Ersatzquellen.

Die Texte wurden im Änderungsprotokoll `section_change_log.new_value` wiedergefunden und anschließend als jeweils **ein Snapshot pro Abschnitt** in `rkb2_ch2_section_snapshots` nachgewiesen. Die vom Nutzer übermittelte SQL-Ausgabe bestätigt in allen elf Fällen `imported_snapshots = 1` sowie `matching_hashes = 1` (Vergleich `BINARY body_sha256 = BINARY SHA2(body_text,256)`). Das belegt die Integrität **der gespeicherten Snapshots gegen ihren aktuellen Inhalt**; die endgültige redaktionelle und bibliografische Freigabe folgt daraus nicht automatisch.

| Abschnitt | Bezeichnung (verkürzte Anzeige) | Zeichen | Snapshot | SHA-256 | Letztbestätigter Status |
|---|---|---:|---:|---:|---|
| 2.0 | Gegenstand, Methode und Abgrenzung der Literaturuntersuchung | 17.918 | 1 | PASS | `draft` |
| 2.1 | Funktionale Zusammenhänge und mathematische Modellierung | 38.239 | 1 | PASS | `draft` |
| 2.2 | Mathematische Repräsentationen, Visualisierung und … | 41.552 | 1 | PASS | `draft` |
| 2.3 | Aufgabenverständnis, mathematisches Problemlösen und … | 50.661 | 1 | PASS | `draft` |
| 2.4 | Vorwissen, Begriffsbildung und mathematische Kommunikation | 55.993 | 1 | PASS | `draft` |
| 2.5 | Individuelle Lernförderung, Scaffolding und Feedback | 59.742 | 1 | PASS | `draft` |
| 2.6 | Didaktische Entwicklungsforschung und empirische Evaluation | 57.770 | 1 | PASS | `draft` |
| 2.7 | Systemtheoretische, kybernetische und erkenntnistheoretische … | 25.066 | 1 | PASS | `draft` |
| 2.8 | Raum, Zeit und Beobachtung im Kontext physikalischer … | 21.226 | 1 | PASS | `draft` |
| 2.9 | Kritische Gegenüberstellung des Forschungsstands und … | 20.955 | 1 | PASS | `draft` |
| 2.10 | Forschungslücke und Anforderungen an die mathematische … | 16.609 | 1 | PASS | `draft` |

**Gesamtumfang:** 405.731 Zeichen über elf Snapshots. Verkürzte Titel sind keine Umbenennung der Datenbanktitel. Es gelten die vollständigen Überschriften aus `dissertation_sections` und den Snapshots.

## 2. Wissenschaftlicher Übergang

Kapitel 2 bereitet die eigenständige FRZK-Modellbildung durch die Auseinandersetzung mit funktionalen Zusammenhängen, mathematischen Repräsentationen, Problemlösen, Vorwissen, Lernförderung, Entwicklungsforschung, Systemtheorie sowie Raum, Zeit und Beobachtung vor. Abschnitt 2.9 ordnet den Forschungsstand kritisch ein; **2.10 formuliert Forschungslücke und Anforderungen an die mathematische Weiterentwicklung**. Diese Anforderungen bilden den methodischen Ausgangspunkt für Kapitel 3, sind aber weder bereits der Beweis der FRZK-Axiomatik noch ein Wirksamkeitsnachweis.

**Übergangsprinzip:** Kapitel 3 muss die in Kapitel 2 herausgearbeiteten Anforderungen explizit in mathematisch überprüfbare Definitionen, Geltungsbereiche, Operationen und Konsistenzprüfungen überführen. Der mathematische und didaktische Nutzen bleibt eine zu untersuchende Behauptung und darf nicht stillschweigend als empirisch bestätigt dargestellt werden.

### Verpflichtende FRZK-Grundlagen für Kapitel 3

1. **Methodisch-didaktische Zielsetzung:** Das FRZK ist primär ein Darstellungs-, Ordnungs- und Bearbeitungsrahmen für mathematische und physikalische Aufgaben; daraus folgt nicht die Behauptung einer neuen empirisch gesicherten physikalischen Theorie.
2. **Orthogonalitätsforderung:** Das FRZK schreibt funktionalen Zusammenhängen keine allgemeine Geometrie vor. Lediglich im **Grenzzustand null** wird eine orthogonale Ausgangsorientierung verlangt. Grenzparameter, Richtungen und Skalarprodukt/Orthogonalitätsbegriff sind ausdrücklich zu definieren.
3. **Symbolische Werte:** `∞₊^FRZK`, `∞₋^FRZK`, `0₊^FRZK`, `0₋^FRZK` werden als eigenständig definierte FRZK-Symbole behandelt. Ihre Operationen benötigen festgelegte Definitionsbereiche und sind nicht ohne Beweis identisch mit gewöhnlicher reeller Arithmetik oder den erweiterten reellen Zahlen.
4. **Orientierter Nullvektor:** Das Multiplizieren eines von null verschiedenen Vektors mit dem FRZK-Nullwert bewahrt im erweiterten FRZK-Zustand Orientierungsinformation. Diese Konstruktion ist explizit vom **klassischen Nullvektor** zu unterscheiden, der keine Richtung besitzt. Eine spätere Rekonstruktion durch erneute Skalierung benötigt eigene Regeln und kann nicht als gewöhnliches Vektorraumaxiom ausgegeben werden.
5. **Kohärenz, Rekursion, Fixpunkt und zulässige Abbildungen:** Diese Begriffe sind als Kandidaten für formale Modellierung zu prüfen, mit transparenten Voraussetzungen, Beispielen, Gegenbeispielen und Konsistenzbedingungen.
6. **Mathematische Redlichkeit:** Bei `∞/∞`, `0/0` oder Richtungsinformation unter Nullsetzung keine unbegrenzten Rechenversprechen. Jede algebraische Aussage gilt nur auf ihrem ausdrücklich definierten Bereich.

## 3. Literatur- und Editionsstand

- Literaturbestand für Kapitel 2: **135 Datensätze**, Zitiernummern **[15]–[149]**.
- Eindeutigkeit der Zitiernummern und bibliografische Grundfelder: in der übermittelten Gate-Tabelle **PASS**.
- **42 Datensätze ohne DOI**: INFO, ausdrücklich kein automatischer Fehler.
- DOI-Resolver-URLs und gezielte Datensätze **[90] Plomp, [94] Creswell/Plano Clark, [95] Yin, [117] Giere, [139] Lee**: entsprechende Metadaten-Gates **PASS**; die bibliografische Originalstellenprüfung ist damit nicht automatisch abgeschlossen.
- Gate `15_SOURCE_VERIFICATION_135`: beim letzten tatsächlich übermittelten Gate **0/135 `verified` = FAIL**. Eine Massenumstellung auf `verified` ohne Quellen-/Aussagenprüfung ist untersagt.
- Bereits vorhandene Zuordnungen und Quellen-IDs dürfen beim Aufbau von Kapitel 3 nicht stillschweigend neu nummeriert oder überschrieben werden. Neue Literatur erhält die nächste zulässige Nummer gemäß Datenbankkonvention; konkrete Nummern erst nach Bestandsprüfung festlegen.

## 4. Technischer Kapitel-2-Stand und bekannte Gates

### Nachgewiesene PASS-Befunde

- `01_CH2_ROOT` bis `04_SECTION_HIERARCHY`: Kapitelwurzel, elf Abschnitte, Lückenfreiheit und Hierarchie.
- `10_SOURCES_135`, `11_CITATION_UNIQUE`, `12_CITATION_CORE_COMPLETE`.
- `14_DOI_RESOLVER_LINKS`, `16_FIVE_EDITION_RECORDS`, `17_PLOMP_PAGES`.
- `18_EQUATIONS_RENDER_AND_WORD` berichtete **0 mangelhafte registrierte Gleichungen**. Achtung: Ein solcher Nullbefund belegt für sich **nicht**, dass alle Gleichungen überhaupt registriert sind.
- Nach dem vorherigen Gate wurden **11/11 Snapshots mit passenden Hashes** direkt durch SQL-Ausgabe belegt.

### Zuletzt offen bzw. nach neuer Sicherung neu zu prüfen

- `05_ALL_FINAL_STATUS`: zuvor **0/12** (Kapitelwurzel plus elf Abschnitte); nicht freigegeben.
- `06–09`: ältere Gate-Fassung erwartete nicht existente Tabelle `section_versions`, obwohl der anschließende Snapshotspeicher nun belegt ist. **Diese Gates sind an `rkb2_ch2_section_snapshots` anzupassen** statt blind eine neue Tabelle als endgültige Textbasis anzunehmen.
- `15_SOURCE_VERIFICATION_135`: **FAIL**.
- `19_AUTHOR_APPROVAL`: **FAIL**, keine belegte Autorenfreigabe.
- `20_OVERALL`: **BLOCKED** im letzten vorliegenden umfassenden Abschlussgate.
- Skript zum Übergang `draft` → `review` wurde bereitgestellt; **Ausführungserfolg nicht bestätigt**. Diese Übergabe setzt daher den Status nicht als erfolgt voraus.

### Relevante Tabellen

`dissertation_sections` (Gliederung/Status), `section_change_log` (Import-/Änderungsprotokoll), `rkb2_ch2_section_snapshots` (Text/Hash), `sources` (Quellen), `rkb2_ch2_source_review` und `rkb2_ch2_claim_review` (Prüfung), `repository_revisions` und `repository_validation_results` (Revision/Gates), `rkb2_ch2_gate_results_20261021` (Gate-Bericht). Kapitel-1-Daten unter `rkb1_ch1_*` bleiben unberührt.

## 5. Arbeitsregeln für den eigenständigen Neuaufbau von Kapitel 3

- **Ich-Form**, wissenschaftlicher zusammenhängender Fließtext. Keine Verweise auf ältere Entwürfe, frühere Fassungen oder deren Überarbeitungen innerhalb des neu formulierten Dissertationstextes.
- **Jeder vollständige Abschnitt unmittelbar im Chat**, nicht nur als Datei oder Ausschnitt. DOCX nur auf ausdrücklichen Auftrag.
- **Externe wissenschaftliche Literaturrecherche** vor belasteten fachlichen Aussagen. Quellen sauber auf Originalaussage, Ausgabe und Seitenstelle zurückführen. Ein Metadaten-Datensatz ersetzt keine überprüfte Quellenstelle.
- **Zitierstil** der Dissertation: `{[genaue quellenangabe]}[[literaturnummer]]`; erste Nennung mit ausführlicher Angabe gemäß Projektregel, Folgebelege mit zugehöriger Nummer.
- **Formeln visuell mathematisch gesetzt**, nicht nur roher LaTeX-Quelltext. Zu **jeder** Formel eine unmittelbar zugehörige separate Zeile `Word-LaTeX: ...`; auch abgesetzte Formeln zusätzlich im erklärenden Fließtext aufgreifen. Word-kompatible Schreibweise prüfen.
- Die symbolischen FRZK-Grenzwerte mit tiefgestelltem Vorzeichen und hochgestelltem `FRZK` setzen, z. B. `\infty_{+}^{\mathrm{FRZK}}` im Word-LaTeX-Quelltext.
- Keine unbelegten physikalischen Vorhersagen oder empirischen Wirksamkeitsversprechen; didaktische Hypothesen als zu prüfende Hypothesen kennzeichnen.
- Pro Abschnitt Definitionen, Voraussetzungen, Geltungsgrenzen, Beleglage und Status vor Finalisierung nachvollziehbar halten.

## 6. Empfohlene Reihenfolge bei Kapitel 3

**A.** Die mathematisch-didaktischen Anforderungen aus 2.10 extrahieren und als überprüfbare Kriterien führen; keine ungesicherten Schlussfolgerungen übernehmen.  
**B.** Grundobjekte, Nullgrenzzustand, Orthogonalitätsbegriff und erlaubte Strukturen definieren.  
**C.** Symbolische Werte ±∞/±0 und den orientierten Nullzustand mitsamt Operationen, Einschränkungen und klassischen Gegenbegriffen formalisieren.  
**D.** Konsistenz, Rekursions-/Fixpunktideen, strukturtreue Abbildungen und die Trennung von Modellbehauptung und empirischer Prüfung entwickeln.  
**E.** Jeden Abschnitt anhand aktueller wissenschaftlicher Literatur, registrierter Formeln und versionierter Textbestände prüfen.

Diese Reihenfolge ist eine **Arbeitsvorschau**, keine Behauptung, dass Kapitel 3 bereits ein bestimmtes fertiges Inhaltsverzeichnis oder einen bestandenen Abschlussstatus besitzt.

## 7. Unmittelbare SQL-Kontrollen vor Kapitel-3-Beginn

```sql
USE `frzk_rkb_32_neu`;

-- 11 Text-Snapshots, keine Änderung:
SELECT s.section_code, s.status,
       COUNT(ss.snapshot_id) AS snapshots,
       SUM(IF(ss.snapshot_id IS NOT NULL
         AND BINARY ss.body_sha256 = BINARY SHA2(ss.body_text,256),1,0)) AS hash_pass,
       MAX(CHAR_LENGTH(ss.body_text)) AS textlaenge
FROM dissertation_sections s
LEFT JOIN rkb2_ch2_section_snapshots ss ON ss.section_code=s.section_code
WHERE s.section_code REGEXP '^2\\.(0|[1-9]|10)$'
GROUP BY s.section_id,s.section_code,s.status
ORDER BY s.section_order;

-- Letzte Gate-Befunde:
SELECT gate_name, result, actual_value, expected_value
FROM rkb2_ch2_gate_results_20261021 ORDER BY gate_name;

-- Editionsbezogene Literaturpruefung:
SELECT citation_number, title, year_edition, edition, isbn, doi,
       verification_status
FROM sources WHERE citation_number IN (90,94,95,117,139)
ORDER BY citation_number;
```

**Keine dieser Abfragen verändert Daten.** Vor späteren produktiven Änderungen stets Backup/Revision und eine transaktionssichere Vorzustandsprüfung vorsehen. Die Statusänderung von `review` nach `final` und die Freigabe `CH2_FINAL_GATE = RELEASED` erfordern eigene, nachgewiesene Gates und Autorentscheidung.

## 8. Übergabebeschluss

**Kapitel 2 wird als vollständiger, snapshotgesicherter Arbeitsbestand an den Neuaufbau von Kapitel 3 übergeben.** Die mathematische Fortführung kann auf seiner wissenschaftlichen Fragestellung und auf Abschnitt 2.10 aufbauen, ohne noch offene Kapitel-2-Freigaben zu verschweigen. **Die Kapitel-2-Abschlussfreigabe bleibt bis zum erfolgreichen Literatur-/Claimcheck, den angepassten Text-Gates und der dokumentierten Autorenfreigabe offen.**
