# Aktualisierung Anlage 1A.2 – Version 3, 09.11.2026

## Dateien

- `FRZK_Kapitel1_Anlage_A2_aktualisiert_v3_2026-11-09.docx`: vollständiges Kapitel 1 mit ersetzter Anlage A2 und unveränderten übrigen Anlagen.
- `Anlage_A2_Aktualisiert_v3_2026-11-09.docx`: einzelne aktuelle Anlage mit 7 Bildern.
- `FRZK_Anlage_A2_Update_v3_2026-11-09.sql`: SQL-**Nachimport** für bestehendes Schema `frzk_dissertation`, nicht vollständiger Neuimport.
- `assets/anlage_1A2/a2_frame_1.png` bis `a2_frame_7.png`: Originalgrafiken, Bild 5 aus vorheriger EMF-zu-PNG-Konvertierung.
- `A.2 lineareFunktion_erklärt(2).docx`: eingereichte aktuelle Autorenvorlage.

## Übernommen

- `a ≈ 0,9` statt bisher `a ≈ 1,2`.
- `a = Δy/Δx`, `f(x)=0,9x+b`, `f(x)=0,9x+5,5`.
- sieben Grafiken für den schrittweisen Aufbau; nun zusätzlich die Originalerläuterungen zu a, b und f(x)=ax+b als native Word-Formeln.
- didaktische Rückprüfung bleibt ausdrücklich als Ergänzung gekennzeichnet, nicht als beobachteter Unterrichtsverlauf.
- Die Aussage zur „eieindeutigen Zuordnung“ wird mathematisch präzisiert.

## SQL-Import

1. Datenbank sichern.
2. Kapitel 1 muss bereits vorhanden sein.
3. SQL-Datei in phpMyAdmin oder MySQL-Client importieren.
4. Kontrolle: Abschnitt `1.A2`, sieben Figuren und ihr `figure_assets`-Eintrag.
5. Dateien im `assets/anlage_1A2/`-Pfad der Anwendung bereitstellen.

Der Import ersetzt **nur** A2-Absätze und A2-Abbildungsassets. Bei `chapters.body_text` wird ein Altblock nur dann automatisch ersetzt, wenn seine bisherige Position am Textende anhand eines Abschlussmarkers sicher identifiziert wird. Ansonsten muss der Kapitelgesamttext vor einem manuellen Austausch verglichen werden. Der SQL-Import ist statisch geprüft, aber nicht auf dem Datenbankserver des Nutzers ausgeführt.

## Integrität

- Autorenvorlage SHA256: `91283a6214ec3891f95ae71fd753adf57661cbb84a800abf732996e401e700b8`
- Word-Master SHA256: `918aef913ed44c2ae0b783146e7b766de1d9c977272c56056b4cbd2693ecb58b`
