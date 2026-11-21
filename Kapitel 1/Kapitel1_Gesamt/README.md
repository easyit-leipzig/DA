# FRZK Kapitel 1 – Gesamtimport 09.11.2026

Master: FRZK_Kapitel1_Iterativer_Erkenntnisprozess_2026-11-09.docx
SHA-256: `a3fcd99db815be9750523202c88b61d89f19d178625da4b72e1238e045c57cd8`

## Inhalt

- `FRZK_Kapitel1_Gesamtimport_2026-11-09.sql`: ein vollständiger Kapitel-1-Import, keine separaten SQL-Patches erforderlich.
- `frzk_dissertation_schema_empty.sql`: DDL für eine noch nicht vorhandene Datenbank.
- `FRZK_Kapitel1_Iterativer_Erkenntnisprozess_2026-11-09.docx`: maßgebliche aktuelle Autorenfassung.
- `assets/...`: 16 Abbildungen einschließlich der sieben Bilder von Anlage 1A.2.

## Installation

1. Datenbank sichern.
2. Nur bei fehlenden Tabellen zuerst das beigefügte Schema ausführen (ACHTUNG: die Schema-Datei enthält CREATEs und Views; vorhandene DB vorher sichern).
3. Einmal `FRZK_Kapitel1_Gesamtimport_2026-11-09.sql` im SQL-Reiter von phpMyAdmin für die Datenbank `frzk_dissertation` importieren.
4. Bilddateien nach den unter `figure_assets.relative_path` angegebenen relativen Pfaden auf dem Dateiserver ablegen.
5. Die Kontrollabfragen am Ende des SQL-Imports auswerten: 16 Abbildungen insgesamt, vier Hauptabbildungen 1.F1–1.F4, fünf in Anlage 1A, sieben in Anlage 1A.2.

## Wissenschaftlicher Status

Autorenfassung abgeschlossen; originale Quellenstellen, grafische Nutzungsrechte und empirische Nachweise bleiben dort offen, wo sie nicht unabhängig geprüft sind. Eine Validierung der Iterationsmethode wird nicht behauptet.

## Importtechnik

MySQL 8 / MariaDB 10.6+; utf8mb4. Selbstreferenzierende Vorab-Prüfungen wurden bei INSERTs in `SET @... := EXISTS(...)` ausgelagert, um MySQL-Fehler #1093 zu vermeiden. Der Import verwendet im Kern ON DUPLICATE KEY UPDATE und ist für wiederholte Ausführung ausgelegt. Andere Kapitel werden nicht verändert. Produktiver Serverlauf wurde hier nicht durchgeführt.
