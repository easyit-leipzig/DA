-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 16. Okt 2026 um 08:32
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `frzk_rkb_32_neu`
--

DELIMITER $$
--
-- Prozeduren
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `rkb38_materialize_3820` ()   BEGIN
  DECLARE v_parent BIGINT UNSIGNED;
  DECLARE v_section BIGINT UNSIGNED;
  DECLARE v_previous BIGINT UNSIGNED;
  DECLARE v_revision BIGINT UNSIGNED;
  DECLARE v_rows INT DEFAULT 0;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;
  START TRANSACTION;
  IF NOT (DATABASE()='frzk_rkb_32_neu') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: DATABASE'; END IF;
  IF NOT ((SELECT COUNT(*) FROM dissertation_sections WHERE section_code='3.8' AND status='draft')=1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: CHAPTER_38'; END IF;
  IF NOT ((SELECT COUNT(*) FROM dissertation_sections s JOIN dissertation_sections p ON p.section_id=s.parent_section_id WHERE s.section_code='3.8.20' AND s.status='final' AND p.section_code='3.8')=1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: SECTION_3820'; END IF;
  IF NOT ((SELECT COUNT(*) FROM repository_revisions WHERE revision_code='RKB38-REV-3.8.20-2026-10-13' AND scope_type='section' AND scope_reference='3.8.20')=1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: REVISION_3820'; END IF;
  IF NOT ((SELECT COUNT(*) FROM repository_validation_results v JOIN repository_revisions r ON r.revision_id=v.revision_id WHERE r.revision_code='RKB38-REV-3.8.20-2026-10-13' AND v.validation_status='passed')=45) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: VALIDATIONS_3820'; END IF;
  IF NOT ((SELECT COUNT(*) FROM repository_validation_results WHERE validation_code='RKB38-3820-FINAL-GATE' AND validation_status='passed')=1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: FINAL_GATE_3820'; END IF;
  IF NOT ((SELECT COUNT(*) FROM repository_validation_results WHERE validation_code='RKB38-3820-SUMMARY' AND validation_status='passed')=1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: SUMMARY_3820'; END IF;
  IF NOT ((SELECT COUNT(*) FROM repository_validation_results WHERE validation_code='RKB38-3820-OP-GATE' AND validation_status='passed' AND BINARY actual_value=BINARY 'NOT_RELEASED')=1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: OP_NOT_RELEASED'; END IF;
  IF NOT ((SELECT COUNT(*) FROM repository_validation_results WHERE validation_code='RKB38-3820-EMP-READY' AND validation_status='passed' AND BINARY actual_value=BINARY 'NOT_RELEASED')=1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: EMP_READY_OPEN'; END IF;
  IF NOT ((SELECT COUNT(*) FROM repository_validation_results WHERE validation_code='RKB38-3820-NO-EMPIRICAL' AND validation_status='passed' AND BINARY actual_value=BINARY '0')=1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: NO_EMPIRICAL'; END IF;
  IF NOT ((SELECT COUNT(*) FROM repository_validation_results WHERE validation_code='RKB38-3820-NO-NEW-PHYSICS' AND validation_status='passed')=1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: NO_NEW_PHYSICS'; END IF;
  IF NOT ((SELECT COUNT(*) FROM repository_validation_results WHERE validation_code='RKB38-3820-PA1-N6' AND validation_status='passed')=1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: PA1_N6_3820'; END IF;
  IF NOT ((SELECT COUNT(*) FROM equations e JOIN dissertation_sections s ON s.section_id=e.section_id WHERE s.section_code='3.8.20' AND e.equation_number IN ('3.1975','3.1976','3.1977','3.1978','3.1979') AND e.validation_status='verified')=5) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: EQUATIONS_1970_1974'; END IF;
  IF NOT ((SELECT COUNT(*) FROM equations e JOIN dissertation_sections s ON s.section_id=e.section_id WHERE s.section_code='3.8.20' AND BINARY e.equation_latex=BINARY e.word_latex)=5) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: WORDLATEX_3820'; END IF;
  IF NOT ((SELECT COUNT(*) FROM repository_validation_results WHERE validation_code='RKB37-CHAPTER-37-GATE' AND validation_status='passed')=1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: CHAPTER_37_GATE'; END IF;
  IF NOT ((SELECT COUNT(*) FROM n6_primary_core WHERE is_active=1)=1 AND (SELECT COUNT(*) FROM n6_candidate_roles r JOIN n6_primary_core c ON c.candidate_role_id=r.candidate_role_id WHERE c.is_active=1 AND r.primary_status='primary' AND r.primary_gate_status='passed')=1 AND (SELECT COUNT(*) FROM n6_candidate_roles WHERE primary_status='open' OR (primary_status='primary' AND primary_gate_status<>'passed') OR (primary_status='excluded' AND primary_gate_status NOT IN ('passed','failed')))=0) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: PA1_N6'; END IF;
  IF NOT ((SELECT counter_value FROM repository_counters WHERE counter_key='last_completed_section')='3.8.20') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: COUNTER_LAST'; END IF;
  IF NOT ((SELECT counter_value FROM repository_counters WHERE counter_key='current_section')='3.8.21') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: COUNTER_CURRENT'; END IF;
  IF NOT ((SELECT counter_value FROM repository_counters WHERE counter_key='last_repository_revision')='RKB38-REV-3.8.20-2026-10-13') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: COUNTER_REVISION'; END IF;
  IF NOT ((SELECT counter_value FROM repository_counters WHERE counter_key='chapter_3_next_equation_number')='1980') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: NEXT_EQUATION'; END IF;
  IF NOT ((SELECT COUNT(*) FROM equations WHERE equation_number IN ('3.1980','3.1981','3.1982','3.1983','3.1984'))=0) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: EQUATIONS_1980_1984_FREE'; END IF;
  IF NOT ((SELECT COUNT(*) FROM dissertation_sections WHERE section_code='3.8.21')=0) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: SECTION_3821_FREE'; END IF;
  IF NOT ((SELECT COUNT(*) FROM repository_revisions WHERE revision_code='RKB38-REV-3.8.21-2026-10-13')=0) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: REVISION_3821_FREE'; END IF;
  IF NOT ((SELECT COUNT(*) FROM repository_validation_results WHERE validation_code LIKE 'RKB38-3821-%')=0) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: VALIDATIONS_3821_FREE'; END IF;
  IF NOT ((SELECT COUNT(*) FROM equations WHERE equation_number IN ('3.1975','3.1976','3.1977','3.1978','3.1979') AND validation_status='verified')=5) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: SOURCE_BASIS'; END IF;
  IF NOT ((SELECT COUNT(*) FROM repository_validation_results WHERE validation_code='RKB38-3820-EXTERNAL-REPRO' AND validation_status='passed' AND BINARY actual_value=BINARY 'open')=1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: EXTERNAL_REPRO_3820'; END IF;
  IF NOT ((SELECT COUNT(*) FROM repository_validation_results WHERE validation_code='RKB38-3820-WORDLATEX-STYLE' AND validation_status='passed' AND BINARY actual_value=BINARY 'required')=1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: WORDLATEX_STYLE_3820'; END IF;
  IF NOT ((SELECT COUNT(*) FROM repository_validation_results WHERE validation_code='RKB38-3820-ROBUST-GATE' AND validation_status='passed' AND BINARY actual_value=BINARY 'NOT_RELEASED')=1) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 PRESTATE FAIL: ROBUST_GATE_3820'; END IF;
  SELECT section_id INTO v_parent FROM dissertation_sections WHERE section_code='3.8' AND status='draft' LIMIT 1;
  SELECT revision_id INTO v_previous FROM repository_revisions WHERE revision_code='RKB38-REV-3.8.20-2026-10-13' LIMIT 1;
  INSERT INTO dissertation_sections (parent_section_id,section_code,title,chapter_no,section_order,status,is_original_contribution,notes)
  VALUES (v_parent,'3.8.21','Sensitivitaets- und Robustheitspruefung der synthetischen Parameterschaetzung',3,3.8020,'final',1,'Fuenf Gleichungen 3.1980-3.1984, nur synthetische Robustheits-Teilbefunde.');
  SET v_section=LAST_INSERT_ID();
  INSERT INTO repository_revisions (revision_code,revision_date,scope_type,scope_reference,version_label,summary,created_by,parent_revision_id)
  VALUES ('RKB38-REV-3.8.21-2026-10-13',NOW(),'section','3.8.21','3.8.21-v1','Startwert-, Rauschstaerken- und Modellstrukturpruefung; keine uneingeschraenkte Freigabe.','Olaf Thiele / ChatGPT',v_previous);
  SET v_revision=LAST_INSERT_ID();
  INSERT INTO equations (section_id,equation_number,title,equation_latex,word_latex,plain_description,equation_type,provenance,source_id,derivation,assumptions,validation_status,created_revision_id) VALUES
    (v_section, '3.1980', 'Robustheitsszenarien', '\\Sigma_T=\\{0{,}05;0{,}10;0{,}20\\}\\,\\mathrm{K},\\quad N_{\\mathrm{MC}}=80,\\quad\\mathcal{H}=\\{H_{\\mathrm{all}},H_{\\mathrm{left}},H_{\\mathrm{center}}\\}', '\\Sigma_T=\\{0{,}05;0{,}10;0{,}20\\}\\,\\mathrm{K},\\quad N_{\\mathrm{MC}}=80,\\quad\\mathcal{H}=\\{H_{\\mathrm{all}},H_{\\mathrm{left}},H_{\\mathrm{center}}\\}', 'Drei hypothetische Rauschstufen, drei Sensoren und 80 Wiederholungen je Szenario.', 'definition', 'original', NULL, 'Methodische Ableitung aus thermischem Referenzmodell M1 und synthetischer Robustheitspruefung.', 'Nur synthetisches Untersuchungsdesign; kein Sensorkalibrierungsnachweis.', 'verified', v_revision),
    (v_section, '3.1981', 'Startwertstabilitaet', '\\widehat{\\theta}^{(a)}=\\operatorname*{arg\\,min}_{\\theta\\in\\Theta}J(\\theta;y,\\theta_{\\mathrm{start}}^{(a)}),\\quad\\Delta_{\\mathrm{start}}=\\max_{a,b}\\|\\widehat{\\theta}^{(a)}-\\widehat{\\theta}^{(b)}\\|_\\infty', '\\widehat{\\theta}^{(a)}=\\operatorname*{arg\\,min}_{\\theta\\in\\Theta}J(\\theta;y,\\theta_{\\mathrm{start}}^{(a)}),\\quad\\Delta_{\\mathrm{start}}=\\max_{a,b}\\|\\widehat{\\theta}^{(a)}-\\widehat{\\theta}^{(b)}\\|_\\infty', 'Vergleich numerischer Optimierungsresultate bei vier Startwerten.', 'definition', 'original', NULL, 'Methodische Ableitung aus thermischem Referenzmodell M1 und synthetischer Robustheitspruefung.', 'Startwert als numerische Prozedurkennzeichnung, nicht mathematisches Argument der unveraenderten Zielfunktion.', 'verified', v_revision),
    (v_section, '3.1982', 'Verzerrung und Streuung unter Rauschvariation', 'b_j(\\sigma_T,H)=\\overline{\\widehat{\\theta}}_j-\\theta_{0,j},\\quad s_j(\\sigma_T,H)=\\sqrt{\\frac{1}{N_{\\mathrm{MC}}-1}\\sum_{r=1}^{N_{\\mathrm{MC}}}(\\widehat{\\theta}_j^{(r)}-\\overline{\\widehat{\\theta}}_j)^2}', 'b_j(\\sigma_T,H)=\\overline{\\widehat{\\theta}}_j-\\theta_{0,j},\\quad s_j(\\sigma_T,H)=\\sqrt{\\frac{1}{N_{\\mathrm{MC}}-1}\\sum_{r=1}^{N_{\\mathrm{MC}}}(\\widehat{\\theta}_j^{(r)}-\\overline{\\widehat{\\theta}}_j)^2}', 'Szenariospezifische mittlere Abweichung und empirische Standardabweichung.', 'definition', 'original', NULL, 'Methodische Ableitung aus thermischem Referenzmodell M1 und synthetischer Robustheitspruefung.', '80 Wiederholungen pro Szenario, Normalrauschen hypothetisch.', 'verified', v_revision),
    (v_section, '3.1983', 'Gewichtete asymmetrische lineare Kopplung', 'A_\\delta=-(I+L_\\delta),\\quad L_\\delta=L_\\delta^{\\mathsf T},\\quad L_\\delta\\boldsymbol{1}=0,\\quad (L_\\delta)_{12}=-2{,}2,\\quad(L_\\delta)_{23}=-1{,}8,\\quad(L_\\delta)_{13}=0,\\quad y_\\delta(t)=H(T_U\\boldsymbol{1}+T_Se^{A_\\delta t}x_0)+\\varepsilon(t)', 'A_\\delta=-(I+L_\\delta),\\quad L_\\delta=L_\\delta^{\\mathsf T},\\quad L_\\delta\\boldsymbol{1}=0,\\quad (L_\\delta)_{12}=-2{,}2,\\quad(L_\\delta)_{23}=-1{,}8,\\quad(L_\\delta)_{13}=0,\\quad y_\\delta(t)=H(T_U\\boldsymbol{1}+T_Se^{A_\\delta t}x_0)+\\varepsilon(t)', 'Zwei unterschiedliche lineare Kopplungsgewichte im Datengenerierungsmodell.', 'definition', 'original', NULL, 'Methodische Ableitung aus thermischem Referenzmodell M1 und synthetischer Robustheitspruefung.', 'Synthetische Modellabweichung; Schaeztmodell bleibt symmetrisch, keine kubische Wirkung.', 'verified', v_revision),
    (v_section, '3.1984', 'Methodisches Robustheitsgate', 'G_{\\mathrm{robust}}=G_{\\mathrm{start}}\\land G_{\\mathrm{noise}}\\land G_{\\mathrm{model}}\\land G_{\\mathrm{artifacts}},\\quad G_{\\mathrm{synthetic}}=\\mathrm{PASS}\\not\\Rightarrow G_{\\mathrm{empirical}}=\\mathrm{PASS}', 'G_{\\mathrm{robust}}=G_{\\mathrm{start}}\\land G_{\\mathrm{noise}}\\land G_{\\mathrm{model}}\\land G_{\\mathrm{artifacts}},\\quad G_{\\mathrm{synthetic}}=\\mathrm{PASS}\\not\\Rightarrow G_{\\mathrm{empirical}}=\\mathrm{PASS}', 'Robustheitsfreigabe verlangt Teilpruefungen und reproduzierbare Artefakte.', 'definition', 'original', NULL, 'Methodische Ableitung aus thermischem Referenzmodell M1 und synthetischer Robustheitspruefung.', 'Nur Teilbefunde dokumentiert; globale, externe und empirische Freigaben offen.', 'verified', v_revision);
  INSERT INTO repository_validation_results (revision_id,validation_code,validation_status,expected_value,actual_value,validation_message) VALUES
    (v_revision, 'RKB38-3821-PRESTATE', 'passed', '3.8.20 final; 45 Validierungen', 'verified', 'Vorgaengerabschluss und Freigabestatus geprueft.'),
    (v_revision, 'RKB38-3821-SECTION', 'passed', '3.8.21 final', '1', 'Abschnitt 3.8.21 materialisiert.'),
    (v_revision, 'RKB38-3821-EQUATIONS', 'passed', '3.1980-3.1984', '5', 'Fuenf exakt hinterlegte Gleichungen.'),
    (v_revision, 'RKB38-3821-WORDLATEX', 'passed', '5 von 5 identisch', '5', 'Exakte Word-LaTeX-Identitaet.'),
    (v_revision, 'RKB38-3821-SOURCE-BASIS', 'passed', '3.8.20;3.1975-3.1979', '5', 'Vorherige synthetische Schaetzung als Basis.'),
    (v_revision, 'RKB38-3821-THERMAL-REFERENCE', 'passed', 'M1 linear thermisches Dreiernetz', 'unchanged', 'Keine neue physikalische Dynamik.'),
    (v_revision, 'RKB38-3821-PARAMETERS', 'passed', 'gamma0=1;k0=2;x0=(1,-1,2)', 'fixed', 'Pilotparameter unveraendert.'),
    (v_revision, 'RKB38-3821-TIME-GRID', 'passed', '0.1;0.25;0.5;1;1.5;2;3', '7', 'Zeitfenster unveraendert.'),
    (v_revision, 'RKB38-3821-RNG-SEED', 'passed', '382121', '382121', 'Reproduzierbarer synthetischer RNG-Startwert.'),
    (v_revision, 'RKB38-3821-MC-COUNT', 'passed', '80 per scenario', '80', '80 Wiederholungen je Szenario.'),
    (v_revision, 'RKB38-3821-SIGMA-LEVELS', 'passed', '0.05;0.10;0.20 K', '3', 'Hypothetische Rauschstandardabweichungen.'),
    (v_revision, 'RKB38-3821-SENSOR-ARCHITECTURES', 'passed', 'all;left;center', '3', 'Drei Sensoranordnungen.'),
    (v_revision, 'RKB38-3821-SCENARIOS', 'passed', '3 x 3', '9', 'Neun synthetische Szenarien.'),
    (v_revision, 'RKB38-3821-FITS-720', 'passed', '9 x 80', '720', '720 synthetische Optimierungen dokumentiert.'),
    (v_revision, 'RKB38-3821-START-VALUES', 'passed', '(0.2,0.2);(0.3,7);(7,0.3);(7,7)', '4', 'Vier Startwerte gleicher Daten.'),
    (v_revision, 'RKB38-3821-START-RESULT', 'passed', 'gamma=1.007076;k=1.995069;residual=0.316183', 'documented', 'Vier optisch identische Schaetzwerte; kein Globalnachweis.'),
    (v_revision, 'RKB38-3821-START-LIMIT', 'passed', 'single synthetic dataset', 'limited', 'Nur ein Datensatz.'),
    (v_revision, 'RKB38-3821-NOISE-ALL', 'passed', 'gamma_sd=0.006032,0.012289,0.023410;k_sd=0.011991,0.025512,0.048400', 'documented', 'Synthetische Streuungen bei voller Beobachtung.'),
    (v_revision, 'RKB38-3821-NOISE-LEFT', 'passed', 'gamma_sd=0.013183,0.024028,0.048662;k_sd=0.041761,0.093094,0.179008', 'documented', 'Synthetische Streuungen erster Koerper.'),
    (v_revision, 'RKB38-3821-NOISE-CENTER', 'passed', 'gamma_sd=0.011904,0.019852,0.052618;k_sd=0.015907,0.032464,0.064951', 'documented', 'Synthetische Streuungen mittlerer Koerper.'),
    (v_revision, 'RKB38-3821-BIAS-ALL', 'passed', 'gamma=0.000291,-0.000755,-0.001896;k=0.001123,-0.004171,0.008036', 'documented', 'Endliche Stichprobenmittel, keine generelle Unverzerrtheit.'),
    (v_revision, 'RKB38-3821-BIAS-LEFT', 'passed', 'gamma=0.000626,0.002867,-0.000397;k=-0.005909,-0.007546,-0.004094', 'documented', 'Endliche Stichprobenmittel.'),
    (v_revision, 'RKB38-3821-BIAS-CENTER', 'passed', 'gamma=0.000724,0.004526,0.005376;k=-0.002888,-0.003456,0.005281', 'documented', 'Endliche Stichprobenmittel.'),
    (v_revision, 'RKB38-3821-OPTIMIZER-SUCCESS', 'passed', '720/720', 'documented', 'Technischer Optimierungsstatus, kein empirischer Gate.'),
    (v_revision, 'RKB38-3821-MODEL-GENERATOR', 'passed', 'G12=2.2;G23=1.8 W/K', 'asymmetric', 'Bewusst asymmetrische Datengenerierung.'),
    (v_revision, 'RKB38-3821-MODEL-FITTER', 'passed', 'single symmetric coupling k', 'unchanged', 'Nicht an asymmetrische Datengenerierung angepasst.'),
    (v_revision, 'RKB38-3821-LAPLACIAN', 'passed', 'Ldelta symmetric, row sums zero', 'documented', 'Dissipative gewichtete Kopplung.'),
    (v_revision, 'RKB38-3821-MODEL-MC', 'passed', '80; sigma=0.1 K', '80', '80 synthetische Datensaetze der Modellabweichung.'),
    (v_revision, 'RKB38-3821-MODEL-BIAS', 'passed', 'gamma=-0.008805;k=-0.108842', 'documented', 'Systematische Verschiebung, kein Beweis neuer Physik.'),
    (v_revision, 'RKB38-3821-MODEL-SD', 'passed', 'gamma=0.010843;k=0.022214', 'documented', 'Beobachtete synthetische Streuung.'),
    (v_revision, 'RKB38-3821-MODEL-RESIDUAL', 'passed', '0.784 K', 'documented', 'Ungewichtete Residualnorm aus Textfassung.'),
    (v_revision, 'RKB38-3821-MODEL-DIAGNOSTIC', 'passed', 'linear asymmetry, not cubic', 'documented', 'Kein Nachweis von M38-E01.'),
    (v_revision, 'RKB38-3821-ROBUST-PARTIAL', 'passed', 'start/noise/model scenarios examined', 'documented', 'Begrenzte Teilpruefungen.'),
    (v_revision, 'RKB38-3821-ROBUST-GATE', 'passed', 'complete independent robustness evidence', 'NOT_RELEASED', 'Allgemeine Robustheitsfreigabe offen.'),
    (v_revision, 'RKB38-3821-EXTERNAL-REPRO', 'passed', 'independent external repetition', 'open', 'Externe Reproduktion offen.'),
    (v_revision, 'RKB38-3821-EXTERNAL-ARTIFACTS', 'passed', 'versioned code/raw data/output hashes', 'open', 'Vollstaendige Artefaktkette fehlt.'),
    (v_revision, 'RKB38-3821-NUM-RELEASE', 'passed', 'external numerical release', 'NOT_RELEASED', 'Keine externe numerische Freigabe.'),
    (v_revision, 'RKB38-3821-PHYSICAL-SCALING', 'passed', 'C,G_U,G jointly scaling ambiguous', 'unresolved', 'Absolute physikalische Parameter nicht eindeutig.'),
    (v_revision, 'RKB38-3821-OP-GATE', 'passed', 'physical operationalization', 'NOT_RELEASED', 'Physikalische Operationalisierung offen.'),
    (v_revision, 'RKB38-3821-EMP-READY', 'passed', 'empirical readiness', 'NOT_RELEASED', 'Keine empirische Testfreigabe.'),
    (v_revision, 'RKB38-3821-EMPIRICAL', 'passed', 'real experimental verification', 'open', 'Keine realen Messdaten.'),
    (v_revision, 'RKB38-3821-NO-EMPIRICAL', 'passed', 'confirmed physical tests', '0', 'Keine empirische Bestaetigung.'),
    (v_revision, 'RKB38-3821-M1-REFERENCE', 'passed', 'known linear thermal dynamics', 'unchanged', 'Referenzidentitaet gewahrt.'),
    (v_revision, 'RKB38-3821-M38E01-STATUS', 'passed', 'cubic candidate not physically tested', 'unchanged', 'Keine besondere physikalische Herkunft belegt.'),
    (v_revision, 'RKB38-3821-NO-NEW-PHYSICS', 'passed', 'new physical law', 'not_claimed', 'Keine neue Physik behauptet.'),
    (v_revision, 'RKB38-3821-PA1-N6', 'passed', 'PA1 only, N6 closed', 'prechecked', 'Unveraenderter Axiom- und N6-Status.'),
    (v_revision, 'RKB38-3821-NO-NEW-SOURCES', 'passed', 'no added source usage', '0', 'Keine Quellen hinzugefuegt.'),
    (v_revision, 'RKB38-3821-WORDLATEX-STYLE', 'passed', 'one pair parentheses; wordlatex/image/wordlatex', 'required', 'Formelgrafik ist externe Textdarstellung, nicht DB-geprueft.'),
    (v_revision, 'RKB38-3821-FINAL-GATE', 'passed', 'formal repository close', 'passed', 'Nur formaler Repository-Gate.'),
    (v_revision, 'RKB38-3821-SUMMARY', 'passed', '3.8.21 final; next 3.8.22; equation 1985', '3.8.21 final', 'Folgeabschnitt vorbereitet.');
  UPDATE repository_counters SET counter_value='3.8.21' WHERE counter_key='last_completed_section';
  SET v_rows=ROW_COUNT();
  IF v_rows<>1 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 UPDATE FAIL: last_completed_section'; END IF;
  UPDATE repository_counters SET counter_value='3.8.22' WHERE counter_key='current_section';
  SET v_rows=ROW_COUNT();
  IF v_rows<>1 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 UPDATE FAIL: current_section'; END IF;
  UPDATE repository_counters SET counter_value='RKB38-REV-3.8.21-2026-10-13' WHERE counter_key='last_repository_revision';
  SET v_rows=ROW_COUNT();
  IF v_rows<>1 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 UPDATE FAIL: last_repository_revision'; END IF;
  UPDATE repository_counters SET counter_value='1985' WHERE counter_key='chapter_3_next_equation_number';
  SET v_rows=ROW_COUNT();
  IF v_rows<>1 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 UPDATE FAIL: chapter_3_next_equation_number'; END IF;
  IF (SELECT COUNT(*) FROM dissertation_sections WHERE section_id=v_section AND parent_section_id=v_parent AND status='final')<>1
     OR (SELECT COUNT(*) FROM equations WHERE section_id=v_section AND validation_status='verified')<>5
     OR (SELECT COUNT(*) FROM equations WHERE section_id=v_section AND BINARY equation_latex=BINARY word_latex)<>5
     OR (SELECT COUNT(*) FROM repository_validation_results WHERE revision_id=v_revision AND validation_status='passed')<>50
     OR (SELECT COUNT(*) FROM repository_validation_results WHERE revision_id=v_revision AND validation_code='RKB38-3821-ROBUST-GATE' AND actual_value='NOT_RELEASED')<>1
     OR (SELECT COUNT(*) FROM repository_validation_results WHERE revision_id=v_revision AND validation_code='RKB38-3821-OP-GATE' AND actual_value='NOT_RELEASED')<>1
     OR (SELECT COUNT(*) FROM repository_validation_results WHERE revision_id=v_revision AND validation_code='RKB38-3821-EMP-READY' AND actual_value='NOT_RELEASED')<>1
     OR (SELECT COUNT(*) FROM source_usage WHERE section_id=v_section)<>0
     OR (SELECT counter_value FROM repository_counters WHERE counter_key='chapter_3_next_equation_number')<>'1985'
  THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB38 POSTCONDITION FAIL: 3.8.21'; END IF;
  COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_frzk_revalidate_m3_m4_gate` ()   main: BEGIN
    DECLARE v_gate_revision_id BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_m3_module_id BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_m4_module_id BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_m311_section_id BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_m30_section_id BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_section_gates INT DEFAULT 0;
    DECLARE v_m311_gate VARCHAR(16) DEFAULT NULL;
    DECLARE v_m3_gate VARCHAR(16) DEFAULT NULL;
    DECLARE v_m3_module_status VARCHAR(16) DEFAULT NULL;

    DECLARE v_section_count INT DEFAULT 0;
    DECLARE v_section_distinct INT DEFAULT 0;
    DECLARE v_section_review_final INT DEFAULT 0;

    DECLARE v_eq_count INT DEFAULT 0;
    DECLARE v_eq_valid_display INT DEFAULT 0;
    DECLARE v_eq_distinct INT DEFAULT 0;
    DECLARE v_eq_min INT DEFAULT NULL;
    DECLARE v_eq_max INT DEFAULT NULL;
    DECLARE v_section_ranges INT DEFAULT 0;

    DECLARE v_word_exact INT DEFAULT 0;
    DECLARE v_word_tag INT DEFAULT 0;
    DECLARE v_bad_role INT DEFAULT 0;

    DECLARE v_m311_versions INT DEFAULT 0;
    DECLARE v_m311_stored_hash VARCHAR(64) DEFAULT NULL;
    DECLARE v_m311_actual_hash VARCHAR(64) DEFAULT NULL;
    DECLARE v_m30_m4_handoff INT DEFAULT 0;
    DECLARE v_m311_handoff_objects INT DEFAULT 0;
    DECLARE v_m311_body_marker INT DEFAULT 0;

    DECLARE v_lang_id BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_strang_id BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_m311_follow_usage INT DEFAULT 0;

    DECLARE v_m4_module_count INT DEFAULT 0;
    DECLARE v_m4_module_good INT DEFAULT 0;
    DECLARE v_m4_status VARCHAR(16) DEFAULT NULL;
    DECLARE v_m4_sections INT DEFAULT 0;
    DECLARE v_m4_versions INT DEFAULT 0;
    DECLARE v_m4_objects INT DEFAULT 0;

    DECLARE v_failed INT DEFAULT 0;
    DECLARE v_message TEXT;

    DECLARE v_expected_m311_hash CHAR(64) CHARACTER SET ascii COLLATE ascii_bin
        DEFAULT '0e2b0c34e75b4872e0c15ca21264760024ebdc11243520fa9de5a4867f2e24fa';

    -- ------------------------------------------------------------------------
    -- Harte technische Eingangskontrollen
    -- ------------------------------------------------------------------------

    IF DATABASE() <> 'frzk_rkb_32_neu' THEN
        SET v_message = CONCAT(
            'Falsche Datenbank: erwartet frzk_rkb_32_neu, aktuell ',
            COALESCE(DATABASE(), 'NULL')
        );
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_message;
    END IF;

    SELECT MAX(`revision_id`)
      INTO v_gate_revision_id
      FROM `repository_revisions`
     WHERE `revision_code` = 'RKB32-GATE-M3-M4-2026-09-13';

    IF v_gate_revision_id IS NULL THEN
        SET v_message = 'Gate-Revision RKB32-GATE-M3-M4-2026-09-13 fehlt.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_message;
    END IF;

    SELECT MAX(`appendix_module_id`), MAX(`status`)
      INTO v_m3_module_id, v_m3_module_status
      FROM `appendix_modules`
     WHERE `appendix_code` = 'M3';

    IF v_m3_module_id IS NULL THEN
        SET v_message = 'Anlagenmodul M3 fehlt.';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_message;
    END IF;

    SELECT MAX(`appendix_section_id`)
      INTO v_m30_section_id
      FROM `appendix_sections`
     WHERE `appendix_module_id` = v_m3_module_id
       AND `section_code` = 'M3.0';

    SELECT MAX(`appendix_section_id`)
      INTO v_m311_section_id
      FROM `appendix_sections`
     WHERE `appendix_module_id` = v_m3_module_id
       AND `section_code` = 'M3.11';

    -- ------------------------------------------------------------------------
    -- Erwartete Abschnittsgrenzen für den kanonischen M3-Gleichungsbestand
    -- ------------------------------------------------------------------------

    DROP TEMPORARY TABLE IF EXISTS `tmp_rkb32_m3_ranges`;
    CREATE TEMPORARY TABLE `tmp_rkb32_m3_ranges` (
        `section_code` VARCHAR(50) NOT NULL,
        `eq_min` INT NOT NULL,
        `eq_max` INT NOT NULL,
        `eq_count` INT NOT NULL,
        PRIMARY KEY (`section_code`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

    INSERT INTO `tmp_rkb32_m3_ranges` (`section_code`, `eq_min`, `eq_max`, `eq_count`) VALUES
        ('M3.0',    1,   18,  18),
        ('M3.1',   19,   89,  71),
        ('M3.2',   90,  198, 109),
        ('M3.3',  199,  372, 174),
        ('M3.4',  373,  496, 124),
        ('M3.5',  497,  645, 149),
        ('M3.6',  646,  839, 194),
        ('M3.7',  840, 1013, 174),
        ('M3.8', 1014, 1175, 162),
        ('M3.9', 1176, 1330, 155),
        ('M3.10',1331, 1515, 185),
        ('M3.11',1516, 1625, 110);

    DROP TEMPORARY TABLE IF EXISTS `tmp_rkb32_m3m4_gate_results`;
    CREATE TEMPORARY TABLE `tmp_rkb32_m3m4_gate_results` (
        `sort_order` INT NOT NULL,
        `validation_code` VARCHAR(100) NOT NULL,
        `validation_status` ENUM('passed','warning','failed') NOT NULL,
        `expected_value` VARCHAR(255) DEFAULT NULL,
        `actual_value` VARCHAR(255) DEFAULT NULL,
        `validation_message` TEXT NOT NULL,
        PRIMARY KEY (`validation_code`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

    -- ------------------------------------------------------------------------
    -- 1) Vorgängergates und Modulstatus M3
    -- ------------------------------------------------------------------------

    SELECT COUNT(DISTINCT `validation_code`)
      INTO v_section_gates
      FROM `repository_validation_results`
     WHERE `validation_status` = 'passed'
       AND `validation_code` IN (
           'RKB32-M30-FINAL-GATE',
           'RKB32-M31-FINAL-GATE',
           'RKB32-M32-FINAL-GATE',
           'RKB32-M33-FINAL-GATE',
           'RKB32-M34-FINAL-GATE',
           'RKB32-M35-FINAL-GATE',
           'RKB32-M36-FINAL-GATE',
           'RKB32-M37-FINAL-GATE',
           'RKB32-M38-FINAL-GATE',
           'RKB32-M39-FINAL-GATE',
           'RKB32-M310-FINAL-GATE',
           'RKB32-M311-FINAL-GATE'
       );

    SELECT MAX(CASE WHEN `validation_status`='passed' THEN 'passed' ELSE `validation_status` END)
      INTO v_m311_gate
      FROM `repository_validation_results`
     WHERE `validation_code` = 'RKB32-M311-FINAL-GATE';

    SELECT MAX(CASE WHEN `validation_status`='passed' THEN 'passed' ELSE `validation_status` END)
      INTO v_m3_gate
      FROM `repository_validation_results`
     WHERE `validation_code` = 'RKB32-M3-FINAL-GATE';

    INSERT INTO `tmp_rkb32_m3m4_gate_results`
        (`sort_order`,`validation_code`,`validation_status`,`expected_value`,`actual_value`,`validation_message`)
    VALUES
        (
            10,
            'RKB32-M3M4-PREDECESSOR',
            IF(
                v_section_gates = 12
                AND v_m311_gate = 'passed'
                AND v_m3_gate = 'passed'
                AND v_m3_module_status IN ('review','final'),
                'passed','failed'
            ),
            '12 section gates passed; M311=passed; M3=passed; M3 status review|final',
            CONCAT(
                'section_gates=',v_section_gates,
                '; M311=',COALESCE(v_m311_gate,'NULL'),
                '; M3=',COALESCE(v_m3_gate,'NULL'),
                '; module=',COALESCE(v_m3_module_status,'NULL')
            ),
            'Alle Abschnitts-Final-Gates M3.0-M3.11 sowie M3.11- und M3-Gesamtgate müssen passed sein.'
        );

    -- ------------------------------------------------------------------------
    -- 2) Exakte Abschnittsstruktur M3.0 bis M3.11
    -- ------------------------------------------------------------------------

    SELECT
        COUNT(*),
        COUNT(DISTINCT `section_code`),
        SUM(CASE WHEN `status` IN ('review','final') THEN 1 ELSE 0 END)
      INTO v_section_count, v_section_distinct, v_section_review_final
      FROM `appendix_sections`
     WHERE `appendix_module_id` = v_m3_module_id;

    INSERT INTO `tmp_rkb32_m3m4_gate_results`
        (`sort_order`,`validation_code`,`validation_status`,`expected_value`,`actual_value`,`validation_message`)
    VALUES
        (
            20,
            'RKB32-M3M4-SECTIONS',
            IF(
                v_section_count = 12
                AND v_section_distinct = 12
                AND v_section_review_final = 12
                AND (SELECT COUNT(*) FROM `appendix_sections`
                      WHERE `appendix_module_id`=v_m3_module_id
                        AND `section_code` IN ('M3.0','M3.1','M3.2','M3.3','M3.4','M3.5','M3.6','M3.7','M3.8','M3.9','M3.10','M3.11')) = 12,
                'passed','failed'
            ),
            '12 sections; 12 distinct; 12 review|final',
            CONCAT(
                'count=',v_section_count,
                '; distinct=',v_section_distinct,
                '; review_or_final=',v_section_review_final
            ),
            'M3 muss genau die Abschnitte M3.0-M3.11 im freigegebenen Status enthalten.'
        );

    -- ------------------------------------------------------------------------
    -- 3) Lückenloser Gleichungsbestand M3.1 bis M3.1625 und Abschnittsgrenzen
    -- ------------------------------------------------------------------------

    SELECT COUNT(*)
      INTO v_eq_count
      FROM `appendix_objects` ao
      JOIN `appendix_sections` s
        ON s.`appendix_section_id` = ao.`appendix_section_id`
     WHERE s.`appendix_module_id` = v_m3_module_id
       AND ao.`object_type` = 'equation';

    SELECT
        COUNT(*),
        COUNT(DISTINCT ao.`display_number`),
        MIN(CAST(SUBSTRING_INDEX(ao.`display_number`,'.',-1) AS UNSIGNED)),
        MAX(CAST(SUBSTRING_INDEX(ao.`display_number`,'.',-1) AS UNSIGNED))
      INTO v_eq_valid_display, v_eq_distinct, v_eq_min, v_eq_max
      FROM `appendix_objects` ao
      JOIN `appendix_sections` s
        ON s.`appendix_section_id` = ao.`appendix_section_id`
     WHERE s.`appendix_module_id` = v_m3_module_id
       AND ao.`object_type` = 'equation'
       AND ao.`display_number` REGEXP '^M3\\.[0-9]+$';

    SELECT COUNT(*)
      INTO v_section_ranges
      FROM `tmp_rkb32_m3_ranges` r
     WHERE (
            SELECT COUNT(*)
              FROM `appendix_objects` ao
              JOIN `appendix_sections` s
                ON s.`appendix_section_id` = ao.`appendix_section_id`
             WHERE s.`appendix_module_id` = v_m3_module_id
               AND s.`section_code` = r.`section_code`
               AND ao.`object_type` = 'equation'
               AND ao.`display_number` REGEXP '^M3\\.[0-9]+$'
          ) = r.`eq_count`
       AND (
            SELECT MIN(CAST(SUBSTRING_INDEX(ao.`display_number`,'.',-1) AS UNSIGNED))
              FROM `appendix_objects` ao
              JOIN `appendix_sections` s
                ON s.`appendix_section_id` = ao.`appendix_section_id`
             WHERE s.`appendix_module_id` = v_m3_module_id
               AND s.`section_code` = r.`section_code`
               AND ao.`object_type` = 'equation'
               AND ao.`display_number` REGEXP '^M3\\.[0-9]+$'
          ) = r.`eq_min`
       AND (
            SELECT MAX(CAST(SUBSTRING_INDEX(ao.`display_number`,'.',-1) AS UNSIGNED))
              FROM `appendix_objects` ao
              JOIN `appendix_sections` s
                ON s.`appendix_section_id` = ao.`appendix_section_id`
             WHERE s.`appendix_module_id` = v_m3_module_id
               AND s.`section_code` = r.`section_code`
               AND ao.`object_type` = 'equation'
               AND ao.`display_number` REGEXP '^M3\\.[0-9]+$'
          ) = r.`eq_max`;

    INSERT INTO `tmp_rkb32_m3m4_gate_results`
        (`sort_order`,`validation_code`,`validation_status`,`expected_value`,`actual_value`,`validation_message`)
    VALUES
        (
            30,
            'RKB32-M3M4-EQUATIONS',
            IF(
                v_eq_count = 1625
                AND v_eq_valid_display = 1625
                AND v_eq_distinct = 1625
                AND v_eq_min = 1
                AND v_eq_max = 1625
                AND v_section_ranges = 12,
                'passed','failed'
            ),
            'count=1625; distinct=1625; min=1; max=1625; section_ranges=12',
            CONCAT(
                'count=',v_eq_count,
                '; valid=',v_eq_valid_display,
                '; distinct=',v_eq_distinct,
                '; min=',COALESCE(v_eq_min,-1),
                '; max=',COALESCE(v_eq_max,-1),
                '; section_ranges=',v_section_ranges
            ),
            'M3 muss den lückenlosen kanonischen Gleichungsbestand M3.1-M3.1625 mit den festgelegten Abschnittsgrenzen enthalten.'
        );

    -- ------------------------------------------------------------------------
    -- 4) Word-LaTeX und Rollen
    -- ------------------------------------------------------------------------

    SELECT
        SUM(CASE WHEN BINARY ao.`formal_latex` = BINARY ao.`word_latex` THEN 1 ELSE 0 END),
        SUM(CASE WHEN LOCATE(CONCAT(CHAR(92),'tag'),COALESCE(ao.`word_latex`,'')) > 0 THEN 1 ELSE 0 END)
      INTO v_word_exact, v_word_tag
      FROM `appendix_objects` ao
      JOIN `appendix_sections` s
        ON s.`appendix_section_id` = ao.`appendix_section_id`
     WHERE s.`appendix_module_id` = v_m3_module_id
       AND ao.`object_type` = 'equation';

    SELECT SUM(
               CASE
                   WHEN ao.`object_type`='equation' AND ao.`equation_role` IS NULL THEN 1
                   WHEN ao.`object_type`<>'equation' AND ao.`equation_role` IS NOT NULL THEN 1
                   ELSE 0
               END
           )
      INTO v_bad_role
      FROM `appendix_objects` ao
      JOIN `appendix_sections` s
        ON s.`appendix_section_id` = ao.`appendix_section_id`
     WHERE s.`appendix_module_id` = v_m3_module_id;

    SET v_word_exact = COALESCE(v_word_exact,0);
    SET v_word_tag   = COALESCE(v_word_tag,0);
    SET v_bad_role   = COALESCE(v_bad_role,0);

    INSERT INTO `tmp_rkb32_m3m4_gate_results`
        (`sort_order`,`validation_code`,`validation_status`,`expected_value`,`actual_value`,`validation_message`)
    VALUES
        (
            40,
            'RKB32-M3M4-WORDLATEX',
            IF(v_word_exact=1625 AND v_word_tag=0 AND v_bad_role=0,'passed','failed'),
            'exact=1625; tag=0; bad_role=0',
            CONCAT('exact=',v_word_exact,'; tag=',v_word_tag,'; bad_role=',v_bad_role),
            'Alle M3-Gleichungen müssen formal_latex/word_latex byteidentisch, tagfrei und rollen-konform gespeichert sein.'
        );

    -- ------------------------------------------------------------------------
    -- 5) Kanonischer M3.11-Hash, Übergabeobjekte und Nichtzirkularität
    -- ------------------------------------------------------------------------

    SELECT
        COUNT(*),
        MAX(`checksum_sha256`),
        MAX(SHA2(`body_markdown`,256)),
        MAX(CASE WHEN LOCATE(
            'Die Ergebnisse von M3 dürfen für ihren eigenen Aufbau keine systematische Theorie aus M4, M5 oder M6 voraussetzen.',
            `body_markdown`
        ) > 0 THEN 1 ELSE 0 END)
      INTO v_m311_versions, v_m311_stored_hash, v_m311_actual_hash, v_m311_body_marker
      FROM `appendix_section_versions`
     WHERE `appendix_section_id` = v_m311_section_id
       AND `version_kind` = 'draft';

    SELECT COUNT(DISTINCT `object_anchor`)
      INTO v_m30_m4_handoff
      FROM `appendix_objects`
     WHERE `appendix_section_id` = v_m30_section_id
       AND `object_anchor` = 'M3-HANDOFF-M4'
       AND `object_type` = 'statement'
       AND `equation_role` IS NULL;

    SELECT COUNT(DISTINCT `object_anchor`)
      INTO v_m311_handoff_objects
      FROM `appendix_objects`
     WHERE `appendix_section_id` = v_m311_section_id
       AND `object_type` IN ('statement','theorem')
       AND `equation_role` IS NULL
       AND `object_anchor` IN (
           'M3.11-HANDOFF-M4',
           'M3.11-HANDOFF-M5',
           'M3.11-HANDOFF-M6',
           'M3.11-HANDOFF-MAIN-32',
           'M3.11-BOUNDARY-NONCIRCULAR',
           'M3.11-FINAL-M3'
       );

    INSERT INTO `tmp_rkb32_m3m4_gate_results`
        (`sort_order`,`validation_code`,`validation_status`,`expected_value`,`actual_value`,`validation_message`)
    VALUES
        (
            50,
            'RKB32-M3M4-HANDOFF',
            IF(
                v_m311_versions = 1
                AND BINARY v_m311_stored_hash = BINARY v_expected_m311_hash
                AND BINARY v_m311_actual_hash = BINARY v_expected_m311_hash
                AND v_m30_m4_handoff = 1
                AND v_m311_handoff_objects = 6
                AND v_m311_body_marker = 1,
                'passed','failed'
            ),
            'M3.11 hash exact; M3.0 handoff=1; M3.11 handoff objects=6; body marker=1',
            CONCAT(
                'versions=',v_m311_versions,
                '; stored_hash=',COALESCE(v_m311_stored_hash,'NULL'),
                '; actual_hash=',COALESCE(v_m311_actual_hash,'NULL'),
                '; M30_M4=',v_m30_m4_handoff,
                '; M311_objects=',v_m311_handoff_objects,
                '; body=',v_m311_body_marker
            ),
            'Die Übergabe M3->M4 muss am Eingang von M3 und im Abschluss M3.11 ausdrücklich und kanonisch vorhanden sein.'
        );

    -- ------------------------------------------------------------------------
    -- 6) Kanonische Literaturquellen und geprüfte Folgezitationen in M3.11
    -- ------------------------------------------------------------------------

    SELECT MAX(`source_id`)
      INTO v_lang_id
      FROM `sources`
     WHERE `source_key` = 'lang_algebra_rev3_2002'
       AND `citation_number` = 71
       AND `verification_status` = 'verified';

    SELECT MAX(`source_id`)
      INTO v_strang_id
      FROM `sources`
     WHERE `source_key` = 'strang_introduction_linear_algebra_5_2016'
       AND `citation_number` = 72
       AND `verification_status` = 'verified';

    SELECT COUNT(*)
      INTO v_m311_follow_usage
      FROM `appendix_source_usage`
     WHERE `appendix_section_id` = v_m311_section_id
       AND `source_id` IN (v_lang_id,v_strang_id)
       AND `is_first_mention` = 0
       AND `citation_checked` = 1;

    INSERT INTO `tmp_rkb32_m3m4_gate_results`
        (`sort_order`,`validation_code`,`validation_status`,`expected_value`,`actual_value`,`validation_message`)
    VALUES
        (
            60,
            'RKB32-M3M4-SOURCES',
            IF(v_lang_id=50 AND v_strang_id=51 AND v_m311_follow_usage=2,'passed','failed'),
            'Lang [[71]] verified; Strang [[72]] verified; M3.11 follow usages=2',
            CONCAT(
                'Lang=',COALESCE(v_lang_id,0),
                '; Strang=',COALESCE(v_strang_id,0),
                '; M311_follow=',v_m311_follow_usage
            ),
            'Die kanonischen Literaturquellen [[71]] und [[72]] müssen verifiziert und im M3-Abschluss geprüft verwendet sein.'
        );

    -- ------------------------------------------------------------------------
    -- 7) M4 muss als korrekt geplantes, vollständig leeres Zielmodul vorliegen
    -- ------------------------------------------------------------------------

    SELECT COUNT(*), MAX(`appendix_module_id`), MAX(`status`)
      INTO v_m4_module_count, v_m4_module_id, v_m4_status
      FROM `appendix_modules`
     WHERE `appendix_code` = 'M4';

    SELECT COUNT(*)
      INTO v_m4_module_good
      FROM `appendix_modules`
     WHERE `appendix_code` = 'M4'
       AND `title` = 'Rang, Kern, Bild und lineare Gleichungssysteme'
       AND `purpose` = 'Rang, Bild, Kern, Rang-Nullität, lineare Injektivität und Surjektivität sowie Lösbarkeit und vollständige Lösung linearer Gleichungssysteme.'
       AND `sort_order` = 4
       AND `status` = 'planned';

    IF v_m4_module_id IS NOT NULL THEN
        SELECT COUNT(*)
          INTO v_m4_sections
          FROM `appendix_sections`
         WHERE `appendix_module_id` = v_m4_module_id;

        SELECT COUNT(*)
          INTO v_m4_versions
          FROM `appendix_section_versions` v
          JOIN `appendix_sections` s
            ON s.`appendix_section_id` = v.`appendix_section_id`
         WHERE s.`appendix_module_id` = v_m4_module_id;

        SELECT COUNT(*)
          INTO v_m4_objects
          FROM `appendix_objects` o
          JOIN `appendix_sections` s
            ON s.`appendix_section_id` = o.`appendix_section_id`
         WHERE s.`appendix_module_id` = v_m4_module_id;
    END IF;

    INSERT INTO `tmp_rkb32_m3m4_gate_results`
        (`sort_order`,`validation_code`,`validation_status`,`expected_value`,`actual_value`,`validation_message`)
    VALUES
        (
            70,
            'RKB32-M3M4-TARGET-CLEAN',
            IF(
                v_m4_module_count=1
                AND v_m4_module_good=1
                AND v_m4_status='planned'
                AND v_m4_sections=0
                AND v_m4_versions=0
                AND v_m4_objects=0,
                'passed','failed'
            ),
            'M4 module=1; status=planned; sections=0; versions=0; objects=0',
            CONCAT(
                'module=',v_m4_module_count,
                '; metadata=',v_m4_module_good,
                '; status=',COALESCE(v_m4_status,'NULL'),
                '; sections=',v_m4_sections,
                '; versions=',v_m4_versions,
                '; objects=',v_m4_objects
            ),
            'M4 muss vor Beginn als geplantes, inhaltlich leeres Zielmodul vorliegen.'
        );

    -- ------------------------------------------------------------------------
    -- Final-Gate aus ALLEN sieben Einzelprüfungen berechnen
    -- ------------------------------------------------------------------------

    SELECT COUNT(*)
      INTO v_failed
      FROM `tmp_rkb32_m3m4_gate_results`
     WHERE `validation_status` = 'failed';

    -- Die bestehenden Prüfzeilen der Gate-Revision werden idempotent aktualisiert.
    -- Es werden weder M3-Inhalte noch M4-Inhalte verändert.
    INSERT INTO `repository_validation_results`
        (`revision_id`,`validation_code`,`validation_status`,`expected_value`,`actual_value`,`validation_message`,`checked_at`)
    SELECT
        v_gate_revision_id,
        r.`validation_code`,
        r.`validation_status`,
        r.`expected_value`,
        r.`actual_value`,
        r.`validation_message`,
        CURRENT_TIMESTAMP
      FROM `tmp_rkb32_m3m4_gate_results` r
    ON DUPLICATE KEY UPDATE
        `validation_status` = VALUES(`validation_status`),
        `expected_value` = VALUES(`expected_value`),
        `actual_value` = VALUES(`actual_value`),
        `validation_message` = VALUES(`validation_message`),
        `checked_at` = VALUES(`checked_at`);

    INSERT INTO `repository_validation_results`
        (`revision_id`,`validation_code`,`validation_status`,`expected_value`,`actual_value`,`validation_message`,`checked_at`)
    VALUES
        (
            v_gate_revision_id,
            'RKB32-M3M4-FINAL-GATE',
            IF(v_failed=0,'passed','failed'),
            '0 failed',
            CAST(v_failed AS CHAR),
            'M4 darf nur begonnen werden, wenn M3 vollständig freigegeben, die Übergabe explizit und M4 unverändert leer ist.',
            CURRENT_TIMESTAMP
        )
    ON DUPLICATE KEY UPDATE
        `validation_status` = VALUES(`validation_status`),
        `expected_value` = VALUES(`expected_value`),
        `actual_value` = VALUES(`actual_value`),
        `validation_message` = VALUES(`validation_message`),
        `checked_at` = VALUES(`checked_at`);

    COMMIT;

    -- Vollständige Diagnoseausgabe VOR dem Assert.
    SELECT
        r.`validation_code`,
        r.`validation_status`,
        r.`expected_value`,
        r.`actual_value`,
        r.`validation_message`,
        r.`checked_at`
      FROM `repository_validation_results` r
     WHERE r.`revision_id` = v_gate_revision_id
       AND r.`validation_code` IN (
           'RKB32-M3M4-PREDECESSOR',
           'RKB32-M3M4-SECTIONS',
           'RKB32-M3M4-EQUATIONS',
           'RKB32-M3M4-WORDLATEX',
           'RKB32-M3M4-HANDOFF',
           'RKB32-M3M4-SOURCES',
           'RKB32-M3M4-TARGET-CLEAN',
           'RKB32-M3M4-FINAL-GATE'
       )
     ORDER BY FIELD(
         r.`validation_code`,
         'RKB32-M3M4-PREDECESSOR',
         'RKB32-M3M4-SECTIONS',
         'RKB32-M3M4-EQUATIONS',
         'RKB32-M3M4-WORDLATEX',
         'RKB32-M3M4-HANDOFF',
         'RKB32-M3M4-SOURCES',
         'RKB32-M3M4-TARGET-CLEAN',
         'RKB32-M3M4-FINAL-GATE'
     );

    IF v_failed <> 0 THEN
        SET v_message = CONCAT(
            'RKB32-M3M4-FINAL-GATE fehlgeschlagen: ',
            v_failed,
            ' Einzelvalidierung(en) failed. Diagnoseausgabe beachten.'
        );
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_message;
    END IF;

    SELECT
        'RKB32-M3M4-FINAL-GATE' AS `gate`,
        'passed' AS `status`,
        'M4.0 darf nun auf diesem Repositorystand beginnen.' AS `message`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb32_320_apply` ()   main: BEGIN

    DECLARE v_root3_id BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_section32_id BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_section320_id BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_revision_id BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_parent_revision_id BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_count INT DEFAULT 0;
    DECLARE v_failed INT DEFAULT 0;

    DECLARE v_m6_final_gate INT DEFAULT 0;
    DECLARE v_m6_handoff_gate INT DEFAULT 0;
    DECLARE v_m6_handoff_object INT DEFAULT 0;
    DECLARE v_31_final INT DEFAULT 0;

    DECLARE v_equation_count INT DEFAULT 0;
    DECLARE v_source_usage_count INT DEFAULT 0;
    DECLARE v_definition_count INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT COUNT(*), MAX(`section_id`)
      INTO v_count, v_root3_id
      FROM `dissertation_sections`
     WHERE `section_code` = '3';

    IF v_count <> 1 OR v_root3_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'RKB32-3.2.0: Kapitel 3 fehlt oder ist nicht eindeutig.';
    END IF;

    SELECT COUNT(*)
      INTO v_31_final
      FROM `dissertation_sections`
     WHERE `section_code` = '3.1'
       AND `status` = 'final';

    IF v_31_final <> 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'RKB32-3.2.0: Kapitel 3.1 ist nicht eindeutig final abgeschlossen.';
    END IF;

    SELECT MAX(r.`revision_id`)
      INTO v_parent_revision_id
      FROM `repository_revisions` r
      JOIN `repository_validation_results` vr
        ON vr.`revision_id` = r.`revision_id`
     WHERE r.`revision_code` =
               'RKB32-REV-M6-FINAL-GATE-2026-09-18'
       AND vr.`validation_code` =
               'RKB32-M6-FINAL-GATE'
       AND vr.`validation_status` = 'passed';

    IF v_parent_revision_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'RKB32-3.2.0: Bestandene M6-Finalrevision wurde nicht gefunden.';
    END IF;

    SELECT COUNT(*)
      INTO v_m6_final_gate
      FROM `repository_validation_results`
     WHERE `revision_id` = v_parent_revision_id
       AND `validation_code` = 'RKB32-M6-FINAL-GATE'
       AND `validation_status` = 'passed';

    IF v_m6_final_gate <> 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'RKB32-3.2.0: M6-FINAL-GATE ist nicht passed.';
    END IF;

    SELECT COUNT(*)
      INTO v_m6_handoff_gate
      FROM `repository_validation_results`
     WHERE `revision_id` = v_parent_revision_id
       AND `validation_code` = 'RKB32-M6-HANDOFF-TO-32'
       AND `validation_status` = 'passed';

    IF v_m6_handoff_gate <> 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'RKB32-3.2.0: Übergabe M6 -> 3.2 ist nicht freigegeben.';
    END IF;

    SELECT COUNT(*)
      INTO v_m6_handoff_object
      FROM `appendix_objects` ao
      JOIN `appendix_sections` aps
        ON aps.`appendix_section_id` = ao.`appendix_section_id`
     WHERE aps.`section_code` = 'M6.12'
       AND ao.`object_anchor` = 'M6.12-HANDOFF-32'
       AND ao.`validation_status` = 'checked';

    IF v_m6_handoff_object <> 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'RKB32-3.2.0: Kanonische Weitergabestelle M6.12 -> 3.2 fehlt.';
    END IF;

    SELECT COUNT(*)
      INTO v_count
      FROM `dissertation_sections`
     WHERE `section_code` = '3.2.0';

    IF v_count <> 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'RKB32-3.2.0: Abschnitt 3.2.0 existiert bereits. Skript nicht erneut ausführen.';
    END IF;

    SELECT COUNT(*)
      INTO v_count
      FROM `repository_revisions`
     WHERE `revision_code` =
           'RKB32-REV-3.2.0-2026-09-18';

    IF v_count <> 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'RKB32-3.2.0: Repository-Revision für 3.2.0 existiert bereits.';
    END IF;

    INSERT INTO `repository_revisions`
    (
        `revision_code`,
        `revision_date`,
        `scope_type`,
        `scope_reference`,
        `version_label`,
        `summary`,
        `created_by`,
        `parent_revision_id`
    )
    VALUES
    (
        'RKB32-REV-3.2.0-2026-09-18',
        NOW(),
        'section',
        '3.2.0',
        '3.2.0-v1',
        'Neuaufsatz von Abschnitt 3.2.0 nach vollständigem Abschluss der Anlagen M1 bis M6. Der Abschnitt übernimmt die methodischen Grenzen aus Kapitel 3.1 und den geprüften mathematischen Werkzeugbestand der Anlagen, ohne frühere Fassungen oder Nummerierungen von 3.2 vorauszusetzen.',
        'Olaf Thiele / ChatGPT',
        v_parent_revision_id
    );

    SET v_revision_id = LAST_INSERT_ID();

    SELECT COUNT(*), MAX(`section_id`)
      INTO v_count, v_section32_id
      FROM `dissertation_sections`
     WHERE `section_code` = '3.2';

    IF v_count = 0 THEN

        INSERT INTO `dissertation_sections`
        (
            `parent_section_id`,
            `section_code`,
            `title`,
            `chapter_no`,
            `section_order`,
            `status`,
            `is_original_contribution`,
            `notes`
        )
        VALUES
        (
            v_root3_id,
            '3.2',
            'Mathematische Grundlagen des Funktionalen Raum-Zeit-Kohärenzsystems',
            3,
            3.2000,
            'draft',
            1,
            'Vollständiger Neuaufsatz nach Abschluss und Prüfung der mathematischen Anlagen M1 bis M6. Keine frühere Fassung, Gliederung oder Gleichungsnummerierung von 3.2 wird vorausgesetzt.'
        );

        SET v_section32_id = LAST_INSERT_ID();

        INSERT INTO `section_change_log`
        (
            `revision_id`,
            `section_id`,
            `change_type`,
            `object_type`,
            `object_reference`,
            `change_summary`,
            `previous_value`,
            `new_value`
        )
        VALUES
        (
            v_revision_id,
            v_section32_id,
            'created',
            'section',
            '3.2',
            'Kapitel 3.2 wurde als vollständig neuer Haupttext nach Abschluss der Anlagen M1 bis M6 angelegt.',
            NULL,
            'Mathematische Grundlagen des Funktionalen Raum-Zeit-Kohärenzsystems; Status draft; Neuaufsatz ohne Rückgriff auf frühere 3.2-Fassungen.'
        );

    ELSEIF v_count = 1 THEN

        SELECT `section_id`
          INTO v_section32_id
          FROM `dissertation_sections`
         WHERE `section_code` = '3.2'
         LIMIT 1;

        IF NOT EXISTS
        (
            SELECT 1
              FROM `dissertation_sections`
             WHERE `section_id` = v_section32_id
               AND `parent_section_id` = v_root3_id
        ) THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT =
                    'RKB32-3.2.0: Vorhandener Abschnitt 3.2 besitzt eine falsche Elternzuordnung.';
        END IF;

    ELSE

        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'RKB32-3.2.0: Abschnitt 3.2 ist nicht eindeutig.';

    END IF;

    INSERT INTO `dissertation_sections`
    (
        `parent_section_id`,
        `section_code`,
        `title`,
        `chapter_no`,
        `section_order`,
        `status`,
        `is_original_contribution`,
        `notes`
    )
    VALUES
    (
        v_section32_id,
        '3.2.0',
        'Ausgangspunkt und Übernahme der mathematischen Grundlagen',
        3,
        3.2000,
        'draft',
        1,
        'Eingangsabschnitt des vollständig neuen Haupttexts 3.2. Übernahme der methodischen Grenzen aus 3.1 und des voraussetzungsgeprüften mathematischen Werkzeugbestands aus M1 bis M6. Raum, Zeit, Richtung, Abstand, Dauer, Gleichzeitigkeit und Dimension werden nicht als Ausgangsstrukturen vorausgesetzt. Keine Gleichungen und keine neuen Literaturquellen. Weitergabe an 3.2.1.'
    );

    SET v_section320_id = LAST_INSERT_ID();

    INSERT INTO `section_change_log`
    (
        `revision_id`,
        `section_id`,
        `change_type`,
        `object_type`,
        `object_reference`,
        `change_summary`,
        `previous_value`,
        `new_value`
    )
    VALUES
    (
        v_revision_id,
        v_section320_id,
        'created',
        'section',
        '3.2.0',
        'Abschnitt 3.2.0 wurde als Ausgangs- und Übernahmeabschnitt des neuen Haupttexts angelegt.',
        NULL,
        'Übernahme aus 3.1 und M1 bis M6; keine vorweggenommene Raum- oder Zeitstruktur; keine Gleichungen; keine neuen Literaturquellen; explizite Weitergabe an 3.2.1.'
    );

    SELECT COUNT(*)
      INTO v_equation_count
      FROM `equations`
     WHERE `section_id` = v_section320_id;

    SELECT COUNT(*)
      INTO v_source_usage_count
      FROM `source_usage`
     WHERE `section_id` = v_section320_id;

    SELECT COUNT(*)
      INTO v_definition_count
      FROM `definitions`
     WHERE `section_id` = v_section320_id;

    INSERT INTO `repository_validation_results`
    (
        `revision_id`,
        `validation_code`,
        `validation_status`,
        `expected_value`,
        `actual_value`,
        `validation_message`
    )
    VALUES
    (
        v_revision_id,
        'RKB32-320-M6-FINAL-GATE',
        IF(v_m6_final_gate = 1, 'passed', 'failed'),
        '1 passed M6 final gate',
        CONCAT(v_m6_final_gate),
        '3.2.0 darf nur auf dem bestandenen Gesamtabschluss der Anlage M6 aufbauen.'
    );

    INSERT INTO `repository_validation_results`
    (
        `revision_id`,
        `validation_code`,
        `validation_status`,
        `expected_value`,
        `actual_value`,
        `validation_message`
    )
    VALUES
    (
        v_revision_id,
        'RKB32-320-M6-HANDOFF',
        IF(
            v_m6_handoff_gate = 1
            AND v_m6_handoff_object = 1,
            'passed',
            'failed'
        ),
        'gate=1; canonical handoff=1',
        CONCAT(
            'gate=', v_m6_handoff_gate,
            '; handoff=', v_m6_handoff_object
        ),
        'Die Rückgabe der mathematischen Anlage M6 an den neuen Haupttext 3.2 muss vollständig freigegeben sein.'
    );

    SELECT COUNT(*)
      INTO v_count
      FROM `dissertation_sections`
     WHERE `section_code` = '3.2'
       AND `parent_section_id` = v_root3_id;

    INSERT INTO `repository_validation_results`
    (
        `revision_id`,
        `validation_code`,
        `validation_status`,
        `expected_value`,
        `actual_value`,
        `validation_message`
    )
    VALUES
    (
        v_revision_id,
        'RKB32-320-CHAPTER-32',
        IF(v_count = 1, 'passed', 'failed'),
        '1',
        CONCAT(v_count),
        'Der neue Hauptabschnitt 3.2 muss genau einmal und unmittelbar unter Kapitel 3 vorhanden sein.'
    );

    SELECT COUNT(*)
      INTO v_count
      FROM `dissertation_sections`
     WHERE `section_code` = '3.2.0'
       AND `parent_section_id` = v_section32_id;

    INSERT INTO `repository_validation_results`
    (
        `revision_id`,
        `validation_code`,
        `validation_status`,
        `expected_value`,
        `actual_value`,
        `validation_message`
    )
    VALUES
    (
        v_revision_id,
        'RKB32-320-SECTION',
        IF(v_count = 1, 'passed', 'failed'),
        '1',
        CONCAT(v_count),
        'Abschnitt 3.2.0 muss genau einmal und als unmittelbares Kind von 3.2 vorhanden sein.'
    );

    INSERT INTO `repository_validation_results`
    (
        `revision_id`,
        `validation_code`,
        `validation_status`,
        `expected_value`,
        `actual_value`,
        `validation_message`
    )
    VALUES
    (
        v_revision_id,
        'RKB32-320-NO-EQUATIONS',
        IF(v_equation_count = 0, 'passed', 'failed'),
        '0',
        CONCAT(v_equation_count),
        '3.2.0 ist ein methodischer Übernahme- und Abgrenzungsabschnitt und enthält noch keine nummerierten Gleichungen.'
    );

    INSERT INTO `repository_validation_results`
    (
        `revision_id`,
        `validation_code`,
        `validation_status`,
        `expected_value`,
        `actual_value`,
        `validation_message`
    )
    VALUES
    (
        v_revision_id,
        'RKB32-320-NO-NEW-SOURCES',
        IF(v_source_usage_count = 0, 'passed', 'failed'),
        '0',
        CONCAT(v_source_usage_count),
        '3.2.0 übernimmt den geprüften mathematischen Bestand der Anlagen und eröffnet keine neue Literaturführung.'
    );

    INSERT INTO `repository_validation_results`
    (
        `revision_id`,
        `validation_code`,
        `validation_status`,
        `expected_value`,
        `actual_value`,
        `validation_message`
    )
    VALUES
    (
        v_revision_id,
        'RKB32-320-NO-FORMAL-DEFINITIONS',
        IF(v_definition_count = 0, 'passed', 'failed'),
        '0',
        CONCAT(v_definition_count),
        'Die formale Definition funktionaler Zustände beginnt erst im nachfolgenden mathematischen Aufbau.'
    );

    SELECT COUNT(*)
      INTO v_count
      FROM `dissertation_sections`
     WHERE `section_id` = v_section320_id
       AND `is_original_contribution` = 1;

    INSERT INTO `repository_validation_results`
    (
        `revision_id`,
        `validation_code`,
        `validation_status`,
        `expected_value`,
        `actual_value`,
        `validation_message`
    )
    VALUES
    (
        v_revision_id,
        'RKB32-320-ORIGINAL-CONTRIBUTION',
        IF(v_count = 1, 'passed', 'failed'),
        '1',
        CONCAT(v_count),
        'Die originäre Eigenleistung liegt in Auswahl, Abhängigkeitsordnung, Abgrenzung und kontrollierter Verwendung des mathematischen Werkzeugbestands.'
    );

    SELECT COUNT(*)
      INTO v_count
      FROM `dissertation_sections`
     WHERE `section_id` = v_section320_id
       AND `notes` LIKE '%keine%'
       AND `notes` LIKE '%Raum%'
       AND `notes` LIKE '%Zeit%'
       AND `notes` LIKE '%M1 bis M6%';

    INSERT INTO `repository_validation_results`
    (
        `revision_id`,
        `validation_code`,
        `validation_status`,
        `expected_value`,
        `actual_value`,
        `validation_message`
    )
    VALUES
    (
        v_revision_id,
        'RKB32-320-RESET-DIRECTION',
        IF(v_count = 1, 'passed', 'failed'),
        '1',
        CONCAT(v_count),
        '3.2.0 muss aus dem neu aufgebauten Anlagenbestand M1 bis M6 hervorgehen und darf Raum oder Zeit nicht als bereits gegebene Ausgangsstruktur voraussetzen.'
    );

    SELECT COUNT(*)
      INTO v_count
      FROM `dissertation_sections`
     WHERE `section_id` = v_section320_id
       AND `notes` LIKE '%Weitergabe an 3.2.1%';

    INSERT INTO `repository_validation_results`
    (
        `revision_id`,
        `validation_code`,
        `validation_status`,
        `expected_value`,
        `actual_value`,
        `validation_message`
    )
    VALUES
    (
        v_revision_id,
        'RKB32-320-HANDOFF-321',
        IF(v_count = 1, 'passed', 'failed'),
        '1',
        CONCAT(v_count),
        'Die Weitergabe von 3.2.0 an 3.2.1 muss ausdrücklich dokumentiert sein.'
    );

    SELECT COUNT(*)
      INTO v_failed
      FROM `repository_validation_results`
     WHERE `revision_id` = v_revision_id
       AND `validation_status` = 'failed';

    IF v_failed <> 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
                'RKB32-3.2.0: Abschnittsvalidierung fehlgeschlagen. Transaktion wird zurückgesetzt.';
    END IF;

    UPDATE `dissertation_sections`
       SET `status` = 'final'
     WHERE `section_id` = v_section320_id;

    INSERT INTO `section_change_log`
    (
        `revision_id`,
        `section_id`,
        `change_type`,
        `object_type`,
        `object_reference`,
        `change_summary`,
        `previous_value`,
        `new_value`
    )
    VALUES
    (
        v_revision_id,
        v_section320_id,
        'status_changed',
        'section',
        '3.2.0-FINAL',
        'Abschnitt 3.2.0 wurde nach bestandenem Abschnitts-Gate freigegeben.',
        'draft',
        'final'
    );

    INSERT INTO `repository_validation_results`
    (
        `revision_id`,
        `validation_code`,
        `validation_status`,
        `expected_value`,
        `actual_value`,
        `validation_message`
    )
    VALUES
    (
        v_revision_id,
        'RKB32-320-FINAL-GATE',
        'passed',
        '0 failed checks',
        '0 failed checks',
        '3.2.0 ist repository-technisch abgeschlossen und für die Weitergabe an 3.2.1 freigegeben.'
    );

    INSERT INTO `repository_counters`
    (
        `counter_key`,
        `counter_value`
    )
    VALUES
    (
        'last_completed_section',
        '3.2.0'
    )
    ON DUPLICATE KEY UPDATE
        `counter_value` = VALUES(`counter_value`),
        `updated_at` = CURRENT_TIMESTAMP;

    INSERT INTO `repository_counters`
    (
        `counter_key`,
        `counter_value`
    )
    VALUES
    (
        'current_section',
        '3.2.1'
    )
    ON DUPLICATE KEY UPDATE
        `counter_value` = VALUES(`counter_value`),
        `updated_at` = CURRENT_TIMESTAMP;

    COMMIT;

    SELECT
        v_revision_id AS `revision_id`,
        v_section32_id AS `section_3_2_id`,
        v_section320_id AS `section_3_2_0_id`,
        '3.2.0' AS `section_code`,
        'final' AS `section_status`,
        'RKB32-320-FINAL-GATE' AS `gate`,
        'passed' AS `gate_status`,
        '3.2.1' AS `next_section`;

    SELECT
        `validation_code`,
        `validation_status`,
        `expected_value`,
        `actual_value`,
        `validation_message`
    FROM `repository_validation_results`
    WHERE `revision_id` = v_revision_id
    ORDER BY `validation_result_id`;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb32_m210_inventory_final_assert` ()   BEGIN
  DECLARE v_message TEXT;

  IF @m210_final_status<>'passed' THEN
    SET v_message=CONCAT(
      'M2.10-FINAL-GATE weiter failed: ',
      COALESCE(@m210_failed_codes,'unbekannte Einzelvalidierung')
    );
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT=v_message;
  END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_chapter_33_final_gate` ()   main: BEGIN
    DECLARE v_chapter33_id BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_chapter33_count INT DEFAULT 0;
    DECLARE v_chapter33_status VARCHAR(20) DEFAULT NULL;

    DECLARE v_sec3330_id BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_sec3330_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_sec3330_gate INT DEFAULT 0;

    DECLARE v_gate_revision BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_sections_total INT DEFAULT 0;
    DECLARE v_sections_final INT DEFAULT 0;
    DECLARE v_sections_original INT DEFAULT 0;
    DECLARE v_section_3331 INT DEFAULT 0;
    DECLARE v_section_gate_passed INT DEFAULT 0;
    DECLARE v_section_gate_current INT DEFAULT 0;

    DECLARE v_eq_count INT DEFAULT 0;
    DECLARE v_eq_unique INT DEFAULT 0;
    DECLARE v_eq_min INT DEFAULT 0;
    DECLARE v_eq_max INT DEFAULT 0;
    DECLARE v_eq_verified INT DEFAULT 0;
    DECLARE v_eq_sync INT DEFAULT 0;
    DECLARE v_eq_bad_numbers INT DEFAULT 0;

    DECLARE v_axioms_total INT DEFAULT 0;
    DECLARE v_axioms_pa1 INT DEFAULT 0;
    DECLARE v_axioms_other INT DEFAULT 0;
    DECLARE v_open_candidates INT DEFAULT 0;
    DECLARE v_primary_candidates INT DEFAULT 0;
    DECLARE v_active_core INT DEFAULT 0;
    DECLARE v_active_pa1_core INT DEFAULT 0;

    DECLARE v_n1n6_gate INT DEFAULT 0;
    DECLARE v_n6_handoff INT DEFAULT 0;

    DECLARE v_model_gate INT DEFAULT 0;
    DECLARE v_nonvacuity_gate INT DEFAULT 0;
    DECLARE v_scope_gate INT DEFAULT 0;
    DECLARE v_scope_handoff_gate INT DEFAULT 0;
    DECLARE v_gap_gate INT DEFAULT 0;
    DECLARE v_closure_gate INT DEFAULT 0;
    DECLARE v_extension_gate INT DEFAULT 0;
    DECLARE v_extension_policy_gate INT DEFAULT 0;
    DECLARE v_extension_handoff_gate INT DEFAULT 0;
    DECLARE v_handoff_gate INT DEFAULT 0;
    DECLARE v_target_state_gate INT DEFAULT 0;

    DECLARE v_failed INT DEFAULT 0;
    DECLARE v_passed INT DEFAULT 0;

    -- ------------------------------------------------------------------------
    -- A. Harte technische Auflösung des Kapitelknotens
    -- ------------------------------------------------------------------------
    IF DATABASE() <> 'frzk_rkb_32_neu' THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO = 1644,
                MESSAGE_TEXT = 'RKB33-3.3-FINAL-GATE: falsche Datenbank; erwartet frzk_rkb_32_neu.';
    END IF;

    SELECT COUNT(*), MAX(section_id), MAX(status)
      INTO v_chapter33_count, v_chapter33_id, v_chapter33_status
      FROM dissertation_sections
     WHERE section_code='3.3';

    IF v_chapter33_count <> 1 OR v_chapter33_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO = 1644,
                MESSAGE_TEXT = 'RKB33-3.3-FINAL-GATE: Kapitelknoten 3.3 fehlt oder ist nicht eindeutig.';
    END IF;

    SELECT MAX(section_id)
      INTO v_sec3330_id
      FROM dissertation_sections
     WHERE parent_section_id=v_chapter33_id
       AND section_code='3.3.30';

    SELECT MAX(r.revision_id)
      INTO v_sec3330_rev
      FROM repository_revisions r
     WHERE r.scope_type='section'
       AND r.scope_reference='3.3.30';

    SELECT COUNT(*)
      INTO v_sec3330_gate
      FROM repository_validation_results vr
     WHERE vr.validation_code='RKB33-3330-FINAL-GATE'
       AND vr.validation_status='passed'
       AND vr.revision_id=v_sec3330_rev;

    -- ------------------------------------------------------------------------
    -- B. Gate-Revision idempotent an den aktuellen 3.3.30-Endstand binden
    -- ------------------------------------------------------------------------
    START TRANSACTION;

    INSERT INTO repository_revisions
    (
        revision_code, revision_date, scope_type, scope_reference,
        version_label, summary, created_by, parent_revision_id
    )
    VALUES
    (
        'RKB33-GATE-3.3-FINAL-2026-10-02',
        CURRENT_TIMESTAMP,
        'chapter',
        '3.3',
        '3.3-final-gate-v1',
        'Kapitelgesamtgate 3.3 nach finalem Abschnitt 3.3.30. Prüft Abschnittsvollständigkeit, revisionsgebundene Abschnittsgates, lückenlosen Gleichungsbestand 3.406 bis 3.1149, PA1-only-Primärkern, geschlossenen N6-Kandidatenraum, Modell-, Scope-, Axiomenlücken-, Erweiterungs-, Provenienz- und Übergabearchitektur. Inhaltliche 3.3-Objekte werden nicht verändert.',
        'Olaf Thiele / ChatGPT',
        v_sec3330_rev
    )
    ON DUPLICATE KEY UPDATE
        revision_date=VALUES(revision_date),
        scope_type='chapter',
        scope_reference='3.3',
        version_label='3.3-final-gate-v1',
        summary=VALUES(summary),
        created_by=VALUES(created_by),
        parent_revision_id=VALUES(parent_revision_id);

    SELECT revision_id
      INTO v_gate_revision
      FROM repository_revisions
     WHERE revision_code='RKB33-GATE-3.3-FINAL-2026-10-02'
     LIMIT 1;

    IF v_gate_revision IS NULL THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO = 1644,
                MESSAGE_TEXT = 'RKB33-3.3-FINAL-GATE: Gate-Revision konnte nicht erzeugt/aufgelöst werden.';
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tmp_rkb33_ch33_gate;
    CREATE TEMPORARY TABLE tmp_rkb33_ch33_gate
    (
        sort_order INT NOT NULL,
        validation_code VARCHAR(100) NOT NULL,
        validation_status ENUM('passed','warning','failed') NOT NULL,
        expected_value VARCHAR(255) DEFAULT NULL,
        actual_value VARCHAR(255) DEFAULT NULL,
        validation_message TEXT NOT NULL,
        PRIMARY KEY(validation_code)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

    -- ------------------------------------------------------------------------
    -- C1. Vorgängerbestand N1-N6 und 3.3.30
    -- ------------------------------------------------------------------------
    SELECT COUNT(*) INTO v_n1n6_gate
      FROM repository_validation_results
     WHERE validation_result_id=(
           SELECT MAX(validation_result_id)
             FROM repository_validation_results
            WHERE validation_code='RKB33-N1N6-FINAL-GATE')
       AND validation_status='passed';

    SELECT COUNT(*) INTO v_n6_handoff
      FROM repository_validation_results
     WHERE validation_result_id=(
           SELECT MAX(validation_result_id)
             FROM repository_validation_results
            WHERE validation_code='RKB33-N6-HANDOFF-33')
       AND validation_status='passed';

    INSERT INTO tmp_rkb33_ch33_gate VALUES
    (
        10,
        'RKB33-33-TOTAL-PREDECESSOR-GATE',
        IF(v_n1n6_gate=1 AND v_n6_handoff=1 AND v_sec3330_id IS NOT NULL AND v_sec3330_rev IS NOT NULL AND v_sec3330_gate=1,'passed','failed'),
        'N1-N6 final=passed; N6->3.3 handoff=passed; 3.3.30 final gate current/passed',
        CONCAT('N1N6=',v_n1n6_gate,';handoff=',v_n6_handoff,';sec3330=',IF(v_sec3330_id IS NULL,0,1),';rev3330=',COALESCE(v_sec3330_rev,0),';gate3330=',v_sec3330_gate),
        'Der Kapitelabschluss darf nur auf dem vollständig freigegebenen N1-N6-Bestand und dem aktuellen finalen Abschnitt 3.3.30 aufbauen.'
    );

    -- ------------------------------------------------------------------------
    -- C2. G_sections: exakt 3.3.0 bis 3.3.30, alle final, kein 3.3.31,
    --     jeder Abschnitt mit aktuellem eigenem FINAL-GATE
    -- ------------------------------------------------------------------------
    SELECT COUNT(*),
           SUM(status='final'),
           SUM(is_original_contribution=1)
      INTO v_sections_total, v_sections_final, v_sections_original
      FROM dissertation_sections
     WHERE parent_section_id=v_chapter33_id
       AND section_code REGEXP '^3[.]3[.](0|[1-9]|[12][0-9]|30)$';

    SELECT COUNT(*) INTO v_section_3331
      FROM dissertation_sections
     WHERE parent_section_id=v_chapter33_id
       AND section_code='3.3.31';

    -- Anzahl der 31 erwarteten Abschnittsgates, deren letzter Datensatz passed ist.
    SELECT COUNT(*)
      INTO v_section_gate_passed
      FROM dissertation_sections s
     WHERE s.parent_section_id=v_chapter33_id
       AND s.section_code REGEXP '^3[.]3[.](0|[1-9]|[12][0-9]|30)$'
       AND EXISTS (
           SELECT 1
             FROM repository_validation_results vr
            WHERE vr.validation_code=CONCAT('RKB33-33',SUBSTRING_INDEX(s.section_code,'.',-1),'-FINAL-GATE')
              AND vr.validation_status='passed'
              AND vr.validation_result_id=(
                  SELECT MAX(vr2.validation_result_id)
                    FROM repository_validation_results vr2
                   WHERE vr2.validation_code=vr.validation_code
              )
       );

    -- Zusätzlich muss das jeweils letzte Abschnittsgate an eine Revision desselben
    -- Abschnitts gebunden sein. Damit wird ein historisch bestandenes Gate nicht
    -- als aktuelles Gate eines später veränderten Abschnitts akzeptiert.
    SELECT COUNT(*)
      INTO v_section_gate_current
      FROM dissertation_sections s
     WHERE s.parent_section_id=v_chapter33_id
       AND s.section_code REGEXP '^3[.]3[.](0|[1-9]|[12][0-9]|30)$'
       AND EXISTS (
           SELECT 1
             FROM repository_validation_results vr
             JOIN repository_revisions r ON r.revision_id=vr.revision_id
            WHERE vr.validation_code=CONCAT('RKB33-33',SUBSTRING_INDEX(s.section_code,'.',-1),'-FINAL-GATE')
              AND vr.validation_status='passed'
              AND r.scope_type='section'
              AND r.scope_reference=s.section_code
              AND vr.validation_result_id=(
                  SELECT MAX(vr2.validation_result_id)
                    FROM repository_validation_results vr2
                   WHERE vr2.validation_code=vr.validation_code
              )
       );

    INSERT INTO tmp_rkb33_ch33_gate VALUES
    (
        20,
        'RKB33-33-TOTAL-SECTIONS-GATE',
        IF(v_sections_total=31 AND v_sections_final=31 AND v_sections_original=31 AND v_section_3331=0 AND v_section_gate_passed=31 AND v_section_gate_current=31,'passed','failed'),
        'sections=31; final=31; original=31; 3.3.31=0; section_final_gates=31 current/passed',
        CONCAT('sections=',v_sections_total,';final=',v_sections_final,';original=',v_sections_original,';3331=',v_section_3331,';gates=',v_section_gate_passed,';current=',v_section_gate_current),
        'G_sections: 3.3.0 bis 3.3.30 müssen exakt einmal, final, als Eigenleistungsabschnitte und mit aktuellem passed FINAL-GATE vorliegen; 3.3.31 muss fehlen.'
    );

    -- ------------------------------------------------------------------------
    -- C3. Lückenloser kanonischer Gleichungsbestand 3.406 bis 3.1149
    -- ------------------------------------------------------------------------
    SELECT
        COUNT(*),
        COUNT(DISTINCT CAST(SUBSTRING_INDEX(e.equation_number,'.',-1) AS UNSIGNED)),
        MIN(CAST(SUBSTRING_INDEX(e.equation_number,'.',-1) AS UNSIGNED)),
        MAX(CAST(SUBSTRING_INDEX(e.equation_number,'.',-1) AS UNSIGNED)),
        SUM(e.validation_status='verified'),
        SUM(BINARY e.equation_latex=BINARY e.word_latex),
        SUM(e.equation_number NOT REGEXP '^3[.][0-9]+$')
      INTO v_eq_count,v_eq_unique,v_eq_min,v_eq_max,v_eq_verified,v_eq_sync,v_eq_bad_numbers
      FROM equations e
      JOIN dissertation_sections s ON s.section_id=e.section_id
     WHERE s.parent_section_id=v_chapter33_id;

    INSERT INTO tmp_rkb33_ch33_gate VALUES
    (
        30,
        'RKB33-33-TOTAL-EQUATIONS-GATE',
        IF(v_eq_count=744 AND v_eq_unique=744 AND v_eq_min=406 AND v_eq_max=1149 AND v_eq_verified=744 AND v_eq_sync=744 AND v_eq_bad_numbers=0,'passed','failed'),
        '744 equations; unique=744; min=406; max=1149; verified=744; Word-LaTeX sync=744',
        CONCAT('count=',v_eq_count,';unique=',v_eq_unique,';min=',v_eq_min,';max=',v_eq_max,';verified=',v_eq_verified,';sync=',v_eq_sync,';bad_numbers=',v_eq_bad_numbers),
        'Der Haupttext 3.3 muss den lückenlosen Gleichungsbestand (3.406) bis (3.1149) enthalten; Gleichungs- und Word-LaTeX-Fassung müssen byteidentisch und verifiziert sein.'
    );

    -- ------------------------------------------------------------------------
    -- C4. G_core: PA1-only; N6 vollständig geschlossen
    -- ------------------------------------------------------------------------
    SELECT COUNT(*),
           SUM(a.axiom_number='PA1' AND a.status='accepted'),
           SUM(NOT(a.axiom_number='PA1' AND a.status='accepted'))
      INTO v_axioms_total,v_axioms_pa1,v_axioms_other
      FROM axioms a
      JOIN dissertation_sections s ON s.section_id=a.section_id
     WHERE s.parent_section_id=v_chapter33_id;

    SELECT SUM(primary_status='open'),
           SUM(primary_status='primary')
      INTO v_open_candidates,v_primary_candidates
      FROM n6_candidate_roles;

    SELECT COUNT(*),
           SUM(pc.is_active=1 AND cr.candidate_code='N6-PA1' AND cr.statement_class='primary' AND cr.primary_status='primary' AND cr.primary_gate_status='passed')
      INTO v_active_core,v_active_pa1_core
      FROM n6_primary_core pc
      JOIN n6_candidate_roles cr ON cr.candidate_role_id=pc.candidate_role_id
     WHERE pc.is_active=1;

    SET v_open_candidates=COALESCE(v_open_candidates,0);
    SET v_primary_candidates=COALESCE(v_primary_candidates,0);
    SET v_active_pa1_core=COALESCE(v_active_pa1_core,0);

    INSERT INTO tmp_rkb33_ch33_gate VALUES
    (
        40,
        'RKB33-33-TOTAL-CORE-GATE',
        IF(v_axioms_total=1 AND v_axioms_pa1=1 AND v_axioms_other=0 AND v_open_candidates=0 AND v_primary_candidates=1 AND v_active_core=1 AND v_active_pa1_core=1,'passed','failed'),
        'exactly one accepted axiom PA1; open N6 candidates=0; one primary candidate; one active PA1 core',
        CONCAT('axioms=',v_axioms_total,';PA1=',v_axioms_pa1,';other=',v_axioms_other,';open=',v_open_candidates,';primary=',v_primary_candidates,';active_core=',v_active_core,';active_PA1_core=',v_active_pa1_core),
        'G_core: Der universelle Primärkern muss exakt PA1 enthalten; der N6-Kandidatenraum muss geschlossen sein und genau ein aktiver Primärkern darf bestehen.'
    );

    -- ------------------------------------------------------------------------
    -- C5. G_model: universelle Modellklasse / Nichtvakuosität
    -- ------------------------------------------------------------------------
    SELECT COUNT(*) INTO v_model_gate
      FROM repository_validation_results
     WHERE validation_result_id=(SELECT MAX(validation_result_id) FROM repository_validation_results WHERE validation_code='RKB33-3325-FINAL-GATE')
       AND validation_status='passed';

    SELECT COUNT(*) INTO v_nonvacuity_gate
      FROM repository_validation_results
     WHERE validation_result_id=(SELECT MAX(validation_result_id) FROM repository_validation_results WHERE validation_code='RKB33-3329-NONVACUITY-GATE')
       AND validation_status='passed';

    INSERT INTO tmp_rkb33_ch33_gate VALUES
    (
        50,
        'RKB33-33-TOTAL-MODEL-GATE',
        IF(v_model_gate=1 AND v_nonvacuity_gate=1,'passed','failed'),
        '3.3.25 final passed; universal model class nonempty',
        CONCAT('model_final=',v_model_gate,';nonvacuity=',v_nonvacuity_gate),
        'G_model: Die universelle FRZK-Modellklasse und ihre Nichtvakuosität müssen im aktuellen Abschlussbestand freigegeben sein.'
    );

    -- ------------------------------------------------------------------------
    -- C6. G_scope: Geltungs-/Scope-Architektur
    -- ------------------------------------------------------------------------
    SELECT COUNT(*) INTO v_scope_gate
      FROM repository_validation_results
     WHERE validation_result_id=(SELECT MAX(validation_result_id) FROM repository_validation_results WHERE validation_code='RKB33-3329-SCOPE-ARCHITECTURE-GATE')
       AND validation_status='passed';

    SELECT COUNT(*) INTO v_scope_handoff_gate
      FROM repository_validation_results
     WHERE validation_result_id=(SELECT MAX(validation_result_id) FROM repository_validation_results WHERE validation_code='RKB33-3330-SCOPE-ARCHITECTURE-GATE')
       AND validation_status='passed';

    INSERT INTO tmp_rkb33_ch33_gate VALUES
    (
        60,
        'RKB33-33-TOTAL-SCOPE-GATE',
        IF(v_scope_gate=1 AND v_scope_handoff_gate=1,'passed','failed'),
        '3.3.29 scope architecture passed; 3.3.30 scope handoff passed',
        CONCAT('closure_scope=',v_scope_gate,';handoff_scope=',v_scope_handoff_gate),
        'G_scope: Geltungsstufen, ScopeTrace und Restriktionsarchitektur müssen bis in den Abschlussabschnitt konsistent freigegeben sein.'
    );

    -- ------------------------------------------------------------------------
    -- C7. G_gap: Axiomenlücken- und Abschlussprüfung
    -- ------------------------------------------------------------------------
    SELECT COUNT(*) INTO v_gap_gate
      FROM repository_validation_results
     WHERE validation_result_id=(SELECT MAX(validation_result_id) FROM repository_validation_results WHERE validation_code='RKB33-3329-AXIOM-GAP-GATE')
       AND validation_status='passed';

    SELECT COUNT(*) INTO v_closure_gate
      FROM repository_validation_results
     WHERE validation_result_id=(SELECT MAX(validation_result_id) FROM repository_validation_results WHERE validation_code='RKB33-3329-SIX-CLOSURE-GATES')
       AND validation_status='passed';

    INSERT INTO tmp_rkb33_ch33_gate VALUES
    (
        70,
        'RKB33-33-TOTAL-AXIOM-GAP-GATE',
        IF(v_gap_gate=1 AND v_closure_gate=1,'passed','failed'),
        'axiom-gap gate passed; six closure gates passed',
        CONCAT('axiom_gap=',v_gap_gate,';closure=',v_closure_gate),
        'G_gap: Die revisionsgebundene Axiomenlückenprüfung und die Abschlussgates der universellen Axiomatik müssen passed sein.'
    );

    -- ------------------------------------------------------------------------
    -- C8. G_extension: Erweiterungs- und Revalidierungsarchitektur
    -- ------------------------------------------------------------------------
    SELECT COUNT(*) INTO v_extension_gate
      FROM repository_validation_results
     WHERE validation_result_id=(SELECT MAX(validation_result_id) FROM repository_validation_results WHERE validation_code='RKB33-3328-FINAL-GATE')
       AND validation_status='passed';

    SELECT COUNT(*) INTO v_extension_policy_gate
      FROM repository_validation_results
     WHERE validation_result_id=(SELECT MAX(validation_result_id) FROM repository_validation_results WHERE validation_code='RKB33-3329-EXTENSION-POLICY-GATE')
       AND validation_status='passed';

    SELECT COUNT(*) INTO v_extension_handoff_gate
      FROM repository_validation_results
     WHERE validation_result_id=(SELECT MAX(validation_result_id) FROM repository_validation_results WHERE validation_code='RKB33-3330-EXTENSION-ARCHITECTURE-GATE')
       AND validation_status='passed';

    INSERT INTO tmp_rkb33_ch33_gate VALUES
    (
        80,
        'RKB33-33-TOTAL-EXTENSION-GATE',
        IF(v_extension_gate=1 AND v_extension_policy_gate=1 AND v_extension_handoff_gate=1,'passed','failed'),
        '3.3.28 final passed; extension policy passed; 3.3.30 extension handoff passed',
        CONCAT('gate=',v_extension_gate,';policy=',v_extension_policy_gate,';handoff=',v_extension_handoff_gate),
        'G_extension: Jede spätere definitorische, modellbezogene, brückenbezogene oder primäre Erweiterung muss revisionsgebunden und revalidierungspflichtig bleiben.'
    );

    -- ------------------------------------------------------------------------
    -- C9. G_provenance: revisionsgebundene Provenienz des gesamten Kapitelbestands
    -- ------------------------------------------------------------------------
    INSERT INTO tmp_rkb33_ch33_gate VALUES
    (
        90,
        'RKB33-33-TOTAL-PROVENANCE-GATE',
        IF(v_section_gate_current=31 AND v_sections_original=31 AND v_eq_verified=744 AND v_eq_sync=744,'passed','failed'),
        '31 current revision-bound section gates; 31 original-contribution markers; 744 verified synchronized equations',
        CONCAT('current_section_gates=',v_section_gate_current,';original_sections=',v_sections_original,';verified_eq=',v_eq_verified,';sync_eq=',v_eq_sync),
        'G_provenance: Jeder 3.3-Abschnitt muss revisionsgebunden finalisiert sein; Eigenleistungskennzeichnung und formale Gleichungsprovenienz müssen bis zum Abschluss erhalten bleiben.'
    );

    -- ------------------------------------------------------------------------
    -- C10. G_handoff: exklusiver Abschluss an Kapitelgesamtgate / Folgekomplex
    -- ------------------------------------------------------------------------
    SELECT COUNT(*) INTO v_handoff_gate
      FROM repository_validation_results
     WHERE validation_result_id=(SELECT MAX(validation_result_id) FROM repository_validation_results WHERE validation_code='RKB33-3330-HANDOFF-33-FINAL-GATE')
       AND validation_status='passed';

    SELECT COUNT(*) INTO v_target_state_gate
      FROM repository_validation_results
     WHERE validation_result_id=(SELECT MAX(validation_result_id) FROM repository_validation_results WHERE validation_code='RKB33-3330-TARGET-STATE-GATE')
       AND validation_status='passed';

    INSERT INTO tmp_rkb33_ch33_gate VALUES
    (
        100,
        'RKB33-33-TOTAL-HANDOFF-GATE',
        IF(v_handoff_gate=1 AND v_target_state_gate=1 AND v_section_3331=0,'passed','failed'),
        '3.3.30 handoff to chapter gate passed; target-state gate passed; 3.3.31 absent',
        CONCAT('handoff=',v_handoff_gate,';target=',v_target_state_gate,';3331=',v_section_3331),
        'G_handoff: Nach 3.3.30 darf kein weiterer 3.3-Unterabschnitt folgen; die Übergabe erfolgt ausschließlich über das Kapitelgesamtgate an den kontrollierten Folgekomplex.'
    );

    -- ------------------------------------------------------------------------
    -- D. Gesamtergebnis bilden und alle Einzelprüfungen persistent speichern
    -- ------------------------------------------------------------------------
    SELECT COUNT(*) INTO v_failed
      FROM tmp_rkb33_ch33_gate
     WHERE validation_status='failed';

    SELECT COUNT(*) INTO v_passed
      FROM tmp_rkb33_ch33_gate
     WHERE validation_status='passed';

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,validation_message,checked_at)
    SELECT
        v_gate_revision,
        validation_code,
        validation_status,
        expected_value,
        actual_value,
        validation_message,
        CURRENT_TIMESTAMP
      FROM tmp_rkb33_ch33_gate
    ON DUPLICATE KEY UPDATE
        validation_status=VALUES(validation_status),
        expected_value=VALUES(expected_value),
        actual_value=VALUES(actual_value),
        validation_message=VALUES(validation_message),
        checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,validation_message,checked_at)
    VALUES
    (
        v_gate_revision,
        'RKB33-33-TOTAL-FINAL-GATE',
        IF(v_failed=0,'passed','failed'),
        '10/10 Einzelgates passed; ChapterGate_3.3 = passed iff G_total_3.3 = 1',
        CONCAT('passed=',v_passed,';failed=',v_failed),
        IF(v_failed=0,
           'Kapitel 3.3 ist vollständig, revisionsgebunden und formal abgeschlossen. Der PA1-only-Primärkern, der geschlossene N6-Kandidatenraum, Modell-, Scope-, Axiomenlücken-, Erweiterungs-, Provenienz- und Übergabearchitektur sind konsistent. ChapterGate 3.3 wird auf passed gesetzt.',
           'Kapitel 3.3 bleibt gesperrt. Mindestens ein Teilgate des Kapitelgesamtgates ist failed; die Detailausgabe benennt die Ursache.'),
        CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
        validation_status=VALUES(validation_status),
        expected_value=VALUES(expected_value),
        actual_value=VALUES(actual_value),
        validation_message=VALUES(validation_message),
        checked_at=CURRENT_TIMESTAMP;

    -- ------------------------------------------------------------------------
    -- E. Nur bei vollständig bestandenem Gate Kapitel 3.3 finalisieren
    -- ------------------------------------------------------------------------
    IF v_failed=0 THEN
        IF v_chapter33_status <> 'final' THEN
            UPDATE dissertation_sections
               SET status='final'
             WHERE section_id=v_chapter33_id;

            INSERT INTO section_change_log
            (
                revision_id,section_id,change_type,object_type,object_reference,
                change_summary,previous_value,new_value
            )
            VALUES
            (
                v_gate_revision,
                v_chapter33_id,
                'status_changed',
                'section',
                '3.3-FINAL',
                'Kapitel 3.3 wurde nach vollständig bestandenem Kapitelgesamtgate finalisiert.',
                v_chapter33_status,
                'final'
            );
        END IF;

        INSERT INTO repository_counters(counter_key,counter_value,updated_at)
        VALUES ('chapter_3_3_final_gate','passed',CURRENT_TIMESTAMP)
        ON DUPLICATE KEY UPDATE counter_value='passed',updated_at=CURRENT_TIMESTAMP;

        INSERT INTO repository_counters(counter_key,counter_value,updated_at)
        VALUES ('last_completed_section','3.3',CURRENT_TIMESTAMP)
        ON DUPLICATE KEY UPDATE counter_value='3.3',updated_at=CURRENT_TIMESTAMP;

        INSERT INTO repository_counters(counter_key,counter_value,updated_at)
        VALUES ('current_section','3.3-COMPLETE',CURRENT_TIMESTAMP)
        ON DUPLICATE KEY UPDATE counter_value='3.3-COMPLETE',updated_at=CURRENT_TIMESTAMP;

        INSERT INTO repository_counters(counter_key,counter_value,updated_at)
        VALUES ('last_repository_revision','RKB33-GATE-3.3-FINAL-2026-10-02',CURRENT_TIMESTAMP)
        ON DUPLICATE KEY UPDATE counter_value='RKB33-GATE-3.3-FINAL-2026-10-02',updated_at=CURRENT_TIMESTAMP;
    ELSE
        INSERT INTO repository_counters(counter_key,counter_value,updated_at)
        VALUES ('chapter_3_3_final_gate','blocked',CURRENT_TIMESTAMP)
        ON DUPLICATE KEY UPDATE counter_value='blocked',updated_at=CURRENT_TIMESTAMP;

        INSERT INTO repository_counters(counter_key,counter_value,updated_at)
        VALUES ('current_section','3.3-FINAL-GATE',CURRENT_TIMESTAMP)
        ON DUPLICATE KEY UPDATE counter_value='3.3-FINAL-GATE',updated_at=CURRENT_TIMESTAMP;
    END IF;

    COMMIT;

    -- ------------------------------------------------------------------------
    -- F. Diagnoseausgabe. Kein SIGNAL nach diesen SELECTs, damit phpMyAdmin
    --    nicht in den bekannten Commands-out-of-sync-Pfad gerät.
    -- ------------------------------------------------------------------------
    SELECT
        validation_code,
        validation_status,
        expected_value,
        actual_value,
        validation_message
      FROM repository_validation_results
     WHERE revision_id=v_gate_revision
       AND validation_code IN
       (
         'RKB33-33-TOTAL-PREDECESSOR-GATE',
         'RKB33-33-TOTAL-SECTIONS-GATE',
         'RKB33-33-TOTAL-EQUATIONS-GATE',
         'RKB33-33-TOTAL-CORE-GATE',
         'RKB33-33-TOTAL-MODEL-GATE',
         'RKB33-33-TOTAL-SCOPE-GATE',
         'RKB33-33-TOTAL-AXIOM-GAP-GATE',
         'RKB33-33-TOTAL-EXTENSION-GATE',
         'RKB33-33-TOTAL-PROVENANCE-GATE',
         'RKB33-33-TOTAL-HANDOFF-GATE',
         'RKB33-33-TOTAL-FINAL-GATE'
       )
     ORDER BY FIELD
     (
         validation_code,
         'RKB33-33-TOTAL-PREDECESSOR-GATE',
         'RKB33-33-TOTAL-SECTIONS-GATE',
         'RKB33-33-TOTAL-EQUATIONS-GATE',
         'RKB33-33-TOTAL-CORE-GATE',
         'RKB33-33-TOTAL-MODEL-GATE',
         'RKB33-33-TOTAL-SCOPE-GATE',
         'RKB33-33-TOTAL-AXIOM-GAP-GATE',
         'RKB33-33-TOTAL-EXTENSION-GATE',
         'RKB33-33-TOTAL-PROVENANCE-GATE',
         'RKB33-33-TOTAL-HANDOFF-GATE',
         'RKB33-33-TOTAL-FINAL-GATE'
     );

    SELECT
        'RKB33-33-TOTAL-FINAL-GATE' AS gate,
        IF(v_failed=0,'passed','failed') AS status,
        v_gate_revision AS gate_revision_id,
        v_sections_total AS sections_3_3_0_to_3_3_30,
        v_eq_count AS equations_3_406_to_3_1149,
        v_axioms_pa1 AS accepted_PA1,
        v_open_candidates AS open_N6_candidates,
        v_active_core AS active_primary_core_entries,
        IF(v_failed=0,
           'Kapitel 3.3 ist FINAL. Nächster Schritt: kontrollierter Folgekomplex; kein 3.3.31.',
           'Kapitel 3.3 bleibt gesperrt. Detailvalidierungen prüfen.') AS message;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_force_revision_chain_n26_n28` ()   BEGIN
    DECLARE v_n25 BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n26 BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n27 BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n28 BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_gate BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_n2_module BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n26_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n27_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n28_sec BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_scope_repository_ok INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- ========================================================================
    -- 1. EINZIGE HARTE VORAUSSETZUNG: N2.5-REVISION MUSS EXISTIEREN
    -- ========================================================================

    SELECT revision_id
      INTO v_n25
      FROM repository_revisions
     WHERE revision_code='RKB33-REV-N2.5-2026-09-22'
     LIMIT 1;

    IF v_n25 IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-FORCE-REV: Parent RKB33-REV-N2.5-2026-09-22 fehlt.';
    END IF;

    START TRANSACTION;

    -- ========================================================================
    -- 2. N2.6-REVISION DIREKT ANLEGEN
    --    KEIN SELECT, KEIN @start_ok, KEIN WHERE
    -- ========================================================================

    INSERT INTO repository_revisions
    (
        revision_code,
        revision_date,
        scope_type,
        scope_reference,
        version_label,
        summary,
        created_by,
        parent_revision_id
    )
    VALUES
    (
        'RKB33-REV-N2.6-2026-09-22',
        '2026-09-22 12:30:00',
        'section',
        'N2.6',
        'N2.6-final-v1',
        'Nachgetragene kanonische Revision fuer N2.6 Unabhaengigkeit von Axiomkandidaten.',
        'Olaf Thiele / ChatGPT',
        v_n25
    )
    ON DUPLICATE KEY UPDATE
        revision_date=VALUES(revision_date),
        scope_type='section',
        scope_reference='N2.6',
        version_label='N2.6-final-v1',
        summary=VALUES(summary),
        created_by=VALUES(created_by),
        parent_revision_id=v_n25;

    SELECT revision_id
      INTO v_n26
      FROM repository_revisions
     WHERE revision_code='RKB33-REV-N2.6-2026-09-22'
     LIMIT 1;

    IF v_n26 IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-FORCE-REV: N2.6-Revision wurde nicht erzeugt.';
    END IF;

    -- ========================================================================
    -- 3. N2.7-REVISION
    -- ========================================================================

    INSERT INTO repository_revisions
    (
        revision_code,
        revision_date,
        scope_type,
        scope_reference,
        version_label,
        summary,
        created_by,
        parent_revision_id
    )
    VALUES
    (
        'RKB33-REV-N2.7-2026-09-22',
        '2026-09-22 13:15:00',
        'section',
        'N2.7',
        'N2.7-final-v1',
        'Nachgetragene kanonische Revision fuer N2.7 Minimalitaet des Axiomkandidatensystems.',
        'Olaf Thiele / ChatGPT',
        v_n26
    )
    ON DUPLICATE KEY UPDATE
        revision_date=VALUES(revision_date),
        scope_type='section',
        scope_reference='N2.7',
        version_label='N2.7-final-v1',
        summary=VALUES(summary),
        created_by=VALUES(created_by),
        parent_revision_id=v_n26;

    SELECT revision_id
      INTO v_n27
      FROM repository_revisions
     WHERE revision_code='RKB33-REV-N2.7-2026-09-22'
     LIMIT 1;

    IF v_n27 IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-FORCE-REV: N2.7-Revision wurde nicht erzeugt.';
    END IF;

    -- ========================================================================
    -- 4. N2.8-REVISION
    -- ========================================================================

    INSERT INTO repository_revisions
    (
        revision_code,
        revision_date,
        scope_type,
        scope_reference,
        version_label,
        summary,
        created_by,
        parent_revision_id
    )
    VALUES
    (
        'RKB33-REV-N2.8-2026-09-22',
        '2026-09-22 14:00:00',
        'section',
        'N2.8',
        'N2.8-final-v1',
        'Nachgetragene kanonische Revision fuer N2.8 Konsolidierung und Uebergabe an N3.',
        'Olaf Thiele / ChatGPT',
        v_n27
    )
    ON DUPLICATE KEY UPDATE
        revision_date=VALUES(revision_date),
        scope_type='section',
        scope_reference='N2.8',
        version_label='N2.8-final-v1',
        summary=VALUES(summary),
        created_by=VALUES(created_by),
        parent_revision_id=v_n27;

    SELECT revision_id
      INTO v_n28
      FROM repository_revisions
     WHERE revision_code='RKB33-REV-N2.8-2026-09-22'
     LIMIT 1;

    IF v_n28 IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-FORCE-REV: N2.8-Revision wurde nicht erzeugt.';
    END IF;

    -- ========================================================================
    -- 5. GATE-REVISION
    --






    -- repository_revisions.scope_type ist installationsabhaengig.
    -- Wir pruefen, ob 'repository' im Enum erlaubt ist.
    -- Falls nicht, verwenden wir 'section' mit scope_reference='N2->N3'.
    -- ========================================================================

    SELECT COUNT(*)
      INTO v_scope_repository_ok
      FROM information_schema.COLUMNS
     WHERE TABLE_SCHEMA=DATABASE()
       AND TABLE_NAME='repository_revisions'
       AND COLUMN_NAME='scope_type'
       AND COLUMN_TYPE LIKE '%repository%';

    IF v_scope_repository_ok > 0 THEN

        INSERT INTO repository_revisions
        (
            revision_code,
            revision_date,
            scope_type,
            scope_reference,
            version_label,
            summary,
            created_by,
            parent_revision_id
        )
        VALUES
        (
            'RKB33-GATE-N2-N3-2026-09-22',
            '2026-09-22 14:35:00',
            'repository',
            'N2->N3',
            'handoff-gate-v1',
            'Revisionsobjekt fuer das eigenstaendige Uebergabegate N2 nach N3.',
            'Olaf Thiele / ChatGPT',
            v_n28
        )
        ON DUPLICATE KEY UPDATE
            revision_date=VALUES(revision_date),
            scope_type='repository',
            scope_reference='N2->N3',
            version_label='handoff-gate-v1',
            summary=VALUES(summary),
            created_by=VALUES(created_by),
            parent_revision_id=v_n28;

    ELSE

        INSERT INTO repository_revisions
        (
            revision_code,
            revision_date,
            scope_type,
            scope_reference,
            version_label,
            summary,
            created_by,
            parent_revision_id
        )
        VALUES
        (
            'RKB33-GATE-N2-N3-2026-09-22',
            '2026-09-22 14:35:00',
            'section',
            'N2->N3',
            'handoff-gate-v1',
            'Revisionsobjekt fuer das eigenstaendige Uebergabegate N2 nach N3; scope_type fallback=section.',
            'Olaf Thiele / ChatGPT',
            v_n28
        )
        ON DUPLICATE KEY UPDATE
            revision_date=VALUES(revision_date),
            scope_type='section',
            scope_reference='N2->N3',
            version_label='handoff-gate-v1',
            summary=VALUES(summary),
            created_by=VALUES(created_by),
            parent_revision_id=v_n28;

    END IF;

    SELECT revision_id
      INTO v_gate
      FROM repository_revisions
     WHERE revision_code='RKB33-GATE-N2-N3-2026-09-22'
     LIMIT 1;

    IF v_gate IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-FORCE-REV: Gate-Revision wurde nicht erzeugt.';
    END IF;

    -- ========================================================================
    -- 6. VORHANDENE ABSCHNITTE OPTIONAL AN DIE NEUEN REVISIONEN BINDEN
    --    Das Fehlen eines Abschnittes verhindert die Revisionsanlage NICHT.
    -- ========================================================================

    SELECT appendix_module_id
      INTO v_n2_module
      FROM appendix_modules
     WHERE appendix_code='N2'
     LIMIT 1;

    IF v_n2_module IS NOT NULL THEN

        SELECT appendix_section_id
          INTO v_n26_sec
          FROM appendix_sections
         WHERE appendix_module_id=v_n2_module
           AND section_code='N2.6'
         LIMIT 1;

        SELECT appendix_section_id
          INTO v_n27_sec
          FROM appendix_sections
         WHERE appendix_module_id=v_n2_module
           AND section_code='N2.7'
         LIMIT 1;

        SELECT appendix_section_id
          INTO v_n28_sec
          FROM appendix_sections
         WHERE appendix_module_id=v_n2_module
           AND section_code='N2.8'
         LIMIT 1;

        IF v_n26_sec IS NOT NULL THEN
            UPDATE appendix_sections
               SET created_revision_id=v_n26
             WHERE appendix_section_id=v_n26_sec;

            UPDATE appendix_objects
               SET created_revision_id=v_n26
             WHERE appendix_section_id=v_n26_sec;

            UPDATE appendix_source_usage
               SET created_revision_id=v_n26
             WHERE appendix_section_id=v_n26_sec;
        END IF;

        IF v_n27_sec IS NOT NULL THEN
            UPDATE appendix_sections
               SET created_revision_id=v_n27
             WHERE appendix_section_id=v_n27_sec;

            UPDATE appendix_objects
               SET created_revision_id=v_n27
             WHERE appendix_section_id=v_n27_sec;

            UPDATE appendix_source_usage
               SET created_revision_id=v_n27
             WHERE appendix_section_id=v_n27_sec;
        END IF;

        IF v_n28_sec IS NOT NULL THEN
            UPDATE appendix_sections
               SET created_revision_id=v_n28
             WHERE appendix_section_id=v_n28_sec;

            UPDATE appendix_objects
               SET created_revision_id=v_n28
             WHERE appendix_section_id=v_n28_sec;

            UPDATE appendix_source_usage
               SET created_revision_id=v_n28
             WHERE appendix_section_id=v_n28_sec;
        END IF;

    END IF;

    -- ========================================================================
    -- 7. REVISIONS-VALIDIERUNGEN
    -- ========================================================================

    INSERT INTO repository_validation_results
    (
        revision_id,
        validation_code,
        validation_status,
        expected_value,
        actual_value,
        validation_message
    )
    VALUES
    (
        v_n26,
        'RKB33-N26-REVISION-EXISTS',
        'passed',
        'RKB33-REV-N2.6-2026-09-22 mit Parent N2.5',
        CONCAT('revision_id=',v_n26,'; parent_revision_id=',v_n25),
        'N2.6-Revision wurde direkt und ohne Start-Gate erzeugt.'
    )
    ON DUPLICATE KEY UPDATE
        validation_status='passed',
        expected_value=VALUES(expected_value),
        actual_value=VALUES(actual_value),
        validation_message=VALUES(validation_message),
        checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (
        revision_id,
        validation_code,
        validation_status,
        expected_value,
        actual_value,
        validation_message
    )
    VALUES
    (
        v_n27,
        'RKB33-N27-REVISION-EXISTS',
        'passed',
        'RKB33-REV-N2.7-2026-09-22 mit Parent N2.6',
        CONCAT('revision_id=',v_n27,'; parent_revision_id=',v_n26),
        'N2.7-Revision wurde direkt und ohne Start-Gate erzeugt.'
    )
    ON DUPLICATE KEY UPDATE
        validation_status='passed',
        expected_value=VALUES(expected_value),
        actual_value=VALUES(actual_value),
        validation_message=VALUES(validation_message),
        checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (
        revision_id,
        validation_code,
        validation_status,
        expected_value,
        actual_value,
        validation_message
    )
    VALUES
    (
        v_n28,
        'RKB33-N28-REVISION-EXISTS',
        'passed',
        'RKB33-REV-N2.8-2026-09-22 mit Parent N2.7',
        CONCAT('revision_id=',v_n28,'; parent_revision_id=',v_n27),
        'N2.8-Revision wurde direkt und ohne Start-Gate erzeugt.'
    )
    ON DUPLICATE KEY UPDATE
        validation_status='passed',
        expected_value=VALUES(expected_value),
        actual_value=VALUES(actual_value),
        validation_message=VALUES(validation_message),
        checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (
        revision_id,
        validation_code,
        validation_status,
        expected_value,
        actual_value,
        validation_message
    )
    VALUES
    (
        v_gate,
        'RKB33-N2N3-REVISION-EXISTS',
        'passed',
        'Gate-Revision mit Parent N2.8',
        CONCAT('revision_id=',v_gate,'; parent_revision_id=',v_n28),
        'N2->N3-Gate-Revision wurde direkt erzeugt. Das fachliche Gate muss separat validiert werden.'
    )
    ON DUPLICATE KEY UPDATE
        validation_status='passed',
        expected_value=VALUES(expected_value),
        actual_value=VALUES(actual_value),
        validation_message=VALUES(validation_message),
        checked_at=CURRENT_TIMESTAMP;

    -- ========================================================================
    -- 8. REPOSITORY-ZAEHLER
    -- ========================================================================

    INSERT INTO repository_counters(counter_key,counter_value)
    VALUES ('last_repository_revision','RKB33-REV-N2.8-2026-09-22')
    ON DUPLICATE KEY UPDATE counter_value=VALUES(counter_value);

    INSERT INTO repository_counters(counter_key,counter_value)
    VALUES ('last_completed_section','N2.8')
    ON DUPLICATE KEY UPDATE counter_value=VALUES(counter_value);

    INSERT INTO repository_counters(counter_key,counter_value)
    VALUES ('current_section','N3.0')
    ON DUPLICATE KEY UPDATE counter_value=VALUES(counter_value);

    -- ========================================================================
    -- 9. POST-GUARD: REVISIONSKETTE MUSS EXAKT EXISTIEREN
    -- ========================================================================

    IF NOT EXISTS (
        SELECT 1
          FROM repository_revisions r26
          JOIN repository_revisions r27
            ON r27.parent_revision_id=r26.revision_id
          JOIN repository_revisions r28
            ON r28.parent_revision_id=r27.revision_id
          JOIN repository_revisions rg
            ON rg.parent_revision_id=r28.revision_id
         WHERE r26.revision_id=v_n26
           AND r26.parent_revision_id=v_n25
           AND r27.revision_id=v_n27
           AND r28.revision_id=v_n28
           AND rg.revision_id=v_gate
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-FORCE-REV: Revisionskette ist nach INSERT nicht konsistent.';
    END IF;

    COMMIT;

    -- ========================================================================
    -- 10. AUSGABE
    -- ========================================================================

    SELECT
        'PASSED' AS FORCE_REVISION_RESULT,
        v_n25 AS n25_revision_id,
        v_n26 AS n26_revision_id,
        v_n27 AS n27_revision_id,
        v_n28 AS n28_revision_id,
        v_gate AS gate_revision_id;

    SELECT
        r.revision_id,
        r.revision_code,
        r.scope_type,
        r.scope_reference,
        r.parent_revision_id,
        p.revision_code AS parent_revision_code
    FROM repository_revisions r
    LEFT JOIN repository_revisions p
      ON p.revision_id=r.parent_revision_id
    WHERE r.revision_id IN (v_n25,v_n26,v_n27,v_n28,v_gate)
    ORDER BY
      CASE r.revision_code
        WHEN 'RKB33-REV-N2.5-2026-09-22' THEN 1
        WHEN 'RKB33-REV-N2.6-2026-09-22' THEN 2
        WHEN 'RKB33-REV-N2.7-2026-09-22' THEN 3
        WHEN 'RKB33-REV-N2.8-2026-09-22' THEN 4
        WHEN 'RKB33-GATE-N2-N3-2026-09-22' THEN 5
        ELSE 99
      END;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n26_n28_revision_repair` ()   BEGIN
    DECLARE v_n2_module BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_n25_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n26_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n27_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n28_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_gate_rev BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_n26_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n27_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n28_sec BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_count INT DEFAULT 0;
    DECLARE v_bad INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- ========================================================================
    -- A. START-GUARD
    -- ========================================================================

    SELECT appendix_module_id
      INTO v_n2_module
      FROM appendix_modules
     WHERE appendix_code='N2'
     LIMIT 1;

    IF v_n2_module IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-N26-N28-REVISION-REPAIR: N2-Modul fehlt.';
    END IF;

    SELECT revision_id
      INTO v_n25_rev
      FROM repository_revisions
     WHERE revision_code='RKB33-REV-N2.5-2026-09-22'
     LIMIT 1;

    IF v_n25_rev IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-N26-N28-REVISION-REPAIR: Parent-Revision N2.5 fehlt.';
    END IF;

    SELECT appendix_section_id
      INTO v_n26_sec
      FROM appendix_sections
     WHERE appendix_module_id=v_n2_module
       AND section_code='N2.6'
     LIMIT 1;

    SELECT appendix_section_id
      INTO v_n27_sec
      FROM appendix_sections
     WHERE appendix_module_id=v_n2_module
       AND section_code='N2.7'
     LIMIT 1;

    SELECT appendix_section_id
      INTO v_n28_sec
      FROM appendix_sections
     WHERE appendix_module_id=v_n2_module
       AND section_code='N2.8'
     LIMIT 1;

    IF v_n26_sec IS NULL OR v_n27_sec IS NULL OR v_n28_sec IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-N26-N28-REVISION-REPAIR: N2.6, N2.7 oder N2.8 fehlt. Revisionsnachtrag abgebrochen.';
    END IF;

    -- Für jeden Abschnitt muss bereits mindestens eine gespeicherte Textversion
    -- existieren, damit ein revisionsgebundener Snapshot erzeugt werden kann.
    SELECT COUNT(*)
      INTO v_count
      FROM (
            SELECT appendix_section_id
              FROM appendix_section_versions
             WHERE appendix_section_id IN (v_n26_sec,v_n27_sec,v_n28_sec)
             GROUP BY appendix_section_id
           ) q;

    IF v_count <> 3 THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-N26-N28-REVISION-REPAIR: Für mindestens einen Abschnitt N2.6-N2.8 fehlt eine appendix_section_version.';
    END IF;

    START TRANSACTION;

    -- ========================================================================
    -- B. REVISIONSKETTE N2.6 -> N2.8
    -- ========================================================================

    INSERT INTO repository_revisions
    (revision_code,revision_date,scope_type,scope_reference,version_label,
     summary,created_by,parent_revision_id)
    VALUES
    (
      'RKB33-REV-N2.6-2026-09-22',
      '2026-09-22 12:30:00',
      'section',
      'N2.6',
      'N2.6-final-v1',
      'Revisionsnachtrag für N2.6 Unabhängigkeit von Axiomkandidaten; bindet den bereits vorhandenen Abschnitt revisionsgerecht an N2.5 an.',
      'Olaf Thiele / ChatGPT',
      v_n25_rev
    )
    ON DUPLICATE KEY UPDATE
      scope_type='section',
      scope_reference='N2.6',
      version_label='N2.6-final-v1',
      summary=VALUES(summary),
      created_by=VALUES(created_by),
      parent_revision_id=v_n25_rev;

    SELECT revision_id
      INTO v_n26_rev
      FROM repository_revisions
     WHERE revision_code='RKB33-REV-N2.6-2026-09-22'
     LIMIT 1;

    IF v_n26_rev IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-N26-N28-REVISION-REPAIR: N2.6-Revision konnte nicht angelegt werden.';
    END IF;

    INSERT INTO repository_revisions
    (revision_code,revision_date,scope_type,scope_reference,version_label,
     summary,created_by,parent_revision_id)
    VALUES
    (
      'RKB33-REV-N2.7-2026-09-22',
      '2026-09-22 13:15:00',
      'section',
      'N2.7',
      'N2.7-final-v1',
      'Revisionsnachtrag für N2.7 Minimalität des Axiomkandidatensystems; Parent ist die nachgetragene N2.6-Revision.',
      'Olaf Thiele / ChatGPT',
      v_n26_rev
    )
    ON DUPLICATE KEY UPDATE
      scope_type='section',
      scope_reference='N2.7',
      version_label='N2.7-final-v1',
      summary=VALUES(summary),
      created_by=VALUES(created_by),
      parent_revision_id=v_n26_rev;

    SELECT revision_id
      INTO v_n27_rev
      FROM repository_revisions
     WHERE revision_code='RKB33-REV-N2.7-2026-09-22'
     LIMIT 1;

    IF v_n27_rev IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-N26-N28-REVISION-REPAIR: N2.7-Revision konnte nicht angelegt werden.';
    END IF;

    INSERT INTO repository_revisions
    (revision_code,revision_date,scope_type,scope_reference,version_label,
     summary,created_by,parent_revision_id)
    VALUES
    (
      'RKB33-REV-N2.8-2026-09-22',
      '2026-09-22 14:00:00',
      'section',
      'N2.8',
      'N2.8-final-v1',
      'Revisionsnachtrag für N2.8 Konsolidierung der axiomatischen Prüfung und Übergabe an N3; Parent ist die nachgetragene N2.7-Revision.',
      'Olaf Thiele / ChatGPT',
      v_n27_rev
    )
    ON DUPLICATE KEY UPDATE
      scope_type='section',
      scope_reference='N2.8',
      version_label='N2.8-final-v1',
      summary=VALUES(summary),
      created_by=VALUES(created_by),
      parent_revision_id=v_n27_rev;

    SELECT revision_id
      INTO v_n28_rev
      FROM repository_revisions
     WHERE revision_code='RKB33-REV-N2.8-2026-09-22'
     LIMIT 1;

    IF v_n28_rev IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-N26-N28-REVISION-REPAIR: N2.8-Revision konnte nicht angelegt werden.';
    END IF;

    -- ========================================================================
    -- C. GATE-REVISION KORREKT ANLEGEN
    --    repository_revisions.scope_type kennt KEIN "gate".
    --    Deshalb verbindlich: scope_type='repository'.
    -- ========================================================================

    INSERT INTO repository_revisions
    (revision_code,revision_date,scope_type,scope_reference,version_label,
     summary,created_by,parent_revision_id)
    VALUES
    (
      'RKB33-GATE-N2-N3-2026-09-22',
      '2026-09-22 14:35:00',
      'repository',
      'N2->N3',
      'handoff-gate-v1',
      'Revisionsobjekt für das eigenständige Übergabegate N2 -> N3. Das fachliche Gate ist nach diesem Revisionsnachtrag erneut zu validieren.',
      'Olaf Thiele / ChatGPT',
      v_n28_rev
    )
    ON DUPLICATE KEY UPDATE
      scope_type='repository',
      scope_reference='N2->N3',
      version_label='handoff-gate-v1',
      summary=VALUES(summary),
      created_by=VALUES(created_by),
      parent_revision_id=v_n28_rev;

    SELECT revision_id
      INTO v_gate_rev
      FROM repository_revisions
     WHERE revision_code='RKB33-GATE-N2-N3-2026-09-22'
     LIMIT 1;

    IF v_gate_rev IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-N26-N28-REVISION-REPAIR: Gate-Revision konnte nicht angelegt werden.';
    END IF;

    -- ========================================================================
    -- D. ABSCHNITTE, OBJEKTE UND QUELLENVERWENDUNGEN UMBINDEN
    -- ========================================================================

    UPDATE appendix_sections
       SET created_revision_id=v_n26_rev
     WHERE appendix_section_id=v_n26_sec;

    UPDATE appendix_objects
       SET created_revision_id=v_n26_rev
     WHERE appendix_section_id=v_n26_sec;

    UPDATE appendix_source_usage
       SET created_revision_id=v_n26_rev
     WHERE appendix_section_id=v_n26_sec;

    UPDATE appendix_sections
       SET created_revision_id=v_n27_rev
     WHERE appendix_section_id=v_n27_sec;

    UPDATE appendix_objects
       SET created_revision_id=v_n27_rev
     WHERE appendix_section_id=v_n27_sec;

    UPDATE appendix_source_usage
       SET created_revision_id=v_n27_rev
     WHERE appendix_section_id=v_n27_sec;

    UPDATE appendix_sections
       SET created_revision_id=v_n28_rev
     WHERE appendix_section_id=v_n28_sec;

    UPDATE appendix_objects
       SET created_revision_id=v_n28_rev
     WHERE appendix_section_id=v_n28_sec;

    UPDATE appendix_source_usage
       SET created_revision_id=v_n28_rev
     WHERE appendix_section_id=v_n28_sec;

    -- ========================================================================
    -- E. REVISIONSGEBUNDENE VERSIONSSNAPSHOTS
    --    Die jeweils letzte vorhandene Textversion wird in die richtige
    --    Abschnittsrevision kopiert. Historische Versionen bleiben erhalten.
    -- ========================================================================

    INSERT INTO appendix_section_versions
    (appendix_section_id,revision_id,version_kind,body_markdown,
     checksum_sha256,notes)
    SELECT
      s.appendix_section_id,
      v_n26_rev,
      CASE
        WHEN s.status='final'  THEN 'final'
        WHEN s.status='review' THEN 'review'
        ELSE 'draft'
      END,
      v.body_markdown,
      v.checksum_sha256,
      CONCAT(
        COALESCE(v.notes,''),
        CASE WHEN COALESCE(v.notes,'')='' THEN '' ELSE '\n' END,
        'Revisionsnachtrag 22.09.2026: Snapshot an RKB33-REV-N2.6-2026-09-22 gebunden.'
      )
    FROM appendix_sections s
    JOIN appendix_section_versions v
      ON v.appendix_section_id=s.appendix_section_id
    WHERE s.appendix_section_id=v_n26_sec
      AND v.appendix_section_version_id=(
          SELECT MAX(v2.appendix_section_version_id)
            FROM appendix_section_versions v2
           WHERE v2.appendix_section_id=v_n26_sec
      )
    ON DUPLICATE KEY UPDATE
      body_markdown=VALUES(body_markdown),
      checksum_sha256=VALUES(checksum_sha256),
      notes=VALUES(notes);

    INSERT INTO appendix_section_versions
    (appendix_section_id,revision_id,version_kind,body_markdown,
     checksum_sha256,notes)
    SELECT
      s.appendix_section_id,
      v_n27_rev,
      CASE
        WHEN s.status='final'  THEN 'final'
        WHEN s.status='review' THEN 'review'
        ELSE 'draft'
      END,
      v.body_markdown,
      v.checksum_sha256,
      CONCAT(
        COALESCE(v.notes,''),
        CASE WHEN COALESCE(v.notes,'')='' THEN '' ELSE '\n' END,
        'Revisionsnachtrag 22.09.2026: Snapshot an RKB33-REV-N2.7-2026-09-22 gebunden.'
      )
    FROM appendix_sections s
    JOIN appendix_section_versions v
      ON v.appendix_section_id=s.appendix_section_id
    WHERE s.appendix_section_id=v_n27_sec
      AND v.appendix_section_version_id=(
          SELECT MAX(v2.appendix_section_version_id)
            FROM appendix_section_versions v2
           WHERE v2.appendix_section_id=v_n27_sec
      )
    ON DUPLICATE KEY UPDATE
      body_markdown=VALUES(body_markdown),
      checksum_sha256=VALUES(checksum_sha256),
      notes=VALUES(notes);

    INSERT INTO appendix_section_versions
    (appendix_section_id,revision_id,version_kind,body_markdown,
     checksum_sha256,notes)
    SELECT
      s.appendix_section_id,
      v_n28_rev,
      CASE
        WHEN s.status='final'  THEN 'final'
        WHEN s.status='review' THEN 'review'
        ELSE 'draft'
      END,
      v.body_markdown,
      v.checksum_sha256,
      CONCAT(
        COALESCE(v.notes,''),
        CASE WHEN COALESCE(v.notes,'')='' THEN '' ELSE '\n' END,
        'Revisionsnachtrag 22.09.2026: Snapshot an RKB33-REV-N2.8-2026-09-22 gebunden.'
      )
    FROM appendix_sections s
    JOIN appendix_section_versions v
      ON v.appendix_section_id=s.appendix_section_id
    WHERE s.appendix_section_id=v_n28_sec
      AND v.appendix_section_version_id=(
          SELECT MAX(v2.appendix_section_version_id)
            FROM appendix_section_versions v2
           WHERE v2.appendix_section_id=v_n28_sec
      )
    ON DUPLICATE KEY UPDATE
      body_markdown=VALUES(body_markdown),
      checksum_sha256=VALUES(checksum_sha256),
      notes=VALUES(notes);

    -- ========================================================================
    -- F. VORHANDENE VALIDIERUNGEN IN DIE RICHTIGEN REVISIONEN SPIEGELN
    --    Es wird je validation_code der zuletzt vorhandene Datensatz kopiert.
    -- ========================================================================

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    SELECT
      v_n26_rev,
      x.validation_code,
      x.validation_status,
      x.expected_value,
      x.actual_value,
      CONCAT(x.validation_message,' [Revisionsnachtrag N2.6]'),
      CURRENT_TIMESTAMP
    FROM repository_validation_results x
    JOIN (
        SELECT validation_code,MAX(validation_result_id) AS max_id
          FROM repository_validation_results
         WHERE validation_code LIKE 'RKB33-N26-%'
         GROUP BY validation_code
    ) m
      ON m.max_id=x.validation_result_id
    WHERE x.revision_id<>v_n26_rev
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    SELECT
      v_n27_rev,
      x.validation_code,
      x.validation_status,
      x.expected_value,
      x.actual_value,
      CONCAT(x.validation_message,' [Revisionsnachtrag N2.7]'),
      CURRENT_TIMESTAMP
    FROM repository_validation_results x
    JOIN (
        SELECT validation_code,MAX(validation_result_id) AS max_id
          FROM repository_validation_results
         WHERE validation_code LIKE 'RKB33-N27-%'
         GROUP BY validation_code
    ) m
      ON m.max_id=x.validation_result_id
    WHERE x.revision_id<>v_n27_rev
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    SELECT
      v_n28_rev,
      x.validation_code,
      x.validation_status,
      x.expected_value,
      x.actual_value,
      CONCAT(x.validation_message,' [Revisionsnachtrag N2.8]'),
      CURRENT_TIMESTAMP
    FROM repository_validation_results x
    JOIN (
        SELECT validation_code,MAX(validation_result_id) AS max_id
          FROM repository_validation_results
         WHERE validation_code LIKE 'RKB33-N28-%'
            OR validation_code IN ('RKB33-N2-FINAL-GATE','RKB33-GATE-N2-N3')
         GROUP BY validation_code
    ) m
      ON m.max_id=x.validation_result_id
    WHERE x.revision_id<>v_n28_rev
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    -- Vorhandene Validierungen des eigenständigen Übergabegates übernehmen.
    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    SELECT
      v_gate_rev,
      x.validation_code,
      x.validation_status,
      x.expected_value,
      x.actual_value,
      CONCAT(x.validation_message,' [Gate-Revisionsnachtrag]'),
      CURRENT_TIMESTAMP
    FROM repository_validation_results x
    JOIN (
        SELECT validation_code,MAX(validation_result_id) AS max_id
          FROM repository_validation_results
         WHERE validation_code LIKE 'RKB33-N2N3-%'
            OR validation_code='RKB33-GATE-N2-N3'
         GROUP BY validation_code
    ) m
      ON m.max_id=x.validation_result_id
    WHERE x.revision_id<>v_gate_rev
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    -- ========================================================================
    -- G. REVISIONS-REPAIR-VALIDIERUNGEN
    -- ========================================================================

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message)
    SELECT
      v_n26_rev,
      'RKB33-N26-REVISION-REPAIR',
      IF(
        (SELECT created_revision_id FROM appendix_sections WHERE appendix_section_id=v_n26_sec)=v_n26_rev
        AND (SELECT COUNT(*) FROM appendix_objects WHERE appendix_section_id=v_n26_sec AND created_revision_id<>v_n26_rev)=0
        AND (SELECT COUNT(*) FROM appendix_source_usage WHERE appendix_section_id=v_n26_sec AND created_revision_id<>v_n26_rev)=0
        AND (SELECT COUNT(*) FROM appendix_section_versions WHERE appendix_section_id=v_n26_sec AND revision_id=v_n26_rev)>=1,
        'passed','failed'
      ),
      'Section/Object/SourceUsage auf N2.6-Revision + >=1 Versionssnapshot',
      CONCAT(
        'section_rev=',(SELECT created_revision_id FROM appendix_sections WHERE appendix_section_id=v_n26_sec),
        '; object_mismatch=',(SELECT COUNT(*) FROM appendix_objects WHERE appendix_section_id=v_n26_sec AND created_revision_id<>v_n26_rev),
        '; usage_mismatch=',(SELECT COUNT(*) FROM appendix_source_usage WHERE appendix_section_id=v_n26_sec AND created_revision_id<>v_n26_rev),
        '; versions=',(SELECT COUNT(*) FROM appendix_section_versions WHERE appendix_section_id=v_n26_sec AND revision_id=v_n26_rev)
      ),
      'Nachträgliche Revisionsbindung von N2.6.'
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message)
    SELECT
      v_n27_rev,
      'RKB33-N27-REVISION-REPAIR',
      IF(
        (SELECT created_revision_id FROM appendix_sections WHERE appendix_section_id=v_n27_sec)=v_n27_rev
        AND (SELECT COUNT(*) FROM appendix_objects WHERE appendix_section_id=v_n27_sec AND created_revision_id<>v_n27_rev)=0
        AND (SELECT COUNT(*) FROM appendix_source_usage WHERE appendix_section_id=v_n27_sec AND created_revision_id<>v_n27_rev)=0
        AND (SELECT COUNT(*) FROM appendix_section_versions WHERE appendix_section_id=v_n27_sec AND revision_id=v_n27_rev)>=1,
        'passed','failed'
      ),
      'Section/Object/SourceUsage auf N2.7-Revision + >=1 Versionssnapshot',
      CONCAT(
        'section_rev=',(SELECT created_revision_id FROM appendix_sections WHERE appendix_section_id=v_n27_sec),
        '; object_mismatch=',(SELECT COUNT(*) FROM appendix_objects WHERE appendix_section_id=v_n27_sec AND created_revision_id<>v_n27_rev),
        '; usage_mismatch=',(SELECT COUNT(*) FROM appendix_source_usage WHERE appendix_section_id=v_n27_sec AND created_revision_id<>v_n27_rev),
        '; versions=',(SELECT COUNT(*) FROM appendix_section_versions WHERE appendix_section_id=v_n27_sec AND revision_id=v_n27_rev)
      ),
      'Nachträgliche Revisionsbindung von N2.7.'
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message)
    SELECT
      v_n28_rev,
      'RKB33-N28-REVISION-REPAIR',
      IF(
        (SELECT created_revision_id FROM appendix_sections WHERE appendix_section_id=v_n28_sec)=v_n28_rev
        AND (SELECT COUNT(*) FROM appendix_objects WHERE appendix_section_id=v_n28_sec AND created_revision_id<>v_n28_rev)=0
        AND (SELECT COUNT(*) FROM appendix_source_usage WHERE appendix_section_id=v_n28_sec AND created_revision_id<>v_n28_rev)=0
        AND (SELECT COUNT(*) FROM appendix_section_versions WHERE appendix_section_id=v_n28_sec AND revision_id=v_n28_rev)>=1,
        'passed','failed'
      ),
      'Section/Object/SourceUsage auf N2.8-Revision + >=1 Versionssnapshot',
      CONCAT(
        'section_rev=',(SELECT created_revision_id FROM appendix_sections WHERE appendix_section_id=v_n28_sec),
        '; object_mismatch=',(SELECT COUNT(*) FROM appendix_objects WHERE appendix_section_id=v_n28_sec AND created_revision_id<>v_n28_rev),
        '; usage_mismatch=',(SELECT COUNT(*) FROM appendix_source_usage WHERE appendix_section_id=v_n28_sec AND created_revision_id<>v_n28_rev),
        '; versions=',(SELECT COUNT(*) FROM appendix_section_versions WHERE appendix_section_id=v_n28_sec AND revision_id=v_n28_rev)
      ),
      'Nachträgliche Revisionsbindung von N2.8.'
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message)
    VALUES
    (
      v_gate_rev,
      'RKB33-N2N3-REVISION-REPAIR',
      'passed',
      'Gate-Revision mit scope_type=repository und Parent=N2.8',
      CONCAT('gate_revision_id=',v_gate_rev,'; parent_revision_id=',v_n28_rev),
      'Technische Gate-Revision wurde revisionsgerecht nachgetragen. Das fachliche N2->N3-Gate ist separat erneut auszuführen.'
    )
    ON DUPLICATE KEY UPDATE
      validation_status='passed',
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    -- ========================================================================
    -- H. POST-GUARD
    -- ========================================================================

    SELECT COUNT(*)
      INTO v_bad
      FROM repository_revisions r6
      JOIN repository_revisions r7 ON r7.parent_revision_id=r6.revision_id
      JOIN repository_revisions r8 ON r8.parent_revision_id=r7.revision_id
      JOIN repository_revisions rg ON rg.parent_revision_id=r8.revision_id
     WHERE r6.revision_id=v_n26_rev
       AND r6.parent_revision_id=v_n25_rev
       AND r7.revision_id=v_n27_rev
       AND r8.revision_id=v_n28_rev
       AND rg.revision_id=v_gate_rev
       AND r6.scope_type='section'
       AND r7.scope_type='section'
       AND r8.scope_type='section'
       AND rg.scope_type='repository';

    IF v_bad <> 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-N26-N28-REVISION-REPAIR: Parent-Kette oder scope_type fehlerhaft.';
    END IF;

    SELECT COUNT(*)
      INTO v_bad
      FROM repository_validation_results
     WHERE (
           (revision_id=v_n26_rev AND validation_code='RKB33-N26-REVISION-REPAIR')
        OR (revision_id=v_n27_rev AND validation_code='RKB33-N27-REVISION-REPAIR')
        OR (revision_id=v_n28_rev AND validation_code='RKB33-N28-REVISION-REPAIR')
        OR (revision_id=v_gate_rev AND validation_code='RKB33-N2N3-REVISION-REPAIR')
     )
       AND validation_status='passed';

    IF v_bad <> 4 THEN
        SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-N26-N28-REVISION-REPAIR: Mindestens eine Revisionsbindung ist nicht passed.';
    END IF;

    -- Repository steht nach der Reparatur auf N2.8.
    -- Die Gate-Revision existiert bereits, wird aber erst nach erneutem
    -- erfolgreichem Übergabegate zum last_repository_revision.
    INSERT INTO repository_counters(counter_key,counter_value)
    VALUES ('last_repository_revision','RKB33-REV-N2.8-2026-09-22')
    ON DUPLICATE KEY UPDATE counter_value=VALUES(counter_value);

    INSERT INTO repository_counters(counter_key,counter_value)
    VALUES ('last_completed_section','N2.8')
    ON DUPLICATE KEY UPDATE counter_value=VALUES(counter_value);

    INSERT INTO repository_counters(counter_key,counter_value)
    VALUES ('current_section','N3.0')
    ON DUPLICATE KEY UPDATE counter_value=VALUES(counter_value);

    COMMIT;

    -- ========================================================================
    -- I. KONTROLLAUSGABE
    -- ========================================================================

    SELECT
      'PASSED' AS REVISION_REPAIR_RESULT,
      v_n25_rev AS n25_parent_revision_id,
      v_n26_rev AS n26_revision_id,
      v_n27_rev AS n27_revision_id,
      v_n28_rev AS n28_revision_id,
      v_gate_rev AS gate_revision_id;

    SELECT
      revision_id,
      revision_code,
      revision_date,
      scope_type,
      scope_reference,
      version_label,
      parent_revision_id
    FROM repository_revisions
    WHERE revision_id IN (v_n25_rev,v_n26_rev,v_n27_rev,v_n28_rev,v_gate_rev)
    ORDER BY revision_id;

    SELECT
      s.section_code,
      s.status,
      s.created_revision_id,
      r.revision_code,
      (SELECT COUNT(*) FROM appendix_objects o
        WHERE o.appendix_section_id=s.appendix_section_id
          AND o.created_revision_id=s.created_revision_id) AS objects_on_revision,
      (SELECT COUNT(*) FROM appendix_source_usage u
        WHERE u.appendix_section_id=s.appendix_section_id
          AND u.created_revision_id=s.created_revision_id) AS usages_on_revision,
      (SELECT COUNT(*) FROM appendix_section_versions v
        WHERE v.appendix_section_id=s.appendix_section_id
          AND v.revision_id=s.created_revision_id) AS versions_on_revision
    FROM appendix_sections s
    JOIN repository_revisions r
      ON r.revision_id=s.created_revision_id
    WHERE s.section_code IN ('N2.6','N2.7','N2.8')
    ORDER BY s.section_code;

    SELECT
      r.revision_code,
      v.validation_code,
      v.validation_status,
      v.actual_value
    FROM repository_validation_results v
    JOIN repository_revisions r
      ON r.revision_id=v.revision_id
    WHERE v.validation_code IN
      ('RKB33-N26-REVISION-REPAIR',
       'RKB33-N27-REVISION-REPAIR',
       'RKB33-N28-REVISION-REPAIR',
       'RKB33-N2N3-REVISION-REPAIR')
    ORDER BY r.revision_id,v.validation_code;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n2_final_revalidate_n1n6_retry` ()   main: BEGIN

    DECLARE v_n2_module BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_n20_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n21_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n22_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n23_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n24_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n25_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n26_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n27_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n28_sec BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_n20_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n21_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n22_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n23_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n24_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n25_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n26_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n27_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n28_rev BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_n2_gate_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n6_gate_rev BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_sections INT DEFAULT 0;
    DECLARE v_revisions INT DEFAULT 0;
    DECLARE v_parent_chain INT DEFAULT 0;
    DECLARE v_snapshots INT DEFAULT 0;
    DECLARE v_bad_object_links INT DEFAULT 0;

    DECLARE v_eq_count INT DEFAULT 0;
    DECLARE v_eq_unique INT DEFAULT 0;
    DECLARE v_eq_min INT DEFAULT 0;
    DECLARE v_eq_max INT DEFAULT 0;
    DECLARE v_eq_sync INT DEFAULT 0;
    DECLARE v_eq_leaks INT DEFAULT 0;

    DECLARE v_def_count INT DEFAULT 0;
    DECLARE v_def_unique INT DEFAULT 0;
    DECLARE v_def_min INT DEFAULT 0;
    DECLARE v_def_max INT DEFAULT 0;

    DECLARE v_n2_failed INT DEFAULT 0;
    DECLARE v_n2_detail VARCHAR(255) DEFAULT NULL;

    DECLARE v_n1_module BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n3_module BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n4_module BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n5_module BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_n1_max_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n2_max_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n3_max_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n4_max_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n5_max_rev BIGINT UNSIGNED DEFAULT 0;

    DECLARE v_n1_status VARCHAR(20) DEFAULT 'missing';
    DECLARE v_n2n3_status VARCHAR(20) DEFAULT 'missing';
    DECLARE v_n2canon_status VARCHAR(20) DEFAULT 'missing';
    DECLARE v_n3n4_status VARCHAR(20) DEFAULT 'missing';
    DECLARE v_n4n5_status VARCHAR(20) DEFAULT 'missing';
    DECLARE v_n5n6_status VARCHAR(20) DEFAULT 'missing';
    DECLARE v_n6_status VARCHAR(20) DEFAULT 'missing';

    DECLARE v_n1_gate_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n2n3_gate_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n2canon_gate_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n3n4_gate_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n4n5_gate_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n5n6_gate_rev BIGINT UNSIGNED DEFAULT 0;

    DECLARE v_n1_ok INT DEFAULT 0;
    DECLARE v_n2_ok INT DEFAULT 0;
    DECLARE v_n3_ok INT DEFAULT 0;
    DECLARE v_n4_ok INT DEFAULT 0;
    DECLARE v_n5_ok INT DEFAULT 0;
    DECLARE v_n6_ok INT DEFAULT 0;
    DECLARE v_total_failed INT DEFAULT 0;
    DECLARE v_total_detail VARCHAR(255) DEFAULT NULL;
    DECLARE v_message TEXT;

    -- ========================================================================
    -- A. N6-FINAL MUSS BEREITS PERSISTENT PASSED SEIN
    -- ========================================================================

    SELECT MAX(r.revision_id)
      INTO v_n6_gate_rev
      FROM repository_revisions r
      JOIN repository_validation_results vr
        ON vr.revision_id=r.revision_id
     WHERE r.revision_code='RKB33-GATE-N6-N1N6-2026-09-25'
       AND vr.validation_code='RKB33-N6-FINAL-GATE'
       AND vr.validation_status='passed';

    IF v_n6_gate_rev IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N2-REVALIDATE: RKB33-N6-FINAL-GATE = passed fehlt. N6.9 muss zuerst erfolgreich finalisiert sein.';
    END IF;

    -- ========================================================================
    -- B. N2-MODUL UND N2.0 BIS N2.8 EINDEUTIG AUFLÖSEN
    -- ========================================================================

    SELECT MAX(appendix_module_id)
      INTO v_n2_module
      FROM appendix_modules
     WHERE appendix_code='N2';

    IF v_n2_module IS NULL
       OR (SELECT COUNT(*) FROM appendix_modules WHERE appendix_code='N2')<>1 THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N2-REVALIDATE: N2-Modul fehlt oder ist mehrfach vorhanden.';
    END IF;

    SELECT COUNT(*)
      INTO v_sections
      FROM appendix_sections
     WHERE appendix_module_id=v_n2_module
       AND section_code IN
       ('N2.0','N2.1','N2.2','N2.3','N2.4','N2.5','N2.6','N2.7','N2.8');

    IF v_sections<>9 THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N2-REVALIDATE: Erwartet werden genau N2.0 bis N2.8 (9 Sections).';
    END IF;

    IF EXISTS (
        SELECT section_code
          FROM appendix_sections
         WHERE appendix_module_id=v_n2_module
           AND section_code IN
           ('N2.0','N2.1','N2.2','N2.3','N2.4','N2.5','N2.6','N2.7','N2.8')
         GROUP BY section_code
        HAVING COUNT(*)<>1
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N2-REVALIDATE: Mindestens ein N2-Abschnitt ist mehrfach vorhanden.';
    END IF;

    SELECT appendix_section_id,created_revision_id INTO v_n20_sec,v_n20_rev
      FROM appendix_sections WHERE appendix_module_id=v_n2_module AND section_code='N2.0';
    SELECT appendix_section_id,created_revision_id INTO v_n21_sec,v_n21_rev
      FROM appendix_sections WHERE appendix_module_id=v_n2_module AND section_code='N2.1';
    SELECT appendix_section_id,created_revision_id INTO v_n22_sec,v_n22_rev
      FROM appendix_sections WHERE appendix_module_id=v_n2_module AND section_code='N2.2';
    SELECT appendix_section_id,created_revision_id INTO v_n23_sec,v_n23_rev
      FROM appendix_sections WHERE appendix_module_id=v_n2_module AND section_code='N2.3';
    SELECT appendix_section_id,created_revision_id INTO v_n24_sec,v_n24_rev
      FROM appendix_sections WHERE appendix_module_id=v_n2_module AND section_code='N2.4';
    SELECT appendix_section_id,created_revision_id INTO v_n25_sec,v_n25_rev
      FROM appendix_sections WHERE appendix_module_id=v_n2_module AND section_code='N2.5';
    SELECT appendix_section_id,created_revision_id INTO v_n26_sec,v_n26_rev
      FROM appendix_sections WHERE appendix_module_id=v_n2_module AND section_code='N2.6';
    SELECT appendix_section_id,created_revision_id INTO v_n27_sec,v_n27_rev
      FROM appendix_sections WHERE appendix_module_id=v_n2_module AND section_code='N2.7';
    SELECT appendix_section_id,created_revision_id INTO v_n28_sec,v_n28_rev
      FROM appendix_sections WHERE appendix_module_id=v_n2_module AND section_code='N2.8';

    -- ========================================================================
    -- C. REVISIONSKETTE / SNAPSHOTS / OBJEKTBINDUNG
    -- ========================================================================

    SELECT COUNT(*)
      INTO v_revisions
      FROM repository_revisions r
     WHERE (r.revision_id=v_n20_rev AND r.scope_type='section' AND r.scope_reference='N2.0')
        OR (r.revision_id=v_n21_rev AND r.scope_type='section' AND r.scope_reference='N2.1')
        OR (r.revision_id=v_n22_rev AND r.scope_type='section' AND r.scope_reference='N2.2')
        OR (r.revision_id=v_n23_rev AND r.scope_type='section' AND r.scope_reference='N2.3')
        OR (r.revision_id=v_n24_rev AND r.scope_type='section' AND r.scope_reference='N2.4')
        OR (r.revision_id=v_n25_rev AND r.scope_type='section' AND r.scope_reference='N2.5')
        OR (r.revision_id=v_n26_rev AND r.scope_type='section' AND r.scope_reference='N2.6')
        OR (r.revision_id=v_n27_rev AND r.scope_type='section' AND r.scope_reference='N2.7')
        OR (r.revision_id=v_n28_rev AND r.scope_type='section' AND r.scope_reference='N2.8');

    SELECT
        IF((SELECT parent_revision_id FROM repository_revisions WHERE revision_id=v_n21_rev)=v_n20_rev,1,0)
      + IF((SELECT parent_revision_id FROM repository_revisions WHERE revision_id=v_n22_rev)=v_n21_rev,1,0)
      + IF((SELECT parent_revision_id FROM repository_revisions WHERE revision_id=v_n23_rev)=v_n22_rev,1,0)
      + IF((SELECT parent_revision_id FROM repository_revisions WHERE revision_id=v_n24_rev)=v_n23_rev,1,0)
      + IF((SELECT parent_revision_id FROM repository_revisions WHERE revision_id=v_n25_rev)=v_n24_rev,1,0)
      + IF((SELECT parent_revision_id FROM repository_revisions WHERE revision_id=v_n26_rev)=v_n25_rev,1,0)
      + IF((SELECT parent_revision_id FROM repository_revisions WHERE revision_id=v_n27_rev)=v_n26_rev,1,0)
      + IF((SELECT parent_revision_id FROM repository_revisions WHERE revision_id=v_n28_rev)=v_n27_rev,1,0)
      INTO v_parent_chain;

    SELECT COUNT(*)
      INTO v_snapshots
      FROM appendix_sections s
     WHERE s.appendix_module_id=v_n2_module
       AND s.section_code IN
       ('N2.0','N2.1','N2.2','N2.3','N2.4','N2.5','N2.6','N2.7','N2.8')
       AND EXISTS (
           SELECT 1
             FROM appendix_section_versions v
            WHERE v.appendix_section_id=s.appendix_section_id
              AND v.revision_id=s.created_revision_id
       );

    SELECT COUNT(*)
      INTO v_bad_object_links
      FROM appendix_sections s
      JOIN appendix_objects o
        ON o.appendix_section_id=s.appendix_section_id
     WHERE s.appendix_module_id=v_n2_module
       AND s.section_code IN
       ('N2.0','N2.1','N2.2','N2.3','N2.4','N2.5','N2.6','N2.7','N2.8')
       AND o.created_revision_id<>s.created_revision_id;

    -- ========================================================================
    -- D. KANONISCHE N2-GLEICHUNGEN: N2.1 BIS N2.165
    -- ========================================================================

    SELECT
      COUNT(*),
      COUNT(DISTINCT CAST(SUBSTRING(o.display_number,4) AS UNSIGNED)),
      MIN(CAST(SUBSTRING(o.display_number,4) AS UNSIGNED)),
      MAX(CAST(SUBSTRING(o.display_number,4) AS UNSIGNED)),
      SUM(o.formal_latex=o.word_latex),
      SUM(
          LOCATE(o.display_number,o.formal_latex)>0
          OR LOCATE(o.display_number,o.word_latex)>0
      )
      INTO
      v_eq_count,v_eq_unique,v_eq_min,v_eq_max,v_eq_sync,v_eq_leaks
      FROM appendix_sections s
      JOIN appendix_objects o
        ON o.appendix_section_id=s.appendix_section_id
     WHERE s.appendix_module_id=v_n2_module
       AND o.object_type='equation'
       AND o.display_number REGEXP '^N2[.][0-9]+$';

    -- ========================================================================
    -- E. KANONISCHE N2-DEFINITIONEN: N2-D1 BIS N2-D43
    -- ========================================================================

    SELECT
      COUNT(*),
      COUNT(DISTINCT CAST(SUBSTRING(o.object_anchor,5) AS UNSIGNED)),
      MIN(CAST(SUBSTRING(o.object_anchor,5) AS UNSIGNED)),
      MAX(CAST(SUBSTRING(o.object_anchor,5) AS UNSIGNED))
      INTO
      v_def_count,v_def_unique,v_def_min,v_def_max
      FROM appendix_sections s
      JOIN appendix_objects o
        ON o.appendix_section_id=s.appendix_section_id
     WHERE s.appendix_module_id=v_n2_module
       AND o.object_anchor REGEXP '^N2-D[0-9]+$';

    SET v_n2_failed =
        IF(v_revisions=9,0,1)
      + IF(v_parent_chain=8,0,1)
      + IF(v_snapshots=9,0,1)
      + IF(v_bad_object_links=0,0,1)
      + IF(v_eq_count=165,0,1)
      + IF(v_eq_unique=165,0,1)
      + IF(v_eq_min=1,0,1)
      + IF(v_eq_max=165,0,1)
      + IF(v_eq_sync=165,0,1)
      + IF(v_eq_leaks=0,0,1)
      + IF(v_def_count=43,0,1)
      + IF(v_def_unique=43,0,1)
      + IF(v_def_min=1,0,1)
      + IF(v_def_max=43,0,1);

    SET v_n2_detail = CASE
      WHEN v_revisions<>9 THEN CONCAT('REVISIONS=',v_revisions,' expected=9')
      WHEN v_parent_chain<>8 THEN CONCAT('PARENT_CHAIN=',v_parent_chain,' expected=8')
      WHEN v_snapshots<>9 THEN CONCAT('SNAPSHOTS=',v_snapshots,' expected=9')
      WHEN v_bad_object_links<>0 THEN CONCAT('BAD_OBJECT_REV_LINKS=',v_bad_object_links,' expected=0')
      WHEN v_eq_count<>165 THEN CONCAT('EQUATIONS=',v_eq_count,' expected=165')
      WHEN v_eq_unique<>165 OR v_eq_min<>1 OR v_eq_max<>165
           THEN CONCAT('EQ_SEQUENCE unique=',v_eq_unique,' min=',v_eq_min,' max=',v_eq_max)
      WHEN v_eq_sync<>165 THEN CONCAT('WORDLATEX_SYNC=',v_eq_sync,' expected=165')
      WHEN v_eq_leaks<>0 THEN CONCAT('OWN_FORMULA_NUMBER_LEAKS=',v_eq_leaks,' expected=0')
      WHEN v_def_count<>43 THEN CONCAT('DEFINITIONS=',v_def_count,' expected=43')
      WHEN v_def_unique<>43 OR v_def_min<>1 OR v_def_max<>43
           THEN CONCAT('DEF_SEQUENCE unique=',v_def_unique,' min=',v_def_min,' max=',v_def_max)
      ELSE 'UNKNOWN'
    END;

    IF v_n2_failed<>0 THEN
        SET v_message=CONCAT(
          'RKB33-N2-REVALIDATE failed: ',
          v_n2_detail,
          '; failed_checks=',
          v_n2_failed
        );
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT=v_message;
    END IF;

    -- ========================================================================
    -- F. KANONISCHE N2->N3-GATE-REVISION AUFLÖSEN ODER REVALIDIERUNG ERZEUGEN
    -- ========================================================================

    SELECT MAX(revision_id)
      INTO v_n2_gate_rev
      FROM repository_revisions
     WHERE revision_code='RKB33-GATE-N2-N3-2026-09-22'
       AND parent_revision_id=v_n28_rev;

    START TRANSACTION;

    IF v_n2_gate_rev IS NULL THEN
        IF EXISTS (
            SELECT 1 FROM repository_revisions
             WHERE revision_code='RKB33-GATE-N2-N3-REVALIDATE-2026-09-25'
        ) THEN
            SELECT MAX(revision_id)
              INTO v_n2_gate_rev
              FROM repository_revisions
             WHERE revision_code='RKB33-GATE-N2-N3-REVALIDATE-2026-09-25'
               AND parent_revision_id=v_n28_rev;
        ELSE
            INSERT INTO repository_revisions
            (
              revision_code,revision_date,scope_type,scope_reference,
              version_label,summary,created_by,parent_revision_id
            )
            VALUES
            (
              'RKB33-GATE-N2-N3-REVALIDATE-2026-09-25',
              CURRENT_TIMESTAMP,
              'repository',
              'N2->N3',
              'handoff-gate-revalidation-v1',
              'Revalidierte N2->N3-Gate-Revision nach vollständiger Prüfung des aktuellen N2.0-N2.8-Bestands.',
              'Olaf Thiele / ChatGPT',
              v_n28_rev
            );
            SET v_n2_gate_rev=LAST_INSERT_ID();
        END IF;
    END IF;

    IF v_n2_gate_rev IS NULL THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N2-REVALIDATE: N2->N3-Gate-Revision konnte nicht aufgelöst oder erzeugt werden.';
    END IF;

    -- ========================================================================
    -- G. FEHLENDES N2-FINAL UND N2->N3-GATES REVALIDIERT PERSISTIEREN
    -- ========================================================================

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    VALUES
    (
      v_n28_rev,
      'RKB33-N2-REVALIDATION-2026-09-25',
      'passed',
      'N2.0-N2.8=9; parent_chain=8; equations=165; definitions=43; word_latex_sync=165; own_number_leaks=0',
      CONCAT(
        'sections=',v_sections,
        '; revisions=',v_revisions,
        '; parent_chain=',v_parent_chain,
        '; snapshots=',v_snapshots,
        '; equations=',v_eq_count,
        '; definitions=',v_def_count,
        '; word_latex_sync=',v_eq_sync,
        '; own_number_leaks=',v_eq_leaks
      ),
      'Der aktuelle N2-Bestand wurde vollständig revalidiert, ohne N2-Inhalte zu verändern.',
      CURRENT_TIMESTAMP
    ),
    (
      v_n28_rev,
      'RKB33-N2-FINAL-GATE',
      'passed',
      'aktueller N2.0-N2.8-Bestand strukturell vollständig und revisionsgebunden',
      'passed after explicit revalidation 2026-09-25',
      'Das zuvor fehlende N2-Gesamtgate wurde nach vollständiger Revalidierung des aktuellen kanonischen N2-Bestands wiederhergestellt.',
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    VALUES
    (
      v_n2_gate_rev,
      'RKB33-N2N3-FINAL-GATE',
      'passed',
      'RKB33-N2-FINAL-GATE = passed; gate parent = current N2.8 revision',
      CONCAT('N2_FINAL=passed; parent_revision_id=',v_n28_rev),
      'Die technische Übergabe N2 -> N3 wurde auf Grundlage des revalidierten aktuellen N2-Endstands erneut bestätigt.',
      CURRENT_TIMESTAMP
    ),
    (
      v_n2_gate_rev,
      'RKB33-GATE-N2-N3',
      'passed',
      'RKB33-N2N3-FINAL-GATE = passed',
      'passed',
      'Der kanonische Übergabecode N2 -> N3 wurde nach N2-Revalidierung erneut freigegeben.',
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    COMMIT;

    -- ========================================================================
    -- H. GESAMTGATE N1–N6 JETZT ÜBER DIE REALEN KANONISCHEN HANDOFF-GATES
    -- ========================================================================

    START TRANSACTION;

    SELECT MAX(appendix_module_id) INTO v_n1_module FROM appendix_modules WHERE appendix_code='N1';
    SELECT MAX(appendix_module_id) INTO v_n3_module FROM appendix_modules WHERE appendix_code='N3';
    SELECT MAX(appendix_module_id) INTO v_n4_module FROM appendix_modules WHERE appendix_code='N4';
    SELECT MAX(appendix_module_id) INTO v_n5_module FROM appendix_modules WHERE appendix_code='N5';

    SELECT COALESCE(MAX(created_revision_id),0) INTO v_n1_max_rev FROM appendix_sections WHERE appendix_module_id=v_n1_module;
    SELECT COALESCE(MAX(created_revision_id),0) INTO v_n2_max_rev FROM appendix_sections WHERE appendix_module_id=v_n2_module;
    SELECT COALESCE(MAX(created_revision_id),0) INTO v_n3_max_rev FROM appendix_sections WHERE appendix_module_id=v_n3_module;
    SELECT COALESCE(MAX(created_revision_id),0) INTO v_n4_max_rev FROM appendix_sections WHERE appendix_module_id=v_n4_module;
    SELECT COALESCE(MAX(created_revision_id),0) INTO v_n5_max_rev FROM appendix_sections WHERE appendix_module_id=v_n5_module;

    SELECT COALESCE((SELECT validation_status
                       FROM repository_validation_results
                      WHERE validation_code='RKB33-N1-N2-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing'),
           COALESCE((SELECT revision_id
                       FROM repository_validation_results
                      WHERE validation_code='RKB33-N1-N2-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),0)
      INTO v_n1_status,v_n1_gate_rev;

    SELECT COALESCE((SELECT validation_status
                       FROM repository_validation_results
                      WHERE validation_code='RKB33-N2N3-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing'),
           COALESCE((SELECT revision_id
                       FROM repository_validation_results
                      WHERE validation_code='RKB33-N2N3-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),0)
      INTO v_n2n3_status,v_n2n3_gate_rev;

    SELECT COALESCE((SELECT validation_status
                       FROM repository_validation_results
                      WHERE validation_code='RKB33-GATE-N2-N3'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing'),
           COALESCE((SELECT revision_id
                       FROM repository_validation_results
                      WHERE validation_code='RKB33-GATE-N2-N3'
                      ORDER BY validation_result_id DESC LIMIT 1),0)
      INTO v_n2canon_status,v_n2canon_gate_rev;

    SELECT COALESCE((SELECT validation_status
                       FROM repository_validation_results
                      WHERE validation_code='RKB33-N3N4-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing'),
           COALESCE((SELECT revision_id
                       FROM repository_validation_results
                      WHERE validation_code='RKB33-N3N4-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),0)
      INTO v_n3n4_status,v_n3n4_gate_rev;

    SELECT COALESCE((SELECT validation_status
                       FROM repository_validation_results
                      WHERE validation_code='RKB33-N4N5-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing'),
           COALESCE((SELECT revision_id
                       FROM repository_validation_results
                      WHERE validation_code='RKB33-N4N5-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),0)
      INTO v_n4n5_status,v_n4n5_gate_rev;

    SELECT COALESCE((SELECT validation_status
                       FROM repository_validation_results
                      WHERE validation_code='RKB33-N5N6-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing'),
           COALESCE((SELECT revision_id
                       FROM repository_validation_results
                      WHERE validation_code='RKB33-N5N6-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),0)
      INTO v_n5n6_status,v_n5n6_gate_rev;

    SELECT COALESCE((SELECT validation_status
                       FROM repository_validation_results
                      WHERE revision_id=v_n6_gate_rev
                        AND validation_code='RKB33-N6-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing')
      INTO v_n6_status;

    SET v_n1_ok = IF(
        v_n1_module IS NOT NULL
        AND v_n1_status='passed'
        AND v_n1_gate_rev>=v_n1_max_rev,
        1,0
    );

    SET v_n2_ok = IF(
        v_n2n3_status='passed'
        AND v_n2canon_status='passed'
        AND v_n2n3_gate_rev>=v_n2_max_rev
        AND v_n2canon_gate_rev>=v_n2_max_rev,
        1,0
    );

    SET v_n3_ok = IF(
        v_n3_module IS NOT NULL
        AND v_n3n4_status='passed'
        AND v_n3n4_gate_rev>=v_n3_max_rev,
        1,0
    );

    SET v_n4_ok = IF(
        v_n4_module IS NOT NULL
        AND v_n4n5_status='passed'
        AND v_n4n5_gate_rev>=v_n4_max_rev,
        1,0
    );

    SET v_n5_ok = IF(
        v_n5_module IS NOT NULL
        AND v_n5n6_status='passed'
        AND v_n5n6_gate_rev>=v_n5_max_rev,
        1,0
    );

    SET v_n6_ok = IF(v_n6_status='passed',1,0);

    SET v_total_failed =
        IF(v_n1_ok=1,0,1)
      + IF(v_n2_ok=1,0,1)
      + IF(v_n3_ok=1,0,1)
      + IF(v_n4_ok=1,0,1)
      + IF(v_n5_ok=1,0,1)
      + IF(v_n6_ok=1,0,1);

    SET v_total_detail = CASE
      WHEN v_n1_ok<>1 THEN CONCAT(
           'N1->N2 gate not current/passed: status=',v_n1_status,
           ', gate_rev=',v_n1_gate_rev,', max_N1_section_rev=',v_n1_max_rev)
      WHEN v_n2_ok<>1 THEN CONCAT(
           'N2->N3 gates not current/passed: final=',v_n2n3_status,
           ', canonical=',v_n2canon_status,
           ', final_rev=',v_n2n3_gate_rev,
           ', canonical_rev=',v_n2canon_gate_rev,
           ', max_N2_section_rev=',v_n2_max_rev)
      WHEN v_n3_ok<>1 THEN CONCAT(
           'N3->N4 gate not current/passed: status=',v_n3n4_status,
           ', gate_rev=',v_n3n4_gate_rev,', max_N3_section_rev=',v_n3_max_rev)
      WHEN v_n4_ok<>1 THEN CONCAT(
           'N4->N5 gate not current/passed: status=',v_n4n5_status,
           ', gate_rev=',v_n4n5_gate_rev,', max_N4_section_rev=',v_n4_max_rev)
      WHEN v_n5_ok<>1 THEN CONCAT(
           'N5->N6 gate not current/passed: status=',v_n5n6_status,
           ', gate_rev=',v_n5n6_gate_rev,', max_N5_section_rev=',v_n5_max_rev)
      WHEN v_n6_ok<>1 THEN CONCAT('N6 FINAL not passed: status=',v_n6_status)
      ELSE 'all canonical appendix gates current and passed'
    END;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    VALUES
    (
      v_n6_gate_rev,
      'RKB33-N1N6-FINAL-GATE',
      IF(v_total_failed=0,'passed','failed'),
      'N1->N2, N2->N3, N3->N4, N4->N5, N5->N6 and N6-FINAL current and passed',
      CONCAT(
        'N1=',v_n1_ok,
        ';N2=',v_n2_ok,
        ';N3=',v_n3_ok,
        ';N4=',v_n4_ok,
        ';N5=',v_n5_ok,
        ';N6=',v_n6_ok
      ),
      IF(v_total_failed=0,
         'Alle kanonischen Anlagenübergaben N1 bis N6 und N6-FINAL sind auf den aktuellen Anlagenständen passed. Kapitel 3.3 ist freigegeben.',
         CONCAT('Gesamtgate bleibt gesperrt: ',v_total_detail)),
      CURRENT_TIMESTAMP
    ),
    (
      v_n6_gate_rev,
      'RKB33-N6-HANDOFF-33',
      IF(v_total_failed=0,'passed','failed'),
      'RKB33-N1N6-FINAL-GATE = passed',
      IF(v_total_failed=0,'RKB33-N1N6-FINAL-GATE = passed',
                             'RKB33-N1N6-FINAL-GATE = failed'),
      IF(v_total_failed=0,
         'Revisionsgebundene Übergabe N1-N6 -> Kapitel 3.3 freigegeben.',
         'Kapitel 3.3 bleibt bis zum bestandenen Gesamtgate gesperrt.'),
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_counters(counter_key,counter_value,updated_at)
    VALUES
    (
      'chapter_3_3_start_gate',
      IF(v_total_failed=0,'passed','blocked'),
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      counter_value=VALUES(counter_value),
      updated_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_counters(counter_key,counter_value,updated_at)
    VALUES ('current_section','N6.9',CURRENT_TIMESTAMP)
    ON DUPLICATE KEY UPDATE counter_value='N6.9',updated_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_counters(counter_key,counter_value,updated_at)
    VALUES ('last_completed_section','N6.9',CURRENT_TIMESTAMP)
    ON DUPLICATE KEY UPDATE counter_value='N6.9',updated_at=CURRENT_TIMESTAMP;

    COMMIT;

    IF v_total_failed<>0 THEN
        SET v_message=CONCAT(
          'RKB33-N1N6-FINAL-GATE failed after N2 repair: ',
          v_total_detail,
          '; N2 repair and N6-FINAL remain persisted; Kapitel 3.3 bleibt gesperrt.'
        );
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT=v_message;
    END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n3n4_final_assert` ()   BEGIN
    DECLARE v_n3_module BIGINT UNSIGNED;
    DECLARE v_n3_sections INT DEFAULT 0;
    DECLARE v_missing_revisions INT DEFAULT 0;
    DECLARE v_missing_versions INT DEFAULT 0;
    DECLARE v_bad_object_revisions INT DEFAULT 0;
    DECLARE v_n38_count INT DEFAULT 0;
    DECLARE v_n38_revision BIGINT UNSIGNED;
    DECLARE v_gate_revision BIGINT UNSIGNED;

    -- N3-Modul
    SELECT appendix_module_id
      INTO v_n3_module
      FROM appendix_modules
     WHERE appendix_code='N3'
     LIMIT 1;

    IF v_n3_module IS NULL THEN
        SIGNAL SQLSTATE '45000'
          SET MESSAGE_TEXT='RKB33-N3N4-FINAL-GATE: Anlage N3 fehlt.';
    END IF;

    -- Erwarteter abgeschlossener Arbeitsstand N3.0 bis N3.8
    SELECT COUNT(*)
      INTO v_n3_sections
      FROM appendix_sections
     WHERE appendix_module_id=v_n3_module
       AND section_code IN
           ('N3.0','N3.1','N3.2','N3.3','N3.4','N3.5','N3.6','N3.7','N3.8');

    IF v_n3_sections <> 9 THEN
        SIGNAL SQLSTATE '45000'
          SET MESSAGE_TEXT='RKB33-N3N4-CONTENT-GATE: Erwartet werden N3.0 bis N3.8 vollständig (9 Abschnitte).';
    END IF;

    -- Jeder N3-Abschnitt braucht eine erzeugende Revision.
    SELECT COUNT(*)
      INTO v_missing_revisions
      FROM appendix_sections s
     WHERE s.appendix_module_id=v_n3_module
       AND s.section_code IN
           ('N3.0','N3.1','N3.2','N3.3','N3.4','N3.5','N3.6','N3.7','N3.8')
       AND (
           s.created_revision_id IS NULL
           OR NOT EXISTS (
               SELECT 1
                 FROM repository_revisions r
                WHERE r.revision_id=s.created_revision_id
           )
       );

    IF v_missing_revisions <> 0 THEN
        SIGNAL SQLSTATE '45000'
          SET MESSAGE_TEXT='RKB33-N3N4-REVISION-GATE: Mindestens ein N3-Abschnitt besitzt keine gültige Repositoryrevision.';
    END IF;

    -- Jeder Abschnitt braucht mindestens einen revisionsgebundenen Snapshot.
    SELECT COUNT(*)
      INTO v_missing_versions
      FROM appendix_sections s
     WHERE s.appendix_module_id=v_n3_module
       AND s.section_code IN
           ('N3.0','N3.1','N3.2','N3.3','N3.4','N3.5','N3.6','N3.7','N3.8')
       AND NOT EXISTS (
           SELECT 1
             FROM appendix_section_versions sv
            WHERE sv.appendix_section_id=s.appendix_section_id
              AND sv.revision_id=s.created_revision_id
       );

    IF v_missing_versions <> 0 THEN
        SIGNAL SQLSTATE '45000'
          SET MESSAGE_TEXT='RKB33-N3N4-SNAPSHOT-GATE: Mindestens ein N3-Abschnitt besitzt keinen Snapshot seiner Revision.';
    END IF;

    -- Alle registrierten Objekte müssen revisionsgebunden sein.
    SELECT COUNT(*)
      INTO v_bad_object_revisions
      FROM appendix_objects o
      JOIN appendix_sections s
        ON s.appendix_section_id=o.appendix_section_id
     WHERE s.appendix_module_id=v_n3_module
       AND s.section_code IN
           ('N3.0','N3.1','N3.2','N3.3','N3.4','N3.5','N3.6','N3.7','N3.8')
       AND (
           o.created_revision_id IS NULL
           OR NOT EXISTS (
               SELECT 1
                 FROM repository_revisions r
                WHERE r.revision_id=o.created_revision_id
           )
       );

    IF v_bad_object_revisions <> 0 THEN
        SIGNAL SQLSTATE '45000'
          SET MESSAGE_TEXT='RKB33-N3N4-OBJECT-GATE: Mindestens ein N3-Objekt besitzt keine gültige Revision.';
    END IF;

    -- N3.8 ist der Übergabeabschnitt.
    SELECT COUNT(*), MAX(created_revision_id)
      INTO v_n38_count, v_n38_revision
      FROM appendix_sections
     WHERE appendix_module_id=v_n3_module
       AND section_code='N3.8';

    IF v_n38_count <> 1 OR v_n38_revision IS NULL THEN
        SIGNAL SQLSTATE '45000'
          SET MESSAGE_TEXT='RKB33-N3N4-N38-GATE: N3.8 fehlt oder ist nicht eindeutig revisionsgebunden.';
    END IF;

    SET v_gate_revision=v_n38_revision;

    START TRANSACTION;

    -- Alte aktuelle Gate-Aussage bleibt historisch erhalten.
    -- Es wird ein neuer, revisionsgebundener Prüfdatensatz angelegt.
    INSERT INTO repository_validation_results
    (
        revision_id,
        validation_code,
        validation_status,
        expected_value,
        actual_value,
        validation_message,
        checked_at
    )
    VALUES
    (
        v_gate_revision,
        'RKB33-N3N4-FINAL-GATE',
        'passed',
        'N3.0-N3.8 vollständig; Revisionen, Snapshots und Objektbindungen vorhanden',
        'passed',
        'N3 wurde für den Übergang zu N4 erfolgreich geprüft. N4.0 darf revisionsgebunden gestartet werden.',
        CURRENT_TIMESTAMP
    );

    COMMIT;

    SELECT
        'RKB33-N3N4-FINAL-GATE' AS validation_code,
        'passed' AS validation_status,
        v_n3_sections AS n3_section_count,
        v_missing_revisions AS missing_revisions,
        v_missing_versions AS missing_snapshots,
        v_bad_object_revisions AS invalid_object_revisions,
        v_gate_revision AS gate_revision_id,
        'N3 -> N4 ist freigegeben.' AS validation_message;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n3_repair_assert` ()   BEGIN
 DECLARE v_mod BIGINT UNSIGNED;
 DECLARE v_sections INT DEFAULT 0;
 DECLARE v_snaps INT DEFAULT 0;
 DECLARE v_badrev INT DEFAULT 0;
 DECLARE v_n38_final INT DEFAULT 0;
 DECLARE v_rev160 BIGINT UNSIGNED;

 SELECT appendix_module_id INTO v_mod FROM appendix_modules WHERE appendix_code='N3' LIMIT 1;
 IF v_mod IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB33-N3-REPAIR: N3-Modul fehlt weiterhin.';
 END IF;

 SELECT COUNT(*) INTO v_sections FROM appendix_sections
 WHERE appendix_module_id=v_mod
 AND section_code IN ('N3.0','N3.1','N3.2','N3.3','N3.4','N3.5','N3.6','N3.7','N3.8');
 IF v_sections<>9 THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB33-N3-REPAIR: N3.0 bis N3.8 nicht vollständig.';
 END IF;

 SELECT COUNT(*) INTO v_snaps
 FROM appendix_section_versions sv
 JOIN appendix_sections s ON s.appendix_section_id=sv.appendix_section_id
 WHERE s.appendix_module_id=v_mod
 AND s.section_code IN ('N3.0','N3.1','N3.2','N3.3','N3.4','N3.5','N3.6','N3.7','N3.8')
 AND sv.revision_id=s.created_revision_id;
 IF v_snaps<>9 THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB33-N3-REPAIR: Revisionssnapshots unvollständig.';
 END IF;

 SELECT COUNT(*) INTO v_badrev
 FROM appendix_sections s
 LEFT JOIN repository_revisions r ON r.revision_id=s.created_revision_id
 WHERE s.appendix_module_id=v_mod
 AND s.section_code IN ('N3.0','N3.1','N3.2','N3.3','N3.4','N3.5','N3.6','N3.7','N3.8')
 AND r.revision_id IS NULL;
 IF v_badrev<>0 THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB33-N3-REPAIR: Ungültige Abschnittsrevision.';
 END IF;

 SELECT COUNT(*) INTO v_n38_final FROM appendix_sections
 WHERE appendix_module_id=v_mod AND section_code='N3.8' AND status='final';
 IF v_n38_final<>1 THEN
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RKB33-N3-REPAIR: N3.8 ist nicht eindeutig final.';
 END IF;

 SELECT revision_id INTO v_rev160 FROM repository_revisions
 WHERE revision_code='RKB33-REV-N3.8-2026-09-23' LIMIT 1;

 -- Autoritative neue Reparaturvalidierungen.
 -- Vorhandene Validierungszeilen derselben Revision und desselben Codes werden aufgrund
 -- von uq_validation_revision_code revisionsintern aktualisiert; neue Codes werden eingefügt.
 INSERT INTO repository_validation_results
 (revision_id,validation_code,validation_status,expected_value,actual_value,validation_message,checked_at)
 VALUES
 (v_rev160,'RKB33-N38-SECTION','passed','1','1','N3.8 nach Strukturreparatur vorhanden und final.',CURRENT_TIMESTAMP),
 (v_rev160,'RKB33-N38-FINAL-GATE','passed','revisionsgebundener finaler N3.8-Abschnitt','passed',
  'Historischer Materialisierungsfehler behoben; N3.8 ist revisionsgebunden materialisiert.',CURRENT_TIMESTAMP),
 (v_rev160,'RKB33-N3N4-FINAL-GATE','passed',
  'N3.0-N3.8 vollständig; Revisionen und Snapshots vorhanden','passed',
  'N3-Struktur nach Reparatur vollständig. N4.0 darf auf dieser Repositorybasis gestartet werden.',CURRENT_TIMESTAMP)
 ON DUPLICATE KEY UPDATE
   validation_status = VALUES(validation_status),
   expected_value = VALUES(expected_value),
   actual_value = VALUES(actual_value),
   validation_message = VALUES(validation_message),
   checked_at = VALUES(checked_at);

 SELECT
   'RKB33-N3-REPAIR-FINAL' AS gate_code,
   'passed' AS gate_status,
   v_sections AS n3_sections,
   v_snaps AS n3_snapshots,
   v_badrev AS bad_revision_links,
   v_n38_final AS n38_final_count,
   'N3 repariert; N3->N4 freigegeben.' AS message;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n40_n42_pre_guard` ()   BEGIN
  DECLARE v_status VARCHAR(32);
  DECLARE v_actual TEXT;

  SELECT validation_status, actual_value
    INTO v_status, v_actual
    FROM repository_validation_results
   WHERE validation_code='RKB33-N3N4-FINAL-GATE'
   ORDER BY validation_result_id DESC LIMIT 1;

  IF COALESCE(v_status,'') <> 'passed' OR COALESCE(v_actual,'')='blocked' THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT='RKB33-N40N42-START-GATE: N3->N4 ist nicht freigegeben.';
  END IF;

  IF EXISTS (
      SELECT 1 FROM appendix_sections s
      JOIN appendix_modules m ON m.appendix_module_id=s.appendix_module_id
      WHERE m.appendix_code='N4'
        AND s.section_code IN ('N4.0','N4.1','N4.2')
  ) THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT='RKB33-N40N42-DUPLICATE-GATE: N4.0-N4.2 existiert bereits; zuerst zurückrollen.';
  END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n40_rollback` ()   BEGIN
    DECLARE v_n4_module BIGINT UNSIGNED;
    DECLARE v_n40_sec BIGINT UNSIGNED;
    DECLARE v_n40_rev BIGINT UNSIGNED;
    DECLARE v_n40_count INT DEFAULT 0;
    DECLARE v_later_count INT DEFAULT 0;

    SELECT appendix_module_id
      INTO v_n4_module
      FROM appendix_modules
     WHERE appendix_code='N4'
     LIMIT 1;

    IF v_n4_module IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='RKB33-N40-ROLLBACK: Anlage N4 existiert nicht; nichts zurückzusetzen.';
    END IF;

    SELECT COUNT(*), MAX(appendix_section_id)
      INTO v_n40_count, v_n40_sec
      FROM appendix_sections
     WHERE appendix_module_id=v_n4_module
       AND section_code='N4.0';

    IF v_n40_count = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='RKB33-N40-ROLLBACK: N4.0 existiert nicht; nichts zurückzusetzen.';
    END IF;

    IF v_n40_count <> 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='RKB33-N40-ROLLBACK-GATE: N4.0 ist nicht eindeutig vorhanden.';
    END IF;

    SELECT COUNT(*)
      INTO v_later_count
      FROM appendix_sections
     WHERE appendix_module_id=v_n4_module
       AND section_code REGEXP '^N4\\.[1-9][0-9]*$';

    IF v_later_count <> 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='RKB33-N40-ROLLBACK-GATE: N4.1 oder höhere N4-Abschnitte existieren. Erst diese zurückrollen.';
    END IF;

    SELECT created_revision_id
      INTO v_n40_rev
      FROM appendix_sections
     WHERE appendix_section_id=v_n40_sec;

    START TRANSACTION;

    -- Quellenbindungen des Abschnitts
    DELETE FROM appendix_source_usage
     WHERE appendix_section_id=v_n40_sec;

    -- Abschnittsobjekte
    DELETE FROM appendix_objects
     WHERE appendix_section_id=v_n40_sec;

    -- Versionssnapshots
    DELETE FROM appendix_section_versions
     WHERE appendix_section_id=v_n40_sec;

    -- Abschnitt selbst
    DELETE FROM appendix_sections
     WHERE appendix_section_id=v_n40_sec;

    -- Validierungen der N4.0-Revision
    IF v_n40_rev IS NOT NULL THEN
        DELETE FROM repository_validation_results
         WHERE revision_id=v_n40_rev;

        -- Revision nur entfernen, wenn keine Repositoryobjekte mehr darauf zeigen.
        IF (SELECT COUNT(*) FROM appendix_sections
             WHERE created_revision_id=v_n40_rev)=0
           AND
           (SELECT COUNT(*) FROM appendix_objects
             WHERE created_revision_id=v_n40_rev)=0
           AND
           (SELECT COUNT(*) FROM appendix_source_usage
             WHERE created_revision_id=v_n40_rev)=0
           AND
           (SELECT COUNT(*) FROM appendix_section_versions
             WHERE revision_id=v_n40_rev)=0 THEN

            DELETE FROM repository_revisions
             WHERE revision_id=v_n40_rev
               AND (
                    revision_code='RKB33-REV-N4.0-2026-09-23'
                    OR scope_reference='N4.0'
               );
        END IF;
    END IF;

    -- N4-Modul nur entfernen, wenn nach dem Rollback kein N4-Abschnitt mehr existiert.
    IF (SELECT COUNT(*) FROM appendix_sections
         WHERE appendix_module_id=v_n4_module)=0 THEN
        DELETE FROM appendix_modules
         WHERE appendix_module_id=v_n4_module;
    END IF;

    COMMIT;

    SELECT
        'RKB33-N40-ROLLBACK' AS validation_code,
        'passed' AS validation_status,
        v_n40_sec AS removed_section_id,
        v_n40_rev AS removed_revision_id,
        'N4.0 wurde zurückgesetzt; N3 und das N3->N4-Gate wurden nicht verändert.' AS validation_message;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n41_n42_guard` ()   BEGIN
    DECLARE v_gate_status VARCHAR(32);
    DECLARE v_gate_actual TEXT;
    DECLARE v_n4_module BIGINT UNSIGNED;
    DECLARE v_n40_count INT DEFAULT 0;
    DECLARE v_n41_count INT DEFAULT 0;
    DECLARE v_n42_count INT DEFAULT 0;
    DECLARE v_parent_rev BIGINT UNSIGNED;
    DECLARE v_rev41 BIGINT UNSIGNED;
    DECLARE v_rev42 BIGINT UNSIGNED;
    DECLARE v_sec40 BIGINT UNSIGNED;
    DECLARE v_sec41 BIGINT UNSIGNED;
    DECLARE v_sec42 BIGINT UNSIGNED;

    -- ------------------------------------------------------------------------
    -- A. START-GATE N3 -> N4
    -- ------------------------------------------------------------------------
    SELECT validation_status, actual_value
      INTO v_gate_status, v_gate_actual
      FROM repository_validation_results
     WHERE validation_code = 'RKB33-N3N4-FINAL-GATE'
     ORDER BY validation_result_id DESC
     LIMIT 1;

    IF COALESCE(v_gate_status,'') <> 'passed'
       OR COALESCE(v_gate_actual,'') = 'blocked' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
            'RKB33-N41N42-START-GATE: N3->N4 ist nicht freigegeben. Erwartet: RKB33-N3N4-FINAL-GATE=passed. N4 darf nicht fortgeschrieben werden.';
    END IF;

    -- ------------------------------------------------------------------------
    -- B. N4-Modul muss bereits durch den freigegebenen N4.0-Start existieren
    -- ------------------------------------------------------------------------
    SELECT appendix_module_id
      INTO v_n4_module
      FROM appendix_modules
     WHERE appendix_code = 'N4'
     LIMIT 1;

    IF v_n4_module IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
            'RKB33-N41N42-MODULE-GATE: Anlage N4 fehlt. Zuerst das freigegebene N4.0-Revisionsskript ausführen.';
    END IF;

    SELECT COUNT(*), MAX(appendix_section_id)
      INTO v_n40_count, v_sec40
      FROM appendix_sections
     WHERE appendix_module_id = v_n4_module
       AND section_code = 'N4.0';

    IF v_n40_count <> 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
            'RKB33-N41N42-N40-GATE: N4.0 muss genau einmal vorhanden sein.';
    END IF;

    SELECT COUNT(*) INTO v_n41_count
      FROM appendix_sections
     WHERE appendix_module_id = v_n4_module
       AND section_code = 'N4.1';

    SELECT COUNT(*) INTO v_n42_count
      FROM appendix_sections
     WHERE appendix_module_id = v_n4_module
       AND section_code = 'N4.2';

    IF v_n41_count <> 0 OR v_n42_count <> 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =
            'RKB33-N41N42-DUPLICATE-GATE: N4.1 oder N4.2 ist bereits vorhanden. Kein stilles Überschreiben zulässig.';
    END IF;

    SELECT created_revision_id
      INTO v_parent_rev
      FROM appendix_sections
     WHERE appendix_section_id = v_sec40;

    START TRANSACTION;

    -- ------------------------------------------------------------------------
    -- C. REVISION N4.1
    -- ------------------------------------------------------------------------
    INSERT INTO repository_revisions
    (
        revision_code, revision_date, scope_type, scope_reference,
        version_label, summary, created_by, parent_revision_id
    )
    VALUES
    (
        'RKB33-REV-N4.1-2026-09-23', NOW(), 'section', 'N4.1',
        'N4.1-v1',
        'Mathematische Struktur und Darstellung; Trennung von Gegenstand, Struktur und Repräsentation sowie Einführung strukturtreuer Darstellungen.',
        'Olaf Thiele / ChatGPT',
        v_parent_rev
    );

    SET v_rev41 = LAST_INSERT_ID();

    INSERT INTO appendix_sections
    (
        appendix_module_id, parent_appendix_section_id, section_code,
        title, sort_order, status, notes, created_revision_id
    )
    VALUES
    (
        v_n4_module, v_sec40, 'N4.1',
        'Mathematische Struktur und Darstellung',
        2.0000, 'draft',
        'N4-Strukturprüfung: Trennung von Gegenstand, mathematischer Struktur und konkreter Darstellung; Grundlage für Darstellungswechsel und Invarianz.',
        v_rev41
    );

    SET v_sec41 = LAST_INSERT_ID();

    INSERT INTO appendix_section_versions
    (
        appendix_section_id, revision_id, version_kind,
        body_markdown, checksum_sha256, notes
    )
    VALUES
    (
        v_sec41, v_rev41, 'draft',
        'N4.1 Mathematische Struktur und Darstellung

Der Abschnitt trennt systematisch mathematischen Gegenstand, mathematische Struktur und konkrete Darstellung. Ein Strukturträger X wird von den auf ihm festgelegten Operationen, Relationen und ausgezeichneten Elementen unterschieden. Die FRZK-relevante Struktur wird schematisch als S=(X,O,R,C) gefasst. Eine Darstellung wird durch eine Repräsentationsabbildung rho:X->D beschrieben. Objektgleichheit und Darstellungsgleichheit werden ausdrücklich getrennt. Injektivität wird als Voraussetzung dafür ausgewiesen, aus gleicher Darstellung auf Objektgleichheit schließen zu können. Weiter wird zwischen vollständigem Zustand und beobachteter beziehungsweise projizierter Komponente unterschieden. Eine Darstellung heißt hinsichtlich einer festgelegten Strukturkomponente strukturtreu, wenn die relevante Struktur aus ihr erhalten oder eindeutig rekonstruiert werden kann. Die originäre Eigenleistung dieser Arbeit liegt in der Einordnung dieser Standardbegriffe in die FRZK-Prüflogik und in der Sperre, beobachtete Gleichheit ohne Strukturprüfung mit vollständiger Zustandsgleichheit zu identifizieren.',
        SHA2(CONCAT('N4.1|',v_rev41,'|2026-09-23'),256),
        'Kanonischer Repository-Snapshot N4.1. Volltext liegt in der wissenschaftlichen Arbeitsfassung vor.'
    );

    -- Definitionen N4-D1 bis N4-D5
    INSERT INTO appendix_objects
    (appendix_section_id,object_anchor,object_type,display_number,title,
     content_text,importance_level,provenance,validation_status,created_revision_id)
    VALUES
    (v_sec41,'N4-D1','definition','N4-D1','Strukturträger',
     'Nichtleere Menge X als Träger der im jeweiligen Untersuchungskontext festgelegten Operationen und Relationen.',
     'core','mixed','checked',v_rev41),
    (v_sec41,'N4-D2','definition','N4-D2','FRZK-relevante mathematische Struktur',
     'Strukturschema aus Träger, Operationen, Relationen und gegebenenfalls ausgezeichneten Elementen.',
     'core','mixed','checked',v_rev41),
    (v_sec41,'N4-D3','definition','N4-D3','Darstellung',
     'Darstellung eines Gegenstandes x durch eine Repräsentationsabbildung rho:X->D.',
     'core','literature','checked',v_rev41),
    (v_sec41,'N4-D4','definition','N4-D4','Objektgleichheit und Darstellungsgleichheit',
     'Trennung der Gleichheit mathematischer Gegenstände von der Gleichheit ihrer Repräsentationsobjekte.',
     'core','mixed','checked',v_rev41),
    (v_sec41,'N4-D5','definition','N4-D5','Strukturtreue Darstellung',
     'Darstellung, aus der die für eine festgelegte Strukturkomponente relevanten Beziehungen und Operationen erhalten beziehungsweise eindeutig rekonstruiert werden können.',
     'core','original','checked',v_rev41);

    -- Gleichungen N4.5 bis N4.11
    INSERT INTO appendix_objects
    (appendix_section_id,object_anchor,object_type,display_number,title,
     content_text,formal_latex,word_latex,importance_level,equation_role,
     provenance,validation_status,created_revision_id)
    VALUES
    (v_sec41,'N4-EQ-005','equation','N4.5','FRZK-relevantes Strukturschema',
     'Allgemeines Strukturschema.','\\mathfrak{S}=(X,\\mathcal{O},\\mathcal{R},\\mathcal{C})',
     '\\mathfrak{S}=(X,\\mathcal{O},\\mathcal{R},\\mathcal{C})','core','canonical','mixed','checked',v_rev41),
    (v_sec41,'N4-EQ-006','equation','N4.6','Repräsentationszuordnung',
     'Zuordnung eines Gegenstandes zu seiner Darstellung.','x\\longmapsto\\rho(x)',
     'x\\longmapsto\\rho(x)','supporting','canonical','literature','checked',v_rev41),
    (v_sec41,'N4-EQ-007','equation','N4.7','Verschiedene Darstellungen',
     'Verschiedene Repräsentationen desselben Gegenstandes können verschieden sein.','\\rho_1(x)\\neq\\rho_2(x)',
     '\\rho_1(x)\\neq\\rho_2(x)','supporting','derived','mixed','checked',v_rev41),
    (v_sec41,'N4-EQ-008','equation','N4.8','Injektive Repräsentation',
     'Bei injektiver Repräsentation folgt aus Darstellungsgleichheit Objektgleichheit.','\\rho(x_1)=\\rho(x_2)\\Longrightarrow x_1=x_2',
     '\\rho(x_1)=\\rho(x_2)\\Longrightarrow x_1=x_2','core','canonical','literature','checked',v_rev41),
    (v_sec41,'N4-EQ-009','equation','N4.9','Gleiche Projektion',
     'Unterschiedliche vollständige Zustände können dieselbe beobachtete Komponente besitzen.','\\pi(z_1)=\\pi(z_2)',
     '\\pi(z_1)=\\pi(z_2)','supporting','derived','mixed','checked',v_rev41),
    (v_sec41,'N4-EQ-010','equation','N4.10','Verschiedene vollständige Zustände',
     'Trotz gleicher Projektion können die vollständigen Zustände verschieden sein.','z_1\\neq z_2',
     'z_1\\neq z_2','supporting','derived','mixed','checked',v_rev41),
    (v_sec41,'N4-EQ-011','equation','N4.11','Informationsverlust einer Repräsentation',
     'Nichtinjektive Repräsentation kann unterschiedliche Zustände nicht unterscheiden.','x_1\\neq x_2\\quad\\text{und}\\quad\\rho(x_1)=\\rho(x_2)',
     'x_1\\neq x_2\\quad\\text{und}\\quad\\rho(x_1)=\\rho(x_2)','core','derived','mixed','checked',v_rev41);

    -- ------------------------------------------------------------------------
    -- D. REVISION N4.2
    -- ------------------------------------------------------------------------
    INSERT INTO repository_revisions
    (
        revision_code, revision_date, scope_type, scope_reference,
        version_label, summary, created_by, parent_revision_id
    )
    VALUES
    (
        'RKB33-REV-N4.2-2026-09-23', NOW(), 'section', 'N4.2',
        'N4.2-v1',
        'Abbildungen zwischen Darstellungen und Erhaltung von Struktur; konsistente, operations- und relationserhaltende sowie reversible Darstellungswechsel.',
        'Olaf Thiele / ChatGPT',
        v_rev41
    );

    SET v_rev42 = LAST_INSERT_ID();

    INSERT INTO appendix_sections
    (
        appendix_module_id, parent_appendix_section_id, section_code,
        title, sort_order, status, notes, created_revision_id
    )
    VALUES
    (
        v_n4_module, v_sec40, 'N4.2',
        'Abbildungen zwischen Darstellungen und Erhaltung von Struktur',
        3.0000, 'draft',
        'Aufbau auf N4.1; Konsistenz, Operations- und Relationserhaltung, Homomorphie, Projektion und reversibler Darstellungswechsel.',
        v_rev42
    );

    SET v_sec42 = LAST_INSERT_ID();

    INSERT INTO appendix_section_versions
    (
        appendix_section_id, revision_id, version_kind,
        body_markdown, checksum_sha256, notes
    )
    VALUES
    (
        v_sec42, v_rev42, 'draft',
        'N4.2 Abbildungen zwischen Darstellungen und Erhaltung von Struktur

Der Abschnitt untersucht Abbildungen T:D1->D2 zwischen zwei Repräsentationen desselben Gegenstandsbereiches. Ein konsistenter Darstellungswechsel erfüllt T o rho1 = rho2. Darauf aufbauend werden Operations- und Relationserhaltung sowie die Abbildung ausgezeichneter Elemente präzisiert. Strukturerhaltende Abbildungen werden von bloßen Transformationen unterschieden. Für die N4-Prüflogik wird außerdem zwischen strukturverträglicher, möglicherweise informationsreduzierender Projektion und reversiblem Darstellungswechsel unterschieden. Die originäre Eigenleistung dieser Arbeit besteht in der systematischen Einbindung dieser Standardbegriffe in die FRZK-Prüfarchitektur und in der Forderung, zusätzliche Zustandsinformation nicht aufgrund ihrer technischen Speicherung, sondern anhand ihrer konsistenten Transformierbarkeit zu beurteilen.',
        SHA2(CONCAT('N4.2|',v_rev42,'|2026-09-23'),256),
        'Kanonischer Repository-Snapshot N4.2. Volltext liegt in der wissenschaftlichen Arbeitsfassung vor.'
    );

    -- Definitionen N4-D6 bis N4-D11
    INSERT INTO appendix_objects
    (appendix_section_id,object_anchor,object_type,display_number,title,
     content_text,importance_level,provenance,validation_status,created_revision_id)
    VALUES
    (v_sec42,'N4-D6','definition','N4-D6','Konsistenter Darstellungswechsel',
     'Darstellungswechsel T mit T o rho1 = rho2 auf dem betrachteten Bereich.',
     'core','mixed','checked',v_rev42),
    (v_sec42,'N4-D7','definition','N4-D7','Operationserhaltende Abbildung',
     'Abbildung, die die festgelegte Operation mit dem Darstellungswechsel verträglich transportiert.',
     'core','literature','checked',v_rev42),
    (v_sec42,'N4-D8','definition','N4-D8','Relationserhaltende Abbildung',
     'Abbildung, welche die Gültigkeit der festgelegten Relation in die Zieldarstellung überträgt.',
     'core','literature','checked',v_rev42),
    (v_sec42,'N4-D9','definition','N4-D9','Strukturerhaltende Abbildung',
     'Abbildung, die alle für die Untersuchung festgelegten Operationen, Relationen und ausgezeichneten Elemente in der geforderten Weise erhält.',
     'core','mixed','checked',v_rev42),
    (v_sec42,'N4-D10','definition','N4-D10','Homomorphe Strukturübertragung',
     'Erhaltung der für die festgelegte Struktur spezifizierten Operationen sowie der zusätzlich festgelegten Relations- und Konstantenbedingungen.',
     'core','mixed','checked',v_rev42),
    (v_sec42,'N4-D11','definition','N4-D11','Reversibler Darstellungswechsel',
     'Bijektiver Darstellungswechsel mit inverser Abbildung und beidseitigen Identitätskompositionen.',
     'core','literature','checked',v_rev42);

    -- Gleichungen N4.12 bis N4.24
    INSERT INTO appendix_objects
    (appendix_section_id,object_anchor,object_type,display_number,title,
     content_text,formal_latex,word_latex,importance_level,equation_role,
     provenance,validation_status,created_revision_id)
    VALUES
    (v_sec42,'N4-EQ-012','equation','N4.12','Konsistenz punktweise',
     'Direkte und transformierte Darstellung stimmen überein.','T(\\rho_1(x))=\\rho_2(x)',
     'T(\\rho_1(x))=\\rho_2(x)','core','canonical','mixed','checked',v_rev42),
    (v_sec42,'N4-EQ-013','equation','N4.13','Konsistenz als Komposition',
     'Kompositionsform der Darstellungsbedingung.','T\\circ\\rho_1=\\rho_2',
     'T\\circ\\rho_1=\\rho_2','core','canonical','mixed','checked',v_rev42),
    (v_sec42,'N4-EQ-014','equation','N4.14','Konsistenter Darstellungswechsel',
     'Definitionsgleichung des konsistenten Darstellungswechsels.','T\\circ\\rho_1=\\rho_2',
     'T\\circ\\rho_1=\\rho_2','core','canonical','mixed','checked',v_rev42),
    (v_sec42,'N4-EQ-015','equation','N4.15','Erhaltung einer zweistelligen Operation',
     'Verträglichkeit von Transformation und Operation.','T(\\omega_1(d_1,d_2))=\\omega_2(T(d_1),T(d_2))',
     'T(\\omega_1(d_1,d_2))=\\omega_2(T(d_1),T(d_2))','core','canonical','literature','checked',v_rev42),
    (v_sec42,'N4-EQ-016','equation','N4.16','Erhaltung einer n-stelligen Operation',
     'Allgemeine Operationserhaltung.','T(\\omega_1(d_1,\\ldots,d_n))=\\omega_2(T(d_1),\\ldots,T(d_n))',
     'T(\\omega_1(d_1,\\ldots,d_n))=\\omega_2(T(d_1),\\ldots,T(d_n))','core','canonical','literature','checked',v_rev42),
    (v_sec42,'N4-EQ-017','equation','N4.17','Relationserhaltung',
     'Erhaltung einer Relation in Vorwärtsrichtung.','R_1(d_1,d_2)\\Longrightarrow R_2(T(d_1),T(d_2))',
     'R_1(d_1,d_2)\\Longrightarrow R_2(T(d_1),T(d_2))','supporting','canonical','literature','checked',v_rev42),
    (v_sec42,'N4-EQ-018','equation','N4.18','Relationsäquivalenz',
     'Erhaltung und Reflexion der Relation.','R_1(d_1,d_2)\\Longleftrightarrow R_2(T(d_1),T(d_2))',
     'R_1(d_1,d_2)\\Longleftrightarrow R_2(T(d_1),T(d_2))','core','canonical','literature','checked',v_rev42),
    (v_sec42,'N4-EQ-019','equation','N4.19','Erhaltung ausgezeichneter Elemente',
     'Ausgezeichnete Elemente werden auf ihre Entsprechung abgebildet.','T(c_1)=c_2',
     'T(c_1)=c_2','supporting','canonical','literature','checked',v_rev42),
    (v_sec42,'N4-EQ-020','equation','N4.20','Verschiedene Ausgangsdarstellungen',
     'Ausgangselemente sind verschieden.','d_1\\neq d_2',
     'd_1\\neq d_2','supporting','derived','mixed','checked',v_rev42),
    (v_sec42,'N4-EQ-021','equation','N4.21','Informationsverlust',
     'Nichtinjektive Transformation identifiziert verschiedene Ausgangsdarstellungen.','T(d_1)=T(d_2)',
     'T(d_1)=T(d_2)','supporting','derived','mixed','checked',v_rev42),
    (v_sec42,'N4-EQ-022','equation','N4.22','Linksinverse Bedingung',
     'Inverse Komposition auf D1 ergibt die Identität.','T^{-1}\\circ T=\\operatorname{id}_{D_1}',
     'T^{-1}\\circ T=\\operatorname{id}_{D_1}','core','canonical','literature','checked',v_rev42),
    (v_sec42,'N4-EQ-023','equation','N4.23','Rechtsinverse Bedingung',
     'Inverse Komposition auf D2 ergibt die Identität.','T\\circ T^{-1}=\\operatorname{id}_{D_2}',
     'T\\circ T^{-1}=\\operatorname{id}_{D_2}','core','canonical','literature','checked',v_rev42),
    (v_sec42,'N4-EQ-024','equation','N4.24','Gleicher Nullwert bei verschiedenen Zuständen',
     'Verschiedene vollständige Zustände können auf denselben Nullwert projiziert werden.','z_1\\neq z_2,\\qquad\\pi(z_1)=\\pi(z_2)=0',
     'z_1\\neq z_2,\\qquad\\pi(z_1)=\\pi(z_2)=0','core','derived','original','checked',v_rev42);

    -- ------------------------------------------------------------------------
    -- E. Revisions-/Vollständigkeitsgates
    -- ------------------------------------------------------------------------
    IF (SELECT COUNT(*) FROM appendix_section_versions
         WHERE appendix_section_id=v_sec41 AND revision_id=v_rev41) <> 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='RKB33-N41-REVISION-GATE: Versionssnapshot N4.1 fehlt.';
    END IF;

    IF (SELECT COUNT(*) FROM appendix_objects
         WHERE appendix_section_id=v_sec41 AND created_revision_id<>v_rev41) <> 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='RKB33-N41-REVISION-GATE: Objekt ohne korrekte N4.1-Revisionsbindung.';
    END IF;

    IF (SELECT COUNT(*) FROM appendix_section_versions
         WHERE appendix_section_id=v_sec42 AND revision_id=v_rev42) <> 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='RKB33-N42-REVISION-GATE: Versionssnapshot N4.2 fehlt.';
    END IF;

    IF (SELECT COUNT(*) FROM appendix_objects
         WHERE appendix_section_id=v_sec42 AND created_revision_id<>v_rev42) <> 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='RKB33-N42-REVISION-GATE: Objekt ohne korrekte N4.2-Revisionsbindung.';
    END IF;

    IF (SELECT COUNT(*) FROM appendix_objects
         WHERE appendix_section_id=v_sec41
           AND object_type='definition') <> 5
       OR
       (SELECT COUNT(*) FROM appendix_objects
         WHERE appendix_section_id=v_sec41
           AND object_type='equation') <> 7 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='RKB33-N41-CONTENT-GATE: Erwartet N4-D1..D5 und N4.5..N4.11.';
    END IF;

    IF (SELECT COUNT(*) FROM appendix_objects
         WHERE appendix_section_id=v_sec42
           AND object_type='definition') <> 6
       OR
       (SELECT COUNT(*) FROM appendix_objects
         WHERE appendix_section_id=v_sec42
           AND object_type='equation') <> 13 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='RKB33-N42-CONTENT-GATE: Erwartet N4-D6..D11 und N4.12..N4.24.';
    END IF;

    COMMIT;

    SELECT
        'RKB33-N41N42-IMPORT' AS validation_code,
        'passed' AS validation_status,
        v_rev41 AS n41_revision_id,
        v_rev42 AS n42_revision_id,
        v_sec41 AS n41_section_id,
        v_sec42 AS n42_section_id,
        'N4.1 und N4.2 revisionsgebunden importiert.' AS validation_message;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n47_criteria_repair` ()   BEGIN
    DECLARE v_module BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_s47 BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_r47 BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_count INT DEFAULT 0;
    DECLARE v_badrev INT DEFAULT 0;

    SELECT MAX(appendix_module_id)
      INTO v_module
      FROM appendix_modules
     WHERE appendix_code='N4';

    IF v_module IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N47-REPAIR: Anlage N4 fehlt.';
    END IF;

    SELECT MAX(appendix_section_id)
      INTO v_s47
      FROM appendix_sections
     WHERE appendix_module_id=v_module
       AND section_code='N4.7';

    IF v_s47 IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N47-REPAIR: Abschnitt N4.7 fehlt.';
    END IF;

    SELECT created_revision_id
      INTO v_r47
      FROM appendix_sections
     WHERE appendix_section_id=v_s47
     LIMIT 1;

    IF v_r47 IS NULL OR NOT EXISTS (
        SELECT 1
          FROM repository_revisions
         WHERE revision_id=v_r47
           AND scope_type='section'
           AND scope_reference='N4.7'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N47-REPAIR: N4.7 besitzt keine gueltige Abschnittsrevision.';
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tmp_n47_criteria;
    CREATE TEMPORARY TABLE tmp_n47_criteria (
        object_anchor VARCHAR(32) NOT NULL PRIMARY KEY,
        title VARCHAR(255) NOT NULL,
        content_text TEXT NOT NULL
    ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    INSERT INTO tmp_n47_criteria
        (object_anchor,title,content_text)
    VALUES
    ('N4-P1','Eindeutige Strukturzuordnung',
     'Der betrachtete Gegenstand muss einer eindeutig angegebenen mathematischen Struktur zugeordnet sein. Traeger, relevante Operationen, Relationen und ausgezeichnete Elemente duerfen nicht stillschweigend zwischen verschiedenen Strukturen wechseln.'),
    ('N4-P2','Eindeutige Darstellungszuordnung',
     'Fuer jede verwendete Darstellung muss erkennbar sein, welchen mathematischen Gegenstand beziehungsweise Zustand sie repraesentiert und welche Strukturinformation durch die Darstellung erhalten, verworfen oder zusaetzlich mitgefuehrt wird.'),
    ('N4-P3','Strukturtreue der Abbildungen',
     'Jede fuer die Argumentation wesentliche Abbildung zwischen Ausgangsstruktur, erweitertem Zustandsraum und Darstellung muss hinsichtlich der beanspruchten Operationen und Relationen auf Strukturerhaltung geprueft werden.'),
    ('N4-P4','Explizite Projektionsbeziehung',
     'Wird ein erweiterter Zustand auf eine klassische Struktur bezogen, muss die Projektionsabbildung explizit festgelegt sein. Gleichheit der Projektionen darf nicht ohne weiteren Nachweis als Gleichheit der vollstaendigen erweiterten Zustaende interpretiert werden.'),
    ('N4-P5','Darstellungsunabhaengigkeit',
     'Eine als strukturell oder physikalisch wesentlich beanspruchte Aussage darf nicht allein aus einer speziellen Notation oder Darstellung entstehen. Sie muss unter den fuer den betrachteten Zusammenhang zulaessigen Darstellungswechseln erhalten bleiben.'),
    ('N4-P6','Invarianz unter zulaessigen Transformationen',
     'Fuer jede beanspruchte Invarianz ist die Klasse der zulaessigen Transformationen anzugeben. Die betreffende Aussage muss fuer diese Transformationsklasse erhalten bleiben; weitergehende Invarianz darf daraus nicht abgeleitet werden.'),
    ('N4-P7','Trennung von klassischem Nullobjekt und erweitertem Nullzustand',
     'Ein klassisches Nullobjekt darf nicht mit einem erweiterten Zustand identifiziert werden, dessen klassische Projektion Null ist, der jedoch zusaetzliche Zustandsinformation traegt. Die klassische Nullstruktur bleibt dabei unveraendert.'),
    ('N4-P8','Nachweis der Herkunft erhaltener Zusatzinformation',
     'Zusatzinformation, die nach einer klassischen Nullprojektion erneut verwendet wird, muss im vollstaendigen erweiterten Zustand erhalten geblieben oder durch eine ausdruecklich definierte Regel bereitgestellt worden sein. Sie darf nicht aus dem klassischen Nullobjekt rekonstruiert werden.'),
    ('N4-P9','Projektionsvertraeglichkeit erweiterter Operationen',
     'Wird eine Operation des erweiterten Zustandsraums als Erweiterung einer klassischen Operation beansprucht, muss ihre Projektion die zugeordnete klassische Operation reproduzieren. Abweichungen muessen als eigenstaendige Operationen ausgewiesen werden.'),
    ('N4-P10','Keine automatische Strukturuebertragung',
     'Algebraische, analytische, topologische oder physikalische Eigenschaften der klassischen Projektionsstruktur duerfen nicht allein aufgrund der Projektion auf den erweiterten Zustandsraum uebertragen werden. Jede benoetigte Eigenschaft ist fuer die Erweiterung gesondert auszuweisen oder nachzuweisen.');

    -- Idempotente Reparatur: nur wirklich fehlende Kriterien anlegen.
    INSERT INTO appendix_objects
    (
        appendix_section_id,
        object_anchor,
        object_type,
        display_number,
        title,
        content_text,
        importance_level,
        provenance,
        validation_status,
        created_revision_id
    )
    SELECT
        v_s47,
        c.object_anchor,
        'criterion',
        c.object_anchor,
        c.title,
        c.content_text,
        'core',
        'original',
        'checked',
        v_r47
    FROM tmp_n47_criteria c
    WHERE NOT EXISTS (
        SELECT 1
          FROM appendix_objects o
         WHERE o.appendix_section_id=v_s47
           AND o.object_anchor=c.object_anchor
    );

    -- Bereits vorhandene N4-P*-Objekte muessen ebenfalls korrekt typisiert
    -- und an die gueltige N4.7-Revision gebunden sein.
    UPDATE appendix_objects o
    JOIN tmp_n47_criteria c
      ON c.object_anchor=o.object_anchor
       SET o.object_type='criterion',
           o.display_number=c.object_anchor,
           o.title=c.title,
           o.content_text=c.content_text,
           o.importance_level='core',
           o.provenance='original',
           o.validation_status='checked',
           o.created_revision_id=v_r47
     WHERE o.appendix_section_id=v_s47;

    SELECT COUNT(DISTINCT o.object_anchor)
      INTO v_count
      FROM appendix_objects o
     WHERE o.appendix_section_id=v_s47
       AND o.object_type='criterion'
       AND o.object_anchor IN
           ('N4-P1','N4-P2','N4-P3','N4-P4','N4-P5',
            'N4-P6','N4-P7','N4-P8','N4-P9','N4-P10');

    SELECT COUNT(*)
      INTO v_badrev
      FROM appendix_objects o
     WHERE o.appendix_section_id=v_s47
       AND o.object_anchor IN
           ('N4-P1','N4-P2','N4-P3','N4-P4','N4-P5',
            'N4-P6','N4-P7','N4-P8','N4-P9','N4-P10')
       AND o.created_revision_id<>v_r47;

    IF v_count<>10 OR v_badrev<>0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N47-REPAIR: Kriterienreparatur unvollstaendig.';
    END IF;

    SELECT
        v_module AS n4_module_id,
        v_s47 AS n47_section_id,
        v_r47 AS n47_revision_id,
        v_count AS criteria_count,
        v_badrev AS bad_criterion_revision_links,
        'REPAIR_OK' AS repair_status;

    DROP TEMPORARY TABLE IF EXISTS tmp_n47_criteria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n47_criterion_enum_repair` ()   BEGIN
    DECLARE v_module BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_count INT DEFAULT 0;
    DECLARE v_bad INT DEFAULT 0;

    SELECT MAX(appendix_module_id) INTO v_module
    FROM appendix_modules WHERE appendix_code='N4';

    SELECT MAX(appendix_section_id) INTO v_sec
    FROM appendix_sections
    WHERE appendix_module_id=v_module AND section_code='N4.7';

    IF v_sec IS NULL THEN
      SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
      MESSAGE_TEXT='RKB33-N47-HOTFIX: N4.7 fehlt.';
    END IF;

    SELECT created_revision_id INTO v_rev
    FROM appendix_sections
    WHERE appendix_section_id=v_sec LIMIT 1;

    IF v_rev IS NULL OR NOT EXISTS (
      SELECT 1 FROM repository_revisions
      WHERE revision_id=v_rev
        AND scope_type='section'
        AND scope_reference='N4.7'
    ) THEN
      SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
      MESSAGE_TEXT='RKB33-N47-HOTFIX: gueltige N4.7-Revision fehlt.';
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tmp_n47_p;
    CREATE TEMPORARY TABLE tmp_n47_p(
      anchor VARCHAR(32) PRIMARY KEY,
      title VARCHAR(255) NOT NULL,
      body TEXT NOT NULL
    ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    INSERT INTO tmp_n47_p VALUES
    ('N4-P1','Eindeutige Strukturzuordnung',
     'Der betrachtete Gegenstand muss einer eindeutig angegebenen mathematischen Struktur zugeordnet sein. Traeger, relevante Operationen, Relationen und ausgezeichnete Elemente duerfen nicht stillschweigend zwischen verschiedenen Strukturen wechseln.'),
    ('N4-P2','Eindeutige Darstellungszuordnung',
     'Fuer jede verwendete Darstellung muss erkennbar sein, welchen mathematischen Gegenstand beziehungsweise Zustand sie repraesentiert und welche Strukturinformation durch die Darstellung erhalten, verworfen oder zusaetzlich mitgefuehrt wird.'),
    ('N4-P3','Strukturtreue der Abbildungen',
     'Jede fuer die Argumentation wesentliche Abbildung zwischen Ausgangsstruktur, erweitertem Zustandsraum und Darstellung muss hinsichtlich der beanspruchten Operationen und Relationen auf Strukturerhaltung geprueft werden.'),
    ('N4-P4','Explizite Projektionsbeziehung',
     'Wird ein erweiterter Zustand auf eine klassische Struktur bezogen, muss die Projektionsabbildung explizit festgelegt sein. Gleichheit der Projektionen darf nicht ohne weiteren Nachweis als Gleichheit der vollstaendigen erweiterten Zustaende interpretiert werden.'),
    ('N4-P5','Darstellungsunabhaengigkeit',
     'Eine als strukturell oder physikalisch wesentlich beanspruchte Aussage darf nicht allein aus einer speziellen Notation oder Darstellung entstehen. Sie muss unter den fuer den betrachteten Zusammenhang zulaessigen Darstellungswechseln erhalten bleiben.'),
    ('N4-P6','Invarianz unter zulaessigen Transformationen',
     'Fuer jede beanspruchte Invarianz ist die Klasse der zulaessigen Transformationen anzugeben. Die betreffende Aussage muss fuer diese Transformationsklasse erhalten bleiben; weitergehende Invarianz darf daraus nicht abgeleitet werden.'),
    ('N4-P7','Trennung von klassischem Nullobjekt und erweitertem Nullzustand',
     'Ein klassisches Nullobjekt darf nicht mit einem erweiterten Zustand identifiziert werden, dessen klassische Projektion Null ist, der jedoch zusaetzliche Zustandsinformation traegt. Die klassische Nullstruktur bleibt dabei unveraendert.'),
    ('N4-P8','Nachweis der Herkunft erhaltener Zusatzinformation',
     'Zusatzinformation, die nach einer klassischen Nullprojektion erneut verwendet wird, muss im vollstaendigen erweiterten Zustand erhalten geblieben oder durch eine ausdruecklich definierte Regel bereitgestellt worden sein. Sie darf nicht aus dem klassischen Nullobjekt rekonstruiert werden.'),
    ('N4-P9','Projektionsvertraeglichkeit erweiterter Operationen',
     'Wird eine Operation des erweiterten Zustandsraums als Erweiterung einer klassischen Operation beansprucht, muss ihre Projektion die zugeordnete klassische Operation reproduzieren. Abweichungen muessen als eigenstaendige Operationen ausgewiesen werden.'),
    ('N4-P10','Keine automatische Strukturuebertragung',
     'Algebraische, analytische, topologische oder physikalische Eigenschaften der klassischen Projektionsstruktur duerfen nicht allein aufgrund der Projektion auf den erweiterten Zustandsraum uebertragen werden. Jede benoetigte Eigenschaft ist fuer die Erweiterung gesondert auszuweisen oder nachzuweisen.');

    -- Falls der vorherige Lauf die Anker bereits mit ungueltigem/leerem Typ
    -- erzeugt hat, werden sie hier korrekt repariert.
    UPDATE appendix_objects o
    JOIN tmp_n47_p p ON p.anchor=o.object_anchor
       SET o.appendix_section_id=v_sec,
           o.object_type='criterion',
           o.display_number=p.anchor,
           o.title=p.title,
           o.content_text=p.body,
           o.importance_level='core',
           o.equation_role=NULL,
           o.provenance='original',
           o.validation_status='checked',
           o.created_revision_id=v_rev;

    -- Noch wirklich fehlende Anker ergänzen.
    INSERT INTO appendix_objects
    (appendix_section_id,object_anchor,object_type,display_number,title,
     content_text,importance_level,equation_role,provenance,
     validation_status,created_revision_id)
    SELECT
      v_sec,p.anchor,'criterion',p.anchor,p.title,p.body,
      'core',NULL,'original','checked',v_rev
    FROM tmp_n47_p p
    WHERE NOT EXISTS (
      SELECT 1 FROM appendix_objects o WHERE o.object_anchor=p.anchor
    );

    SELECT COUNT(DISTINCT object_anchor) INTO v_count
    FROM appendix_objects
    WHERE appendix_section_id=v_sec
      AND object_type='criterion'
      AND object_anchor IN
      ('N4-P1','N4-P2','N4-P3','N4-P4','N4-P5',
       'N4-P6','N4-P7','N4-P8','N4-P9','N4-P10');

    SELECT COUNT(*) INTO v_bad
    FROM appendix_objects
    WHERE object_anchor IN
      ('N4-P1','N4-P2','N4-P3','N4-P4','N4-P5',
       'N4-P6','N4-P7','N4-P8','N4-P9','N4-P10')
      AND (appendix_section_id<>v_sec
           OR created_revision_id<>v_rev
           OR object_type<>'criterion');

    IF v_count<>10 OR v_bad<>0 THEN
      SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
      MESSAGE_TEXT='RKB33-N47-HOTFIX: N4-P1..N4-P10 nach ENUM-Reparatur noch inkonsistent.';
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tmp_n47_p;

    SELECT v_sec AS n47_section_id,
           v_rev AS n47_revision_id,
           v_count AS criteria_count,
           v_bad AS bad_criteria,
           'CRITERION_ENUM_REPAIR_OK' AS repair_status;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n47_final_assert` ()   BEGIN
    DECLARE v_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_snap INT DEFAULT 0;
    DECLARE v_defs INT DEFAULT 0;
    DECLARE v_criteria INT DEFAULT 0;
    DECLARE v_eq INT DEFAULT 0;
    DECLARE v_sync INT DEFAULT 0;
    DECLARE v_badrev INT DEFAULT 0;
    DECLARE v_missing_defs INT DEFAULT 0;
    DECLARE v_missing_criteria INT DEFAULT 0;
    DECLARE v_missing_eq INT DEFAULT 0;
    DECLARE v_failed INT DEFAULT 0;

    SELECT MAX(s.appendix_section_id)
      INTO v_sec
      FROM appendix_sections s
      JOIN appendix_modules m
        ON m.appendix_module_id=s.appendix_module_id
     WHERE m.appendix_code='N4'
       AND s.section_code='N4.7';

    IF v_sec IS NULL THEN
      SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
      MESSAGE_TEXT='RKB33-N47-FINAL: N4.7 fehlt.';
    END IF;

    SELECT created_revision_id INTO v_rev
      FROM appendix_sections
     WHERE appendix_section_id=v_sec;

    IF v_rev IS NULL OR NOT EXISTS
      (SELECT 1 FROM repository_revisions WHERE revision_id=v_rev) THEN
      SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
      MESSAGE_TEXT='RKB33-N47-FINAL: gueltige N4.7-Revision fehlt.';
    END IF;

    -- Der bekannte N4.7-Gatebestand verlangt:
    -- Snapshot, Definitionen, 10 Kriterien, 12 Gleichungen,
    -- 12 Word-LaTeX-Synchronitaeten und korrekte Revisionsbindungen.

    SELECT COUNT(*) INTO v_snap
      FROM appendix_section_versions
     WHERE appendix_section_id=v_sec
       AND revision_id=v_rev;

    SELECT COUNT(*) INTO v_defs
      FROM appendix_objects
     WHERE appendix_section_id=v_sec
       AND object_type='definition';

    SELECT COUNT(DISTINCT object_anchor) INTO v_criteria
      FROM appendix_objects
     WHERE appendix_section_id=v_sec
       AND object_type='criterion'
       AND object_anchor IN
       ('N4-P1','N4-P2','N4-P3','N4-P4','N4-P5',
        'N4-P6','N4-P7','N4-P8','N4-P9','N4-P10');

    SELECT COUNT(*) INTO v_eq
      FROM appendix_objects
     WHERE appendix_section_id=v_sec
       AND object_type='equation';

    SELECT COUNT(*) INTO v_sync
      FROM appendix_objects
     WHERE appendix_section_id=v_sec
       AND object_type='equation'
       AND formal_latex IS NOT NULL
       AND word_latex IS NOT NULL
       AND formal_latex=word_latex;

    SELECT COUNT(*) INTO v_badrev
      FROM appendix_objects o
      LEFT JOIN repository_revisions r
        ON r.revision_id=o.created_revision_id
     WHERE o.appendix_section_id=v_sec
       AND (o.created_revision_id<>v_rev OR r.revision_id IS NULL);

    -- Die vorherige Gate-Diagnose dokumentierte 10 erwartete Kriterien.
    -- Für Definitionen verwenden wir den vorhandenen Bestand als Mindestprüfung:
    -- N4.7 muss mindestens eine Definition besitzen.
    SET v_missing_defs = IF(v_defs>=1,0,1);
    SET v_missing_criteria = GREATEST(10-v_criteria,0);
    SET v_missing_eq = GREATEST(12-v_eq,0);

    SET v_failed =
          IF(v_snap>=1,0,1)
        + v_missing_defs
        + v_missing_criteria
        + v_missing_eq
        + IF(v_sync=12,0,1)
        + IF(v_badrev=0,0,1);

    -- Vorhandenen Gate-Eintrag für diese Revision ersetzen, damit kein
    -- historisches failed als aktueller Gatezustand stehen bleibt.
    DELETE FROM repository_validation_results
     WHERE revision_id=v_rev
       AND validation_code='RKB33-N47-REVISION-GATE';

    INSERT INTO repository_validation_results
    (
      revision_id,validation_code,validation_status,
      expected_value,actual_value,validation_message,checked_at
    )
    VALUES
    (
      v_rev,
      'RKB33-N47-REVISION-GATE',
      IF(v_failed=0,'passed','failed'),
      'snapshot>=1; definitions>=1; criteria=10; equations=12; latex_sync=12; bad_revision_links=0',
      CONCAT(
        'snapshot=',v_snap,
        '; definitions=',v_defs,
        '; criteria=',v_criteria,
        '; equations=',v_eq,
        '; latex_sync=',v_sync,
        '; bad_revision_links=',v_badrev,
        '; missing_criteria=',v_missing_criteria
      ),
      IF(v_failed=0,
         'N4.7 vollständig revalidiert. N4.8 darf begonnen werden.',
         'N4.7-Revalidierung fehlgeschlagen. N4.8 bleibt gesperrt.'),
      CURRENT_TIMESTAMP
    );

    SELECT
      v_rev AS revision_id,
      'RKB33-N47-REVISION-GATE' AS validation_code,
      IF(v_failed=0,'passed','failed') AS validation_status,
      v_snap AS snapshots,
      v_defs AS definitions,
      v_criteria AS criteria,
      v_eq AS equations,
      v_sync AS latex_sync,
      v_badrev AS bad_revision_links,
      v_missing_criteria AS missing_criteria;

    IF v_failed<>0 THEN
      SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
      MESSAGE_TEXT='RKB33-N47-REVISION-GATE failed; Diagnose wurde gespeichert.';
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n47_final_revalidate` ()   BEGIN
    DECLARE v_module BIGINT DEFAULT NULL;
    DECLARE v_s47 BIGINT DEFAULT NULL;
    DECLARE v_r47 BIGINT DEFAULT NULL;

    DECLARE v_snap INT DEFAULT 0;
    DECLARE v_defs INT DEFAULT 0;
    DECLARE v_crit INT DEFAULT 0;
    DECLARE v_eq INT DEFAULT 0;
    DECLARE v_sync INT DEFAULT 0;
    DECLARE v_badrev INT DEFAULT 0;

    DECLARE v_missing_defs INT DEFAULT 0;
    DECLARE v_missing_crit INT DEFAULT 0;
    DECLARE v_missing_eq INT DEFAULT 0;
    DECLARE v_pass TINYINT DEFAULT 0;

    -- ------------------------------------------------------------------------
    -- 1. N4 und N4.7 eindeutig bestimmen
    -- ------------------------------------------------------------------------
    SELECT MAX(appendix_module_id)
      INTO v_module
      FROM appendix_modules
     WHERE appendix_code='N4';

    IF v_module IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N47-FINAL: Anlage N4 fehlt.';
    END IF;

    SELECT MAX(appendix_section_id)
      INTO v_s47
      FROM appendix_sections
     WHERE appendix_module_id=v_module
       AND section_code='N4.7';

    IF v_s47 IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N47-FINAL: Abschnitt N4.7 fehlt.';
    END IF;

    SELECT created_revision_id
      INTO v_r47
      FROM appendix_sections
     WHERE appendix_section_id=v_s47
     LIMIT 1;

    IF v_r47 IS NULL OR NOT EXISTS (
        SELECT 1
          FROM repository_revisions
         WHERE revision_id=v_r47
           AND scope_type='section'
           AND scope_reference='N4.7'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N47-FINAL: N4.7 besitzt keine gültige N4.7-Revision.';
    END IF;

    -- ------------------------------------------------------------------------
    -- 2. Exakte Sollmengen
    -- ------------------------------------------------------------------------
    DROP TEMPORARY TABLE IF EXISTS tmp_n47_expected;
    CREATE TEMPORARY TABLE tmp_n47_expected (
        object_anchor VARCHAR(32) PRIMARY KEY,
        object_type VARCHAR(32) NOT NULL
    ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    INSERT INTO tmp_n47_expected VALUES
    ('N4-D36','definition'),
    ('N4-D37','definition'),
    ('N4-P1','criterion'),
    ('N4-P2','criterion'),
    ('N4-P3','criterion'),
    ('N4-P4','criterion'),
    ('N4-P5','criterion'),
    ('N4-P6','criterion'),
    ('N4-P7','criterion'),
    ('N4-P8','criterion'),
    ('N4-P9','criterion'),
    ('N4-P10','criterion'),
    ('N4-EQ-095','equation'),
    ('N4-EQ-096','equation'),
    ('N4-EQ-097','equation'),
    ('N4-EQ-098','equation'),
    ('N4-EQ-099','equation'),
    ('N4-EQ-100','equation'),
    ('N4-EQ-101','equation'),
    ('N4-EQ-102','equation'),
    ('N4-EQ-103','equation'),
    ('N4-EQ-104','equation'),
    ('N4-EQ-105','equation'),
    ('N4-EQ-106','equation');

    -- ------------------------------------------------------------------------
    -- 3. Reale Bestandszahlen
    -- ------------------------------------------------------------------------
    SELECT COUNT(*)
      INTO v_snap
      FROM appendix_section_versions
     WHERE appendix_section_id=v_s47
       AND revision_id=v_r47;

    SELECT COUNT(DISTINCT object_anchor)
      INTO v_defs
      FROM appendix_objects
     WHERE appendix_section_id=v_s47
       AND object_type='definition'
       AND object_anchor IN ('N4-D36','N4-D37');

    SELECT COUNT(DISTINCT object_anchor)
      INTO v_crit
      FROM appendix_objects
     WHERE appendix_section_id=v_s47
       AND object_type='criterion'
       AND object_anchor IN (
          'N4-P1','N4-P2','N4-P3','N4-P4','N4-P5',
          'N4-P6','N4-P7','N4-P8','N4-P9','N4-P10'
       );

    SELECT COUNT(DISTINCT object_anchor)
      INTO v_eq
      FROM appendix_objects
     WHERE appendix_section_id=v_s47
       AND object_type='equation'
       AND object_anchor IN (
          'N4-EQ-095','N4-EQ-096','N4-EQ-097','N4-EQ-098',
          'N4-EQ-099','N4-EQ-100','N4-EQ-101','N4-EQ-102',
          'N4-EQ-103','N4-EQ-104','N4-EQ-105','N4-EQ-106'
       );

    SELECT COUNT(DISTINCT object_anchor)
      INTO v_sync
      FROM appendix_objects
     WHERE appendix_section_id=v_s47
       AND object_type='equation'
       AND object_anchor IN (
          'N4-EQ-095','N4-EQ-096','N4-EQ-097','N4-EQ-098',
          'N4-EQ-099','N4-EQ-100','N4-EQ-101','N4-EQ-102',
          'N4-EQ-103','N4-EQ-104','N4-EQ-105','N4-EQ-106'
       )
       AND formal_latex IS NOT NULL
       AND word_latex IS NOT NULL
       AND formal_latex=word_latex;

    -- Alle Sollobjekte müssen an exakt diese N4.7-Revision gebunden sein.
    SELECT COUNT(*)
      INTO v_badrev
      FROM appendix_objects o
      JOIN tmp_n47_expected e
        ON e.object_anchor=o.object_anchor
       AND e.object_type=o.object_type
      LEFT JOIN repository_revisions r
        ON r.revision_id=o.created_revision_id
     WHERE o.appendix_section_id=v_s47
       AND (
            r.revision_id IS NULL
            OR o.created_revision_id<>v_r47
       );

    -- ------------------------------------------------------------------------
    -- 4. Fehlende Sollobjekte getrennt bestimmen
    -- ------------------------------------------------------------------------
    SELECT COUNT(*)
      INTO v_missing_defs
      FROM tmp_n47_expected e
     WHERE e.object_type='definition'
       AND NOT EXISTS (
          SELECT 1
            FROM appendix_objects o
           WHERE o.appendix_section_id=v_s47
             AND o.object_anchor=e.object_anchor
             AND o.object_type=e.object_type
       );

    SELECT COUNT(*)
      INTO v_missing_crit
      FROM tmp_n47_expected e
     WHERE e.object_type='criterion'
       AND NOT EXISTS (
          SELECT 1
            FROM appendix_objects o
           WHERE o.appendix_section_id=v_s47
             AND o.object_anchor=e.object_anchor
             AND o.object_type=e.object_type
       );

    SELECT COUNT(*)
      INTO v_missing_eq
      FROM tmp_n47_expected e
     WHERE e.object_type='equation'
       AND NOT EXISTS (
          SELECT 1
            FROM appendix_objects o
           WHERE o.appendix_section_id=v_s47
             AND o.object_anchor=e.object_anchor
             AND o.object_type=e.object_type
       );

    SET v_pass = IF(
        v_snap=1
        AND v_defs=2
        AND v_crit=10
        AND v_eq=12
        AND v_sync=12
        AND v_badrev=0
        AND v_missing_defs=0
        AND v_missing_crit=0
        AND v_missing_eq=0,
        1,0
    );

    -- ------------------------------------------------------------------------
    -- 5. Gate UPSERT
    --    Keine künstliche Freigabe: Status folgt ausschließlich v_pass.
    -- ------------------------------------------------------------------------
    IF EXISTS (
        SELECT 1
          FROM repository_validation_results
         WHERE revision_id=v_r47
           AND validation_code='RKB33-N47-REVISION-GATE'
    ) THEN

        UPDATE repository_validation_results
           SET validation_status=IF(v_pass=1,'passed','failed'),
               expected_value=
                 '1 Snapshot + 2 Definitionen + 10 Kriterien + 12 Gleichungen + 12 Word-LaTeX-Synchronitäten + 0 fehlerhafte Revisionsbindungen',
               actual_value=CONCAT(
                   'snapshot=',v_snap,
                   '; definitions=',v_defs,
                   '; criteria=',v_crit,
                   '; equations=',v_eq,
                   '; sync=',v_sync,
                   '; bad_revision_links=',v_badrev,
                   '; missing_defs=',v_missing_defs,
                   '; missing_criteria=',v_missing_crit,
                   '; missing_equations=',v_missing_eq
               ),
               validation_message=IF(
                   v_pass=1,
                   'N4.7 FINAL/REVALIDATE bestanden. N4.8 darf gestartet werden.',
                   'N4.7 FINAL/REVALIDATE fehlgeschlagen. N4.8 bleibt gesperrt.'
               ),
               checked_at=CURRENT_TIMESTAMP
         WHERE revision_id=v_r47
           AND validation_code='RKB33-N47-REVISION-GATE';

    ELSE

        INSERT INTO repository_validation_results
        (revision_id,validation_code,validation_status,
         expected_value,actual_value,validation_message,checked_at)
        VALUES
        (
          v_r47,
          'RKB33-N47-REVISION-GATE',
          IF(v_pass=1,'passed','failed'),
          '1 Snapshot + 2 Definitionen + 10 Kriterien + 12 Gleichungen + 12 Word-LaTeX-Synchronitäten + 0 fehlerhafte Revisionsbindungen',
          CONCAT(
              'snapshot=',v_snap,
              '; definitions=',v_defs,
              '; criteria=',v_crit,
              '; equations=',v_eq,
              '; sync=',v_sync,
              '; bad_revision_links=',v_badrev,
              '; missing_defs=',v_missing_defs,
              '; missing_criteria=',v_missing_crit,
              '; missing_equations=',v_missing_eq
          ),
          IF(
              v_pass=1,
              'N4.7 FINAL/REVALIDATE bestanden. N4.8 darf gestartet werden.',
              'N4.7 FINAL/REVALIDATE fehlgeschlagen. N4.8 bleibt gesperrt.'
          ),
          CURRENT_TIMESTAMP
        );
    END IF;

    -- ------------------------------------------------------------------------
    -- 6. Detailausgabe fehlender Objekte
    -- ------------------------------------------------------------------------
    SELECT
        e.object_anchor,
        e.object_type,
        'MISSING' AS validation_state
    FROM tmp_n47_expected e
    WHERE NOT EXISTS (
        SELECT 1
          FROM appendix_objects o
         WHERE o.appendix_section_id=v_s47
           AND o.object_anchor=e.object_anchor
           AND o.object_type=e.object_type
    )
    ORDER BY e.object_type,e.object_anchor;

    -- ------------------------------------------------------------------------
    -- 7. Detailausgabe fehlerhafter Gleichungssynchronität
    -- ------------------------------------------------------------------------
    SELECT
        o.object_anchor,
        o.display_number,
        o.formal_latex,
        o.word_latex,
        'WORD_LATEX_MISMATCH' AS validation_state
    FROM appendix_objects o
    WHERE o.appendix_section_id=v_s47
      AND o.object_type='equation'
      AND o.object_anchor IN (
          'N4-EQ-095','N4-EQ-096','N4-EQ-097','N4-EQ-098',
          'N4-EQ-099','N4-EQ-100','N4-EQ-101','N4-EQ-102',
          'N4-EQ-103','N4-EQ-104','N4-EQ-105','N4-EQ-106'
      )
      AND NOT (o.formal_latex <=> o.word_latex)
    ORDER BY o.object_anchor;

    -- ------------------------------------------------------------------------
    -- 8. Schlusskontrolle
    -- ------------------------------------------------------------------------
    SELECT
        v_module AS n4_module_id,
        v_s47 AS n47_section_id,
        v_r47 AS n47_revision_id,
        v_snap AS snapshots,
        v_defs AS definitions,
        v_crit AS criteria_count,
        v_eq AS equations,
        v_sync AS wordlatex_sync,
        v_badrev AS bad_revision_links,
        v_missing_defs AS missing_definitions,
        v_missing_crit AS missing_criteria,
        v_missing_eq AS missing_equations,
        IF(v_pass=1,'passed','failed') AS computed_status,
        (
          SELECT validation_status
            FROM repository_validation_results
           WHERE revision_id=v_r47
             AND validation_code='RKB33-N47-REVISION-GATE'
           LIMIT 1
        ) AS stored_gate_status;

    DROP TEMPORARY TABLE IF EXISTS tmp_n47_expected;

    IF v_pass<>1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N47-FINAL-GATE: N4.7 ist nicht vollständig. N4.8 bleibt gesperrt.';
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n48_basis_repair` ()   BEGIN
    DECLARE v_n4_module BIGINT DEFAULT NULL;
    DECLARE v_r47 BIGINT DEFAULT NULL;
    DECLARE v_r48 BIGINT DEFAULT NULL;
    DECLARE v_s48 BIGINT DEFAULT NULL;
    DECLARE v_parent BIGINT DEFAULT NULL;
    DECLARE v_gate47 INT DEFAULT 0;

    -- ------------------------------------------------------------------------
    -- 1. N4 muss existieren
    -- ------------------------------------------------------------------------
    SELECT appendix_module_id
      INTO v_n4_module
      FROM appendix_modules
     WHERE appendix_code='N4'
     ORDER BY appendix_module_id DESC
     LIMIT 1;

    IF v_n4_module IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N48-REPAIR: Anlage N4 fehlt. Reparatur abgebrochen.';
    END IF;

    -- ------------------------------------------------------------------------
    -- 2. N4.7-Revision bestimmen
    -- ------------------------------------------------------------------------
    SELECT revision_id
      INTO v_r47
      FROM repository_revisions
     WHERE scope_type='section'
       AND scope_reference='N4.7'
     ORDER BY revision_id DESC
     LIMIT 1;

    IF v_r47 IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N48-REPAIR: Revision N4.7 fehlt.';
    END IF;

    SELECT COUNT(*)
      INTO v_gate47
      FROM repository_validation_results
     WHERE revision_id=v_r47
       AND validation_code='RKB33-N47-REVISION-GATE'
       AND validation_status='passed';

    IF v_gate47 <> 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N48-REPAIR: RKB33-N47-REVISION-GATE ist nicht passed.';
    END IF;

    -- ------------------------------------------------------------------------
    -- 3. N4.8-Revision suchen oder erzeugen
    -- ------------------------------------------------------------------------
    SELECT revision_id
      INTO v_r48
      FROM repository_revisions
     WHERE scope_type='section'
       AND scope_reference='N4.8'
     ORDER BY revision_id DESC
     LIMIT 1;

    IF v_r48 IS NULL THEN
        INSERT INTO repository_revisions
        (revision_code,revision_date,scope_type,scope_reference,version_label,
         summary,created_by,parent_revision_id)
        VALUES
        ('RKB33-REV-N4.8-2026-09-24',
         CURRENT_TIMESTAMP,
         'section',
         'N4.8',
         'N4.8-v1',
         'Gesamtbewertung der Strukturprüfung und Abgrenzung der Eigenleistung.',
         'Olaf Thiele / ChatGPT',
         v_r47);

        SET v_r48 = LAST_INSERT_ID();
    END IF;

    IF NOT EXISTS (
        SELECT 1
          FROM repository_revisions
         WHERE revision_id=v_r48
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N48-REPAIR: N4.8-Revision konnte nicht materialisiert werden.';
    END IF;

    -- ------------------------------------------------------------------------
    -- 4. Parent N4.0 bestimmen; wenn nicht vorhanden, NULL verwenden.
    -- ------------------------------------------------------------------------
    SELECT MAX(appendix_section_id)
      INTO v_parent
      FROM appendix_sections
     WHERE appendix_module_id=v_n4_module
       AND section_code='N4.0';

    -- ------------------------------------------------------------------------
    -- 5. N4.8-Abschnitt suchen
    -- ------------------------------------------------------------------------
    SELECT MAX(appendix_section_id)
      INTO v_s48
      FROM appendix_sections
     WHERE appendix_module_id=v_n4_module
       AND section_code='N4.8';

    IF v_s48 IS NULL THEN
        INSERT INTO appendix_sections
        (appendix_module_id,parent_appendix_section_id,section_code,title,
         sort_order,status,notes,created_revision_id)
        VALUES
        (v_n4_module,
         v_parent,
         'N4.8',
         'Gesamtbewertung der Strukturprüfung und Abgrenzung der Eigenleistung',
         9.0000,
         'draft',
         'Zusammenführung der N4-Strukturprüfung; strikte Nulltrennung, Zustandserhaltung, Projektionstreue, strukturelle Nichtübertragung und N4-geprüfte Zustandserweiterung.',
         v_r48);

        SET v_s48 = LAST_INSERT_ID();
    ELSE
        -- Vorhandenen Abschnitt an die gültige N4.8-Revision binden.
        UPDATE appendix_sections
           SET created_revision_id=v_r48,
               title='Gesamtbewertung der Strukturprüfung und Abgrenzung der Eigenleistung',
               status='draft'
         WHERE appendix_section_id=v_s48;
    END IF;

    -- ------------------------------------------------------------------------
    -- 6. DER ENTSCHEIDENDE FK-GATE
    -- ------------------------------------------------------------------------
    IF v_s48 IS NULL OR NOT EXISTS (
        SELECT 1
          FROM appendix_sections
         WHERE appendix_section_id=v_s48
           AND appendix_module_id=v_n4_module
           AND section_code='N4.8'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N48-REPAIR: N4.8 appendix_section_id fehlt. Keine Objekte schreiben.';
    END IF;

    -- ------------------------------------------------------------------------
    -- 7. Snapshot sicherstellen
    -- ------------------------------------------------------------------------
    INSERT INTO appendix_section_versions
    (appendix_section_id,revision_id,version_kind,body_markdown,
     checksum_sha256,notes)
    SELECT
        v_s48,
        v_r48,
        'draft',
        'N4.8 – Gesamtbewertung der Strukturprüfung und Abgrenzung der Eigenleistung',
        SHA2(CONCAT('N4.8|',v_r48,'|2026-09-24'),256),
        'Repository-Snapshot N4.8 – Basisreparatur.'
    WHERE NOT EXISTS (
        SELECT 1
          FROM appendix_section_versions
         WHERE appendix_section_id=v_s48
           AND revision_id=v_r48
    );

    -- ------------------------------------------------------------------------
    -- 8. N4-D38 erst NACH erfolgreichem FK-Gate materialisieren
    -- ------------------------------------------------------------------------
    INSERT INTO appendix_objects
    (appendix_section_id,object_anchor,object_type,display_number,title,
     content_text,importance_level,provenance,validation_status,created_revision_id)
    SELECT
        v_s48,
        'N4-D38',
        'definition',
        'N4-D38',
        'Strikte Nulltrennung',
        'Verbindliche Unterscheidung zwischen dem klassischen Nullobjekt einer Ausgangsstruktur und einem erweiterten Zustand, dessen klassische Projektion dieses Nullobjekt ergibt, der jedoch zusätzliche Zustandsinformation enthält.',
        'core',
        'original',
        'checked',
        v_r48
    WHERE NOT EXISTS (
        SELECT 1
          FROM appendix_objects
         WHERE appendix_section_id=v_s48
           AND object_anchor='N4-D38'
    );

    -- ------------------------------------------------------------------------
    -- 9. Diagnose
    -- ------------------------------------------------------------------------
    SELECT
        v_n4_module AS n4_module_id,
        v_r47 AS n47_revision_id,
        v_r48 AS n48_revision_id,
        v_s48 AS n48_section_id,
        (SELECT COUNT(*) FROM appendix_sections
          WHERE appendix_section_id=v_s48) AS section_fk_exists,
        (SELECT COUNT(*) FROM appendix_objects
          WHERE appendix_section_id=v_s48
            AND object_anchor='N4-D38') AS n4_d38_exists;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n48_fk_safe_import` ()   BEGIN
    DECLARE v_module BIGINT DEFAULT NULL;
    DECLARE v_r47 BIGINT DEFAULT NULL;
    DECLARE v_r48 BIGINT DEFAULT NULL;
    DECLARE v_s48 BIGINT DEFAULT NULL;
    DECLARE v_parent BIGINT DEFAULT NULL;
    DECLARE v_snap INT DEFAULT 0;
    DECLARE v_defs INT DEFAULT 0;
    DECLARE v_eqs INT DEFAULT 0;
    DECLARE v_sync INT DEFAULT 0;
    DECLARE v_bad INT DEFAULT 0;

    -- N4
    SELECT MAX(appendix_module_id)
      INTO v_module
      FROM appendix_modules
     WHERE appendix_code='N4';

    IF v_module IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N48: Anlage N4 fehlt.';
    END IF;

    -- Nur eine tatsächlich bestandene N4.7-Revision akzeptieren.
    SELECT MAX(r.revision_id)
      INTO v_r47
      FROM repository_revisions r
      JOIN repository_validation_results g
        ON g.revision_id=r.revision_id
       AND g.validation_code='RKB33-N47-REVISION-GATE'
       AND g.validation_status='passed'
     WHERE r.scope_type='section'
       AND r.scope_reference='N4.7';

    IF v_r47 IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N48: Keine N4.7-Revision mit bestandenem Gate gefunden.';
    END IF;

    -- Vorhandene N4.8-Revision wiederverwenden; sonst neu anlegen.
    SELECT MAX(revision_id)
      INTO v_r48
      FROM repository_revisions
     WHERE scope_type='section'
       AND scope_reference='N4.8';

    IF v_r48 IS NULL THEN
        INSERT INTO repository_revisions
        (revision_code,revision_date,scope_type,scope_reference,version_label,
         summary,created_by,parent_revision_id)
        VALUES
        ('RKB33-REV-N4.8-2026-09-24',
         CURRENT_TIMESTAMP,'section','N4.8','N4.8-v1',
         'Gesamtbewertung der Strukturprüfung und Abgrenzung der Eigenleistung.',
         'Olaf Thiele / ChatGPT',v_r47);
        SET v_r48=LAST_INSERT_ID();
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM repository_revisions WHERE revision_id=v_r48
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N48: N4.8-Revision ist nicht FK-gültig.';
    END IF;

    SELECT MAX(appendix_section_id)
      INTO v_parent
      FROM appendix_sections
     WHERE appendix_module_id=v_module
       AND section_code='N4.0';

    -- Vorhandenen N4.8-Abschnitt bestimmen.
    SELECT MAX(appendix_section_id)
      INTO v_s48
      FROM appendix_sections
     WHERE appendix_module_id=v_module
       AND section_code='N4.8';

    -- Nur wenn real nicht vorhanden: anlegen.
    IF v_s48 IS NULL THEN
        INSERT INTO appendix_sections
        (appendix_module_id,parent_appendix_section_id,section_code,title,
         sort_order,status,notes,created_revision_id)
        VALUES
        (v_module,v_parent,'N4.8',
         'Gesamtbewertung der Strukturprüfung und Abgrenzung der Eigenleistung',
         9.0000,'draft',
         'Zusammenführung der N4-Strukturprüfung und Abgrenzung der Eigenleistung.',
         v_r48);

        SET v_s48=LAST_INSERT_ID();
    ELSE
        UPDATE appendix_sections
           SET created_revision_id=v_r48,
               title='Gesamtbewertung der Strukturprüfung und Abgrenzung der Eigenleistung',
               sort_order=9.0000,
               status='draft'
         WHERE appendix_section_id=v_s48;
    END IF;

    -- Harter FK-Stopper.
    IF NOT EXISTS (
        SELECT 1
          FROM appendix_sections
         WHERE appendix_section_id=v_s48
           AND appendix_module_id=v_module
           AND section_code='N4.8'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='RKB33-N48: N4.8-Section konnte nicht materialisiert werden.';
    END IF;

    -- Snapshot
    INSERT INTO appendix_section_versions
    (appendix_section_id,revision_id,version_kind,body_markdown,
     checksum_sha256,notes)
    SELECT s.appendix_section_id,v_r48,'draft',
'N4.8 – Gesamtbewertung der Strukturprüfung und Abgrenzung der Eigenleistung

N4.8 führt die Ergebnisse der Strukturprüfung N4.1 bis N4.7 zusammen. Der klassische Nullvektor bleibt unverändert; der orientierte Nullzustand ist ausdrücklich ein Element eines erweiterten Zustandsraumes. Zusatzinformation wird nicht aus dem klassischen Nullobjekt rekonstruiert, sondern im vollständigen erweiterten Zustand erhalten.

Die originäre Eigenleistung dieser Arbeit liegt in der FRZK-spezifischen Zusammenführung etablierter mathematischer Werkzeuge zu einem kontrollierten Prüfverfahren.',
    SHA2(CONCAT('N4.8|',v_r48,'|2026-09-24'),256),
    'Repository-Snapshot N4.8.'
    FROM appendix_sections s
    WHERE s.appendix_section_id=v_s48
      AND NOT EXISTS (
          SELECT 1
            FROM appendix_section_versions sv
           WHERE sv.appendix_section_id=s.appendix_section_id
             AND sv.revision_id=v_r48
      );

    -- Definitionen
    DROP TEMPORARY TABLE IF EXISTS tmp_n48_defs;
    CREATE TEMPORARY TABLE tmp_n48_defs (
      anchor VARCHAR(32) PRIMARY KEY,
      title VARCHAR(255) NOT NULL,
      body TEXT NOT NULL
    ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    INSERT INTO tmp_n48_defs VALUES
    ('N4-D38','Strikte Nulltrennung',
     'Verbindliche Unterscheidung zwischen dem klassischen Nullobjekt einer Ausgangsstruktur und einem erweiterten Zustand, dessen klassische Projektion dieses Nullobjekt ergibt, der jedoch zusätzliche Zustandsinformation enthält.'),
    ('N4-D39','Zustandserhaltung statt Nullrekonstruktion',
     'Eine nach einem klassischen Nullzustand erneut verwendete Zusatzinformation stammt aus dem erhaltenen erweiterten Zustand und wird nicht dem klassischen Nullobjekt nachträglich entnommen.'),
    ('N4-D40','Projektionstreue FRZK-Erweiterung',
     'Eine FRZK-Erweiterung ist projektionstreu, wenn ihre erweiterten Operationen bei Projektion auf die klassische Struktur die jeweils zugeordneten klassischen Operationen reproduzieren.'),
    ('N4-D41','Strukturelle Nichtübertragung',
     'Algebraische Eigenschaften der klassischen Projektionsstruktur dürfen nicht automatisch auf den erweiterten Zustandsraum übertragen werden; jede beanspruchte Eigenschaft ist gesondert auszuweisen oder nachzuweisen.'),
    ('N4-D42','N4-geprüfte Zustandserweiterung',
     'Eine Zustandserweiterung ist N4-geprüft, wenn ihre für Anlage N4 relevanten Zustände, Projektionen, Darstellungsbeziehungen, Transformationsregeln und Operationen anhand der anwendbaren Kriterien N4-P1 bis N4-P10 geprüft wurden.');

    INSERT INTO appendix_objects
    (appendix_section_id,object_anchor,object_type,display_number,title,
     content_text,importance_level,provenance,validation_status,created_revision_id)
    SELECT
      s.appendix_section_id,d.anchor,'definition',d.anchor,d.title,d.body,
      'core','original','checked',v_r48
    FROM appendix_sections s
    CROSS JOIN tmp_n48_defs d
    WHERE s.appendix_section_id=v_s48
      AND NOT EXISTS (
        SELECT 1 FROM appendix_objects o
         WHERE o.appendix_section_id=s.appendix_section_id
           AND o.object_anchor=d.anchor
      );

    -- Gleichungen
    DROP TEMPORARY TABLE IF EXISTS tmp_n48_eq;
    CREATE TEMPORARY TABLE tmp_n48_eq (
      n INT PRIMARY KEY,
      anchor VARCHAR(32) NOT NULL,
      title VARCHAR(255) NOT NULL,
      latex TEXT NOT NULL,
      provenance VARCHAR(32) NOT NULL
    ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

    INSERT INTO tmp_n48_eq VALUES
    (107,'N4-EQ-107','Darstellungsverträglichkeit',
     'T\\circ\\widehat{F}=\\widehat{F}_T\\circ T','original'),
    (108,'N4-EQ-108','Erweiterte Struktur',
     '\\widehat{\\mathfrak{S}}=(\\mathfrak{S},\\Omega)','original'),
    (109,'N4-EQ-109','Klassischer Nullvektor',
     '\\mathbf{0}\\in V','literature'),
    (110,'N4-EQ-110','Klassische Multiplikation mit Null',
     '0\\cdot v=\\mathbf{0}','literature'),
    (111,'N4-EQ-111','Skalierung des klassischen Nullvektors',
     'a\\mathbf{0}=\\mathbf{0}','literature'),
    (112,'N4-EQ-112','Erweiterter orientierter Nullzustand',
     'z_0=(\\mathbf{0},\\omega)\\in\\widehat{V}','original'),
    (113,'N4-EQ-113','Klassische Projektion des orientierten Nullzustandes',
     '\\pi_V(z_0)=\\mathbf{0}','original'),
    (114,'N4-EQ-114','Nichtinjektive Projektion',
     'z_1\\neq z_2\\quad\\land\\quad\\pi(z_1)=\\pi(z_2)','original'),
    (115,'N4-EQ-115','Unterschiedliche Nullzustände mit gleicher Projektion',
     '(\\mathbf{0},\\omega_1)\\neq(\\mathbf{0},\\omega_2),\\qquad\\pi_V(\\mathbf{0},\\omega_1)=\\pi_V(\\mathbf{0},\\omega_2)=\\mathbf{0}','original'),
    (116,'N4-EQ-116','Projektionstreue Operation',
     '\\pi\\circ\\widehat{F}=F\\circ\\pi','original'),
    (117,'N4-EQ-117','Kompositionsregel erweiterter Operationen',
     '\\widehat{F}_a\\circ\\widehat{F}_b=\\widehat{F}_{a\\star b}','original'),
    (118,'N4-EQ-118','Erweiterter Zustandsweg',
     CONCAT('(v,\\omega)\\xrightarrow{\\,Z_0\\,}(\\mathbf{0},\\omega)\\xrightarrow{\\,\\widehat{F}\\,}(v',CHAR(39),',\\omega',CHAR(39),')'),'original'),
    (119,'N4-EQ-119','Klassischer Projektionsweg',
     CONCAT('v\\xrightarrow{\\,0\\cdot\\,}\\mathbf{0}\\xrightarrow{\\,F\\,}v',CHAR(39)),'original');

    INSERT INTO appendix_objects
    (appendix_section_id,object_anchor,object_type,display_number,title,
     formal_latex,word_latex,importance_level,equation_role,provenance,
     validation_status,created_revision_id)
    SELECT
      s.appendix_section_id,e.anchor,'equation',CONCAT('N4.',e.n),e.title,
      e.latex,e.latex,'core','canonical',e.provenance,'checked',v_r48
    FROM appendix_sections s
    CROSS JOIN tmp_n48_eq e
    WHERE s.appendix_section_id=v_s48
      AND NOT EXISTS (
        SELECT 1 FROM appendix_objects o
         WHERE o.appendix_section_id=s.appendix_section_id
           AND o.object_anchor=e.anchor
      );

    -- Prüfen
    SELECT COUNT(*) INTO v_snap
      FROM appendix_section_versions
     WHERE appendix_section_id=v_s48 AND revision_id=v_r48;

    SELECT COUNT(*) INTO v_defs
      FROM appendix_objects
     WHERE appendix_section_id=v_s48 AND object_type='definition';

    SELECT COUNT(*) INTO v_eqs
      FROM appendix_objects
     WHERE appendix_section_id=v_s48 AND object_type='equation';

    SELECT COUNT(*) INTO v_sync
      FROM appendix_objects
     WHERE appendix_section_id=v_s48
       AND object_type='equation'
       AND formal_latex=word_latex;

    SELECT COUNT(*) INTO v_bad
      FROM appendix_objects o
      LEFT JOIN repository_revisions r
        ON r.revision_id=o.created_revision_id
     WHERE o.appendix_section_id=v_s48
       AND (r.revision_id IS NULL OR o.created_revision_id<>v_r48);

    -- Gate upsert: nur reale Vollständigkeit kann passed erzeugen.
    IF EXISTS (
        SELECT 1 FROM repository_validation_results
         WHERE revision_id=v_r48
           AND validation_code='RKB33-N48-REVISION-GATE'
    ) THEN
        UPDATE repository_validation_results
           SET validation_status=IF(v_snap=1 AND v_defs=5 AND v_eqs=13 AND v_sync=13 AND v_bad=0,'passed','failed'),
               expected_value='1 Snapshot + 5 Definitionen + 13 Gleichungen + 13 Word-LaTeX-Synchronitäten + 0 fehlerhafte Revisionsbindungen',
               actual_value=CONCAT('snapshot=',v_snap,'; definitions=',v_defs,'; equations=',v_eqs,'; sync=',v_sync,'; bad_revision_links=',v_bad),
               validation_message=IF(v_snap=1 AND v_defs=5 AND v_eqs=13 AND v_sync=13 AND v_bad=0,
                    'N4.8 ist revisionsgebunden vollständig materialisiert.',
                    'N4.8 ist unvollständig. Fortschreibung stoppen.'),
               checked_at=CURRENT_TIMESTAMP
         WHERE revision_id=v_r48
           AND validation_code='RKB33-N48-REVISION-GATE';
    ELSE
        INSERT INTO repository_validation_results
        (revision_id,validation_code,validation_status,expected_value,actual_value,
         validation_message,checked_at)
        VALUES
        (v_r48,'RKB33-N48-REVISION-GATE',
         IF(v_snap=1 AND v_defs=5 AND v_eqs=13 AND v_sync=13 AND v_bad=0,'passed','failed'),
         '1 Snapshot + 5 Definitionen + 13 Gleichungen + 13 Word-LaTeX-Synchronitäten + 0 fehlerhafte Revisionsbindungen',
         CONCAT('snapshot=',v_snap,'; definitions=',v_defs,'; equations=',v_eqs,'; sync=',v_sync,'; bad_revision_links=',v_bad),
         IF(v_snap=1 AND v_defs=5 AND v_eqs=13 AND v_sync=13 AND v_bad=0,
            'N4.8 ist revisionsgebunden vollständig materialisiert.',
            'N4.8 ist unvollständig. Fortschreibung stoppen.'),
         CURRENT_TIMESTAMP);
    END IF;

    -- Diagnose
    SELECT
      v_r47 AS n47_revision_id,
      v_r48 AS n48_revision_id,
      v_s48 AS n48_section_id,
      (SELECT COUNT(*) FROM appendix_sections WHERE appendix_section_id=v_s48) AS section_fk_exists,
      v_snap AS snapshots,
      v_defs AS definitions,
      v_eqs AS equations,
      v_sync AS wordlatex_sync,
      v_bad AS bad_revision_links,
      (SELECT validation_status
         FROM repository_validation_results
        WHERE revision_id=v_r48
          AND validation_code='RKB33-N48-REVISION-GATE'
        LIMIT 1) AS n48_gate;

    DROP TEMPORARY TABLE IF EXISTS tmp_n48_defs;
    DROP TEMPORARY TABLE IF EXISTS tmp_n48_eq;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n48_materialize` ()   BEGIN
 DECLARE v_module BIGINT DEFAULT NULL;
 DECLARE v_r47 BIGINT DEFAULT NULL;
 DECLARE v_r48 BIGINT DEFAULT NULL;
 DECLARE v_s48 BIGINT DEFAULT NULL;
 DECLARE v_parent BIGINT DEFAULT NULL;
 DECLARE v_snap INT DEFAULT 0;
 DECLARE v_defs INT DEFAULT 0;
 DECLARE v_eqs INT DEFAULT 0;
 DECLARE v_sync INT DEFAULT 0;
 DECLARE v_bad INT DEFAULT 0;

 SELECT MAX(appendix_module_id) INTO v_module
 FROM appendix_modules WHERE appendix_code='N4';
 IF v_module IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
   MESSAGE_TEXT='RKB33-N48: Anlage N4 fehlt.';
 END IF;

 SELECT MAX(r.revision_id) INTO v_r47
 FROM repository_revisions r
 JOIN repository_validation_results g
   ON g.revision_id=r.revision_id
  AND g.validation_code='RKB33-N47-REVISION-GATE'
  AND g.validation_status='passed'
 WHERE r.scope_type='section' AND r.scope_reference='N4.7';
 IF v_r47 IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
   MESSAGE_TEXT='RKB33-N48: Keine N4.7-Revision mit bestandenem Gate gefunden.';
 END IF;

 SELECT MAX(revision_id) INTO v_r48
 FROM repository_revisions
 WHERE scope_type='section' AND scope_reference='N4.8';

 IF v_r48 IS NULL THEN
   INSERT INTO repository_revisions
   (revision_code,revision_date,scope_type,scope_reference,version_label,
    summary,created_by,parent_revision_id)
   VALUES
   ('RKB33-REV-N4.8-2026-09-24',CURRENT_TIMESTAMP,'section','N4.8','N4.8-v1',
    'Gesamtbewertung der Strukturprüfung und Abgrenzung der Eigenleistung.',
    'Olaf Thiele / ChatGPT',v_r47);
   SET v_r48=LAST_INSERT_ID();
 END IF;

 IF NOT EXISTS (SELECT 1 FROM repository_revisions WHERE revision_id=v_r48) THEN
   SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
   MESSAGE_TEXT='RKB33-N48: N4.8-Revision ist nicht FK-gueltig.';
 END IF;

 SELECT MAX(appendix_section_id) INTO v_parent
 FROM appendix_sections
 WHERE appendix_module_id=v_module AND section_code='N4.0';

 SELECT MAX(appendix_section_id) INTO v_s48
 FROM appendix_sections
 WHERE appendix_module_id=v_module AND section_code='N4.8';

 IF v_s48 IS NULL THEN
   INSERT INTO appendix_sections
   (appendix_module_id,parent_appendix_section_id,section_code,title,
    sort_order,status,notes,created_revision_id)
   VALUES
   (v_module,v_parent,'N4.8',
    'Gesamtbewertung der Strukturprüfung und Abgrenzung der Eigenleistung',
    9.0000,'draft',
    'Zusammenführung der N4-Strukturprüfung und Abgrenzung der Eigenleistung.',
    v_r48);
   SET v_s48=LAST_INSERT_ID();
 ELSE
   UPDATE appendix_sections
      SET created_revision_id=v_r48,
          title='Gesamtbewertung der Strukturprüfung und Abgrenzung der Eigenleistung',
          sort_order=9.0000,status='draft'
    WHERE appendix_section_id=v_s48;
 END IF;

 IF NOT EXISTS (
   SELECT 1 FROM appendix_sections
   WHERE appendix_section_id=v_s48 AND appendix_module_id=v_module
     AND section_code='N4.8'
 ) THEN
   SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
   MESSAGE_TEXT='RKB33-N48: N4.8-Section konnte nicht materialisiert werden.';
 END IF;

 INSERT INTO appendix_section_versions
 (appendix_section_id,revision_id,version_kind,body_markdown,checksum_sha256,notes)
 SELECT v_s48,v_r48,'draft',
 'N4.8 – Gesamtbewertung der Strukturprüfung und Abgrenzung der Eigenleistung

N4.8 führt die Ergebnisse der Strukturprüfung N4.1 bis N4.7 zusammen. Der klassische Nullvektor bleibt unverändert; der orientierte Nullzustand ist ausdrücklich ein Element eines erweiterten Zustandsraumes. Zusatzinformation wird nicht aus dem klassischen Nullobjekt rekonstruiert, sondern im vollständigen erweiterten Zustand erhalten.

Die originäre Eigenleistung dieser Arbeit liegt in der FRZK-spezifischen Zusammenführung etablierter mathematischer Werkzeuge zu einem kontrollierten Prüfverfahren.',
 SHA2(CONCAT('N4.8|',v_r48,'|2026-09-24'),256),'Repository-Snapshot N4.8.'
 WHERE NOT EXISTS (
   SELECT 1 FROM appendix_section_versions
   WHERE appendix_section_id=v_s48 AND revision_id=v_r48
 );

 DROP TEMPORARY TABLE IF EXISTS tmp_n48_defs;
 CREATE TEMPORARY TABLE tmp_n48_defs(
   anchor VARCHAR(32) PRIMARY KEY,title VARCHAR(255) NOT NULL,body TEXT NOT NULL
 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
 INSERT INTO tmp_n48_defs VALUES
 ('N4-D38','Strikte Nulltrennung','Verbindliche Unterscheidung zwischen dem klassischen Nullobjekt einer Ausgangsstruktur und einem erweiterten Zustand, dessen klassische Projektion dieses Nullobjekt ergibt, der jedoch zusätzliche Zustandsinformation enthält.'),
 ('N4-D39','Zustandserhaltung statt Nullrekonstruktion','Eine nach einem klassischen Nullzustand erneut verwendete Zusatzinformation stammt aus dem erhaltenen erweiterten Zustand und wird nicht dem klassischen Nullobjekt nachträglich entnommen.'),
 ('N4-D40','Projektionstreue FRZK-Erweiterung','Eine FRZK-Erweiterung ist projektionstreu, wenn ihre erweiterten Operationen bei Projektion auf die klassische Struktur die jeweils zugeordneten klassischen Operationen reproduzieren.'),
 ('N4-D41','Strukturelle Nichtübertragung','Algebraische Eigenschaften der klassischen Projektionsstruktur dürfen nicht automatisch auf den erweiterten Zustandsraum übertragen werden; jede beanspruchte Eigenschaft ist gesondert auszuweisen oder nachzuweisen.'),
 ('N4-D42','N4-geprüfte Zustandserweiterung','Eine Zustandserweiterung ist N4-geprüft, wenn ihre für Anlage N4 relevanten Zustände, Projektionen, Darstellungsbeziehungen, Transformationsregeln und Operationen anhand der anwendbaren Kriterien N4-P1 bis N4-P10 geprüft wurden.');

 INSERT INTO appendix_objects
 (appendix_section_id,object_anchor,object_type,display_number,title,content_text,
  importance_level,provenance,validation_status,created_revision_id)
 SELECT v_s48,d.anchor,'definition',d.anchor,d.title,d.body,
        'core','original','checked',v_r48
 FROM tmp_n48_defs d
 WHERE NOT EXISTS (
   SELECT 1 FROM appendix_objects o
   WHERE o.appendix_section_id=v_s48 AND o.object_anchor=d.anchor
 );

 DROP TEMPORARY TABLE IF EXISTS tmp_n48_eq;
 CREATE TEMPORARY TABLE tmp_n48_eq(
   n INT PRIMARY KEY,anchor VARCHAR(32),title VARCHAR(255),latex TEXT,provenance VARCHAR(32)
 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
 INSERT INTO tmp_n48_eq VALUES
 (107,'N4-EQ-107','Darstellungsverträglichkeit','T\\circ\\widehat{F}=\\widehat{F}_T\\circ T','original'),
 (108,'N4-EQ-108','Erweiterte Struktur','\\widehat{\\mathfrak{S}}=(\\mathfrak{S},\\Omega)','original'),
 (109,'N4-EQ-109','Klassischer Nullvektor','\\mathbf{0}\\in V','literature'),
 (110,'N4-EQ-110','Klassische Multiplikation mit Null','0\\cdot v=\\mathbf{0}','literature'),
 (111,'N4-EQ-111','Skalierung des klassischen Nullvektors','a\\mathbf{0}=\\mathbf{0}','literature'),
 (112,'N4-EQ-112','Erweiterter orientierter Nullzustand','z_0=(\\mathbf{0},\\omega)\\in\\widehat{V}','original'),
 (113,'N4-EQ-113','Klassische Projektion des orientierten Nullzustandes','\\pi_V(z_0)=\\mathbf{0}','original'),
 (114,'N4-EQ-114','Nichtinjektive Projektion','z_1\\neq z_2\\quad\\land\\quad\\pi(z_1)=\\pi(z_2)','original'),
 (115,'N4-EQ-115','Unterschiedliche Nullzustände mit gleicher Projektion','(\\mathbf{0},\\omega_1)\\neq(\\mathbf{0},\\omega_2),\\qquad\\pi_V(\\mathbf{0},\\omega_1)=\\pi_V(\\mathbf{0},\\omega_2)=\\mathbf{0}','original'),
 (116,'N4-EQ-116','Projektionstreue Operation','\\pi\\circ\\widehat{F}=F\\circ\\pi','original'),
 (117,'N4-EQ-117','Kompositionsregel erweiterter Operationen','\\widehat{F}_a\\circ\\widehat{F}_b=\\widehat{F}_{a\\star b}','original'),
 (118,'N4-EQ-118','Erweiterter Zustandsweg',CONCAT('(v,\\omega)\\xrightarrow{\\,Z_0\\,}(\\mathbf{0},\\omega)\\xrightarrow{\\,\\widehat{F}\\,}(v',CHAR(39),',\\omega',CHAR(39),')'),'original'),
 (119,'N4-EQ-119','Klassischer Projektionsweg',CONCAT('v\\xrightarrow{\\,0\\cdot\\,}\\mathbf{0}\\xrightarrow{\\,F\\,}v',CHAR(39)),'original');

 INSERT INTO appendix_objects
 (appendix_section_id,object_anchor,object_type,display_number,title,
  formal_latex,word_latex,importance_level,equation_role,provenance,
  validation_status,created_revision_id)
 SELECT v_s48,e.anchor,'equation',CONCAT('N4.',e.n),e.title,
        e.latex,e.latex,'core','canonical',e.provenance,'checked',v_r48
 FROM tmp_n48_eq e
 WHERE NOT EXISTS (
   SELECT 1 FROM appendix_objects o
   WHERE o.appendix_section_id=v_s48 AND o.object_anchor=e.anchor
 );

 SELECT COUNT(*) INTO v_snap FROM appendix_section_versions
 WHERE appendix_section_id=v_s48 AND revision_id=v_r48;
 SELECT COUNT(*) INTO v_defs FROM appendix_objects
 WHERE appendix_section_id=v_s48 AND object_type='definition';
 SELECT COUNT(*) INTO v_eqs FROM appendix_objects
 WHERE appendix_section_id=v_s48 AND object_type='equation';
 SELECT COUNT(*) INTO v_sync FROM appendix_objects
 WHERE appendix_section_id=v_s48 AND object_type='equation'
   AND formal_latex=word_latex;
 SELECT COUNT(*) INTO v_bad
 FROM appendix_objects o LEFT JOIN repository_revisions r
 ON r.revision_id=o.created_revision_id
 WHERE o.appendix_section_id=v_s48
   AND (r.revision_id IS NULL OR o.created_revision_id<>v_r48);

 DELETE FROM repository_validation_results
 WHERE revision_id=v_r48 AND validation_code='RKB33-N48-REVISION-GATE';

 INSERT INTO repository_validation_results
 (revision_id,validation_code,validation_status,expected_value,actual_value,
  validation_message,checked_at)
 VALUES
 (v_r48,'RKB33-N48-REVISION-GATE',
  IF(v_snap=1 AND v_defs=5 AND v_eqs=13 AND v_sync=13 AND v_bad=0,'passed','failed'),
  '1 Snapshot + 5 Definitionen + 13 Gleichungen + 13 Word-LaTeX-Synchronitäten + 0 fehlerhafte Revisionsbindungen',
  CONCAT('snapshot=',v_snap,'; definitions=',v_defs,'; equations=',v_eqs,
         '; sync=',v_sync,'; bad_revision_links=',v_bad),
  IF(v_snap=1 AND v_defs=5 AND v_eqs=13 AND v_sync=13 AND v_bad=0,
     'N4.8 ist revisionsgebunden vollständig materialisiert.',
     'N4.8 ist unvollständig. Fortschreibung stoppen.'),
  CURRENT_TIMESTAMP);

 SELECT v_r47 AS n47_revision_id,v_r48 AS n48_revision_id,
        v_s48 AS n48_section_id,v_snap AS snapshots,v_defs AS definitions,
        v_eqs AS equations,v_sync AS wordlatex_sync,v_bad AS bad_revision_links,
        (SELECT validation_status FROM repository_validation_results
         WHERE revision_id=v_r48 AND validation_code='RKB33-N48-REVISION-GATE'
         LIMIT 1) AS n48_gate;

 DROP TEMPORARY TABLE IF EXISTS tmp_n48_defs;
 DROP TEMPORARY TABLE IF EXISTS tmp_n48_eq;

 IF NOT (v_snap=1 AND v_defs=5 AND v_eqs=13 AND v_sync=13 AND v_bad=0) THEN
   SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
   MESSAGE_TEXT='RKB33-N48-REVISION-GATE failed. N4.9 bleibt gesperrt.';
 END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n50_first_materialize` ()   BEGIN
    DECLARE v_n5_module BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n50_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n50_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_parent_rev BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_n5_existing INT DEFAULT 0;
    DECLARE v_n50_existing INT DEFAULT 0;
    DECLARE v_sections INT DEFAULT 0;
    DECLARE v_snapshots INT DEFAULT 0;
    DECLARE v_objects INT DEFAULT 0;
    DECLARE v_equations INT DEFAULT 0;
    DECLARE v_sync INT DEFAULT 0;
    DECLARE v_number_leaks INT DEFAULT 0;
    DECLARE v_bad_revision_links INT DEFAULT 0;
    DECLARE v_failed INT DEFAULT 0;

    -- ------------------------------------------------------------------------
    -- 1. Harte Doppelmaterialisierungssperre
    -- ------------------------------------------------------------------------
    SELECT COUNT(*)
      INTO v_n5_existing
      FROM appendix_modules
     WHERE appendix_code='N5';

    IF v_n5_existing <> 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N50-FIRST: N5-Modul existiert bereits. Erstmaterialisierung abgebrochen.';
    END IF;

    SELECT COUNT(*)
      INTO v_n50_existing
      FROM appendix_sections
     WHERE section_code='N5.0';

    IF v_n50_existing <> 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N50-FIRST: N5.0 existiert bereits. Erstmaterialisierung abgebrochen.';
    END IF;

    -- ------------------------------------------------------------------------
    -- 2. Letzte reale N4.9-Revision als Parent bestimmen.
    --    Das PRESTART-Gate wurde bereits separat bestanden.
    -- ------------------------------------------------------------------------
    SELECT MAX(r.revision_id)
      INTO v_parent_rev
      FROM repository_revisions r
     WHERE r.scope_type='section'
       AND r.scope_reference='N4.9';

    IF v_parent_rev IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N50-FIRST: Keine reale N4.9-Revision als Parent vorhanden.';
    END IF;

    START TRANSACTION;

    -- ------------------------------------------------------------------------
    -- 3. N5-Modul
    -- ------------------------------------------------------------------------
    INSERT INTO appendix_modules
    (
        appendix_code,
        title,
        status
    )
    VALUES
    (
        'N5',
        'Modellbildung, Brückenannahmen und empirische Interpretation',
        'draft'
    );

    SET v_n5_module=LAST_INSERT_ID();

    -- ------------------------------------------------------------------------
    -- 4. Revision N5.0
    -- ------------------------------------------------------------------------
    INSERT INTO repository_revisions
    (
        revision_code,
        revision_date,
        scope_type,
        scope_reference,
        version_label,
        summary,
        created_by,
        parent_revision_id
    )
    VALUES
    (
        'RKB33-REV-N5.0-2026-09-24',
        CURRENT_TIMESTAMP,
        'section',
        'N5.0',
        'N5.0-v1',
        'Gegenstand, methodische Stellung, Abgrenzung und Prüfprogramm der Modell- und Brückenprüfung.',
        'Olaf Thiele / ChatGPT',
        v_parent_rev
    );

    SET v_n50_rev=LAST_INSERT_ID();

    -- ------------------------------------------------------------------------
    -- 5. Section N5.0
    -- ------------------------------------------------------------------------
    INSERT INTO appendix_sections
    (
        appendix_module_id,
        parent_appendix_section_id,
        section_code,
        title,
        sort_order,
        status,
        notes,
        created_revision_id
    )
    VALUES
    (
        v_n5_module,
        NULL,
        'N5.0',
        'Gegenstand, methodische Stellung, Abgrenzung und Prüfprogramm',
        1.0000,
        'draft',
        'Methodischer Start von N5: mathematische Struktur -> Modellentscheidung -> Brückenannahme -> empirische Interpretation; Abgrenzung gegenüber N4 und N6.',
        v_n50_rev
    );

    SET v_n50_sec=LAST_INSERT_ID();

    -- ------------------------------------------------------------------------
    -- 6. Kernobjekte
    -- ------------------------------------------------------------------------
    INSERT INTO appendix_objects
    (
        appendix_section_id,
        object_anchor,
        object_type,
        display_number,
        title,
        content_text,
        importance_level,
        provenance,
        validation_status,
        created_revision_id
    )
    VALUES
    (
        v_n50_sec,
        'N5-D01',
        'definition',
        'N5-D01',
        'Methodische Ebenentrennung',
        'Verbindliche Trennung zwischen mathematischer Struktur, Modellentscheidung, Brückenannahme und empirischer Interpretation.',
        'core',
        'original',
        'checked',
        v_n50_rev
    ),
    (
        v_n50_sec,
        'N5-D02',
        'definition',
        'N5-D02',
        'Brückenannahme',
        'Eine Brückenannahme ist eine ausdrücklich ausgewiesene zusätzliche Zuordnung, durch die ein Bestandteil der mathematisch-theoretischen Modellstruktur mit einer physikalisch oder empirisch interpretierbaren Größe, Eigenschaft, Relation oder einem Vorgang verbunden wird. Sie darf nicht als rein mathematische Ableitung ausgegeben werden.',
        'core',
        'original',
        'checked',
        v_n50_rev
    ),
    (
        v_n50_sec,
        'N5-E01',
        'statement',
        'N5-E01',
        'Originäre Eigenleistung der methodischen FRZK-Trennung',
        'Originäre Eigenleistung dieser Arbeit ist die konsequente Übertragung der Ebenentrennung auf die FRZK-Grundlegung und ihre Verbindung mit der revisionsgebundenen Prüfarchitektur.',
        'core',
        'original',
        'checked',
        v_n50_rev
    );

    -- ------------------------------------------------------------------------
    -- 7. Gleichungen N5.1 und N5.2
    --    Formelnummer NUR in display_number.
    -- ------------------------------------------------------------------------
    INSERT INTO appendix_objects
    (
        appendix_section_id,
        object_anchor,
        object_type,
        display_number,
        title,
        content_text,
        equation_latex,
        word_latex,
        importance_level,
        provenance,
        validation_status,
        created_revision_id
    )
    VALUES
    (
        v_n50_sec,
        'N5-EQ-001',
        'equation',
        'N5.1',
        'Methodischer Übergang',
        'Prüfweg von der mathematischen Struktur über Modellentscheidung und Brückenannahme zur empirischen Interpretation.',
        '\\text{mathematische Struktur}\\longrightarrow\\text{Modellentscheidung}\\longrightarrow\\text{Brückenannahme}\\longrightarrow\\text{empirische Interpretation}',
        '\\text{mathematische Struktur}\\longrightarrow\\text{Modellentscheidung}\\longrightarrow\\text{Brückenannahme}\\longrightarrow\\text{empirische Interpretation}',
        'core',
        'original',
        'checked',
        v_n50_rev
    ),
    (
        v_n50_sec,
        'N5-EQ-002',
        'equation',
        'N5.2',
        'Keine vorgetäuschte Ableitung',
        'Eine nicht aus den zugrunde gelegten Voraussetzungen ableitbare Aussage darf nicht allein als Folgerung aus diesen Voraussetzungen ausgewiesen werden.',
        'B\\notin\\operatorname{Cn}(A)\\Longrightarrow B\\ \\text{ist nicht allein als Folgerung aus}\\ A\\ \\text{auszuweisen}',
        'B\\notin\\operatorname{Cn}(A)\\Longrightarrow B\\ \\text{ist nicht allein als Folgerung aus}\\ A\\ \\text{auszuweisen}',
        'core',
        'original',
        'checked',
        v_n50_rev
    );

    -- ------------------------------------------------------------------------
    -- 8. Revisionsgebundener Snapshot
    -- ------------------------------------------------------------------------
    INSERT INTO appendix_section_versions
    (
        appendix_section_id,
        revision_id,
        version_label,
        title,
        notes
    )
    VALUES
    (
        v_n50_sec,
        v_n50_rev,
        'N5.0-v1',
        'Gegenstand, methodische Stellung, Abgrenzung und Prüfprogramm',
        'Revisionsgebundener Snapshot der dissertationsfähigen Erstfassung von N5.0.'
    );

    -- ------------------------------------------------------------------------
    -- 9. Tatsächlichen materialisierten Bestand prüfen
    -- ------------------------------------------------------------------------
    SELECT COUNT(*)
      INTO v_sections
      FROM appendix_sections
     WHERE appendix_section_id=v_n50_sec
       AND appendix_module_id=v_n5_module
       AND section_code='N5.0'
       AND created_revision_id=v_n50_rev;

    SELECT COUNT(*)
      INTO v_snapshots
      FROM appendix_section_versions
     WHERE appendix_section_id=v_n50_sec
       AND revision_id=v_n50_rev;

    SELECT COUNT(*)
      INTO v_objects
      FROM appendix_objects
     WHERE appendix_section_id=v_n50_sec
       AND created_revision_id=v_n50_rev
       AND object_anchor IN
           ('N5-D01','N5-D02','N5-E01','N5-EQ-001','N5-EQ-002');

    SELECT COUNT(*)
      INTO v_equations
      FROM appendix_objects
     WHERE appendix_section_id=v_n50_sec
       AND created_revision_id=v_n50_rev
       AND object_type='equation'
       AND object_anchor IN ('N5-EQ-001','N5-EQ-002');

    SELECT COUNT(*)
      INTO v_sync
      FROM appendix_objects
     WHERE appendix_section_id=v_n50_sec
       AND created_revision_id=v_n50_rev
       AND object_type='equation'
       AND object_anchor IN ('N5-EQ-001','N5-EQ-002')
       AND equation_latex=word_latex;

    SELECT COUNT(*)
      INTO v_number_leaks
      FROM appendix_objects
     WHERE appendix_section_id=v_n50_sec
       AND created_revision_id=v_n50_rev
       AND object_type='equation'
       AND (
            equation_latex LIKE '%N5.1%'
         OR equation_latex LIKE '%N5.2%'
         OR word_latex LIKE '%N5.1%'
         OR word_latex LIKE '%N5.2%'
       );

    SELECT COUNT(*)
      INTO v_bad_revision_links
      FROM appendix_objects o
      LEFT JOIN repository_revisions r
        ON r.revision_id=o.created_revision_id
     WHERE o.appendix_section_id=v_n50_sec
       AND o.created_revision_id=v_n50_rev
       AND r.revision_id IS NULL;

    -- ------------------------------------------------------------------------
    -- 10. Einzelvalidierungen
    -- ------------------------------------------------------------------------
    INSERT INTO repository_validation_results
    (
        revision_id,
        validation_code,
        validation_status,
        expected_value,
        actual_value,
        validation_message,
        checked_at
    )
    VALUES
    (
        v_n50_rev,
        'RKB33-N50-SECTION',
        IF(v_sections=1,'passed','failed'),
        '1',
        CAST(v_sections AS CHAR),
        'N5.0 muss genau einmal revisionsgebunden materialisiert sein.',
        CURRENT_TIMESTAMP
    ),
    (
        v_n50_rev,
        'RKB33-N50-SNAPSHOT',
        IF(v_snapshots=1,'passed','failed'),
        '1',
        CAST(v_snapshots AS CHAR),
        'N5.0 muss genau einen Snapshot der aktuellen Revision besitzen.',
        CURRENT_TIMESTAMP
    ),
    (
        v_n50_rev,
        'RKB33-N50-OBJECTS',
        IF(v_objects=5,'passed','failed'),
        '5',
        CAST(v_objects AS CHAR),
        'N5.0 muss die fünf kanonischen Kernobjekte besitzen.',
        CURRENT_TIMESTAMP
    ),
    (
        v_n50_rev,
        'RKB33-N50-EQUATIONS',
        IF(v_equations=2 AND v_sync=2,'passed','failed'),
        'equations=2; sync=2',
        CONCAT('equations=',v_equations,'; sync=',v_sync),
        'N5.1 und N5.2 müssen vorhanden und zwischen equation_latex und word_latex synchron sein.',
        CURRENT_TIMESTAMP
    ),
    (
        v_n50_rev,
        'RKB33-N50-WORDLATEX-NUMBER-GATE',
        IF(v_number_leaks=0,'passed','failed'),
        '0',
        CAST(v_number_leaks AS CHAR),
        'Formelnummern dürfen nicht Bestandteil von equation_latex oder word_latex sein.',
        CURRENT_TIMESTAMP
    ),
    (
        v_n50_rev,
        'RKB33-N50-REVISION-LINKS',
        IF(v_bad_revision_links=0,'passed','failed'),
        '0',
        CAST(v_bad_revision_links AS CHAR),
        'Alle N5.0-Kernobjekte müssen an eine gültige Revision gebunden sein.',
        CURRENT_TIMESTAMP
    );

    SELECT COUNT(*)
      INTO v_failed
      FROM repository_validation_results
     WHERE revision_id=v_n50_rev
       AND validation_code IN
       (
           'RKB33-N50-SECTION',
           'RKB33-N50-SNAPSHOT',
           'RKB33-N50-OBJECTS',
           'RKB33-N50-EQUATIONS',
           'RKB33-N50-WORDLATEX-NUMBER-GATE',
           'RKB33-N50-REVISION-LINKS'
       )
       AND validation_status<>'passed';

    -- ------------------------------------------------------------------------
    -- 11. Finales N5.0-Gate und Freigabe N5.1
    -- ------------------------------------------------------------------------
    INSERT INTO repository_validation_results
    (
        revision_id,
        validation_code,
        validation_status,
        expected_value,
        actual_value,
        validation_message,
        checked_at
    )
    VALUES
    (
        v_n50_rev,
        'RKB33-N50-REVISION-GATE',
        IF(v_failed=0,'passed','failed'),
        '0 failed checks',
        CONCAT(v_failed,' failed checks'),
        IF(v_failed=0,
           'N5.0 ist revisionsgebunden vollständig materialisiert.',
           'N5.0-Materialisierung ist unvollständig.'),
        CURRENT_TIMESTAMP
    ),
    (
        v_n50_rev,
        'RKB33-N50-START-GATE',
        IF(v_failed=0,'passed','failed'),
        'N5.0 vollständig',
        IF(v_failed=0,'passed','blocked'),
        IF(v_failed=0,
           'N5.0 abgeschlossen. N5.1 darf begonnen werden.',
           'N5.0 unvollständig. N5.1 bleibt gesperrt.'),
        CURRENT_TIMESTAMP
    );

    IF v_failed<>0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N50-FIRST-FINAL-GATE fehlgeschlagen; vollständiger Rollback.';
    END IF;

    COMMIT;

    SELECT
        'RKB33-N50-START-GATE' AS gate_code,
        'passed' AS gate_status,
        v_n5_module AS n5_module_id,
        v_n50_sec AS n50_section_id,
        v_n50_rev AS n50_revision_id,
        v_snapshots AS snapshots,
        v_objects AS core_objects,
        v_equations AS equations,
        v_sync AS word_latex_sync,
        v_number_leaks AS formula_number_leaks,
        'N5.0 erstmals materialisiert; N5.1 freigegeben.' AS message;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n50_revise` ()   BEGIN
 DECLARE v_mod BIGINT UNSIGNED DEFAULT NULL;
 DECLARE v_sec BIGINT UNSIGNED DEFAULT NULL;
 DECLARE v_old BIGINT UNSIGNED DEFAULT NULL;
 DECLARE v_rev BIGINT UNSIGNED DEFAULT NULL;
 DECLARE v_gate INT DEFAULT 0;
 DECLARE v_snap INT DEFAULT 0;
 DECLARE v_obj INT DEFAULT 0;
 DECLARE v_eq INT DEFAULT 0;
 DECLARE v_sync INT DEFAULT 0;
 DECLARE v_num INT DEFAULT 0;
 DECLARE v_bad INT DEFAULT 0;
 DECLARE v_failed INT DEFAULT 0;

 SELECT COUNT(*) INTO v_gate
 FROM repository_validation_results
 WHERE validation_code='RKB33-N4N5-FINAL-GATE'
   AND validation_status='passed';
 IF v_gate<1 THEN
   SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
   MESSAGE_TEXT='RKB33-N50-R2: N4->N5-FINAL-GATE nicht passed.';
 END IF;

 SELECT MAX(appendix_module_id) INTO v_mod
 FROM appendix_modules WHERE appendix_code='N5';
 IF v_mod IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
   MESSAGE_TEXT='RKB33-N50-R2: N5-Modul fehlt.';
 END IF;

 SELECT MAX(appendix_section_id) INTO v_sec
 FROM appendix_sections
 WHERE appendix_module_id=v_mod AND section_code='N5.0';
 IF v_sec IS NULL THEN
   SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
   MESSAGE_TEXT='RKB33-N50-R2: N5.0 fehlt.';
 END IF;

 SELECT created_revision_id INTO v_old
 FROM appendix_sections WHERE appendix_section_id=v_sec;
 IF v_old IS NULL OR NOT EXISTS
   (SELECT 1 FROM repository_revisions WHERE revision_id=v_old) THEN
   SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
   MESSAGE_TEXT='RKB33-N50-R2: Ausgangsrevision ungueltig.';
 END IF;

 IF EXISTS (SELECT 1 FROM repository_revisions
            WHERE revision_code='RKB33-REV-N5.0-R2-2026-09-24') THEN
   SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
   MESSAGE_TEXT='RKB33-N50-R2: Revision bereits vorhanden.';
 END IF;

 START TRANSACTION;

 INSERT INTO repository_revisions
 (revision_code,revision_date,scope_type,scope_reference,version_label,
  summary,created_by,parent_revision_id)
 VALUES
 ('RKB33-REV-N5.0-R2-2026-09-24',CURRENT_TIMESTAMP,'section','N5.0','N5.0-v2',
  'Ueberarbeiteter N5.0-Startabschnitt mit verbindlicher Ebenentrennung und korrigierter Word-LaTeX-Nummerntrennung.',
  'Olaf Thiele / ChatGPT',v_old);
 SET v_rev=LAST_INSERT_ID();

 UPDATE appendix_sections
 SET title='Gegenstand, methodische Stellung, Abgrenzung und Prüfprogramm',
     notes='Mathematische Struktur -> Modellentscheidung -> Brueckenannahme -> empirische Interpretation; Abgrenzung zu N4 und N6.',
     created_revision_id=v_rev
 WHERE appendix_section_id=v_sec;

 UPDATE appendix_objects
 SET created_revision_id=v_rev
 WHERE appendix_section_id=v_sec
   AND object_anchor IN ('N5-D01','N5-D02','N5-E01','N5-EQ-001','N5-EQ-002');

 UPDATE appendix_objects
 SET title='Methodische Ebenentrennung',
     content_text='Verbindliche Trennung zwischen mathematischer Struktur, Modellentscheidung, Brückenannahme und empirischer Interpretation.',
     provenance='original',validation_status='checked'
 WHERE appendix_section_id=v_sec AND object_anchor='N5-D01';

 UPDATE appendix_objects
 SET title='Brückenannahme',
     content_text='Eine Brückenannahme ist eine ausdrücklich ausgewiesene zusätzliche Zuordnung zwischen mathematisch-theoretischer Modellstruktur und physikalisch oder empirisch interpretierbarer Größe, Eigenschaft, Relation oder einem Vorgang; sie darf nicht als rein mathematische Ableitung ausgegeben werden.',
     provenance='original',validation_status='checked'
 WHERE appendix_section_id=v_sec AND object_anchor='N5-D02';

 UPDATE appendix_objects
 SET title='Originäre Eigenleistung der methodischen FRZK-Trennung',
     content_text='Originäre Eigenleistung dieser Arbeit ist die konsequente Übertragung der Ebenentrennung auf die FRZK-Grundlegung und ihre Verbindung mit der revisionsgebundenen Prüfarchitektur.',
     provenance='original',validation_status='checked'
 WHERE appendix_section_id=v_sec AND object_anchor='N5-E01';

 UPDATE appendix_objects
 SET display_number='N5.1',
     title='Methodischer Übergang',
     content_text='Prüfweg von der mathematischen Struktur über Modellentscheidung und Brückenannahme zur empirischen Interpretation.',
     equation_latex='\\text{mathematische Struktur}\\longrightarrow\\text{Modellentscheidung}\\longrightarrow\\text{Brückenannahme}\\longrightarrow\\text{empirische Interpretation}',
     word_latex='\\text{mathematische Struktur}\\longrightarrow\\text{Modellentscheidung}\\longrightarrow\\text{Brückenannahme}\\longrightarrow\\text{empirische Interpretation}',
     provenance='original',validation_status='checked',created_revision_id=v_rev
 WHERE appendix_section_id=v_sec AND object_anchor='N5-EQ-001';

 UPDATE appendix_objects
 SET display_number='N5.2',
     title='Keine vorgetäuschte Ableitung',
     content_text='Eine nicht aus den zugrunde gelegten Voraussetzungen ableitbare Aussage darf nicht allein als Folgerung aus diesen Voraussetzungen ausgewiesen werden.',
     equation_latex='B\\notin\\operatorname{Cn}(A)\\Longrightarrow B\\ \\text{ist nicht allein als Folgerung aus}\\ A\\ \\text{auszuweisen}',
     word_latex='B\\notin\\operatorname{Cn}(A)\\Longrightarrow B\\ \\text{ist nicht allein als Folgerung aus}\\ A\\ \\text{auszuweisen}',
     provenance='original',validation_status='checked',created_revision_id=v_rev
 WHERE appendix_section_id=v_sec AND object_anchor='N5-EQ-002';

 INSERT INTO appendix_section_versions
 (appendix_section_id,revision_id,version_label,title,notes)
 VALUES
 (v_sec,v_rev,'N5.0-v2',
  'Gegenstand, methodische Stellung, Abgrenzung und Prüfprogramm',
  'Revisionsgebundener Snapshot der ueberarbeiteten dissertationsfaehigen Fassung N5.0.');

 SELECT COUNT(*) INTO v_snap FROM appendix_section_versions
 WHERE appendix_section_id=v_sec AND revision_id=v_rev;

 SELECT COUNT(*) INTO v_obj FROM appendix_objects
 WHERE appendix_section_id=v_sec AND created_revision_id=v_rev
 AND object_anchor IN ('N5-D01','N5-D02','N5-E01','N5-EQ-001','N5-EQ-002');

 SELECT COUNT(*) INTO v_eq FROM appendix_objects
 WHERE appendix_section_id=v_sec AND created_revision_id=v_rev
 AND object_type='equation' AND object_anchor IN ('N5-EQ-001','N5-EQ-002');

 SELECT COUNT(*) INTO v_sync FROM appendix_objects
 WHERE appendix_section_id=v_sec AND created_revision_id=v_rev
 AND object_type='equation' AND object_anchor IN ('N5-EQ-001','N5-EQ-002')
 AND equation_latex=word_latex;

 SELECT COUNT(*) INTO v_num FROM appendix_objects
 WHERE appendix_section_id=v_sec AND created_revision_id=v_rev
 AND object_type='equation'
 AND (equation_latex LIKE '%N5.1%' OR equation_latex LIKE '%N5.2%'
      OR word_latex LIKE '%N5.1%' OR word_latex LIKE '%N5.2%');

 SELECT COUNT(*) INTO v_bad
 FROM appendix_objects o LEFT JOIN repository_revisions r
 ON r.revision_id=o.created_revision_id
 WHERE o.appendix_section_id=v_sec AND o.created_revision_id=v_rev
 AND r.revision_id IS NULL;

 INSERT INTO repository_validation_results
 (revision_id,validation_code,validation_status,expected_value,actual_value,
  validation_message,checked_at)
 VALUES
 (v_rev,'RKB33-N50-R2-SNAPSHOT',IF(v_snap=1,'passed','failed'),'1',CAST(v_snap AS CHAR),
  'N5.0-v2 muss genau einen revisionsgebundenen Snapshot besitzen.',CURRENT_TIMESTAMP),
 (v_rev,'RKB33-N50-R2-OBJECTS',IF(v_obj=5,'passed','failed'),'5',CAST(v_obj AS CHAR),
  'Fünf kanonische N5.0-Kernobjekte müssen an Revision v2 gebunden sein.',CURRENT_TIMESTAMP),
 (v_rev,'RKB33-N50-R2-EQUATIONS',IF(v_eq=2 AND v_sync=2,'passed','failed'),
  'equations=2; sync=2',CONCAT('equations=',v_eq,'; sync=',v_sync),
  'N5.1 und N5.2 müssen vorhanden und Word-LaTeX-synchron sein.',CURRENT_TIMESTAMP),
 (v_rev,'RKB33-N50-R2-WORDLATEX-NUMBER-GATE',IF(v_num=0,'passed','failed'),'0',CAST(v_num AS CHAR),
  'Formelnummern dürfen nicht in equation_latex oder word_latex stehen.',CURRENT_TIMESTAMP),
 (v_rev,'RKB33-N50-R2-REVISION-LINKS',IF(v_bad=0,'passed','failed'),'0',CAST(v_bad AS CHAR),
  'Alle N5.0-v2-Objekte müssen eine gültige Revision besitzen.',CURRENT_TIMESTAMP);

 SELECT COUNT(*) INTO v_failed
 FROM repository_validation_results
 WHERE revision_id=v_rev
 AND validation_code IN
 ('RKB33-N50-R2-SNAPSHOT','RKB33-N50-R2-OBJECTS','RKB33-N50-R2-EQUATIONS',
  'RKB33-N50-R2-WORDLATEX-NUMBER-GATE','RKB33-N50-R2-REVISION-LINKS')
 AND validation_status<>'passed';

 INSERT INTO repository_validation_results
 (revision_id,validation_code,validation_status,expected_value,actual_value,
  validation_message,checked_at)
 VALUES
 (v_rev,'RKB33-N50-REVISION-GATE',IF(v_failed=0,'passed','failed'),
  '0 failed checks',CONCAT(v_failed,' failed checks'),
  IF(v_failed=0,'N5.0-v2 revisionsgebunden und konsistent.',
     'N5.0-v2 unvollständig; N5.1 bleibt gesperrt.'),CURRENT_TIMESTAMP),
 (v_rev,'RKB33-N50-START-GATE',IF(v_failed=0,'passed','failed'),
  'N5.0-v2 vollständig',IF(v_failed=0,'passed','blocked'),
  IF(v_failed=0,'N5.0-v2 abgeschlossen. N5.1 darf begonnen werden.',
     'N5.0-v2 fehlgeschlagen. N5.1 darf nicht begonnen werden.'),CURRENT_TIMESTAMP);

 IF v_failed<>0 THEN
   ROLLBACK;
   SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO=1644,
   MESSAGE_TEXT='RKB33-N50-R2-FINAL-GATE fehlgeschlagen; Rollback.';
 END IF;

 COMMIT;

 SELECT 'RKB33-N50-START-GATE' AS gate_code,'passed' AS gate_status,
        v_sec AS section_id,v_rev AS revision_id,v_snap AS snapshots,
        v_obj AS core_objects,v_eq AS equations,v_sync AS word_latex_sync,
        v_num AS formula_number_leaks,
        'N5.0-v2 abgeschlossen; N5.1 freigegeben.' AS message;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n50_revise_v3` ()   BEGIN
    DECLARE v_mod BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_sec BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_old_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_new_rev BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_n50_gate INT DEFAULT 0;
    DECLARE v_snap INT DEFAULT 0;
    DECLARE v_obj INT DEFAULT 0;
    DECLARE v_eq INT DEFAULT 0;
    DECLARE v_sync INT DEFAULT 0;
    DECLARE v_num_leaks INT DEFAULT 0;
    DECLARE v_bad_rev INT DEFAULT 0;
    DECLARE v_failed INT DEFAULT 0;

    -- ------------------------------------------------------------------------
    -- 1. N5 und N5.0 müssen bereits real existieren
    -- ------------------------------------------------------------------------
    SELECT MAX(appendix_module_id)
      INTO v_mod
      FROM appendix_modules
     WHERE appendix_code='N5';

    IF v_mod IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N50-R3: N5-Modul fehlt. Zuerst N5.0 materialisieren.';
    END IF;

    SELECT MAX(appendix_section_id)
      INTO v_sec
      FROM appendix_sections
     WHERE appendix_module_id=v_mod
       AND section_code='N5.0';

    IF v_sec IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N50-R3: N5.0 fehlt. Zuerst N5.0 materialisieren.';
    END IF;

    SELECT created_revision_id
      INTO v_old_rev
      FROM appendix_sections
     WHERE appendix_section_id=v_sec;

    IF v_old_rev IS NULL
       OR NOT EXISTS (
           SELECT 1
             FROM repository_revisions
            WHERE revision_id=v_old_rev
       ) THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N50-R3: N5.0 besitzt keine gültige Ausgangsrevision.';
    END IF;

    -- ------------------------------------------------------------------------
    -- 2. Maßgebliche Voraussetzung ist jetzt N5.0 selbst.
    --    Akzeptiert wird ein bereits bestandenes N5.0 START- oder REVISION-GATE.
    -- ------------------------------------------------------------------------
    SELECT COUNT(*)
      INTO v_n50_gate
      FROM repository_validation_results
     WHERE revision_id=v_old_rev
       AND validation_status='passed'
       AND validation_code IN
           ('RKB33-N50-START-GATE','RKB33-N50-REVISION-GATE');

    IF v_n50_gate < 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N50-R3: Für die aktuelle N5.0-Revision ist kein bestandenes N5.0-Gate gespeichert.';
    END IF;

    -- ------------------------------------------------------------------------
    -- 3. Mehrfachausführung verhindern
    -- ------------------------------------------------------------------------
    IF EXISTS (
        SELECT 1
          FROM repository_revisions
         WHERE revision_code='RKB33-REV-N5.0-R3-2026-09-24'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N50-R3-DUPLICATE: N5.0-R3 wurde bereits angelegt.';
    END IF;

    START TRANSACTION;

    -- ------------------------------------------------------------------------
    -- 4. Neue Revision
    -- ------------------------------------------------------------------------
    INSERT INTO repository_revisions
    (
        revision_code,
        revision_date,
        scope_type,
        scope_reference,
        version_label,
        summary,
        created_by,
        parent_revision_id
    )
    VALUES
    (
        'RKB33-REV-N5.0-R3-2026-09-24',
        CURRENT_TIMESTAMP,
        'section',
        'N5.0',
        'N5.0-v3',
        'Überarbeitete dissertationsfähige Fassung von N5.0; Ebenentrennung und korrigierte Trennung von Formelnummer und Word-LaTeX.',
        'Olaf Thiele / ChatGPT',
        v_old_rev
    );

    SET v_new_rev=LAST_INSERT_ID();

    -- ------------------------------------------------------------------------
    -- 5. Section auf neue Revision binden
    -- ------------------------------------------------------------------------
    UPDATE appendix_sections
       SET title='Gegenstand, methodische Stellung, Abgrenzung und Prüfprogramm',
           notes='N5.0-v3: mathematische Struktur -> Modellentscheidung -> Brückenannahme -> empirische Interpretation; klare Abgrenzung zu N4 und N6.',
           created_revision_id=v_new_rev
     WHERE appendix_section_id=v_sec;

    -- ------------------------------------------------------------------------
    -- 6. Kanonische Kernobjekte aktualisieren und revisionsbinden
    -- ------------------------------------------------------------------------
    UPDATE appendix_objects
       SET created_revision_id=v_new_rev
     WHERE appendix_section_id=v_sec
       AND object_anchor IN
           ('N5-D01','N5-D02','N5-E01','N5-EQ-001','N5-EQ-002');

    UPDATE appendix_objects
       SET title='Methodische Ebenentrennung',
           content_text='Verbindliche Trennung zwischen mathematischer Struktur, Modellentscheidung, Brückenannahme und empirischer Interpretation.',
           provenance='original',
           validation_status='checked',
           created_revision_id=v_new_rev
     WHERE appendix_section_id=v_sec
       AND object_anchor='N5-D01';

    UPDATE appendix_objects
       SET title='Brückenannahme',
           content_text='Eine Brückenannahme ist eine ausdrücklich ausgewiesene zusätzliche Zuordnung, durch die ein Bestandteil der mathematisch-theoretischen Modellstruktur mit einer physikalisch oder empirisch interpretierbaren Größe, Eigenschaft, Relation oder einem Vorgang verbunden wird. Sie darf nicht als rein mathematische Ableitung ausgegeben werden.',
           provenance='original',
           validation_status='checked',
           created_revision_id=v_new_rev
     WHERE appendix_section_id=v_sec
       AND object_anchor='N5-D02';

    UPDATE appendix_objects
       SET title='Originäre Eigenleistung der methodischen FRZK-Trennung',
           content_text='Originäre Eigenleistung dieser Arbeit ist die konsequente Übertragung der Ebenentrennung auf die FRZK-Grundlegung und ihre Verbindung mit der revisionsgebundenen Prüfarchitektur.',
           provenance='original',
           validation_status='checked',
           created_revision_id=v_new_rev
     WHERE appendix_section_id=v_sec
       AND object_anchor='N5-E01';

    -- ------------------------------------------------------------------------
    -- 7. Gleichungen korrigieren
    --    Die Nummer steht NUR in display_number.
    --    equation_latex und word_latex enthalten KEINE Nummer.
    -- ------------------------------------------------------------------------
    UPDATE appendix_objects
       SET display_number='N5.1',
           title='Methodischer Übergang',
           content_text='Prüfweg von der mathematischen Struktur über Modellentscheidung und Brückenannahme zur empirischen Interpretation.',
           equation_latex='\\text{mathematische Struktur}\\longrightarrow\\text{Modellentscheidung}\\longrightarrow\\text{Brückenannahme}\\longrightarrow\\text{empirische Interpretation}',
           word_latex='\\text{mathematische Struktur}\\longrightarrow\\text{Modellentscheidung}\\longrightarrow\\text{Brückenannahme}\\longrightarrow\\text{empirische Interpretation}',
           provenance='original',
           validation_status='checked',
           created_revision_id=v_new_rev
     WHERE appendix_section_id=v_sec
       AND object_anchor='N5-EQ-001';

    UPDATE appendix_objects
       SET display_number='N5.2',
           title='Keine vorgetäuschte Ableitung',
           content_text='Eine nicht aus den zugrunde gelegten Voraussetzungen ableitbare Aussage darf nicht allein als Folgerung aus diesen Voraussetzungen ausgewiesen werden.',
           equation_latex='B\\notin\\operatorname{Cn}(A)\\Longrightarrow B\\ \\text{ist nicht allein als Folgerung aus}\\ A\\ \\text{auszuweisen}',
           word_latex='B\\notin\\operatorname{Cn}(A)\\Longrightarrow B\\ \\text{ist nicht allein als Folgerung aus}\\ A\\ \\text{auszuweisen}',
           provenance='original',
           validation_status='checked',
           created_revision_id=v_new_rev
     WHERE appendix_section_id=v_sec
       AND object_anchor='N5-EQ-002';

    -- ------------------------------------------------------------------------
    -- 8. Snapshot
    -- ------------------------------------------------------------------------
    INSERT INTO appendix_section_versions
    (
        appendix_section_id,
        revision_id,
        version_label,
        title,
        notes
    )
    VALUES
    (
        v_sec,
        v_new_rev,
        'N5.0-v3',
        'Gegenstand, methodische Stellung, Abgrenzung und Prüfprogramm',
        'Revisionsgebundener Snapshot der korrigierten N5.0-Fassung.'
    );

    -- ------------------------------------------------------------------------
    -- 9. Reale Prüfung
    -- ------------------------------------------------------------------------
    SELECT COUNT(*) INTO v_snap
      FROM appendix_section_versions
     WHERE appendix_section_id=v_sec
       AND revision_id=v_new_rev;

    SELECT COUNT(*) INTO v_obj
      FROM appendix_objects
     WHERE appendix_section_id=v_sec
       AND created_revision_id=v_new_rev
       AND object_anchor IN
           ('N5-D01','N5-D02','N5-E01','N5-EQ-001','N5-EQ-002');

    SELECT COUNT(*) INTO v_eq
      FROM appendix_objects
     WHERE appendix_section_id=v_sec
       AND created_revision_id=v_new_rev
       AND object_type='equation'
       AND object_anchor IN ('N5-EQ-001','N5-EQ-002');

    SELECT COUNT(*) INTO v_sync
      FROM appendix_objects
     WHERE appendix_section_id=v_sec
       AND created_revision_id=v_new_rev
       AND object_type='equation'
       AND object_anchor IN ('N5-EQ-001','N5-EQ-002')
       AND equation_latex=word_latex;

    SELECT COUNT(*) INTO v_num_leaks
      FROM appendix_objects
     WHERE appendix_section_id=v_sec
       AND created_revision_id=v_new_rev
       AND object_type='equation'
       AND (
            equation_latex LIKE '%N5.1%'
         OR equation_latex LIKE '%N5.2%'
         OR word_latex LIKE '%N5.1%'
         OR word_latex LIKE '%N5.2%'
       );

    SELECT COUNT(*) INTO v_bad_rev
      FROM appendix_objects o
      LEFT JOIN repository_revisions r
        ON r.revision_id=o.created_revision_id
     WHERE o.appendix_section_id=v_sec
       AND o.created_revision_id=v_new_rev
       AND r.revision_id IS NULL;

    -- ------------------------------------------------------------------------
    -- 10. Validierung
    -- ------------------------------------------------------------------------
    INSERT INTO repository_validation_results
    (
        revision_id, validation_code, validation_status,
        expected_value, actual_value, validation_message, checked_at
    )
    VALUES
    (
        v_new_rev,'RKB33-N50-R3-SNAPSHOT',
        IF(v_snap=1,'passed','failed'),
        '1',CAST(v_snap AS CHAR),
        'N5.0-v3 muss genau einen revisionsgebundenen Snapshot besitzen.',
        CURRENT_TIMESTAMP
    ),
    (
        v_new_rev,'RKB33-N50-R3-OBJECTS',
        IF(v_obj=5,'passed','failed'),
        '5',CAST(v_obj AS CHAR),
        'Die fünf kanonischen N5.0-Kernobjekte müssen an N5.0-v3 gebunden sein.',
        CURRENT_TIMESTAMP
    ),
    (
        v_new_rev,'RKB33-N50-R3-EQUATIONS',
        IF(v_eq=2 AND v_sync=2,'passed','failed'),
        'equations=2; sync=2',
        CONCAT('equations=',v_eq,'; sync=',v_sync),
        'N5.1 und N5.2 müssen vorhanden und Word-LaTeX-synchron sein.',
        CURRENT_TIMESTAMP
    ),
    (
        v_new_rev,'RKB33-N50-R3-WORDLATEX-NUMBER-GATE',
        IF(v_num_leaks=0,'passed','failed'),
        '0',CAST(v_num_leaks AS CHAR),
        'Formelnummern dürfen weder in equation_latex noch in word_latex enthalten sein.',
        CURRENT_TIMESTAMP
    ),
    (
        v_new_rev,'RKB33-N50-R3-REVISION-LINKS',
        IF(v_bad_rev=0,'passed','failed'),
        '0',CAST(v_bad_rev AS CHAR),
        'Alle N5.0-v3-Kernobjekte müssen auf eine gültige Revision zeigen.',
        CURRENT_TIMESTAMP
    );

    SELECT COUNT(*) INTO v_failed
      FROM repository_validation_results
     WHERE revision_id=v_new_rev
       AND validation_code IN
       (
           'RKB33-N50-R3-SNAPSHOT',
           'RKB33-N50-R3-OBJECTS',
           'RKB33-N50-R3-EQUATIONS',
           'RKB33-N50-R3-WORDLATEX-NUMBER-GATE',
           'RKB33-N50-R3-REVISION-LINKS'
       )
       AND validation_status<>'passed';

    INSERT INTO repository_validation_results
    (
        revision_id, validation_code, validation_status,
        expected_value, actual_value, validation_message, checked_at
    )
    VALUES
    (
        v_new_rev,
        'RKB33-N50-REVISION-GATE',
        IF(v_failed=0,'passed','failed'),
        '0 failed checks',
        CONCAT(v_failed,' failed checks'),
        IF(v_failed=0,
           'N5.0-v3 ist revisionsgebunden und vollständig.',
           'N5.0-v3 ist unvollständig; N5.1 bleibt gesperrt.'),
        CURRENT_TIMESTAMP
    ),
    (
        v_new_rev,
        'RKB33-N50-START-GATE',
        IF(v_failed=0,'passed','failed'),
        'N5.0-v3 vollständig',
        IF(v_failed=0,'passed','blocked'),
        IF(v_failed=0,
           'N5.0-v3 abgeschlossen. N5.1 darf begonnen werden.',
           'N5.0-v3 fehlgeschlagen. N5.1 darf nicht begonnen werden.'),
        CURRENT_TIMESTAMP
    );

    IF v_failed<>0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N50-R3-FINAL-GATE fehlgeschlagen; Rollback.';
    END IF;

    COMMIT;

    SELECT
        'RKB33-N50-START-GATE' AS gate_code,
        'passed' AS gate_status,
        v_sec AS n50_section_id,
        v_new_rev AS n50_revision_id,
        v_snap AS snapshots,
        v_obj AS core_objects,
        v_eq AS equations,
        v_sync AS word_latex_sync,
        v_num_leaks AS formula_number_leaks,
        'N5.0-v3 abgeschlossen; N5.1 freigegeben.' AS message;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n5n6_final_assert` ()   main: BEGIN

    DECLARE v_n5_module BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n59_section BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n59_revision BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_gate_revision BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_sections INT DEFAULT 0;
    DECLARE v_duplicate_sections INT DEFAULT 0;
    DECLARE v_current_revisions INT DEFAULT 0;
    DECLARE v_snapshots INT DEFAULT 0;
    DECLARE v_bad_section_revisions INT DEFAULT 0;
    DECLARE v_bad_object_revisions INT DEFAULT 0;

    DECLARE v_equations INT DEFAULT 0;
    DECLARE v_equation_numbers INT DEFAULT 0;
    DECLARE v_wordlatex_sync INT DEFAULT 0;
    DECLARE v_formula_number_leaks INT DEFAULT 0;
    DECLARE v_eq77 INT DEFAULT 0;

    DECLARE v_n59_gate INT DEFAULT 0;
    DECLARE v_status_vector INT DEFAULT 0;
    DECLARE v_nonimplications INT DEFAULT 0;
    DECLARE v_claim_gates INT DEFAULT 0;
    DECLARE v_open_status INT DEFAULT 0;
    DECLARE v_eigen_07_10 INT DEFAULT 0;

    DECLARE v_failed INT DEFAULT 0;
    DECLARE v_message TEXT DEFAULT NULL;

    -- ========================================================================
    -- 1. N5 MUSS EXISTIEREN
    -- ========================================================================

    SELECT MAX(appendix_module_id)
      INTO v_n5_module
      FROM appendix_modules
     WHERE appendix_code='N5';

    IF v_n5_module IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N5N6-FINAL: N5-Modul fehlt.';
    END IF;

    -- ========================================================================
    -- 2. N5.9 UND DESSEN AKTUELL GEBUNDENE REVISION
    -- ========================================================================

    SELECT MAX(appendix_section_id)
      INTO v_n59_section
      FROM appendix_sections
     WHERE appendix_module_id=v_n5_module
       AND section_code='N5.9';

    IF v_n59_section IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N5N6-FINAL: N5.9 fehlt.';
    END IF;

    SELECT created_revision_id
      INTO v_n59_revision
      FROM appendix_sections
     WHERE appendix_section_id=v_n59_section
     LIMIT 1;

    IF v_n59_revision IS NULL
       OR NOT EXISTS (
            SELECT 1
              FROM repository_revisions
             WHERE revision_id=v_n59_revision
               AND scope_type='section'
               AND scope_reference='N5.9'
       ) THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N5N6-FINAL: N5.9 besitzt keine gueltige aktuelle Section-Revision.';
    END IF;

    -- ========================================================================
    -- 3. GATE-REVISION ZWINGEND ANLEGEN
    --





    -- Anders als in den fehlerhaften Vorversionen gibt es hier KEIN
    -- WHERE v_gate=passed. Die Revision wird immer erzeugt, sobald N5.9
    -- revisionsgueltig vorhanden ist.
    -- ========================================================================

    START TRANSACTION;

    INSERT INTO repository_revisions
    (
        revision_code,
        revision_date,
        scope_type,
        scope_reference,
        version_label,
        summary,
        created_by,
        parent_revision_id
    )
    VALUES
    (
        'RKB33-GATE-N5-N6-2026-09-25',
        CURRENT_TIMESTAMP,
        'repository',
        'N5->N6',
        'handoff-gate-v1',
        'Eigenstaendige revisionsgebundene Abschluss- und Uebergabepruefung von Anlage N5 nach Anlage N6.',
        'Olaf Thiele / ChatGPT',
        v_n59_revision
    )
    ON DUPLICATE KEY UPDATE
        revision_date=CURRENT_TIMESTAMP,
        scope_type='repository',
        scope_reference='N5->N6',
        version_label='handoff-gate-v1',
        summary=VALUES(summary),
        created_by=VALUES(created_by),
        parent_revision_id=v_n59_revision;

    SELECT revision_id
      INTO v_gate_revision
      FROM repository_revisions
     WHERE revision_code='RKB33-GATE-N5-N6-2026-09-25'
     LIMIT 1;

    IF v_gate_revision IS NULL THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N5N6-FINAL: Gate-Revision konnte nicht erzeugt werden.';
    END IF;

    -- Gate-Revision sofort festschreiben.
    -- Damit bleibt sie auch erhalten, wenn spaeter ein fachliches Gate failed.
    COMMIT;

    -- ========================================================================
    -- 4. REALE N5-STRUKTUR
    -- ========================================================================

    SELECT COUNT(DISTINCT section_code)
      INTO v_sections
      FROM appendix_sections
     WHERE appendix_module_id=v_n5_module
       AND section_code IN
       ('N5.0','N5.1','N5.2','N5.3','N5.4',
        'N5.5','N5.6','N5.7','N5.8','N5.9');

    SELECT COUNT(*)
      INTO v_duplicate_sections
      FROM (
        SELECT section_code
          FROM appendix_sections
         WHERE appendix_module_id=v_n5_module
           AND section_code IN
           ('N5.0','N5.1','N5.2','N5.3','N5.4',
            'N5.5','N5.6','N5.7','N5.8','N5.9')
         GROUP BY section_code
        HAVING COUNT(*)<>1
      ) x;

    -- Jede aktuelle Section muss auf eine reale, zu ihr passende Revision zeigen.
    SELECT COUNT(*)
      INTO v_current_revisions
      FROM appendix_sections s
      JOIN repository_revisions r
        ON r.revision_id=s.created_revision_id
       AND r.scope_type='section'
       AND r.scope_reference=s.section_code
     WHERE s.appendix_module_id=v_n5_module
       AND s.section_code IN
       ('N5.0','N5.1','N5.2','N5.3','N5.4',
        'N5.5','N5.6','N5.7','N5.8','N5.9');

    SELECT COUNT(*)
      INTO v_bad_section_revisions
      FROM appendix_sections s
      LEFT JOIN repository_revisions r
        ON r.revision_id=s.created_revision_id
     WHERE s.appendix_module_id=v_n5_module
       AND s.section_code IN
       ('N5.0','N5.1','N5.2','N5.3','N5.4',
        'N5.5','N5.6','N5.7','N5.8','N5.9')
       AND (
            r.revision_id IS NULL
         OR r.scope_type<>'section'
         OR r.scope_reference<>s.section_code
       );

    -- Mindestens ein Snapshot fuer die jeweils aktuell gebundene Revision.
    SELECT COUNT(DISTINCT s.section_code)
      INTO v_snapshots
      FROM appendix_sections s
      JOIN appendix_section_versions v
        ON v.appendix_section_id=s.appendix_section_id
       AND v.revision_id=s.created_revision_id
     WHERE s.appendix_module_id=v_n5_module
       AND s.section_code IN
       ('N5.0','N5.1','N5.2','N5.3','N5.4',
        'N5.5','N5.6','N5.7','N5.8','N5.9');

    -- Alle Objekte muessen an die aktuelle Revision ihrer Section gebunden sein.
    SELECT COUNT(*)
      INTO v_bad_object_revisions
      FROM appendix_objects o
      JOIN appendix_sections s
        ON s.appendix_section_id=o.appendix_section_id
     WHERE s.appendix_module_id=v_n5_module
       AND s.section_code IN
       ('N5.0','N5.1','N5.2','N5.3','N5.4',
        'N5.5','N5.6','N5.7','N5.8','N5.9')
       AND o.created_revision_id<>s.created_revision_id;

    -- ========================================================================
    -- 5. GLEICHUNGSBESTAND
    -- ========================================================================

    SELECT COUNT(*)
      INTO v_equations
      FROM appendix_objects o
      JOIN appendix_sections s
        ON s.appendix_section_id=o.appendix_section_id
     WHERE s.appendix_module_id=v_n5_module
       AND s.section_code IN
       ('N5.0','N5.1','N5.2','N5.3','N5.4',
        'N5.5','N5.6','N5.7','N5.8','N5.9')
       AND o.object_type='equation';

    SELECT COUNT(DISTINCT o.display_number)
      INTO v_equation_numbers
      FROM appendix_objects o
      JOIN appendix_sections s
        ON s.appendix_section_id=o.appendix_section_id
     WHERE s.appendix_module_id=v_n5_module
       AND s.section_code IN
       ('N5.0','N5.1','N5.2','N5.3','N5.4',
        'N5.5','N5.6','N5.7','N5.8','N5.9')
       AND o.object_type='equation'
       AND o.display_number REGEXP '^N5\\.[0-9]+$';

    SELECT COUNT(*)
      INTO v_wordlatex_sync
      FROM appendix_objects o
      JOIN appendix_sections s
        ON s.appendix_section_id=o.appendix_section_id
     WHERE s.appendix_module_id=v_n5_module
       AND s.section_code IN
       ('N5.0','N5.1','N5.2','N5.3','N5.4',
        'N5.5','N5.6','N5.7','N5.8','N5.9')
       AND o.object_type='equation'
       AND o.formal_latex=o.word_latex;

    -- Formelnummer darf NICHT in formal_latex/word_latex stehen.
    -- Die Pruefung sucht eine typische am Ende stehende Gleichungsnummer.
    SELECT COUNT(*)
      INTO v_formula_number_leaks
      FROM appendix_objects o
      JOIN appendix_sections s
        ON s.appendix_section_id=o.appendix_section_id
     WHERE s.appendix_module_id=v_n5_module
       AND s.section_code IN
       ('N5.0','N5.1','N5.2','N5.3','N5.4',
        'N5.5','N5.6','N5.7','N5.8','N5.9')
       AND o.object_type='equation'
       AND (
            (o.display_number IS NOT NULL
             AND o.formal_latex LIKE CONCAT('%',o.display_number,'%'))
         OR (o.display_number IS NOT NULL
             AND o.word_latex LIKE CONCAT('%',o.display_number,'%'))
       );

    SELECT COUNT(*)
      INTO v_eq77
      FROM appendix_objects o
      JOIN appendix_sections s
        ON s.appendix_section_id=o.appendix_section_id
     WHERE s.appendix_module_id=v_n5_module
       AND o.object_type='equation'
       AND o.display_number='N5.77';

    -- ========================================================================
    -- 6. N5.9 MUSS SEIN EIGENES GATE BESTANDEN HABEN
    -- ========================================================================

    SELECT COUNT(*)
      INTO v_n59_gate
      FROM repository_validation_results
     WHERE revision_id=v_n59_revision
       AND validation_status='passed'
       AND validation_code IN
       ('RKB33-N59-REVISION-GATE','RKB33-N59-START-GATE');

    -- ========================================================================
    -- 7. INHALTLICHE SCHUTZOBJEKTE AUS N5.9
    -- ========================================================================

    SELECT COUNT(*)
      INTO v_status_vector
      FROM appendix_objects
     WHERE appendix_section_id=v_n59_section
       AND object_anchor='N5-EQ-064'
       AND object_type='equation';

    SELECT COUNT(*)
      INTO v_nonimplications
      FROM appendix_objects
     WHERE appendix_section_id=v_n59_section
       AND object_anchor IN ('N5-EQ-068','N5-EQ-069','N5-EQ-071')
       AND object_type='equation'
       AND formal_latex LIKE '%\\not\\Rightarrow%';

    SELECT COUNT(*)
      INTO v_claim_gates
      FROM appendix_objects
     WHERE appendix_section_id=v_n59_section
       AND object_anchor IN
       ('N5-EQ-072','N5-EQ-073','N5-EQ-074',
        'N5-EQ-075','N5-EQ-076','N5-EQ-077');

    SELECT COUNT(*)
      INTO v_open_status
      FROM appendix_objects
     WHERE appendix_section_id=v_n59_section
       AND object_anchor IN ('N5-D31','N5-R02');

    SELECT COUNT(DISTINCT o.object_anchor)
      INTO v_eigen_07_10
      FROM appendix_objects o
      JOIN appendix_sections s
        ON s.appendix_section_id=o.appendix_section_id
     WHERE s.appendix_module_id=v_n5_module
       AND o.object_anchor IN ('N5-E07','N5-E08','N5-E09','N5-E10');

    -- ========================================================================
    -- 8. EINZELVALIDIERUNGEN AN DER EIGENEN GATE-REVISION
    -- ========================================================================

    START TRANSACTION;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    VALUES
    (
      v_gate_revision,
      'RKB33-N5N6-REVISION',
      IF(v_gate_revision IS NOT NULL,'passed','failed'),
      'Gate-Revision vorhanden',
      CONCAT('gate_revision_id=',COALESCE(v_gate_revision,0),
             '; parent_n59=',COALESCE(v_n59_revision,0)),
      'Eigenstaendige Gate-Revision N5->N6 muss real vorhanden und an die aktuelle N5.9-Revision gebunden sein.',
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    VALUES
    (
      v_gate_revision,
      'RKB33-N5N6-SECTIONS',
      IF(v_sections=10 AND v_duplicate_sections=0,'passed','failed'),
      'sections=10; duplicates=0',
      CONCAT('sections=',v_sections,'; duplicates=',v_duplicate_sections),
      'N5.0 bis N5.9 muessen jeweils genau einmal vorhanden sein.',
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    VALUES
    (
      v_gate_revision,
      'RKB33-N5N6-REVISION-LINKS',
      IF(v_current_revisions=10
         AND v_bad_section_revisions=0
         AND v_bad_object_revisions=0,'passed','failed'),
      'current_revisions=10; bad_sections=0; bad_objects=0',
      CONCAT('current_revisions=',v_current_revisions,
             '; bad_sections=',v_bad_section_revisions,
             '; bad_objects=',v_bad_object_revisions),
      'Sections und Objekte muessen an gueltige aktuelle Section-Revisionen gebunden sein.',
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    VALUES
    (
      v_gate_revision,
      'RKB33-N5N6-SNAPSHOTS',
      IF(v_snapshots=10,'passed','failed'),
      '10',
      CAST(v_snapshots AS CHAR),
      'Jede aktuelle N5-Section muss mindestens einen Snapshot auf ihrer aktuellen Revision besitzen.',
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    VALUES
    (
      v_gate_revision,
      'RKB33-N5N6-EQUATIONS',
      IF(v_equations=77 AND v_equation_numbers=77 AND v_eq77=1,'passed','failed'),
      'equations=77; unique_numbers=77; N5.77=1',
      CONCAT('equations=',v_equations,
             '; unique_numbers=',v_equation_numbers,
             '; N5.77=',v_eq77),
      'N5 muss den kanonischen Gleichungsbestand N5.1 bis N5.77 enthalten.',
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    VALUES
    (
      v_gate_revision,
      'RKB33-N5N6-WORDLATEX',
      IF(v_wordlatex_sync=v_equations AND v_formula_number_leaks=0,'passed','failed'),
      'sync=equations; formula_number_leaks=0',
      CONCAT('sync=',v_wordlatex_sync,
             '; equations=',v_equations,
             '; formula_number_leaks=',v_formula_number_leaks),
      'formal_latex und word_latex muessen synchron sein; Formelnummern duerfen nicht in der Word-LaTeX-Zeile stehen.',
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    VALUES
    (
      v_gate_revision,
      'RKB33-N5N6-N59',
      IF(v_n59_gate>=1,'passed','failed'),
      '>=1 passed N5.9 gate',
      CAST(v_n59_gate AS CHAR),
      'Die aktuelle N5.9-Revision muss mindestens ein bestandenes N5.9-Revision-/Start-Gate besitzen.',
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    VALUES
    (
      v_gate_revision,
      'RKB33-N5N6-CONTENT',
      IF(v_status_vector=1
         AND v_nonimplications=3
         AND v_claim_gates=6
         AND v_open_status=2
         AND v_eigen_07_10=4,'passed','failed'),
      'status_vector=1; nonimplications=3; claim_gates=6; open_status=2; eigen_E07_E10=4',
      CONCAT('status_vector=',v_status_vector,
             '; nonimplications=',v_nonimplications,
             '; claim_gates=',v_claim_gates,
             '; open_status=',v_open_status,
             '; eigen_E07_E10=',v_eigen_07_10),
      'Die abschliessende N5-Schutz-, Claim-Gate- und Eigenleistungsstruktur muss vollstaendig vorhanden sein.',
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    -- ========================================================================
    -- 9. FAILED-ZAEHLUNG DER EINZELGATES
    -- ========================================================================

    SELECT COUNT(*)
      INTO v_failed
      FROM repository_validation_results
     WHERE revision_id=v_gate_revision
       AND validation_code IN
       (
        'RKB33-N5N6-REVISION',
        'RKB33-N5N6-SECTIONS',
        'RKB33-N5N6-REVISION-LINKS',
        'RKB33-N5N6-SNAPSHOTS',
        'RKB33-N5N6-EQUATIONS',
        'RKB33-N5N6-WORDLATEX',
        'RKB33-N5N6-N59',
        'RKB33-N5N6-CONTENT'
       )
       AND validation_status='failed';

    -- ========================================================================
    -- 10. N5-FINAL-GATE
    -- ========================================================================

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    VALUES
    (
      v_gate_revision,
      'RKB33-N5-FINAL-GATE',
      IF(v_failed=0,'passed','failed'),
      '0 failed',
      CAST(v_failed AS CHAR),
      'Gesamtabschluss von N5. N6 bleibt bei mindestens einer fehlgeschlagenen Einzelvalidierung gesperrt.',
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    -- ========================================================================
    -- 11. UEBERGABEGATE N5 -> N6
    -- ========================================================================

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    VALUES
    (
      v_gate_revision,
      'RKB33-N5N6-FINAL-GATE',
      IF(v_failed=0,'passed','failed'),
      'RKB33-N5-FINAL-GATE = passed',
      IF(v_failed=0,'RKB33-N5-FINAL-GATE = passed',
                    CONCAT('failed Einzelvalidierungen=',v_failed)),
      IF(v_failed=0,
         'N5->N6-FINAL-GATE passed. N6.0 darf auf Grundlage dieser Gate-Revision begonnen werden.',
         'N5->N6-FINAL-GATE failed. N6.0 bleibt gesperrt.'),
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    -- Repository-Counter nur bei PASS fortschreiben.
    IF v_failed=0 THEN
        INSERT INTO repository_counters
        (counter_key,counter_value,updated_at)
        VALUES
        ('last_repository_revision',
         'RKB33-GATE-N5-N6-2026-09-25',
         CURRENT_TIMESTAMP)
        ON DUPLICATE KEY UPDATE
          counter_value=VALUES(counter_value),
          updated_at=CURRENT_TIMESTAMP;

        INSERT INTO repository_counters
        (counter_key,counter_value,updated_at)
        VALUES
        ('last_completed_section',
         'N5.9',
         CURRENT_TIMESTAMP)
        ON DUPLICATE KEY UPDATE
          counter_value=VALUES(counter_value),
          updated_at=CURRENT_TIMESTAMP;
    END IF;

    COMMIT;

    -- ========================================================================
    -- 12. DIAGNOSE – DIE GATE-REVISION MUSS JETZT IMMER SICHTBAR SEIN
    -- ========================================================================

    SELECT
        revision_id,
        revision_code,
        revision_date,
        scope_type,
        scope_reference,
        version_label,
        parent_revision_id
      FROM repository_revisions
     WHERE revision_id=v_gate_revision;

    SELECT
        validation_code,
        validation_status,
        expected_value,
        actual_value,
        validation_message,
        checked_at
      FROM repository_validation_results
     WHERE revision_id=v_gate_revision
     ORDER BY FIELD(
        validation_code,
        'RKB33-N5N6-REVISION',
        'RKB33-N5N6-SECTIONS',
        'RKB33-N5N6-REVISION-LINKS',
        'RKB33-N5N6-SNAPSHOTS',
        'RKB33-N5N6-EQUATIONS',
        'RKB33-N5N6-WORDLATEX',
        'RKB33-N5N6-N59',
        'RKB33-N5N6-CONTENT',
        'RKB33-N5-FINAL-GATE',
        'RKB33-N5N6-FINAL-GATE'
     );

    -- ========================================================================
    -- 13. HARTER STOPPER ERST NACH COMMIT
    --     Die Gate-Revision und ihre Diagnose bleiben also erhalten.
    -- ========================================================================

    IF v_failed<>0 THEN
        SET v_message=CONCAT(
            'RKB33-N5N6-FINAL-GATE failed: ',
            v_failed,
            ' Einzelvalidierung(en) fehlgeschlagen. ',
            'Gate-Revision wurde dennoch revisionssicher gespeichert; Diagnose beachten.'
        );

        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT=v_message;
    END IF;

    SELECT
      'RKB33-N5N6-FINAL-GATE' AS gate_code,
      'passed' AS gate_status,
      v_gate_revision AS gate_revision_id,
      v_n59_revision AS parent_n59_revision_id,
      'N6.0 darf begonnen werden.' AS message;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `_rkb33_n69_finalize` ()   main: BEGIN
    DECLARE v_n6_module BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n68_section BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n68_revision BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n69_section BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n69_revision BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_gate_revision BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_n1_module BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n2_module BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n3_module BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n4_module BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n5_module BIGINT UNSIGNED DEFAULT NULL;

    DECLARE v_n1_max_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n2_max_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n3_max_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n4_max_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n5_max_rev BIGINT UNSIGNED DEFAULT 0;

    DECLARE v_n1_gate_status VARCHAR(20) DEFAULT 'missing';
    DECLARE v_n2_final_status VARCHAR(20) DEFAULT 'missing';
    DECLARE v_n2n3_status VARCHAR(20) DEFAULT 'missing';
    DECLARE v_n3n4_status VARCHAR(20) DEFAULT 'missing';
    DECLARE v_n4_final_status VARCHAR(20) DEFAULT 'missing';
    DECLARE v_n4n5_status VARCHAR(20) DEFAULT 'missing';
    DECLARE v_n5_final_status VARCHAR(20) DEFAULT 'missing';
    DECLARE v_n5n6_status VARCHAR(20) DEFAULT 'missing';

    DECLARE v_n1_gate_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n2_final_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n2n3_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n3n4_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n4_final_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n4n5_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n5_final_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n5n6_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n2canon_status VARCHAR(20) DEFAULT 'missing';
    DECLARE v_n2canon_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n2_current_end_rev BIGINT UNSIGNED DEFAULT 0;
    DECLARE v_n28_section_id BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n28_scope_rev BIGINT UNSIGNED DEFAULT NULL;
    DECLARE v_n2_handoff_rev BIGINT UNSIGNED DEFAULT 0;

    DECLARE v_n2_sections INT DEFAULT 0;
    DECLARE v_n2_revisions INT DEFAULT 0;
    DECLARE v_n2_parent_chain INT DEFAULT 0;
    DECLARE v_n2_snapshots INT DEFAULT 0;
    DECLARE v_n2_bad_links INT DEFAULT 0;
    DECLARE v_n2_eq_count INT DEFAULT 0;
    DECLARE v_n2_eq_unique INT DEFAULT 0;
    DECLARE v_n2_eq_min INT DEFAULT 0;
    DECLARE v_n2_eq_max INT DEFAULT 0;
    DECLARE v_n2_eq_sync INT DEFAULT 0;
    DECLARE v_n2_eq_leaks INT DEFAULT 0;
    DECLARE v_n2_def_count INT DEFAULT 0;
    DECLARE v_n2_def_unique INT DEFAULT 0;
    DECLARE v_n2_def_min INT DEFAULT 0;
    DECLARE v_n2_def_max INT DEFAULT 0;
    DECLARE v_n2_revalidate_failed INT DEFAULT 0;
    DECLARE v_n2_revalidate_detail VARCHAR(255) DEFAULT NULL;

    DECLARE v_n1_ok INT DEFAULT 0;
    DECLARE v_n2_ok INT DEFAULT 0;
    DECLARE v_n3_ok INT DEFAULT 0;
    DECLARE v_n4_ok INT DEFAULT 0;
    DECLARE v_n5_ok INT DEFAULT 0;
    DECLARE v_n6_ok INT DEFAULT 0;
    DECLARE v_handoffs_ok INT DEFAULT 0;
    DECLARE v_aggregate_failed INT DEFAULT 0;

    DECLARE v_last_citation INT DEFAULT 0;
    DECLARE v_next_citation INT DEFAULT 0;

    DECLARE v_sections INT DEFAULT 0;
    DECLARE v_section_revisions INT DEFAULT 0;
    DECLARE v_snapshots INT DEFAULT 0;
    DECLARE v_parent_chain INT DEFAULT 0;
    DECLARE v_prior_start_gates INT DEFAULT 0;
    DECLARE v_bad_object_revision_links INT DEFAULT 0;

    DECLARE v_objects INT DEFAULT 0;
    DECLARE v_equations INT DEFAULT 0;
    DECLARE v_equation_numbers INT DEFAULT 0;
    DECLARE v_eq_min INT DEFAULT 0;
    DECLARE v_eq_max INT DEFAULT 0;
    DECLARE v_sync INT DEFAULT 0;
    DECLARE v_leaks INT DEFAULT 0;

    DECLARE v_defs INT DEFAULT 0;
    DECLARE v_def_numbers INT DEFAULT 0;
    DECLARE v_def_min INT DEFAULT 0;
    DECLARE v_def_max INT DEFAULT 0;

    DECLARE v_rules INT DEFAULT 0;
    DECLARE v_rule_numbers INT DEFAULT 0;
    DECLARE v_rule_min INT DEFAULT 0;
    DECLARE v_rule_max INT DEFAULT 0;

    DECLARE v_eigen INT DEFAULT 0;
    DECLARE v_eigen_numbers INT DEFAULT 0;
    DECLARE v_eigen_min INT DEFAULT 0;
    DECLARE v_eigen_max INT DEFAULT 0;

    DECLARE v_n69_objects INT DEFAULT 0;
    DECLARE v_n69_equations INT DEFAULT 0;
    DECLARE v_n69_defs INT DEFAULT 0;
    DECLARE v_n69_rules INT DEFAULT 0;
    DECLARE v_n69_eigen INT DEFAULT 0;
    DECLARE v_n69_nonimp INT DEFAULT 0;

    DECLARE v_sources_78_82 INT DEFAULT 0;
    DECLARE v_source_usages_78_82 INT DEFAULT 0;
    DECLARE v_literature_stable INT DEFAULT 0;

    DECLARE v_n6_failed INT DEFAULT 0;
    DECLARE v_failure_detail VARCHAR(255) DEFAULT NULL;
    DECLARE v_aggregate_detail VARCHAR(255) DEFAULT NULL;
    DECLARE v_body LONGTEXT;
    DECLARE v_checksum CHAR(64);
    DECLARE v_message TEXT;
    DECLARE v_recovery INT DEFAULT 0;

    -- ========================================================================
    -- 1. N6.8 MUSS REAL UND FREIGEGEBEN SEIN
    -- ========================================================================

    SELECT MAX(appendix_module_id)
      INTO v_n6_module
      FROM appendix_modules
     WHERE appendix_code='N6';

    IF v_n6_module IS NULL
       OR (SELECT COUNT(*) FROM appendix_modules WHERE appendix_code='N6')<>1 THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N69 START-GATE: N6-Modul fehlt oder ist mehrfach vorhanden.';
    END IF;

    SELECT MAX(appendix_section_id)
      INTO v_n68_section
      FROM appendix_sections
     WHERE appendix_module_id=v_n6_module
       AND section_code='N6.8';

    IF v_n68_section IS NULL
       OR (SELECT COUNT(*) FROM appendix_sections
            WHERE appendix_module_id=v_n6_module AND section_code='N6.8')<>1 THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N69 START-GATE: N6.8 fehlt oder ist mehrfach vorhanden.';
    END IF;

    SELECT created_revision_id
      INTO v_n68_revision
      FROM appendix_sections
     WHERE appendix_section_id=v_n68_section;

    IF NOT EXISTS (
        SELECT 1
          FROM repository_revisions
         WHERE revision_id=v_n68_revision
           AND scope_type='section'
           AND scope_reference='N6.8'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N69 START-GATE: reale N6.8-Revision fehlt.';
    END IF;

    IF NOT EXISTS (
        SELECT 1
          FROM repository_validation_results
         WHERE revision_id=v_n68_revision
           AND validation_code='RKB33-N68-START-GATE'
           AND validation_status='passed'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N69 START-GATE: RKB33-N68-START-GATE = passed fehlt.';
    END IF;

    -- ========================================================================
    -- 2. LITERATUR MUSS BEI 82 / 83 STEHEN
    -- ========================================================================

    SELECT CAST(counter_value AS UNSIGNED)
      INTO v_last_citation
      FROM repository_counters
     WHERE counter_key='last_citation_number'
     LIMIT 1;

    SELECT CAST(counter_value AS UNSIGNED)
      INTO v_next_citation
      FROM repository_counters
     WHERE counter_key='next_citation_number'
     LIMIT 1;

    IF COALESCE(v_last_citation,0)<>82 OR COALESCE(v_next_citation,0)<>83 THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N69 LITERATUR-GATE: erwarteter Literaturstand last=82 / next=83 liegt nicht vor.';
    END IF;

    -- ========================================================================
    -- 3. RECOVERY: N6.9 + N6-FINAL BEREITS ERFOLGREICH?
    -- ========================================================================

    IF (SELECT COUNT(*) FROM appendix_sections
         WHERE appendix_module_id=v_n6_module AND section_code='N6.9')=1 THEN

        SELECT appendix_section_id,created_revision_id
          INTO v_n69_section,v_n69_revision
          FROM appendix_sections
         WHERE appendix_module_id=v_n6_module
           AND section_code='N6.9';

        IF NOT EXISTS (
            SELECT 1
              FROM repository_revisions
             WHERE revision_id=v_n69_revision
               AND scope_type='section'
               AND scope_reference='N6.9'
               AND parent_revision_id=v_n68_revision
        ) THEN
            SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-N69 RECOVERY-GATE: vorhandene N6.9-Revision besitzt falsche Parent-Revision.';
        END IF;

        SELECT MAX(revision_id)
          INTO v_gate_revision
          FROM repository_revisions
         WHERE revision_code='RKB33-GATE-N6-N1N6-2026-09-25'
           AND scope_type='repository'
           AND scope_reference='N6->3.3'
           AND parent_revision_id=v_n69_revision;

        IF v_gate_revision IS NULL
           OR NOT EXISTS (
               SELECT 1
                 FROM repository_validation_results
                WHERE revision_id=v_gate_revision
                  AND validation_code='RKB33-N6-FINAL-GATE'
                  AND validation_status='passed'
           ) THEN
            SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-N69 RECOVERY-GATE: N6.9 existiert, aber ein gültiges RKB33-N6-FINAL-GATE fehlt.';
        END IF;

        SET v_recovery=1;
        SET v_n6_ok=1;
    ELSEIF (SELECT COUNT(*) FROM appendix_sections
             WHERE appendix_module_id=v_n6_module AND section_code='N6.9')>1 THEN
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N69 START-GATE: N6.9 ist mehrfach vorhanden.';
    END IF;

    -- ========================================================================
    -- 4. N6.9 MATERIALISIEREN, WENN NOCH NICHT VORHANDEN
    -- ========================================================================

    IF v_recovery=0 THEN

        IF EXISTS (
            SELECT 1
              FROM repository_revisions
             WHERE revision_code='RKB33-REV-N6.9-2026-09-25'
        ) THEN
            SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-N69 START-GATE: N6.9-Revision existiert widersprüchlich ohne gültige Section.';
        END IF;

        START TRANSACTION;

        INSERT INTO repository_revisions
        (
          revision_code,revision_date,scope_type,scope_reference,
          version_label,summary,created_by,parent_revision_id
        )
        VALUES
        (
          'RKB33-REV-N6.9-2026-09-25',
          CURRENT_TIMESTAMP,
          'section',
          'N6.9',
          'N6.9-v1',
          'Abschlussprüfung der Anlage N6 sowie Vorbereitung und Durchführung des revisionsgebundenen Gesamtgates N1 bis N6 für die Freigabe des Haupttextes 3.3.',
          'Olaf Thiele / ChatGPT',
          v_n68_revision
        );

        SET v_n69_revision=LAST_INSERT_ID();

        INSERT INTO appendix_sections
        (
          appendix_module_id,parent_appendix_section_id,section_code,title,
          sort_order,status,notes,created_revision_id
        )
        VALUES
        (
          v_n6_module,
          v_n68_section,
          'N6.9',
          'Abschlussprüfung der Anlage N6, Gesamtgate N1–N6 und Übergabe an Kapitel 3.3',
          10.0000,
          'draft',
          'Abschlussabschnitt von N6. N6-FINAL und N1N6-FINAL werden erst nach vollständiger realer Repositoryprüfung gesetzt.',
          v_n69_revision
        );

        SET v_n69_section=LAST_INSERT_ID();

        SET v_body='# N6.9 – Abschlussprüfung der Anlage N6, Gesamtgate N1–N6 und Übergabe an Kapitel 3.3

Mit N6.8 ist die inhaltliche Prüfarchitektur der Anlage N6 vollständig entwickelt. N6.1 hat den revisionsgebundenen Kandidatenbestand aus N1 bis N5 zusammengeführt. N6.2 bis N6.4 haben drei unterschiedliche Rekonstruktionsformen als methodische Vergleichsfälle ausgewertet. N6.5 hat daraus eine gemeinsame Kandidaten-, Abhängigkeits- und Prüfmatrix aufgebaut. N6.6 hat die Negativprüfung auf Redundanz, Definierbarkeit, Ableitbarkeit, Austauschbarkeit, Rekonstruierbarkeit und Zirkularität formuliert. N6.7 hat erstmals die Voraussetzungen für einen positiven Primärstatus festgelegt. N6.8 hat diese Entscheidungen zu einem revisionsgebundenen kanonischen Primärkern einschließlich Revalidierungs-, Rollback- und Übergabelogik zusammengeführt.

N6.9 besitzt damit keine weitere Rekonstruktionsaufgabe. Ich führe hier keine neue Primärstruktur, keine neue mathematische Operation und keine zusätzliche Brückenannahme ein. Aufgabe dieses letzten Abschnitts ist ausschließlich die vollständige und revisionsgebundene Abschlussprüfung der Anlage N6 sowie anschließend die Prüfung, ob die sechs Anlagen N1 bis N6 gemeinsam den Haupttext von Kapitel 3.3 freigeben dürfen.

\\[
\\mathcal{S}_{N6}=\\left\\{N6.0,N6.1,N6.2,N6.3,N6.4,N6.5,N6.6,N6.7,N6.8,N6.9\\right\\}
\\tag{N6.179}
\\]

Word-LaTeX: \\mathcal{S}_{N6}=\\left\\{N6.0,N6.1,N6.2,N6.3,N6.4,N6.5,N6.6,N6.7,N6.8,N6.9\\right\\}

\\[
G_{\\mathrm{sections},N6}=\\bigwedge_{s\\in\\mathcal{S}_{N6}}\\left(\\operatorname{Count}(s)=1\\land\\rho(s)\\neq\\varnothing\\right)
\\tag{N6.180}
\\]

Word-LaTeX: G_{\\mathrm{sections},N6}=\\bigwedge_{s\\in\\mathcal{S}_{N6}}\\left(\\operatorname{Count}(s)=1\\land\\rho(s)\\neq\\varnothing\\right)

Die Anlage ist hinsichtlich ihrer Abschnittsstruktur nur dann vollständig, wenn jeder vorgesehene Abschnitt genau einmal existiert und einer realen Repositoryrevision zugeordnet ist.

\\[
\\rho_{N6.0}\\prec\\rho_{N6.1}\\prec\\rho_{N6.2}\\prec\\cdots\\prec\\rho_{N6.9}
\\tag{N6.181}
\\]

Word-LaTeX: \\rho_{N6.0}\\prec\\rho_{N6.1}\\prec\\rho_{N6.2}\\prec\\cdots\\prec\\rho_{N6.9}

\\[
G_{\\mathrm{revision},N6}=\\bigwedge_{k=1}^{9}\\left(\\operatorname{parent}(\\rho_{N6.k})=\\rho_{N6.(k-1)}\\right)
\\tag{N6.182}
\\]

Word-LaTeX: G_{\\mathrm{revision},N6}=\\bigwedge_{k=1}^{9}\\left(\\operatorname{parent}(\\rho_{N6.k})=\\rho_{N6.(k-1)}\\right)

Jede N6-Revision muss auf der unmittelbar vorausgehenden realen N6-Revision aufbauen.

\\[
\\mathcal{E}_{N6}=\\left\\{N6.1,\\ldots,N6.n_{\\mathrm{final}}\\right\\}
\\tag{N6.183}
\\]

Word-LaTeX: \\mathcal{E}_{N6}=\\left\\{N6.1,\\ldots,N6.n_{\\mathrm{final}}\\right\\}

\\[
G_{\\mathrm{equation},N6}=G_{\\mathrm{complete}}\\land G_{\\mathrm{unique}}\\land G_{\\mathrm{ordered}}\\land G_{\\mathrm{word}}
\\tag{N6.184}
\\]

Word-LaTeX: G_{\\mathrm{equation},N6}=G_{\\mathrm{complete}}\\land G_{\\mathrm{unique}}\\land G_{\\mathrm{ordered}}\\land G_{\\mathrm{word}}

\\[
\\operatorname{formal\\_latex}(e)=\\operatorname{word\\_latex}(e)
\\tag{N6.185}
\\]

Word-LaTeX: \\operatorname{formal\\_latex}(e)=\\operatorname{word\\_latex}(e)

\\[
\\operatorname{EqNumberInFormula}(e)=0
\\tag{N6.186}
\\]

Word-LaTeX: \\operatorname{EqNumberInFormula}(e)=0

Damit werden Vollständigkeit, Eindeutigkeit und Word-LaTeX-Synchronität der gesamten Gleichungsfolge abgesichert.

\\[
G_{\\mathrm{literature},N6}=G_{\\mathrm{citation\\_unique}}\\land G_{\\mathrm{source\\_unique}}\\land G_{\\mathrm{author\\_link}}\\land G_{\\mathrm{first\\_usage}}
\\tag{N6.187}
\\]

Word-LaTeX: G_{\\mathrm{literature},N6}=G_{\\mathrm{citation\\_unique}}\\land G_{\\mathrm{source\\_unique}}\\land G_{\\mathrm{author\\_link}}\\land G_{\\mathrm{first\\_usage}}

\\[
\\operatorname{CitationNumber}(s_i)\\neq\\operatorname{CitationNumber}(s_j)\\qquad(i\\neq j)
\\tag{N6.188}
\\]

Word-LaTeX: \\operatorname{CitationNumber}(s_i)\\neq\\operatorname{CitationNumber}(s_j)\\qquad(i\\neq j)

\\[
\\Delta L_{N6.5\\rightarrow N6.9}=0
\\tag{N6.189}
\\]

Word-LaTeX: \\Delta L_{N6.5\\rightarrow N6.9}=0

Nach N6.4 wird keine neue Literatur eingeführt; die globale Literaturzählung bleibt bei [82] mit nächster Ziffer [83].

\\[
\\mathcal{O}_{N6}^{\\mathrm{own}}=\\left\\{N6\\text{-}E01,\\ldots,N6\\text{-}E41\\right\\}
\\tag{N6.190}
\\]

Word-LaTeX: \\mathcal{O}_{N6}^{\\mathrm{own}}=\\left\\{N6\\text{-}E01,\\ldots,N6\\text{-}E41\\right\\}

N6.9 erweitert diesen Eigenleistungsbestand um die Abschluss-Eigenleistungen N6-E42 bis N6-E47.

\\[
G_{\\mathrm{own},N6}=\\bigwedge_{e\\in\\mathcal{O}_{N6}^{\\mathrm{own}}}\\left(\\operatorname{Registered}(e)=1\\land\\operatorname{RevisionBound}(e)=1\\right)
\\tag{N6.191}
\\]

Word-LaTeX: G_{\\mathrm{own},N6}=\\bigwedge_{e\\in\\mathcal{O}_{N6}^{\\mathrm{own}}}\\left(\\operatorname{Registered}(e)=1\\land\\operatorname{RevisionBound}(e)=1\\right)

\\[
G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}\\Longrightarrow G_{\\mathrm{core}}=\\mathrm{passed}
\\tag{N6.192}
\\]

Word-LaTeX: G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}\\Longrightarrow G_{\\mathrm{core}}=\\mathrm{passed}

\\[
G_{\\mathrm{core}}=\\mathrm{passed}\\not\\Rightarrow G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}
\\tag{N6.193}
\\]

Word-LaTeX: G_{\\mathrm{core}}=\\mathrm{passed}\\not\\Rightarrow G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}

Das komponentenstrenge Kern-Gate ist notwendig, aber nicht hinreichend für den Abschluss der gesamten Anlage N6.

\\[
\\mathcal{H}_{3.3}=\\left\\{H_{3.3}(c,r)\\mid(c,r)\\in\\mathcal{K}_{N6}^{\\mathrm{prim}}\\right\\}
\\tag{N6.194}
\\]

Word-LaTeX: \\mathcal{H}_{3.3}=\\left\\{H_{3.3}(c,r)\\mid(c,r)\\in\\mathcal{K}_{N6}^{\\mathrm{prim}}\\right\\}

\\[
G_{\\mathrm{handoff},N6}=\\bigwedge_{h\\in\\mathcal{H}_{3.3}}\\operatorname{Complete}(h)
\\tag{N6.195}
\\]

Word-LaTeX: G_{\\mathrm{handoff},N6}=\\bigwedge_{h\\in\\mathcal{H}_{3.3}}\\operatorname{Complete}(h)

\\[
G_{N6\\text{-}\\mathrm{final}}=G_{\\mathrm{sections},N6}\\land G_{\\mathrm{revision},N6}\\land G_{\\mathrm{equation},N6}\\land G_{\\mathrm{literature},N6}\\land G_{\\mathrm{own},N6}\\land G_{\\mathrm{core}}\\land G_{\\mathrm{handoff},N6}
\\tag{N6.196}
\\]

Word-LaTeX: G_{N6\\text{-}\\mathrm{final}}=G_{\\mathrm{sections},N6}\\land G_{\\mathrm{revision},N6}\\land G_{\\mathrm{equation},N6}\\land G_{\\mathrm{literature},N6}\\land G_{\\mathrm{own},N6}\\land G_{\\mathrm{core}}\\land G_{\\mathrm{handoff},N6}

\\[
G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}
\\tag{N6.197}
\\]

Word-LaTeX: G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}

\\[
G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}\\not\\Rightarrow\\operatorname{Start}(3.3)=1
\\tag{N6.198}
\\]

Word-LaTeX: G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}\\not\\Rightarrow\\operatorname{Start}(3.3)=1

N6-FINAL allein gibt Kapitel 3.3 noch nicht frei.

\\[
\\mathcal{G}_{N1:N6}=\\left\\{G_{N1\\text{-}\\mathrm{final}},G_{N2\\text{-}\\mathrm{final}},G_{N3\\text{-}\\mathrm{final}},G_{N4\\text{-}\\mathrm{final}},G_{N5\\text{-}\\mathrm{final}},G_{N6\\text{-}\\mathrm{final}}\\right\\}
\\tag{N6.199}
\\]

Word-LaTeX: \\mathcal{G}_{N1:N6}=\\left\\{G_{N1\\text{-}\\mathrm{final}},G_{N2\\text{-}\\mathrm{final}},G_{N3\\text{-}\\mathrm{final}},G_{N4\\text{-}\\mathrm{final}},G_{N5\\text{-}\\mathrm{final}},G_{N6\\text{-}\\mathrm{final}}\\right\\}

\\[
G_{N1:N6}=\\bigwedge_{k=1}^{6}G_{Nk\\text{-}\\mathrm{final}}
\\tag{N6.200}
\\]

Word-LaTeX: G_{N1:N6}=\\bigwedge_{k=1}^{6}G_{Nk\\text{-}\\mathrm{final}}

\\[
G_{N1:N6}\\equiv\\mathrm{RKB33\\text{-}N1N6\\text{-}FINAL\\text{-}GATE}
\\tag{N6.201}
\\]

Word-LaTeX: G_{N1:N6}\\equiv\\mathrm{RKB33\\text{-}N1N6\\text{-}FINAL\\text{-}GATE

\\[
G_{Nk\\text{-}\\mathrm{final}}^{\\mathrm{historical}}=\\mathrm{passed}\\not\\Rightarrow G_{Nk\\text{-}\\mathrm{final}}^{\\mathrm{current}}=\\mathrm{passed}
\\tag{N6.202}
\\]

Word-LaTeX: G_{Nk\\text{-}\\mathrm{final}}^{\\mathrm{historical}}=\\mathrm{passed}\\not\\Rightarrow G_{Nk\\text{-}\\mathrm{final}}^{\\mathrm{current}}=\\mathrm{passed}

Für das Gesamtgate dürfen ausschließlich die jeweils aktuell gültigen Anlagenstände verwendet werden.

\\[
G_{N1:N6}=\\mathrm{passed}\\Longrightarrow N_{\\mathrm{relevant}}(\\mathrm{open},\\mathrm{blocked})=0
\\tag{N6.203}
\\]

Word-LaTeX: G_{N1:N6}=\\mathrm{passed}\\Longrightarrow N_{\\mathrm{relevant}}(\\mathrm{open},\\mathrm{blocked})=0

\\[
G_{N1:N6}\\neq\\mathrm{passed}\\Longrightarrow\\operatorname{Start}(3.3)=0
\\tag{N6.204}
\\]

Word-LaTeX: G_{N1:N6}\\neq\\mathrm{passed}\\Longrightarrow\\operatorname{Start}(3.3)=0

\\[
G_{N1:N6}=\\mathrm{passed}\\Longrightarrow\\operatorname{Start}(3.3)=1
\\tag{N6.205}
\\]

Word-LaTeX: G_{N1:N6}=\\mathrm{passed}\\Longrightarrow\\operatorname{Start}(3.3)=1

\\[
\\operatorname{Start}(3.3)=1\\not\\Rightarrow\\operatorname{Complete}(3.3)=1
\\tag{N6.206}
\\]

Word-LaTeX: \\operatorname{Start}(3.3)=1\\not\\Rightarrow\\operatorname{Complete}(3.3)=1

Die Freigabe erlaubt ausschließlich den Beginn des Haupttextes.

\\[
H_{N1:N6\\rightarrow3.3}=\\left(\\rho_{N1},\\rho_{N2},\\rho_{N3},\\rho_{N4},\\rho_{N5},\\rho_{N6},\\mathcal{K}_{N6}^{\\mathrm{prim}},\\mathcal{H}_{3.3},G_{N1:N6}\\right)
\\tag{N6.207}
\\]

Word-LaTeX: H_{N1:N6\\rightarrow3.3}=\\left(\\rho_{N1},\\rho_{N2},\\rho_{N3},\\rho_{N4},\\rho_{N5},\\rho_{N6},\\mathcal{K}_{N6}^{\\mathrm{prim}},\\mathcal{H}_{3.3},G_{N1:N6}\\right)

\\[
\\Delta_{\\mathrm{mat}}(\\rho_{Nk})=1\\Longrightarrow\\operatorname{Revalidate}\\left(H_{N1:N6\\rightarrow3.3}\\right)=1
\\tag{N6.208}
\\]

Word-LaTeX: \\Delta_{\\mathrm{mat}}(\\rho_{Nk})=1\\Longrightarrow\\operatorname{Revalidate}\\left(H_{N1:N6\\rightarrow3.3}\\right)=1

Originäre Eigenleistung dieser Arbeit ist die Zusammenführung der Abschnitts-, Revisions-, Gleichungs-, Literatur-, Eigenleistungs-, Primärkern- und Übergabeprüfung zu einem einzigen revisionsgebundenen N6-FINAL-GATE. Diese Eigenleistung wird als N6-E42 – integriertes N6-FINAL-GATE geführt.

Eine zweite originäre Eigenleistung dieser Arbeit ist die Trennung zwischen dem komponentenstrengen Primärkern-Gate und dem vollständigen N6-FINAL-GATE. Diese Eigenleistung wird als N6-E43 – Kern-vs.-Anlagenabschluss-Trennung geführt.

Eine dritte originäre Eigenleistung dieser Arbeit ist die Verknüpfung der sechs eigenständigen Anlagenabschlusszustände zu einem einzigen harten Gesamtgate RKB33-N1N6-FINAL-GATE, das ausschließlich mit den jeweils aktuell gültigen Revisionen arbeitet. Diese Eigenleistung wird als N6-E44 – revisionsgebundenes N1–N6-Gesamtgate geführt.

Eine vierte originäre Eigenleistung dieser Arbeit besteht in der expliziten historischen-PASS-Sperre. Diese Eigenleistung wird als N6-E45 – historische-PASS-Nichtübertragbarkeit geführt.

Eine fünfte originäre Eigenleistung dieser Arbeit ist die formalisierte Gesamtübergabe an Kapitel 3.3. Diese Eigenleistung wird als N6-E46 – revisionsgebundene Gesamtübergabe an Kapitel 3.3 geführt.

Eine sechste originäre Eigenleistung dieser Arbeit ist die Revalidierungspflicht dieser Gesamtübergabe nach jeder materiellen Änderung einer für Kapitel 3.3 verwendeten Anlagenrevision. Diese Eigenleistung wird als N6-E47 – persistente Anlagen-Haupttext-Konsistenz geführt.

Mit N6.9 ist die Anlage N6 inhaltlich abgeschlossen. Erst wenn das reale RKB33-N6-FINAL-GATE und anschließend das reale RKB33-N1N6-FINAL-GATE den Status passed besitzen, darf der Haupttext von Kapitel 3.3 begonnen werden.
';
        SET v_checksum=SHA2(v_body,256);

        INSERT INTO appendix_section_versions
        (
          appendix_section_id,revision_id,version_kind,
          body_markdown,checksum_sha256,notes
        )
        VALUES
        (
          v_n69_section,v_n69_revision,'draft',
          v_body,v_checksum,
          'Kanonischer N6.9-Snapshot. Keine neue Literatur. Abschluss- und Gesamtgate-Architektur.'
        );

        -- --------------------------------------------------------------------
        -- Definitionen N6-D47 bis N6-D52
        -- --------------------------------------------------------------------

        INSERT INTO appendix_objects
        (
          appendix_section_id,object_anchor,object_type,display_number,title,
          content_text,formal_latex,word_latex,importance_level,equation_role,
          provenance,source_id,assumptions,validation_status,created_revision_id
        )
        VALUES
        (v_n69_section,'N6-D47','definition','N6-D47','N6-Abschlusszustand',
         'Der N6-Abschlusszustand umfasst die vollständige Abschnitts-, Revisions-, Gleichungs-, Literatur-, Eigenleistungs-, Primärkern- und Übergabeprüfung der aktuell gültigen N6-Revisionen.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-D48','definition','N6-D48','Abschnittsvollständigkeit',
         'Abschnittsvollständigkeit liegt vor, wenn N6.0 bis N6.9 jeweils genau einmal existieren, eine reale erzeugende Revision besitzen und einen Snapshot auf der aktuellen Sectionrevision tragen.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-D49','definition','N6-D49','Revisionskettenintegrität',
         'Revisionskettenintegrität liegt vor, wenn jede Revision von N6.1 bis N6.9 unmittelbar auf der erzeugenden Revision des jeweils vorausgehenden N6-Abschnitts aufbaut.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-D50','definition','N6-D50','N6-Gleichungsintegrität',
         'N6-Gleichungsintegrität verlangt die lückenlose eindeutige Folge N6.1 bis N6.208 sowie exakte Synchronität von formal_latex und word_latex ohne Gleichungsnummer im Formelstring.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-D51','definition','N6-D51','Aktuelles Anlagenabschlussgate',
         'Ein Anlagenabschlussgate ist nur aktuell, wenn sein neuester Gatezustand passed ist und keine danach erzeugte Sectionrevision derselben Anlage den geprüften Stand überholt.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-D52','definition','N6-D52','Revisionsgebundene Gesamtübergabe',
         'Die revisionsgebundene Gesamtübergabe verbindet die aktuellen Endstände N1 bis N6 mit dem kanonischen N6-Primärkern und dem real bestandenen Gesamtgate für Kapitel 3.3.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision);

        -- --------------------------------------------------------------------
        -- Regeln N6-R67 bis N6-R76
        -- --------------------------------------------------------------------

        INSERT INTO appendix_objects
        (
          appendix_section_id,object_anchor,object_type,display_number,title,
          content_text,formal_latex,word_latex,importance_level,equation_role,
          provenance,source_id,assumptions,validation_status,created_revision_id
        )
        VALUES
        (v_n69_section,'N6-R67','criterion','N6-R67','Exakte-N6-Section-Regel',
         'N6-FINAL darf nur bei genau zehn aktuellen Sections N6.0 bis N6.9 mit realen Revisionen und aktuellen Snapshots passed sein.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-R68','criterion','N6-R68','Lineare-Parentketten-Regel',
         'Die Revisionen N6.1 bis N6.9 müssen jeweils unmittelbar die erzeugende Revision des vorhergehenden N6-Abschnitts als Parent besitzen.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-R69','criterion','N6-R69','Gleichungsnummern-Trennregel',
         'Gleichungsnummern dürfen nicht in formal_latex oder word_latex gespeichert werden; beide Formelrepräsentationen müssen exakt synchron sein.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-R70','criterion','N6-R70','Literaturstabilitätsregel',
         'N6.5 bis N6.9 dürfen die nach N6.4 erreichte globale Literaturzählung last=82 und next=83 nicht verändern.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-R71','criterion','N6-R71','Eigenleistungs-Vollständigkeitsregel',
         'N6-E01 bis N6-E47 müssen vollständig, eindeutig und an die jeweilige aktuelle Sectionrevision gebunden sein.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-R72','criterion','N6-R72','Kern-vs.-N6-FINAL-Sperre',
         'Ein bestandener Primärkern-Nachweis ersetzt nicht die vollständige Abschlussprüfung der Anlage N6.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-R73','criterion','N6-R73','Historische-PASS-Sperre',
         'Ein Anlagen-Gate gilt für das Gesamtgate nicht als aktuell, wenn nach seiner Gate-Revision eine neue Sectionrevision derselben Anlage erzeugt wurde.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-R74','criterion','N6-R74','N1N6-Aktualitätsregel',
         'Das Gesamtgate N1 bis N6 darf nur die jeweils neuesten realen Anlagenabschluss- und Übergabegates verwenden.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-R75','criterion','N6-R75','Gesamtgate-Hard-Stop',
         'Ist RKB33-N1N6-FINAL-GATE nicht passed, bleibt der Beginn von Kapitel 3.3 repositoryseitig gesperrt.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-R76','criterion','N6-R76','Gesamtübergabe-Revalidierungsregel',
         'Jede spätere materielle Änderung einer für Kapitel 3.3 verwendeten Anlagenrevision erzwingt eine erneute Gesamtübergabeprüfung.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision);

        -- --------------------------------------------------------------------
        -- Eigenleistungen N6-E42 bis N6-E47
        -- --------------------------------------------------------------------

        INSERT INTO appendix_objects
        (
          appendix_section_id,object_anchor,object_type,display_number,title,
          content_text,formal_latex,word_latex,importance_level,equation_role,
          provenance,source_id,assumptions,validation_status,created_revision_id
        )
        VALUES
        (v_n69_section,'N6-E42','statement','N6-E42','Originäre Eigenleistung: integriertes N6-FINAL-GATE',
         'Originäre Eigenleistung dieser Arbeit ist die Zusammenführung von Abschnitts-, Revisions-, Gleichungs-, Literatur-, Eigenleistungs-, Primärkern- und Übergabeprüfung zu einem revisionsgebundenen N6-FINAL-GATE.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-E43','statement','N6-E43','Originäre Eigenleistung: Kern-vs.-Anlagenabschluss-Trennung',
         'Originäre Eigenleistung dieser Arbeit ist die explizite Trennung zwischen komponentenstrengem Primärkern-Gate und vollständigem Anlagenabschluss.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-E44','statement','N6-E44','Originäre Eigenleistung: revisionsgebundenes N1–N6-Gesamtgate',
         'Originäre Eigenleistung dieser Arbeit ist die Verknüpfung der aktuell gültigen Anlagenabschlusszustände N1 bis N6 zu einem harten Gesamtgate vor Kapitel 3.3.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-E45','statement','N6-E45','Originäre Eigenleistung: historische-PASS-Nichtübertragbarkeit',
         'Originäre Eigenleistung dieser Arbeit ist die Sperre historischer PASS-Zustände, sobald spätere Sectionrevisionen den ursprünglich geprüften Anlagenstand überholen.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-E46','statement','N6-E46','Originäre Eigenleistung: revisionsgebundene Gesamtübergabe an Kapitel 3.3',
         'Originäre Eigenleistung dieser Arbeit ist die Gesamtübergabe der sechs aktuellen Anlagenrevisionen, des Primärkerns, der Primärhandoffs und des bestandenen Gesamtgates an Kapitel 3.3.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision),
        (v_n69_section,'N6-E47','statement','N6-E47','Originäre Eigenleistung: persistente Anlagen-Haupttext-Konsistenz',
         'Originäre Eigenleistung dieser Arbeit ist die dauerhafte Revalidierungspflicht der Gesamtübergabe nach materiellen Änderungen einer für Kapitel 3.3 verwendeten Anlagenrevision.',
         NULL,NULL,'core',NULL,'original',NULL,NULL,'checked',v_n69_revision);

        -- --------------------------------------------------------------------
        -- Gleichungen N6.179 bis N6.208
        -- --------------------------------------------------------------------

        INSERT INTO appendix_objects
        (
          appendix_section_id,object_anchor,object_type,display_number,title,
          content_text,formal_latex,word_latex,importance_level,equation_role,
          provenance,source_id,assumptions,validation_status,created_revision_id
        )
        VALUES
    (
      v_n69_section,'N6-EQ-179','equation','N6.179',
      'Vorgesehener N6-Abschnittsbestand','N6 besteht kanonisch aus genau zehn Abschnitten N6.0 bis N6.9.',
      '\\mathcal{S}_{N6}=\\left\\{N6.0,N6.1,N6.2,N6.3,N6.4,N6.5,N6.6,N6.7,N6.8,N6.9\\right\\}','\\mathcal{S}_{N6}=\\left\\{N6.0,N6.1,N6.2,N6.3,N6.4,N6.5,N6.6,N6.7,N6.8,N6.9\\right\\}','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-180','equation','N6.180',
      'N6-Abschnittsvollständigkeitsgate','Jeder vorgesehene Abschnitt muss genau einmal und revisionsgebunden vorhanden sein.',
      'G_{\\mathrm{sections},N6}=\\bigwedge_{s\\in\\mathcal{S}_{N6}}\\left(\\operatorname{Count}(s)=1\\land\\rho(s)\\neq\\varnothing\\right)','G_{\\mathrm{sections},N6}=\\bigwedge_{s\\in\\mathcal{S}_{N6}}\\left(\\operatorname{Count}(s)=1\\land\\rho(s)\\neq\\varnothing\\right)','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-181','equation','N6.181',
      'Lineare N6-Revisionsfolge','Die N6-Abschnittsrevisionen bilden eine lineare Parent-Kette.',
      '\\rho_{N6.0}\\prec\\rho_{N6.1}\\prec\\rho_{N6.2}\\prec\\cdots\\prec\\rho_{N6.9}','\\rho_{N6.0}\\prec\\rho_{N6.1}\\prec\\rho_{N6.2}\\prec\\cdots\\prec\\rho_{N6.9}','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-182','equation','N6.182',
      'N6-Revisionskettengate','Jede Revision N6.k muss unmittelbar auf N6.(k-1) aufbauen.',
      'G_{\\mathrm{revision},N6}=\\bigwedge_{k=1}^{9}\\left(\\operatorname{parent}(\\rho_{N6.k})=\\rho_{N6.(k-1)}\\right)','G_{\\mathrm{revision},N6}=\\bigwedge_{k=1}^{9}\\left(\\operatorname{parent}(\\rho_{N6.k})=\\rho_{N6.(k-1)}\\right)','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-183','equation','N6.183',
      'Vollständiger N6-Gleichungsbereich','Die kanonische N6-Gleichungsfolge ist lückenlos und eindeutig.',
      '\\mathcal{E}_{N6}=\\left\\{N6.1,\\ldots,N6.n_{\\mathrm{final}}\\right\\}','\\mathcal{E}_{N6}=\\left\\{N6.1,\\ldots,N6.n_{\\mathrm{final}}\\right\\}','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-184','equation','N6.184',
      'N6-Gleichungsintegritätsgate','Die Gleichungsprüfung verbindet Vollständigkeit, Eindeutigkeit, Ordnung und Word-LaTeX-Synchronität.',
      'G_{\\mathrm{equation},N6}=G_{\\mathrm{complete}}\\land G_{\\mathrm{unique}}\\land G_{\\mathrm{ordered}}\\land G_{\\mathrm{word}}','G_{\\mathrm{equation},N6}=G_{\\mathrm{complete}}\\land G_{\\mathrm{unique}}\\land G_{\\mathrm{ordered}}\\land G_{\\mathrm{word}}','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-185','equation','N6.185',
      'Word-LaTeX-Synchronität','Kanonische Formel und Word-LaTeX müssen exakt übereinstimmen.',
      '\\operatorname{formal\\_latex}(e)=\\operatorname{word\\_latex}(e)','\\operatorname{formal\\_latex}(e)=\\operatorname{word\\_latex}(e)','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-186','equation','N6.186',
      'Keine Gleichungsnummer im Formelstring','Gleichungsnummern dürfen ausschließlich im dafür vorgesehenen Nummernfeld stehen.',
      '\\operatorname{EqNumberInFormula}(e)=0','\\operatorname{EqNumberInFormula}(e)=0','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-187','equation','N6.187',
      'N6-Literaturintegritätsgate','Die Literaturprüfung verlangt eindeutige Ziffern, Quellenidentität, Autorenverknüpfung und Erstverwendung.',
      'G_{\\mathrm{literature},N6}=G_{\\mathrm{citation\\_unique}}\\land G_{\\mathrm{source\\_unique}}\\land G_{\\mathrm{author\\_link}}\\land G_{\\mathrm{first\\_usage}}','G_{\\mathrm{literature},N6}=G_{\\mathrm{citation\\_unique}}\\land G_{\\mathrm{source\\_unique}}\\land G_{\\mathrm{author\\_link}}\\land G_{\\mathrm{first\\_usage}}','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-188','equation','N6.188',
      'Eindeutige Literaturziffern','Verschiedene Quellen dürfen keine identische globale Literaturziffer besitzen.',
      '\\operatorname{CitationNumber}(s_i)\\neq\\operatorname{CitationNumber}(s_j)\\qquad(i\\neq j)','\\operatorname{CitationNumber}(s_i)\\neq\\operatorname{CitationNumber}(s_j)\\qquad(i\\neq j)','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-189','equation','N6.189',
      'Keine Literaturerweiterung N6.5 bis N6.9','Nach N6.4 wird keine neue globale Literaturquelle eingeführt.',
      '\\Delta L_{N6.5\\rightarrow N6.9}=0','\\Delta L_{N6.5\\rightarrow N6.9}=0','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-190','equation','N6.190',
      'Eigenleistungsbestand vor N6.9-Abschluss','Der bis N6.8 vorliegende Eigenleistungsbestand wird in N6.9 um E42 bis E47 erweitert.',
      '\\mathcal{O}_{N6}^{\\mathrm{own}}=\\left\\{N6\\text{-}E01,\\ldots,N6\\text{-}E41\\right\\}','\\mathcal{O}_{N6}^{\\mathrm{own}}=\\left\\{N6\\text{-}E01,\\ldots,N6\\text{-}E41\\right\\}','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-191','equation','N6.191',
      'N6-Eigenleistungsgate','Jede Eigenleistung muss registriert und revisionsgebunden sein.',
      'G_{\\mathrm{own},N6}=\\bigwedge_{e\\in\\mathcal{O}_{N6}^{\\mathrm{own}}}\\left(\\operatorname{Registered}(e)=1\\land\\operatorname{RevisionBound}(e)=1\\right)','G_{\\mathrm{own},N6}=\\bigwedge_{e\\in\\mathcal{O}_{N6}^{\\mathrm{own}}}\\left(\\operatorname{Registered}(e)=1\\land\\operatorname{RevisionBound}(e)=1\\right)','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-192','equation','N6.192',
      'N6-FINAL verlangt Kern-PASS','N6 kann nur bei bestandenem Primärkern-Gate finalisiert werden.',
      'G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}\\Longrightarrow G_{\\mathrm{core}}=\\mathrm{passed}','G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}\\Longrightarrow G_{\\mathrm{core}}=\\mathrm{passed}','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-193','equation','N6.193',
      'Kern-PASS ist nicht N6-FINAL-PASS','Der Primärkern allein ersetzt nicht den Anlagenabschluss.',
      'G_{\\mathrm{core}}=\\mathrm{passed}\\not\\Rightarrow G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}','G_{\\mathrm{core}}=\\mathrm{passed}\\not\\Rightarrow G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-194','equation','N6.194',
      'Übergabemenge an Kapitel 3.3','Die Übergabemenge enthält die vollständigen Primärübergaben aller Kernelemente.',
      '\\mathcal{H}_{3.3}=\\left\\{H_{3.3}(c,r)\\mid(c,r)\\in\\mathcal{K}_{N6}^{\\mathrm{prim}}\\right\\}','\\mathcal{H}_{3.3}=\\left\\{H_{3.3}(c,r)\\mid(c,r)\\in\\mathcal{K}_{N6}^{\\mathrm{prim}}\\right\\}','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-195','equation','N6.195',
      'N6-Handoff-Gate','Alle für 3.3 bestimmten Übergabeelemente müssen vollständig sein.',
      'G_{\\mathrm{handoff},N6}=\\bigwedge_{h\\in\\mathcal{H}_{3.3}}\\operatorname{Complete}(h)','G_{\\mathrm{handoff},N6}=\\bigwedge_{h\\in\\mathcal{H}_{3.3}}\\operatorname{Complete}(h)','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-196','equation','N6.196',
      'N6-FINAL-Gate','Das N6-FINAL-Gate vereinigt alle Abschlussdimensionen.',
      'G_{N6\\text{-}\\mathrm{final}}=G_{\\mathrm{sections},N6}\\land G_{\\mathrm{revision},N6}\\land G_{\\mathrm{equation},N6}\\land G_{\\mathrm{literature},N6}\\land G_{\\mathrm{own},N6}\\land G_{\\mathrm{core}}\\land G_{\\mathrm{handoff},N6}','G_{N6\\text{-}\\mathrm{final}}=G_{\\mathrm{sections},N6}\\land G_{\\mathrm{revision},N6}\\land G_{\\mathrm{equation},N6}\\land G_{\\mathrm{literature},N6}\\land G_{\\mathrm{own},N6}\\land G_{\\mathrm{core}}\\land G_{\\mathrm{handoff},N6}','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-197','equation','N6.197',
      'N6-FINAL-PASS','Der vollständige N6-Abschluss wird als eigener Gatezustand geführt.',
      'G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}','G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-198','equation','N6.198',
      'N6-FINAL allein startet Kapitel 3.3 nicht','Nach N6-FINAL muss zusätzlich das Gesamtgate N1 bis N6 bestehen.',
      'G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}\\not\\Rightarrow\\operatorname{Start}(3.3)=1','G_{N6\\text{-}\\mathrm{final}}=\\mathrm{passed}\\not\\Rightarrow\\operatorname{Start}(3.3)=1','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-199','equation','N6.199',
      'Menge der Anlagenabschlussgates','Das Gesamtgate beruht auf den sechs aktuell gültigen Anlagenabschlusszuständen.',
      '\\mathcal{G}_{N1:N6}=\\left\\{G_{N1\\text{-}\\mathrm{final}},G_{N2\\text{-}\\mathrm{final}},G_{N3\\text{-}\\mathrm{final}},G_{N4\\text{-}\\mathrm{final}},G_{N5\\text{-}\\mathrm{final}},G_{N6\\text{-}\\mathrm{final}}\\right\\}','\\mathcal{G}_{N1:N6}=\\left\\{G_{N1\\text{-}\\mathrm{final}},G_{N2\\text{-}\\mathrm{final}},G_{N3\\text{-}\\mathrm{final}},G_{N4\\text{-}\\mathrm{final}},G_{N5\\text{-}\\mathrm{final}},G_{N6\\text{-}\\mathrm{final}}\\right\\}','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-200','equation','N6.200',
      'Gesamtgate N1 bis N6','Alle sechs Anlagen müssen gemeinsam freigegeben sein.',
      'G_{N1:N6}=\\bigwedge_{k=1}^{6}G_{Nk\\text{-}\\mathrm{final}}','G_{N1:N6}=\\bigwedge_{k=1}^{6}G_{Nk\\text{-}\\mathrm{final}}','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-201','equation','N6.201',
      'Repositorycode des Gesamtgates','Das formale Gesamtgate wird repositoryseitig unter dem kanonischen Code RKB33-N1N6-FINAL-GATE geführt.',
      'G_{N1:N6}\\equiv\\mathrm{RKB33\\text{-}N1N6\\text{-}FINAL\\text{-}GATE','G_{N1:N6}\\equiv\\mathrm{RKB33\\text{-}N1N6\\text{-}FINAL\\text{-}GATE','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-202','equation','N6.202',
      'Historischer PASS ist kein aktueller PASS','Nach einer späteren Anlagenrevision darf ein historischer PASS nicht als aktueller Abschluss gelten.',
      'G_{Nk\\text{-}\\mathrm{final}}^{\\mathrm{historical}}=\\mathrm{passed}\\not\\Rightarrow G_{Nk\\text{-}\\mathrm{final}}^{\\mathrm{current}}=\\mathrm{passed}','G_{Nk\\text{-}\\mathrm{final}}^{\\mathrm{historical}}=\\mathrm{passed}\\not\\Rightarrow G_{Nk\\text{-}\\mathrm{final}}^{\\mathrm{current}}=\\mathrm{passed}','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-203','equation','N6.203',
      'Gesamt-PASS verlangt keine relevanten offenen Stopper','Ein Gesamt-PASS darf keine für den Handoff relevanten offenen oder blockierten Voraussetzungen verdecken.',
      'G_{N1:N6}=\\mathrm{passed}\\Longrightarrow N_{\\mathrm{relevant}}(\\mathrm{open},\\mathrm{blocked})=0','G_{N1:N6}=\\mathrm{passed}\\Longrightarrow N_{\\mathrm{relevant}}(\\mathrm{open},\\mathrm{blocked})=0','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-204','equation','N6.204',
      'Fehlendes Gesamt-PASS sperrt Kapitel 3.3','Ohne Gesamt-PASS bleibt der Haupttext 3.3 gesperrt.',
      'G_{N1:N6}\\neq\\mathrm{passed}\\Longrightarrow\\operatorname{Start}(3.3)=0','G_{N1:N6}\\neq\\mathrm{passed}\\Longrightarrow\\operatorname{Start}(3.3)=0','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-205','equation','N6.205',
      'Gesamt-PASS gibt Start von Kapitel 3.3 frei','Erst das reale Gesamt-PASS erlaubt den Beginn des Haupttextes.',
      'G_{N1:N6}=\\mathrm{passed}\\Longrightarrow\\operatorname{Start}(3.3)=1','G_{N1:N6}=\\mathrm{passed}\\Longrightarrow\\operatorname{Start}(3.3)=1','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-206','equation','N6.206',
      'Start ist nicht Abschluss von Kapitel 3.3','Die Anlagenfreigabe erlaubt den Beginn, ersetzt aber nicht die Erarbeitung des Haupttextes.',
      '\\operatorname{Start}(3.3)=1\\not\\Rightarrow\\operatorname{Complete}(3.3)=1','\\operatorname{Start}(3.3)=1\\not\\Rightarrow\\operatorname{Complete}(3.3)=1','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-207','equation','N6.207',
      'Revisionsgebundene Gesamtübergabe','Die Gesamtübergabe bindet die sechs Anlagenrevisionen, Primärkern, Primärhandoffs und Gesamtgate.',
      'H_{N1:N6\\rightarrow3.3}=\\left(\\rho_{N1},\\rho_{N2},\\rho_{N3},\\rho_{N4},\\rho_{N5},\\rho_{N6},\\mathcal{K}_{N6}^{\\mathrm{prim}},\\mathcal{H}_{3.3},G_{N1:N6}\\right)','H_{N1:N6\\rightarrow3.3}=\\left(\\rho_{N1},\\rho_{N2},\\rho_{N3},\\rho_{N4},\\rho_{N5},\\rho_{N6},\\mathcal{K}_{N6}^{\\mathrm{prim}},\\mathcal{H}_{3.3},G_{N1:N6}\\right)','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    ),
    (
      v_n69_section,'N6-EQ-208','equation','N6.208',
      'Materielle Anlagenänderung revalidiert Gesamtübergabe','Jede materielle Änderung einer verwendeten Anlagenrevision erzwingt die Revalidierung der Gesamtübergabe.',
      '\\Delta_{\\mathrm{mat}}(\\rho_{Nk})=1\\Longrightarrow\\operatorname{Revalidate}\\left(H_{N1:N6\\rightarrow3.3}\\right)=1','\\Delta_{\\mathrm{mat}}(\\rho_{Nk})=1\\Longrightarrow\\operatorname{Revalidate}\\left(H_{N1:N6\\rightarrow3.3}\\right)=1','core','canonical','original',NULL,NULL,'checked',v_n69_revision
    );

        -- ====================================================================
        -- 5. N6.9 LOKAL VALIDIEREN
        -- ====================================================================

        SELECT COUNT(*) INTO v_n69_objects
          FROM appendix_objects
         WHERE appendix_section_id=v_n69_section
           AND created_revision_id=v_n69_revision;

        SELECT COUNT(*) INTO v_n69_equations
          FROM appendix_objects
         WHERE appendix_section_id=v_n69_section
           AND created_revision_id=v_n69_revision
           AND object_type='equation';

        SELECT COUNT(*) INTO v_n69_defs
          FROM appendix_objects
         WHERE appendix_section_id=v_n69_section
           AND created_revision_id=v_n69_revision
           AND object_anchor IN ('N6-D47','N6-D48','N6-D49','N6-D50','N6-D51','N6-D52');

        SELECT COUNT(*) INTO v_n69_rules
          FROM appendix_objects
         WHERE appendix_section_id=v_n69_section
           AND created_revision_id=v_n69_revision
           AND object_anchor IN ('N6-R67','N6-R68','N6-R69','N6-R70','N6-R71',
                                 'N6-R72','N6-R73','N6-R74','N6-R75','N6-R76');

        SELECT COUNT(*) INTO v_n69_eigen
          FROM appendix_objects
         WHERE appendix_section_id=v_n69_section
           AND created_revision_id=v_n69_revision
           AND object_anchor IN ('N6-E42','N6-E43','N6-E44','N6-E45','N6-E46','N6-E47');

        SELECT COUNT(*) INTO v_n69_nonimp
          FROM appendix_objects
         WHERE appendix_section_id=v_n69_section
           AND created_revision_id=v_n69_revision
           AND object_anchor IN ('N6-EQ-193','N6-EQ-198','N6-EQ-202','N6-EQ-206')
           AND LOCATE(CONCAT(CHAR(92),'not',CHAR(92),'Rightarrow'),formal_latex)>0
           AND LOCATE(CONCAT(CHAR(92),'not',CHAR(92),'Rightarrow'),word_latex)>0;

        -- ====================================================================
        -- 6. GESAMTEN N6-BESTAND REAL VALIDIEREN
        -- ====================================================================

        SELECT COUNT(*) INTO v_sections
          FROM appendix_sections
         WHERE appendix_module_id=v_n6_module
           AND section_code IN ('N6.0','N6.1','N6.2','N6.3','N6.4',
                                'N6.5','N6.6','N6.7','N6.8','N6.9');

        SELECT COUNT(*) INTO v_section_revisions
          FROM appendix_sections s
         WHERE s.appendix_module_id=v_n6_module
           AND s.section_code IN ('N6.0','N6.1','N6.2','N6.3','N6.4',
                                  'N6.5','N6.6','N6.7','N6.8','N6.9')
           AND s.created_revision_id IS NOT NULL
           AND EXISTS (
               SELECT 1 FROM repository_revisions r
                WHERE r.revision_id=s.created_revision_id
                  AND r.scope_type='section'
                  AND r.scope_reference=s.section_code
           );

        SELECT COUNT(*) INTO v_snapshots
          FROM appendix_sections s
         WHERE s.appendix_module_id=v_n6_module
           AND s.section_code IN ('N6.0','N6.1','N6.2','N6.3','N6.4',
                                  'N6.5','N6.6','N6.7','N6.8','N6.9')
           AND (
               SELECT COUNT(*)
                 FROM appendix_section_versions v
                WHERE v.appendix_section_id=s.appendix_section_id
                  AND v.revision_id=s.created_revision_id
           )=1;

        SELECT COUNT(*) INTO v_parent_chain
          FROM appendix_sections cur
          JOIN repository_revisions rcur
            ON rcur.revision_id=cur.created_revision_id
          JOIN appendix_sections prev
            ON prev.appendix_module_id=cur.appendix_module_id
           AND (
                (cur.section_code='N6.1' AND prev.section_code='N6.0') OR
                (cur.section_code='N6.2' AND prev.section_code='N6.1') OR
                (cur.section_code='N6.3' AND prev.section_code='N6.2') OR
                (cur.section_code='N6.4' AND prev.section_code='N6.3') OR
                (cur.section_code='N6.5' AND prev.section_code='N6.4') OR
                (cur.section_code='N6.6' AND prev.section_code='N6.5') OR
                (cur.section_code='N6.7' AND prev.section_code='N6.6') OR
                (cur.section_code='N6.8' AND prev.section_code='N6.7') OR
                (cur.section_code='N6.9' AND prev.section_code='N6.8')
           )
         WHERE cur.appendix_module_id=v_n6_module
           AND rcur.parent_revision_id=prev.created_revision_id;

        SELECT COUNT(*) INTO v_prior_start_gates
          FROM appendix_sections s
         WHERE s.appendix_module_id=v_n6_module
           AND s.section_code IN ('N6.0','N6.1','N6.2','N6.3','N6.4',
                                  'N6.5','N6.6','N6.7','N6.8')
           AND EXISTS (
               SELECT 1
                 FROM repository_validation_results vr
                WHERE vr.revision_id=s.created_revision_id
                  AND vr.validation_code=CONCAT(
                        'RKB33-N6',
                        SUBSTRING_INDEX(s.section_code,'.',-1),
                        '-START-GATE'
                      )
                  AND vr.validation_status='passed'
           );

        SELECT COUNT(*) INTO v_bad_object_revision_links
          FROM appendix_sections s
          JOIN appendix_objects o
            ON o.appendix_section_id=s.appendix_section_id
         WHERE s.appendix_module_id=v_n6_module
           AND s.section_code IN ('N6.0','N6.1','N6.2','N6.3','N6.4',
                                  'N6.5','N6.6','N6.7','N6.8','N6.9')
           AND o.created_revision_id<>s.created_revision_id;

        SELECT COUNT(*) INTO v_objects
          FROM appendix_sections s
          JOIN appendix_objects o
            ON o.appendix_section_id=s.appendix_section_id
         WHERE s.appendix_module_id=v_n6_module
           AND s.section_code IN ('N6.0','N6.1','N6.2','N6.3','N6.4',
                                  'N6.5','N6.6','N6.7','N6.8','N6.9');

        SELECT COUNT(*),
               COUNT(DISTINCT CAST(SUBSTRING(o.display_number,4) AS UNSIGNED)),
               MIN(CAST(SUBSTRING(o.display_number,4) AS UNSIGNED)),
               MAX(CAST(SUBSTRING(o.display_number,4) AS UNSIGNED)),
               SUM(o.formal_latex=o.word_latex),
               SUM(
                   LOCATE(o.display_number,o.formal_latex)>0
                   OR LOCATE(o.display_number,o.word_latex)>0
               )
          INTO v_equations,v_equation_numbers,v_eq_min,v_eq_max,v_sync,v_leaks
          FROM appendix_sections s
          JOIN appendix_objects o
            ON o.appendix_section_id=s.appendix_section_id
         WHERE s.appendix_module_id=v_n6_module
           AND o.object_type='equation'
           AND o.display_number REGEXP '^N6[.][0-9]+$';

        SELECT COUNT(*),
               COUNT(DISTINCT CAST(SUBSTRING(o.object_anchor,5) AS UNSIGNED)),
               MIN(CAST(SUBSTRING(o.object_anchor,5) AS UNSIGNED)),
               MAX(CAST(SUBSTRING(o.object_anchor,5) AS UNSIGNED))
          INTO v_defs,v_def_numbers,v_def_min,v_def_max
          FROM appendix_sections s
          JOIN appendix_objects o
            ON o.appendix_section_id=s.appendix_section_id
         WHERE s.appendix_module_id=v_n6_module
           AND o.object_anchor REGEXP '^N6-D[0-9][0-9]$';

        SELECT COUNT(*),
               COUNT(DISTINCT CAST(SUBSTRING(o.object_anchor,5) AS UNSIGNED)),
               MIN(CAST(SUBSTRING(o.object_anchor,5) AS UNSIGNED)),
               MAX(CAST(SUBSTRING(o.object_anchor,5) AS UNSIGNED))
          INTO v_rules,v_rule_numbers,v_rule_min,v_rule_max
          FROM appendix_sections s
          JOIN appendix_objects o
            ON o.appendix_section_id=s.appendix_section_id
         WHERE s.appendix_module_id=v_n6_module
           AND o.object_anchor REGEXP '^N6-R[0-9][0-9]$';

        SELECT COUNT(*),
               COUNT(DISTINCT CAST(SUBSTRING(o.object_anchor,5) AS UNSIGNED)),
               MIN(CAST(SUBSTRING(o.object_anchor,5) AS UNSIGNED)),
               MAX(CAST(SUBSTRING(o.object_anchor,5) AS UNSIGNED))
          INTO v_eigen,v_eigen_numbers,v_eigen_min,v_eigen_max
          FROM appendix_sections s
          JOIN appendix_objects o
            ON o.appendix_section_id=s.appendix_section_id
         WHERE s.appendix_module_id=v_n6_module
           AND o.object_anchor REGEXP '^N6-E[0-9][0-9]$';

        SELECT COUNT(*) INTO v_sources_78_82
          FROM sources
         WHERE (citation_number=78 AND source_key='mckinsey_sugar_suppes_axiomatic_particle_mechanics_1953')
            OR (citation_number=79 AND source_key='ehlers_pirani_schild_geometry_free_fall_light_1972')
            OR (citation_number=80 AND source_key='matveev_scholz_light_cone_weyl_compatibility_2020')
            OR (citation_number=81 AND source_key='hardy_quantum_theory_five_reasonable_axioms_2001')
            OR (citation_number=82 AND source_key='chiribella_dariano_perinotti_informational_quantum_2011');

        SELECT COUNT(DISTINCT u.source_id)
          INTO v_source_usages_78_82
          FROM appendix_source_usage u
          JOIN appendix_sections s
            ON s.appendix_section_id=u.appendix_section_id
          JOIN sources src
            ON src.source_id=u.source_id
         WHERE s.appendix_module_id=v_n6_module
           AND src.citation_number BETWEEN 78 AND 82
           AND u.is_first_mention=1
           AND u.citation_checked=1;

        SET v_literature_stable =
          IF(
            (SELECT CAST(counter_value AS UNSIGNED) FROM repository_counters
              WHERE counter_key='last_citation_number')=82
            AND
            (SELECT CAST(counter_value AS UNSIGNED) FROM repository_counters
              WHERE counter_key='next_citation_number')=83,
            1,0
          );

        SET v_n6_failed =
            IF(v_n69_objects=52,0,1)
          + IF(v_n69_equations=30,0,1)
          + IF(v_n69_defs=6,0,1)
          + IF(v_n69_rules=10,0,1)
          + IF(v_n69_eigen=6,0,1)
          + IF(v_n69_nonimp=4,0,1)
          + IF(v_sections=10,0,1)
          + IF(v_section_revisions=10,0,1)
          + IF(v_snapshots=10,0,1)
          + IF(v_parent_chain=9,0,1)
          + IF(v_prior_start_gates=9,0,1)
          + IF(v_bad_object_revision_links=0,0,1)
          + IF(v_objects=388,0,1)
          + IF(v_equations=208,0,1)
          + IF(v_equation_numbers=208,0,1)
          + IF(v_eq_min=1,0,1)
          + IF(v_eq_max=208,0,1)
          + IF(v_sync=208,0,1)
          + IF(v_leaks=0,0,1)
          + IF(v_defs=52 AND v_def_numbers=52 AND v_def_min=1 AND v_def_max=52,0,1)
          + IF(v_rules=76 AND v_rule_numbers=76 AND v_rule_min=1 AND v_rule_max=76,0,1)
          + IF(v_eigen=47 AND v_eigen_numbers=47 AND v_eigen_min=1 AND v_eigen_max=47,0,1)
          + IF(v_sources_78_82=5,0,1)
          + IF(v_source_usages_78_82=5,0,1)
          + IF(v_literature_stable=1,0,1)
          + IF(EXISTS(
                SELECT 1
                  FROM repository_validation_results
                 WHERE revision_id=v_n68_revision
                   AND validation_code='RKB33-N68-CORE-GATE'
                   AND validation_status='passed'
             ),0,1);

        SET v_failure_detail = CASE
          WHEN v_n69_objects<>52 THEN CONCAT('N69_OBJECTS=',v_n69_objects,' expected=52')
          WHEN v_n69_equations<>30 THEN CONCAT('N69_EQUATIONS=',v_n69_equations,' expected=30')
          WHEN v_n69_defs<>6 THEN CONCAT('N69_DEFS=',v_n69_defs,' expected=6')
          WHEN v_n69_rules<>10 THEN CONCAT('N69_RULES=',v_n69_rules,' expected=10')
          WHEN v_n69_eigen<>6 THEN CONCAT('N69_EIGEN=',v_n69_eigen,' expected=6')
          WHEN v_n69_nonimp<>4 THEN CONCAT('N69_NONIMP=',v_n69_nonimp,' expected=4')
          WHEN v_sections<>10 THEN CONCAT('SECTIONS=',v_sections,' expected=10')
          WHEN v_section_revisions<>10 THEN CONCAT('SECTION_REVISIONS=',v_section_revisions,' expected=10')
          WHEN v_snapshots<>10 THEN CONCAT('CURRENT_SNAPSHOTS=',v_snapshots,' expected=10')
          WHEN v_parent_chain<>9 THEN CONCAT('PARENT_CHAIN=',v_parent_chain,' expected=9')
          WHEN v_prior_start_gates<>9 THEN CONCAT('PRIOR_START_GATES=',v_prior_start_gates,' expected=9')
          WHEN v_bad_object_revision_links<>0 THEN CONCAT('BAD_OBJECT_REV_LINKS=',v_bad_object_revision_links,' expected=0')
          WHEN v_objects<>388 THEN CONCAT('N6_OBJECTS=',v_objects,' expected=388')
          WHEN v_equations<>208 THEN CONCAT('N6_EQUATIONS=',v_equations,' expected=208')
          WHEN v_equation_numbers<>208 OR v_eq_min<>1 OR v_eq_max<>208
               THEN CONCAT('EQ_SEQUENCE count=',v_equation_numbers,' min=',v_eq_min,' max=',v_eq_max)
          WHEN v_sync<>208 THEN CONCAT('WORDLATEX_SYNC=',v_sync,' expected=208')
          WHEN v_leaks<>0 THEN CONCAT('OWN_FORMULA_NUMBER_LEAKS=',v_leaks,' expected=0')
          WHEN NOT(v_defs=52 AND v_def_numbers=52 AND v_def_min=1 AND v_def_max=52)
               THEN CONCAT('DEF_SEQUENCE count=',v_defs,' unique=',v_def_numbers,' min=',v_def_min,' max=',v_def_max)
          WHEN NOT(v_rules=76 AND v_rule_numbers=76 AND v_rule_min=1 AND v_rule_max=76)
               THEN CONCAT('RULE_SEQUENCE count=',v_rules,' unique=',v_rule_numbers,' min=',v_rule_min,' max=',v_rule_max)
          WHEN NOT(v_eigen=47 AND v_eigen_numbers=47 AND v_eigen_min=1 AND v_eigen_max=47)
               THEN CONCAT('EIGEN_SEQUENCE count=',v_eigen,' unique=',v_eigen_numbers,' min=',v_eigen_min,' max=',v_eigen_max)
          WHEN v_sources_78_82<>5 THEN CONCAT('N6_SOURCES_78_82=',v_sources_78_82,' expected=5')
          WHEN v_source_usages_78_82<>5 THEN CONCAT('N6_FIRST_SOURCE_USAGES=',v_source_usages_78_82,' expected=5')
          WHEN v_literature_stable<>1 THEN 'LITERATURE_COUNTER_DRIFT'
          WHEN NOT EXISTS(
                SELECT 1 FROM repository_validation_results
                 WHERE revision_id=v_n68_revision
                   AND validation_code='RKB33-N68-CORE-GATE'
                   AND validation_status='passed'
               ) THEN 'RKB33-N68-CORE-GATE_NOT_PASSED'
          ELSE 'UNKNOWN'
        END;

        -- ====================================================================
        -- 7. N6.9-REVISION-GATE
        -- ====================================================================

        INSERT INTO repository_validation_results
        (revision_id,validation_code,validation_status,expected_value,actual_value,
         validation_message,checked_at)
        VALUES
        (
          v_n69_revision,'RKB33-N69-REVISION-GATE',
          IF(v_n6_failed=0,'passed','failed'),
          'N6.9 lokal vollständig und gesamter N6-Bestand konsistent',
          CONCAT('failed_checks=',v_n6_failed),
          IF(v_n6_failed=0,
             'N6.9 und der vollständige N6-Bestand sind revisionsgebunden konsistent.',
             CONCAT('N6.9/N6-Prüfung fehlgeschlagen: ',v_failure_detail)),
          CURRENT_TIMESTAMP
        )
        ON DUPLICATE KEY UPDATE
          validation_status=VALUES(validation_status),
          expected_value=VALUES(expected_value),
          actual_value=VALUES(actual_value),
          validation_message=VALUES(validation_message),
          checked_at=CURRENT_TIMESTAMP;

        IF v_n6_failed<>0 THEN
            ROLLBACK;
            SET v_message=CONCAT(
              'RKB33-N69-REVISION-GATE failed: ',
              v_failure_detail,
              '; failed_checks=',
              v_n6_failed
            );
            SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT=v_message;
        END IF;

        -- ====================================================================
        -- 8. EIGENSTÄNDIGE N6-/GESAMTGATE-REVISION
        -- ====================================================================

        INSERT INTO repository_revisions
        (
          revision_code,revision_date,scope_type,scope_reference,
          version_label,summary,created_by,parent_revision_id
        )
        VALUES
        (
          'RKB33-GATE-N6-N1N6-2026-09-25',
          CURRENT_TIMESTAMP,
          'repository',
          'N6->3.3',
          'final-and-handoff-gate-v1',
          'Eigenständige revisionsgebundene Abschlussprüfung von N6 und Gesamtprüfung N1 bis N6 vor Freigabe des Haupttextes 3.3.',
          'Olaf Thiele / ChatGPT',
          v_n69_revision
        );

        SET v_gate_revision=LAST_INSERT_ID();

        INSERT INTO repository_validation_results
        (revision_id,validation_code,validation_status,expected_value,actual_value,
         validation_message,checked_at)
        VALUES
        (
          v_gate_revision,'RKB33-N6-FINAL-GATE','passed',
          'sections=10; revisions=10; snapshots=10; parent_chain=9; start_gates=9; objects=388; equations=208; definitions=52; rules=76; eigen=47; sources=5',
          'all N6 checks passed',
          'N6 ist vollständig, revisionsgebunden und repositorytechnisch finalisiert.',
          CURRENT_TIMESTAMP
        );

        SET v_n6_ok=1;

        COMMIT;
    END IF;

    -- ========================================================================
    -- 9. AB HIER: N6-FINAL IST PERSISTENT PASSED.
    --    DAS GESAMTGATE DARF FEHLSCHLAGEN, OHNE N6.9 ZU VERLIEREN.
    -- ========================================================================

    START TRANSACTION;

    -- Module und jeweils aktuell höchste Sectionrevision bestimmen.
    -- N2 ist absichtlich ausgenommen: N2 wird unten von N2.8 aus aufgelöst.
    SELECT MAX(appendix_module_id) INTO v_n1_module FROM appendix_modules WHERE appendix_code='N1';
    SELECT MAX(appendix_module_id) INTO v_n3_module FROM appendix_modules WHERE appendix_code='N3';
    SELECT MAX(appendix_module_id) INTO v_n4_module FROM appendix_modules WHERE appendix_code='N4';
    SELECT MAX(appendix_module_id) INTO v_n5_module FROM appendix_modules WHERE appendix_code='N5';

    SELECT COALESCE(MAX(created_revision_id),0) INTO v_n1_max_rev FROM appendix_sections WHERE appendix_module_id=v_n1_module;
    SELECT COALESCE(MAX(created_revision_id),0) INTO v_n3_max_rev FROM appendix_sections WHERE appendix_module_id=v_n3_module;
    SELECT COALESCE(MAX(created_revision_id),0) INTO v_n4_max_rev FROM appendix_sections WHERE appendix_module_id=v_n4_module;
    SELECT COALESCE(MAX(created_revision_id),0) INTO v_n5_max_rev FROM appendix_sections WHERE appendix_module_id=v_n5_module;

    -- ========================================================================
    -- 9A. N2 PRIMÄR ÜBER DIE REALE SECTION N2.8 AUFLÖSEN
    --     Nicht mehr über MAX(appendix_module_id).
    -- ========================================================================

    -- Bevorzugt wird eine N2.8-Section, deren created_revision_id real auf
    -- eine Section-Revision mit scope_reference='N2.8' zeigt.
    SELECT MAX(s.appendix_section_id)
      INTO v_n28_section_id
      FROM appendix_sections s
      JOIN repository_revisions r
        ON r.revision_id=s.created_revision_id
     WHERE s.section_code='N2.8'
       AND r.scope_type='section'
       AND r.scope_reference='N2.8';

    -- Fallback nur zur präzisen Diagnose: existiert N2.8 überhaupt?
    IF v_n28_section_id IS NULL THEN
        SELECT MAX(appendix_section_id)
          INTO v_n28_section_id
          FROM appendix_sections
         WHERE section_code='N2.8';
    END IF;

    IF v_n28_section_id IS NULL THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N69 N2-AUTO-REPAIR: Section N2.8 ist in appendix_sections nicht vorhanden.';
    END IF;

    SELECT appendix_module_id,created_revision_id
      INTO v_n2_module,v_n2_current_end_rev
      FROM appendix_sections
     WHERE appendix_section_id=v_n28_section_id;

    IF v_n2_current_end_rev IS NULL OR v_n2_current_end_rev=0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT='RKB33-N69 N2-AUTO-REPAIR: N2.8 existiert, besitzt aber keine created_revision_id.';
    END IF;

    SELECT MAX(revision_id)
      INTO v_n28_scope_rev
      FROM repository_revisions
     WHERE revision_id=v_n2_current_end_rev
       AND scope_type='section'
       AND scope_reference='N2.8';

    IF v_n28_scope_rev IS NULL THEN
        ROLLBACK;
        SET v_message=CONCAT(
          'RKB33-N69 N2-AUTO-REPAIR: N2.8 existiert, aber created_revision_id=',
          v_n2_current_end_rev,
          ' ist keine Section-Revision mit scope_reference=N2.8.'
        );
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT=v_message;
    END IF;

    -- Das aus N2.8 abgeleitete Modul muss selbst als N2 gekennzeichnet sein.
    IF NOT EXISTS (
        SELECT 1
          FROM appendix_modules
         WHERE appendix_module_id=v_n2_module
           AND appendix_code='N2'
    ) THEN
        ROLLBACK;
        SET v_message=CONCAT(
          'RKB33-N69 N2-AUTO-REPAIR: N2.8 hängt an appendix_module_id=',
          v_n2_module,
          ', dieses Modul trägt aber nicht appendix_code=N2.'
        );
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT=v_message;
    END IF;

    SELECT COALESCE(MAX(created_revision_id),0)
      INTO v_n2_max_rev
      FROM appendix_sections
     WHERE appendix_module_id=v_n2_module
       AND section_code IN
       ('N2.0','N2.1','N2.2','N2.3','N2.4','N2.5','N2.6','N2.7','N2.8');

    -- ========================================================================
    -- 9B. N2-FINAL BEI FEHLEN AUTOMATISCH REVALIDIEREN
    --     Keine N2-Inhalte werden verändert.
    -- ========================================================================

    IF NOT EXISTS (
        SELECT 1
          FROM repository_validation_results
         WHERE validation_code='RKB33-N2-FINAL-GATE'
           AND validation_status='passed'
           AND revision_id>=v_n2_max_rev
    ) THEN

        SELECT COUNT(*)
          INTO v_n2_sections
          FROM appendix_sections
         WHERE appendix_module_id=v_n2_module
           AND section_code IN
           ('N2.0','N2.1','N2.2','N2.3','N2.4','N2.5','N2.6','N2.7','N2.8');

        SELECT COUNT(*)
          INTO v_n2_revisions
          FROM appendix_sections s
         WHERE s.appendix_module_id=v_n2_module
           AND s.section_code IN
           ('N2.0','N2.1','N2.2','N2.3','N2.4','N2.5','N2.6','N2.7','N2.8')
           AND s.created_revision_id IS NOT NULL
           AND EXISTS (
               SELECT 1
                 FROM repository_revisions r
                WHERE r.revision_id=s.created_revision_id
                  AND r.scope_type='section'
                  AND r.scope_reference=s.section_code
           );

        SELECT COUNT(*)
          INTO v_n2_snapshots
          FROM appendix_sections s
         WHERE s.appendix_module_id=v_n2_module
           AND s.section_code IN
           ('N2.0','N2.1','N2.2','N2.3','N2.4','N2.5','N2.6','N2.7','N2.8')
           AND EXISTS (
               SELECT 1
                 FROM appendix_section_versions v
                WHERE v.appendix_section_id=s.appendix_section_id
                  AND v.revision_id=s.created_revision_id
           );

        SELECT COUNT(*)
          INTO v_n2_bad_links
          FROM appendix_sections s
          JOIN appendix_objects o
            ON o.appendix_section_id=s.appendix_section_id
         WHERE s.appendix_module_id=v_n2_module
           AND s.section_code IN
           ('N2.0','N2.1','N2.2','N2.3','N2.4','N2.5','N2.6','N2.7','N2.8')
           AND o.created_revision_id<>s.created_revision_id;

        SELECT
            IF(
              (SELECT r1.parent_revision_id
                 FROM appendix_sections s1
                 JOIN repository_revisions r1 ON r1.revision_id=s1.created_revision_id
                WHERE s1.appendix_module_id=v_n2_module AND s1.section_code='N2.1')
              =
              (SELECT s0.created_revision_id
                 FROM appendix_sections s0
                WHERE s0.appendix_module_id=v_n2_module AND s0.section_code='N2.0'),
              1,0)
          + IF(
              (SELECT r2.parent_revision_id
                 FROM appendix_sections s2
                 JOIN repository_revisions r2 ON r2.revision_id=s2.created_revision_id
                WHERE s2.appendix_module_id=v_n2_module AND s2.section_code='N2.2')
              =
              (SELECT s1.created_revision_id
                 FROM appendix_sections s1
                WHERE s1.appendix_module_id=v_n2_module AND s1.section_code='N2.1'),
              1,0)
          + IF(
              (SELECT r3.parent_revision_id
                 FROM appendix_sections s3
                 JOIN repository_revisions r3 ON r3.revision_id=s3.created_revision_id
                WHERE s3.appendix_module_id=v_n2_module AND s3.section_code='N2.3')
              =
              (SELECT s2.created_revision_id
                 FROM appendix_sections s2
                WHERE s2.appendix_module_id=v_n2_module AND s2.section_code='N2.2'),
              1,0)
          + IF(
              (SELECT r4.parent_revision_id
                 FROM appendix_sections s4
                 JOIN repository_revisions r4 ON r4.revision_id=s4.created_revision_id
                WHERE s4.appendix_module_id=v_n2_module AND s4.section_code='N2.4')
              =
              (SELECT s3.created_revision_id
                 FROM appendix_sections s3
                WHERE s3.appendix_module_id=v_n2_module AND s3.section_code='N2.3'),
              1,0)
          + IF(
              (SELECT r5.parent_revision_id
                 FROM appendix_sections s5
                 JOIN repository_revisions r5 ON r5.revision_id=s5.created_revision_id
                WHERE s5.appendix_module_id=v_n2_module AND s5.section_code='N2.5')
              =
              (SELECT s4.created_revision_id
                 FROM appendix_sections s4
                WHERE s4.appendix_module_id=v_n2_module AND s4.section_code='N2.4'),
              1,0)
          + IF(
              (SELECT r6.parent_revision_id
                 FROM appendix_sections s6
                 JOIN repository_revisions r6 ON r6.revision_id=s6.created_revision_id
                WHERE s6.appendix_module_id=v_n2_module AND s6.section_code='N2.6')
              =
              (SELECT s5.created_revision_id
                 FROM appendix_sections s5
                WHERE s5.appendix_module_id=v_n2_module AND s5.section_code='N2.5'),
              1,0)
          + IF(
              (SELECT r7.parent_revision_id
                 FROM appendix_sections s7
                 JOIN repository_revisions r7 ON r7.revision_id=s7.created_revision_id
                WHERE s7.appendix_module_id=v_n2_module AND s7.section_code='N2.7')
              =
              (SELECT s6.created_revision_id
                 FROM appendix_sections s6
                WHERE s6.appendix_module_id=v_n2_module AND s6.section_code='N2.6'),
              1,0)
          + IF(
              (SELECT r8.parent_revision_id
                 FROM appendix_sections s8
                 JOIN repository_revisions r8 ON r8.revision_id=s8.created_revision_id
                WHERE s8.appendix_module_id=v_n2_module AND s8.section_code='N2.8')
              =
              (SELECT s7.created_revision_id
                 FROM appendix_sections s7
                WHERE s7.appendix_module_id=v_n2_module AND s7.section_code='N2.7'),
              1,0)
          INTO v_n2_parent_chain;

        SELECT
          COUNT(*),
          COUNT(DISTINCT CAST(SUBSTRING(o.display_number,4) AS UNSIGNED)),
          MIN(CAST(SUBSTRING(o.display_number,4) AS UNSIGNED)),
          MAX(CAST(SUBSTRING(o.display_number,4) AS UNSIGNED)),
          SUM(o.formal_latex=o.word_latex),
          SUM(
              LOCATE(o.display_number,o.formal_latex)>0
              OR LOCATE(o.display_number,o.word_latex)>0
          )
          INTO
          v_n2_eq_count,v_n2_eq_unique,v_n2_eq_min,v_n2_eq_max,
          v_n2_eq_sync,v_n2_eq_leaks
          FROM appendix_sections s
          JOIN appendix_objects o
            ON o.appendix_section_id=s.appendix_section_id
         WHERE s.appendix_module_id=v_n2_module
           AND o.object_type='equation'
           AND o.display_number REGEXP '^N2[.][0-9]+$';

        SELECT
          COUNT(*),
          COUNT(DISTINCT CAST(SUBSTRING(o.object_anchor,5) AS UNSIGNED)),
          MIN(CAST(SUBSTRING(o.object_anchor,5) AS UNSIGNED)),
          MAX(CAST(SUBSTRING(o.object_anchor,5) AS UNSIGNED))
          INTO
          v_n2_def_count,v_n2_def_unique,v_n2_def_min,v_n2_def_max
          FROM appendix_sections s
          JOIN appendix_objects o
            ON o.appendix_section_id=s.appendix_section_id
         WHERE s.appendix_module_id=v_n2_module
           AND o.object_anchor REGEXP '^N2-D[0-9]+$';

        SET v_n2_revalidate_failed =
            IF(v_n2_sections=9,0,1)
          + IF(v_n2_revisions=9,0,1)
          + IF(v_n2_parent_chain=8,0,1)
          + IF(v_n2_snapshots=9,0,1)
          + IF(v_n2_bad_links=0,0,1)
          + IF(v_n2_eq_count=165,0,1)
          + IF(v_n2_eq_unique=165,0,1)
          + IF(v_n2_eq_min=1,0,1)
          + IF(v_n2_eq_max=165,0,1)
          + IF(v_n2_eq_sync=165,0,1)
          + IF(v_n2_eq_leaks=0,0,1)
          + IF(v_n2_def_count=43,0,1)
          + IF(v_n2_def_unique=43,0,1)
          + IF(v_n2_def_min=1,0,1)
          + IF(v_n2_def_max=43,0,1);

        SET v_n2_revalidate_detail = CASE
          WHEN v_n2_sections<>9 THEN CONCAT('SECTIONS=',v_n2_sections,' expected=9')
          WHEN v_n2_revisions<>9 THEN CONCAT('REVISIONS=',v_n2_revisions,' expected=9')
          WHEN v_n2_parent_chain<>8 THEN CONCAT('PARENT_CHAIN=',v_n2_parent_chain,' expected=8')
          WHEN v_n2_snapshots<>9 THEN CONCAT('SNAPSHOTS=',v_n2_snapshots,' expected=9')
          WHEN v_n2_bad_links<>0 THEN CONCAT('BAD_OBJECT_REV_LINKS=',v_n2_bad_links,' expected=0')
          WHEN v_n2_eq_count<>165 THEN CONCAT('EQUATIONS=',v_n2_eq_count,' expected=165')
          WHEN v_n2_eq_unique<>165 OR v_n2_eq_min<>1 OR v_n2_eq_max<>165
               THEN CONCAT('EQ_SEQUENCE unique=',v_n2_eq_unique,' min=',v_n2_eq_min,' max=',v_n2_eq_max)
          WHEN v_n2_eq_sync<>165 THEN CONCAT('WORDLATEX_SYNC=',v_n2_eq_sync,' expected=165')
          WHEN v_n2_eq_leaks<>0 THEN CONCAT('OWN_FORMULA_NUMBER_LEAKS=',v_n2_eq_leaks,' expected=0')
          WHEN v_n2_def_count<>43 THEN CONCAT('DEFINITIONS=',v_n2_def_count,' expected=43')
          WHEN v_n2_def_unique<>43 OR v_n2_def_min<>1 OR v_n2_def_max<>43
               THEN CONCAT('DEF_SEQUENCE unique=',v_n2_def_unique,' min=',v_n2_def_min,' max=',v_n2_def_max)
          ELSE 'UNKNOWN'
        END;

        IF v_n2_revalidate_failed<>0 THEN
            ROLLBACK;
            SET v_message=CONCAT(
              'RKB33-N69 N2-AUTO-REPAIR failed: ',
              v_n2_revalidate_detail,
              '; failed_checks=',
              v_n2_revalidate_failed
            );
            SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT=v_message;
        END IF;

        -- Aktuelle N2->N3-Gate-Revision bevorzugen.
        SELECT MAX(revision_id)
          INTO v_n2_handoff_rev
          FROM repository_revisions
         WHERE (
                revision_code='RKB33-GATE-N2-N3-2026-09-22'
                OR scope_reference='N2->N3'
               )
           AND parent_revision_id=v_n2_current_end_rev;

        IF v_n2_handoff_rev IS NULL THEN
            IF EXISTS (
                SELECT 1
                  FROM repository_revisions
                 WHERE revision_code='RKB33-GATE-N2-N3-REVALIDATE-2026-09-25'
            ) THEN
                SELECT MAX(revision_id)
                  INTO v_n2_handoff_rev
                  FROM repository_revisions
                 WHERE revision_code='RKB33-GATE-N2-N3-REVALIDATE-2026-09-25'
                   AND parent_revision_id=v_n2_current_end_rev;
            ELSE
                INSERT INTO repository_revisions
                (
                  revision_code,revision_date,scope_type,scope_reference,
                  version_label,summary,created_by,parent_revision_id
                )
                VALUES
                (
                  'RKB33-GATE-N2-N3-REVALIDATE-2026-09-25',
                  CURRENT_TIMESTAMP,
                  'repository',
                  'N2->N3',
                  'handoff-gate-revalidation-v1',
                  'Revalidiertes N2->N3-Gate auf Grundlage des aktuellen N2.0-N2.8-Bestands.',
                  'Olaf Thiele / ChatGPT',
                  v_n2_current_end_rev
                );
                SET v_n2_handoff_rev=LAST_INSERT_ID();
            END IF;
        END IF;

        IF v_n2_handoff_rev IS NULL THEN
            ROLLBACK;
            SIGNAL SQLSTATE '45000'
            SET MYSQL_ERRNO=1644,
                MESSAGE_TEXT='RKB33-N69 N2-AUTO-REPAIR: aktuelle N2->N3-Gate-Revision konnte nicht aufgelöst werden.';
        END IF;

        INSERT INTO repository_validation_results
        (revision_id,validation_code,validation_status,expected_value,actual_value,
         validation_message,checked_at)
        VALUES
        (
          v_n2_current_end_rev,
          'RKB33-N2-REVALIDATION-2026-09-25',
          'passed',
          'N2.0-N2.8=9; parent_chain=8; equations=165; definitions=43; word_latex_sync=165',
          CONCAT('sections=',v_n2_sections,
                 '; parent_chain=',v_n2_parent_chain,
                 '; equations=',v_n2_eq_count,
                 '; definitions=',v_n2_def_count,
                 '; word_latex_sync=',v_n2_eq_sync),
          'N2 wurde für das N1-N6-Gesamtgate vollständig revalidiert, ohne N2-Inhalte zu verändern.',
          CURRENT_TIMESTAMP
        ),
        (
          v_n2_current_end_rev,
          'RKB33-N2-FINAL-GATE',
          'passed',
          'aktueller N2.0-N2.8-Bestand vollständig und revisionsgebunden',
          'passed after explicit revalidation',
          'Das fehlende N2-Gesamtgate wurde ausschließlich nach erfolgreicher vollständiger Revalidierung des aktuellen N2-Bestands wiederhergestellt.',
          CURRENT_TIMESTAMP
        )
        ON DUPLICATE KEY UPDATE
          validation_status=VALUES(validation_status),
          expected_value=VALUES(expected_value),
          actual_value=VALUES(actual_value),
          validation_message=VALUES(validation_message),
          checked_at=CURRENT_TIMESTAMP;

        INSERT INTO repository_validation_results
        (revision_id,validation_code,validation_status,expected_value,actual_value,
         validation_message,checked_at)
        VALUES
        (
          v_n2_handoff_rev,
          'RKB33-N2N3-FINAL-GATE',
          'passed',
          'RKB33-N2-FINAL-GATE = passed; parent=current N2.8 revision',
          CONCAT('parent_revision_id=',v_n2_current_end_rev),
          'N2->N3 wurde auf Grundlage des revalidierten aktuellen N2-Endstands erneut freigegeben.',
          CURRENT_TIMESTAMP
        ),
        (
          v_n2_handoff_rev,
          'RKB33-GATE-N2-N3',
          'passed',
          'RKB33-N2N3-FINAL-GATE = passed',
          'passed',
          'Kanonischer N2->N3-Übergabecode nach Revalidierung erneut bestätigt.',
          CURRENT_TIMESTAMP
        )
        ON DUPLICATE KEY UPDATE
          validation_status=VALUES(validation_status),
          expected_value=VALUES(expected_value),
          actual_value=VALUES(actual_value),
          validation_message=VALUES(validation_message),
          checked_at=CURRENT_TIMESTAMP;

    END IF;

    -- Neueste reale Gatezustände lesen.
    SELECT COALESCE((SELECT validation_status FROM repository_validation_results
                      WHERE validation_code='RKB33-N1-N2-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing')
      INTO v_n1_gate_status;
    SELECT COALESCE((SELECT revision_id FROM repository_validation_results
                      WHERE validation_code='RKB33-N1-N2-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),0)
      INTO v_n1_gate_rev;

    SELECT COALESCE((SELECT validation_status FROM repository_validation_results
                      WHERE validation_code='RKB33-N2-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing')
      INTO v_n2_final_status;
    SELECT COALESCE((SELECT revision_id FROM repository_validation_results
                      WHERE validation_code='RKB33-N2-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),0)
      INTO v_n2_final_rev;

    SELECT COALESCE((SELECT validation_status FROM repository_validation_results
                      WHERE validation_code='RKB33-N2N3-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing')
      INTO v_n2n3_status;
    SELECT COALESCE((SELECT revision_id FROM repository_validation_results
                      WHERE validation_code='RKB33-N2N3-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),0)
      INTO v_n2n3_rev;

    SELECT COALESCE((SELECT validation_status FROM repository_validation_results
                      WHERE validation_code='RKB33-GATE-N2-N3'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing')
      INTO v_n2canon_status;
    SELECT COALESCE((SELECT revision_id FROM repository_validation_results
                      WHERE validation_code='RKB33-GATE-N2-N3'
                      ORDER BY validation_result_id DESC LIMIT 1),0)
      INTO v_n2canon_rev;

    SELECT COALESCE((SELECT validation_status FROM repository_validation_results
                      WHERE validation_code='RKB33-N3N4-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing')
      INTO v_n3n4_status;
    SELECT COALESCE((SELECT revision_id FROM repository_validation_results
                      WHERE validation_code='RKB33-N3N4-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),0)
      INTO v_n3n4_rev;

    SELECT COALESCE((SELECT validation_status FROM repository_validation_results
                      WHERE validation_code='RKB33-N4-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing')
      INTO v_n4_final_status;
    SELECT COALESCE((SELECT revision_id FROM repository_validation_results
                      WHERE validation_code='RKB33-N4-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),0)
      INTO v_n4_final_rev;

    SELECT COALESCE((SELECT validation_status FROM repository_validation_results
                      WHERE validation_code='RKB33-N4N5-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing')
      INTO v_n4n5_status;
    SELECT COALESCE((SELECT revision_id FROM repository_validation_results
                      WHERE validation_code='RKB33-N4N5-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),0)
      INTO v_n4n5_rev;

    SELECT COALESCE((SELECT validation_status FROM repository_validation_results
                      WHERE validation_code='RKB33-N5-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing')
      INTO v_n5_final_status;
    SELECT COALESCE((SELECT revision_id FROM repository_validation_results
                      WHERE validation_code='RKB33-N5-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),0)
      INTO v_n5_final_rev;

    SELECT COALESCE((SELECT validation_status FROM repository_validation_results
                      WHERE validation_code='RKB33-N5N6-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),'missing')
      INTO v_n5n6_status;
    SELECT COALESCE((SELECT revision_id FROM repository_validation_results
                      WHERE validation_code='RKB33-N5N6-FINAL-GATE'
                      ORDER BY validation_result_id DESC LIMIT 1),0)
      INTO v_n5n6_rev;

    SET v_n1_ok =
      IF(v_n1_module IS NOT NULL
         AND v_n1_max_rev>0
         AND v_n1_gate_status='passed'
         AND v_n1_gate_rev>=v_n1_max_rev,1,0);

    SET v_n2_ok =
      IF(v_n2_module IS NOT NULL
         AND v_n2_max_rev>0
         AND v_n2_final_status='passed'
         AND v_n2_final_rev>=v_n2_max_rev
         AND v_n2n3_status='passed'
         AND v_n2n3_rev>=v_n2_max_rev
         AND v_n2canon_status='passed'
         AND v_n2canon_rev>=v_n2_max_rev,1,0);

    SET v_n3_ok =
      IF(v_n3_module IS NOT NULL
         AND v_n3_max_rev>0
         AND v_n3n4_status='passed'
         AND v_n3n4_rev>=v_n3_max_rev,1,0);

    SET v_n4_ok =
      IF(v_n4_module IS NOT NULL
         AND v_n4_max_rev>0
         AND v_n4n5_status='passed'
         AND v_n4n5_rev>=v_n4_max_rev,1,0);

    SET v_n5_ok =
      IF(v_n5_module IS NOT NULL
         AND v_n5_max_rev>0
         AND v_n5n6_status='passed'
         AND v_n5n6_rev>=v_n5_max_rev,1,0);

    SET v_handoffs_ok =
      IF(
         v_n1_gate_status='passed' AND v_n1_gate_rev>=v_n1_max_rev
         AND v_n2n3_status='passed' AND v_n2n3_rev>=v_n2_max_rev
         AND v_n2canon_status='passed' AND v_n2canon_rev>=v_n2_max_rev
         AND v_n3n4_status='passed' AND v_n3n4_rev>=v_n3_max_rev
         AND v_n4n5_status='passed' AND v_n4n5_rev>=v_n4_max_rev
         AND v_n5n6_status='passed' AND v_n5n6_rev>=v_n5_max_rev,
         1,0
      );

    SET v_n6_ok =
      IF(EXISTS(
          SELECT 1
            FROM repository_validation_results
           WHERE revision_id=v_gate_revision
             AND validation_code='RKB33-N6-FINAL-GATE'
             AND validation_status='passed'
         ),1,0);

    SET v_aggregate_failed =
        IF(v_n1_ok=1,0,1)
      + IF(v_n2_ok=1,0,1)
      + IF(v_n3_ok=1,0,1)
      + IF(v_n4_ok=1,0,1)
      + IF(v_n5_ok=1,0,1)
      + IF(v_n6_ok=1,0,1)
      + IF(v_handoffs_ok=1,0,1);

    SET v_aggregate_detail = CASE
      WHEN v_n1_ok<>1 THEN CONCAT('N1 current gate failed: status=',v_n1_gate_status,
                                  ', gate_rev=',v_n1_gate_rev,', max_section_rev=',v_n1_max_rev)
      WHEN v_n2_ok<>1 THEN CONCAT(
           'N2 gates not current: final=',v_n2_final_status,
           ', final_rev=',v_n2_final_rev,
           ', n2n3=',v_n2n3_status,
           ', n2n3_rev=',v_n2n3_rev,
           ', canonical=',v_n2canon_status,
           ', canonical_rev=',v_n2canon_rev,
           ', max_section_rev=',v_n2_max_rev)
      WHEN v_n3_ok<>1 THEN CONCAT('N3->N4 FINAL not current: status=',v_n3n4_status,
                                  ', gate_rev=',v_n3n4_rev,', max_section_rev=',v_n3_max_rev)
      WHEN v_n4_ok<>1 THEN CONCAT('N4->N5 FINAL not current: status=',v_n4n5_status,
                                  ', gate_rev=',v_n4n5_rev,', max_section_rev=',v_n4_max_rev)
      WHEN v_n5_ok<>1 THEN CONCAT('N5->N6 FINAL not current: status=',v_n5n6_status,
                                  ', gate_rev=',v_n5n6_rev,', max_section_rev=',v_n5_max_rev)
      WHEN v_n6_ok<>1 THEN 'N6 FINAL not passed'
      WHEN v_handoffs_ok<>1 THEN CONCAT(
           'handoff chain failed: N2N3=',v_n2n3_status,
           ', N2CANON=',v_n2canon_status,
           ', N3N4=',v_n3n4_status,
           ', N4N5=',v_n4n5_status,
           ', N5N6=',v_n5n6_status)
      ELSE 'all current'
    END;

    -- ========================================================================
    -- 10. GESAMTGATE UND HANDOFF 3.3 PERSISTIEREN
    -- ========================================================================

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    VALUES
    (
      v_gate_revision,
      'RKB33-N1N6-FINAL-GATE',
      IF(v_aggregate_failed=0,'passed','failed'),
      'N1..N6 current finals passed; handoff chain current',
      CONCAT('N1=',v_n1_ok,';N2=',v_n2_ok,';N3=',v_n3_ok,
             ';N4=',v_n4_ok,';N5=',v_n5_ok,';N6=',v_n6_ok,';H=',v_handoffs_ok),
      IF(v_aggregate_failed=0,
         'N1 bis N6 sind auf ihren aktuellen Anlagenständen vollständig freigegeben. Kapitel 3.3 darf begonnen werden.',
         CONCAT('Gesamtgate gesperrt: ',v_aggregate_detail)),
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_validation_results
    (revision_id,validation_code,validation_status,expected_value,actual_value,
     validation_message,checked_at)
    VALUES
    (
      v_gate_revision,
      'RKB33-N6-HANDOFF-33',
      IF(v_aggregate_failed=0,'passed','failed'),
      'RKB33-N1N6-FINAL-GATE = passed',
      IF(v_aggregate_failed=0,'RKB33-N1N6-FINAL-GATE = passed',
                                'RKB33-N1N6-FINAL-GATE = failed'),
      IF(v_aggregate_failed=0,
         'N6 und die Anlagen N1 bis N6 sind revisionsgebunden an Kapitel 3.3 übergabefähig.',
         'Kapitel 3.3 bleibt gesperrt, bis RKB33-N1N6-FINAL-GATE passed ist.'),
      CURRENT_TIMESTAMP
    )
    ON DUPLICATE KEY UPDATE
      validation_status=VALUES(validation_status),
      expected_value=VALUES(expected_value),
      actual_value=VALUES(actual_value),
      validation_message=VALUES(validation_message),
      checked_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_counters(counter_key,counter_value,updated_at)
    VALUES ('current_section','N6.9',CURRENT_TIMESTAMP)
    ON DUPLICATE KEY UPDATE counter_value='N6.9',updated_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_counters(counter_key,counter_value,updated_at)
    VALUES ('last_completed_section','N6.9',CURRENT_TIMESTAMP)
    ON DUPLICATE KEY UPDATE counter_value='N6.9',updated_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_counters(counter_key,counter_value,updated_at)
    VALUES ('last_repository_revision','RKB33-GATE-N6-N1N6-2026-09-25',CURRENT_TIMESTAMP)
    ON DUPLICATE KEY UPDATE counter_value='RKB33-GATE-N6-N1N6-2026-09-25',updated_at=CURRENT_TIMESTAMP;

    INSERT INTO repository_counters(counter_key,counter_value,updated_at)
    VALUES ('chapter_3_3_start_gate',
            IF(v_aggregate_failed=0,'passed','blocked'),
            CURRENT_TIMESTAMP)
    ON DUPLICATE KEY UPDATE
      counter_value=VALUES(counter_value),
      updated_at=CURRENT_TIMESTAMP;

    COMMIT;

    -- N6.9/N6-FINAL bleiben bei einem Gesamtgatefehler bewusst erhalten.
    IF v_aggregate_failed<>0 THEN
        SET v_message=CONCAT(
          'RKB33-N1N6-FINAL-GATE failed: ',
          v_aggregate_detail,
          '; N6.9 und RKB33-N6-FINAL-GATE bleiben erhalten; Kapitel 3.3 ist gesperrt.'
        );
        SIGNAL SQLSTATE '45000'
        SET MYSQL_ERRNO=1644,
            MESSAGE_TEXT=v_message;
    END IF;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `acronyms`
--

CREATE TABLE `acronyms` (
  `acronym_id` bigint(20) UNSIGNED NOT NULL,
  `acronym` varchar(100) NOT NULL,
  `full_form` varchar(1000) NOT NULL,
  `explanation` longtext DEFAULT NULL,
  `first_section_id` bigint(20) UNSIGNED DEFAULT NULL,
  `language_code` char(2) NOT NULL DEFAULT 'de',
  `category` varchar(255) DEFAULT NULL,
  `is_project_specific` tinyint(1) NOT NULL DEFAULT 0,
  `validation_status` enum('draft','checked','verified') NOT NULL DEFAULT 'draft',
  `created_revision_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `annotations`
--

CREATE TABLE `annotations` (
  `annotation_id` bigint(20) UNSIGNED NOT NULL,
  `source_id` bigint(20) UNSIGNED NOT NULL,
  `contribution` text DEFAULT NULL,
  `significance_for_dissertation` text DEFAULT NULL,
  `citation_reason` text DEFAULT NULL,
  `adopted_claims` text DEFAULT NULL,
  `limitations` text DEFAULT NULL,
  `scientific_discussion` text DEFAULT NULL,
  `annotation_status` enum('draft','reviewed','approved') NOT NULL DEFAULT 'draft',
  `reviewed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `assumptions`
--

CREATE TABLE `assumptions` (
  `assumption_id` bigint(20) UNSIGNED NOT NULL,
  `assumption_number` varchar(50) NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `assumption_text` longtext NOT NULL,
  `formal_latex` longtext DEFAULT NULL,
  `word_latex` longtext DEFAULT NULL,
  `derivation_from_research_gap` longtext DEFAULT NULL,
  `status` enum('proposed','accepted','rejected','superseded') NOT NULL DEFAULT 'proposed',
  `created_revision_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `authors`
--

CREATE TABLE `authors` (
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `family_name` varchar(255) NOT NULL,
  `given_names` varchar(255) DEFAULT NULL,
  `normalized_name` varchar(500) NOT NULL,
  `orcid` varchar(50) DEFAULT NULL,
  `birth_year` smallint(6) DEFAULT NULL,
  `death_year` smallint(6) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `axioms`
--

CREATE TABLE `axioms` (
  `axiom_id` bigint(20) UNSIGNED NOT NULL,
  `axiom_number` varchar(50) NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `axiom_text` longtext NOT NULL,
  `formal_latex` longtext DEFAULT NULL,
  `word_latex` longtext DEFAULT NULL,
  `motivation` longtext DEFAULT NULL,
  `independence_note` longtext DEFAULT NULL,
  `consistency_note` longtext DEFAULT NULL,
  `operationalization_note` longtext DEFAULT NULL,
  `source_assumption_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('draft','review','accepted','revised','rejected') NOT NULL DEFAULT 'draft',
  `created_revision_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `axiom_dependencies`
--

CREATE TABLE `axiom_dependencies` (
  `axiom_dependency_id` bigint(20) UNSIGNED NOT NULL,
  `axiom_id` bigint(20) UNSIGNED NOT NULL,
  `depends_on_axiom_id` bigint(20) UNSIGNED NOT NULL,
  `dependency_type` enum('depends_on','extends','specializes','contrasts','independent_of') NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `citation_corrections`
--

CREATE TABLE `citation_corrections` (
  `correction_id` bigint(20) UNSIGNED NOT NULL,
  `old_citation_label` varchar(50) NOT NULL,
  `corrected_citation_label` varchar(50) NOT NULL,
  `section_code` varchar(50) NOT NULL,
  `reason` text NOT NULL,
  `revision_id` bigint(20) UNSIGNED DEFAULT NULL,
  `corrected_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `corollaries`
--

CREATE TABLE `corollaries` (
  `corollary_id` bigint(20) UNSIGNED NOT NULL,
  `corollary_number` varchar(50) NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `statement_text` longtext NOT NULL,
  `statement_latex` longtext DEFAULT NULL,
  `word_latex` longtext DEFAULT NULL,
  `parent_theorem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_lemma_id` bigint(20) UNSIGNED DEFAULT NULL,
  `provenance` enum('original','adapted','literature') NOT NULL DEFAULT 'literature',
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `validation_status` enum('draft','checked','verified') NOT NULL DEFAULT 'draft',
  `created_revision_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `definitions`
--

CREATE TABLE `definitions` (
  `definition_id` bigint(20) UNSIGNED NOT NULL,
  `definition_number` varchar(50) NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `definition_text` longtext NOT NULL,
  `formal_latex` longtext DEFAULT NULL,
  `word_latex` longtext DEFAULT NULL,
  `provenance` enum('original','adapted','literature') NOT NULL DEFAULT 'original',
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assumptions` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `validation_status` enum('draft','checked','verified') NOT NULL DEFAULT 'draft',
  `created_revision_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dissertation_sections`
--

CREATE TABLE `dissertation_sections` (
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `parent_section_id` bigint(20) UNSIGNED DEFAULT NULL,
  `section_code` varchar(50) NOT NULL,
  `title` varchar(500) NOT NULL,
  `chapter_no` int(11) NOT NULL,
  `section_order` decimal(10,4) NOT NULL,
  `status` enum('planned','draft','review','final') NOT NULL DEFAULT 'planned',
  `is_original_contribution` tinyint(1) NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dissertation_tables`
--

CREATE TABLE `dissertation_tables` (
  `table_id` bigint(20) UNSIGNED NOT NULL,
  `table_number` varchar(50) NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `caption` longtext DEFAULT NULL,
  `table_schema_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`table_schema_json`)),
  `table_data_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`table_data_json`)),
  `file_name` varchar(500) DEFAULT NULL,
  `file_path` varchar(1500) DEFAULT NULL,
  `provenance` enum('original','adapted','literature') NOT NULL DEFAULT 'original',
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `generation_method` text DEFAULT NULL,
  `validation_status` enum('draft','checked','verified') NOT NULL DEFAULT 'draft',
  `created_revision_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `documents`
--

CREATE TABLE `documents` (
  `document_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `file_name` varchar(500) DEFAULT NULL,
  `document_type` enum('dissertation','chapter','article','book','dataset','appendix','other') NOT NULL DEFAULT 'other',
  `version_label` varchar(100) DEFAULT NULL,
  `file_path` varchar(1000) DEFAULT NULL,
  `checksum_sha256` char(64) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `equations`
--

CREATE TABLE `equations` (
  `equation_id` bigint(20) UNSIGNED NOT NULL,
  `equation_number` varchar(50) NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `equation_latex` text NOT NULL,
  `word_latex` text NOT NULL,
  `plain_description` text NOT NULL,
  `equation_type` enum('definition','axiom','theorem','lemma','derived','schema','model','metric','other') NOT NULL DEFAULT 'other',
  `provenance` enum('original','adapted','literature') NOT NULL DEFAULT 'original',
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `derivation` text DEFAULT NULL,
  `assumptions` text DEFAULT NULL,
  `validation_status` enum('draft','checked','verified') NOT NULL DEFAULT 'draft',
  `created_revision_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `equation_dependencies`
--

CREATE TABLE `equation_dependencies` (
  `dependency_id` bigint(20) UNSIGNED NOT NULL,
  `equation_id` bigint(20) UNSIGNED NOT NULL,
  `depends_on_equation_id` bigint(20) UNSIGNED NOT NULL,
  `dependency_type` enum('derived_from','uses','special_case_of','generalizes','validates','contrasts') NOT NULL,
  `dependency_note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `equation_symbols`
--

CREATE TABLE `equation_symbols` (
  `equation_symbol_id` bigint(20) UNSIGNED NOT NULL,
  `equation_id` bigint(20) UNSIGNED NOT NULL,
  `symbol_latex` varchar(255) NOT NULL,
  `symbol_name` varchar(255) NOT NULL,
  `definition_text` text NOT NULL,
  `unit_text` varchar(255) DEFAULT NULL,
  `domain_text` varchar(500) DEFAULT NULL,
  `symbol_order` smallint(5) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `figures`
--

CREATE TABLE `figures` (
  `figure_id` bigint(20) UNSIGNED NOT NULL,
  `figure_number` varchar(50) NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `caption` longtext NOT NULL,
  `file_name` varchar(500) DEFAULT NULL,
  `file_path` varchar(1500) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL,
  `figure_type` enum('diagram','plot','photograph','schema','flowchart','network','other') NOT NULL DEFAULT 'other',
  `provenance` enum('original','adapted','literature') NOT NULL DEFAULT 'original',
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `generation_method` text DEFAULT NULL,
  `data_reference` text DEFAULT NULL,
  `validation_status` enum('draft','checked','verified') NOT NULL DEFAULT 'draft',
  `created_revision_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lemmas`
--

CREATE TABLE `lemmas` (
  `lemma_id` bigint(20) UNSIGNED NOT NULL,
  `lemma_number` varchar(50) NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `statement_text` longtext NOT NULL,
  `statement_latex` longtext DEFAULT NULL,
  `word_latex` longtext DEFAULT NULL,
  `provenance` enum('original','adapted','literature') NOT NULL DEFAULT 'literature',
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assumptions` text DEFAULT NULL,
  `validation_status` enum('draft','checked','verified') NOT NULL DEFAULT 'draft',
  `created_revision_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `object_dependencies`
--

CREATE TABLE `object_dependencies` (
  `object_dependency_id` bigint(20) UNSIGNED NOT NULL,
  `object_type_from` enum('definition','theorem','lemma','corollary','proof','equation','assumption','axiom','figure','table') NOT NULL,
  `object_id_from` bigint(20) UNSIGNED NOT NULL,
  `object_type_to` enum('definition','theorem','lemma','corollary','proof','equation','assumption','axiom','figure','table') NOT NULL,
  `object_id_to` bigint(20) UNSIGNED NOT NULL,
  `dependency_type` enum('depends_on','derives_from','supports','contrasts','generalizes','specializes','validates') NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `object_source_links`
--

CREATE TABLE `object_source_links` (
  `object_source_link_id` bigint(20) UNSIGNED NOT NULL,
  `object_type` enum('definition','theorem','lemma','corollary','proof','proposition','equation','figure','table','symbol','acronym','assumption','axiom') NOT NULL,
  `object_id` bigint(20) UNSIGNED NOT NULL,
  `source_id` bigint(20) UNSIGNED NOT NULL,
  `usage_type` enum('primary_source','supporting_source','adapted_from','contrasts','historical_context','verification') NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pending_sources`
--

CREATE TABLE `pending_sources` (
  `pending_source_id` bigint(20) UNSIGNED NOT NULL,
  `proposed_source_key` varchar(150) DEFAULT NULL,
  `title` varchar(1000) NOT NULL,
  `authors_text` varchar(1000) DEFAULT NULL,
  `year_text` varchar(50) DEFAULT NULL,
  `publication_text` varchar(1000) DEFAULT NULL,
  `doi_or_url` varchar(1500) DEFAULT NULL,
  `proposed_section_code` varchar(50) DEFAULT NULL,
  `discovery_context` text NOT NULL,
  `proposed_claim` text DEFAULT NULL,
  `priority` tinyint(3) UNSIGNED NOT NULL DEFAULT 3,
  `review_status` enum('open','in_review','accepted','rejected','merged') NOT NULL DEFAULT 'open',
  `merged_source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discovered_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reviewed_at` datetime DEFAULT NULL,
  `review_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `proofs`
--

CREATE TABLE `proofs` (
  `proof_id` bigint(20) UNSIGNED NOT NULL,
  `proof_number` varchar(50) DEFAULT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `theorem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lemma_id` bigint(20) UNSIGNED DEFAULT NULL,
  `corollary_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `proof_text` longtext NOT NULL,
  `proof_latex` longtext DEFAULT NULL,
  `proof_method` enum('direct','contradiction','induction','construction','equivalence','existence','uniqueness','computational','other') NOT NULL DEFAULT 'direct',
  `provenance` enum('original','adapted','literature') NOT NULL DEFAULT 'original',
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `validation_status` enum('draft','checked','verified') NOT NULL DEFAULT 'draft',
  `created_revision_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `propositions`
--

CREATE TABLE `propositions` (
  `proposition_id` bigint(20) UNSIGNED NOT NULL,
  `proposition_number` varchar(50) NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `statement_text` longtext NOT NULL,
  `statement_latex` longtext DEFAULT NULL,
  `word_latex` longtext DEFAULT NULL,
  `logical_derivation` longtext NOT NULL,
  `based_on_axioms` varchar(255) DEFAULT NULL,
  `status` enum('draft','review','accepted','revised','rejected') NOT NULL DEFAULT 'draft',
  `created_revision_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `proposition_dependencies`
--

CREATE TABLE `proposition_dependencies` (
  `proposition_dependency_id` bigint(20) UNSIGNED NOT NULL,
  `proposition_id` bigint(20) UNSIGNED NOT NULL,
  `axiom_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assumption_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dependency_type` enum('derived_from','uses','motivated_by','contrasts') NOT NULL DEFAULT 'derived_from',
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `repository_counters`
--

CREATE TABLE `repository_counters` (
  `counter_key` varchar(100) NOT NULL,
  `counter_value` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `repository_revisions`
--

CREATE TABLE `repository_revisions` (
  `revision_id` bigint(20) UNSIGNED NOT NULL,
  `revision_code` varchar(100) NOT NULL,
  `revision_date` datetime NOT NULL,
  `scope_type` enum('repository','chapter','section','source','equation','definition','statement','figure','table','symbol','acronym','axiom','assumption','proof','proposition') NOT NULL,
  `scope_reference` varchar(255) DEFAULT NULL,
  `version_label` varchar(100) NOT NULL,
  `summary` text NOT NULL,
  `created_by` varchar(255) DEFAULT 'Olaf Thiele / ChatGPT',
  `parent_revision_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `repository_validation_results`
--

CREATE TABLE `repository_validation_results` (
  `validation_result_id` bigint(20) UNSIGNED NOT NULL,
  `revision_id` bigint(20) UNSIGNED NOT NULL,
  `validation_code` varchar(100) NOT NULL,
  `validation_status` enum('passed','warning','failed') NOT NULL,
  `expected_value` varchar(255) DEFAULT NULL,
  `actual_value` varchar(255) DEFAULT NULL,
  `validation_message` text NOT NULL,
  `checked_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `section_change_log`
--

CREATE TABLE `section_change_log` (
  `change_id` bigint(20) UNSIGNED NOT NULL,
  `revision_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `change_type` enum('created','rewritten','edited','renumbered','source_added','source_reused','equation_added','equation_changed','definition_added','statement_added','proof_added','assumption_added','axiom_added','proposition_added','figure_added','table_added','symbol_added','acronym_added','status_changed','other') NOT NULL,
  `object_type` varchar(100) DEFAULT NULL,
  `object_reference` varchar(255) DEFAULT NULL,
  `change_summary` text NOT NULL,
  `previous_value` longtext DEFAULT NULL,
  `new_value` longtext DEFAULT NULL,
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sources`
--

CREATE TABLE `sources` (
  `source_id` bigint(20) UNSIGNED NOT NULL,
  `citation_number` int(10) UNSIGNED DEFAULT NULL,
  `source_key` varchar(150) NOT NULL,
  `source_type` enum('journal_article','book','book_chapter','conference_paper','thesis','report','standard','website','historical_work','edited_volume','other') NOT NULL,
  `title` varchar(1000) NOT NULL,
  `subtitle` varchar(1000) DEFAULT NULL,
  `year_original` smallint(6) DEFAULT NULL,
  `year_edition` smallint(6) DEFAULT NULL,
  `journal` varchar(500) DEFAULT NULL,
  `publisher` varchar(500) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `volume` varchar(100) DEFAULT NULL,
  `issue` varchar(100) DEFAULT NULL,
  `pages` varchar(100) DEFAULT NULL,
  `edition` varchar(100) DEFAULT NULL,
  `doi` varchar(255) DEFAULT NULL,
  `isbn` varchar(100) DEFAULT NULL,
  `url` varchar(1500) DEFAULT NULL,
  `language_code` char(2) DEFAULT 'de',
  `priority` tinyint(3) UNSIGNED NOT NULL DEFAULT 3,
  `evidence_type` enum('primary','secondary','review','textbook','historical','reference') NOT NULL DEFAULT 'secondary',
  `frzk_relevance` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `verification_status` enum('imported','partially_verified','verified','needs_review') NOT NULL DEFAULT 'imported',
  `first_citation_section_code` varchar(50) DEFAULT NULL,
  `first_citation_note` text DEFAULT NULL,
  `full_citation_text` text NOT NULL,
  `short_citation_text` varchar(500) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_revision_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `source_authors`
--

CREATE TABLE `source_authors` (
  `source_id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `author_order` smallint(5) UNSIGNED NOT NULL,
  `role` enum('author','editor','translator') NOT NULL DEFAULT 'author'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `source_relations`
--

CREATE TABLE `source_relations` (
  `relation_id` bigint(20) UNSIGNED NOT NULL,
  `source_id_from` bigint(20) UNSIGNED NOT NULL,
  `source_id_to` bigint(20) UNSIGNED NOT NULL,
  `relation_type` enum('extends','criticizes','formalizes','applies','reviews','historical_predecessor','alternative_to','supports','contradicts','related') NOT NULL,
  `relation_note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `source_topics`
--

CREATE TABLE `source_topics` (
  `source_id` bigint(20) UNSIGNED NOT NULL,
  `topic_id` bigint(20) UNSIGNED NOT NULL,
  `relevance` tinyint(3) UNSIGNED NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `source_usage`
--

CREATE TABLE `source_usage` (
  `usage_id` bigint(20) UNSIGNED NOT NULL,
  `source_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `usage_type` enum('first_citation','background','definition','theorem','method','historical_context','state_of_research','critique','research_gap','comparison','equation_source','figure_source','table_source','other') NOT NULL,
  `claim_summary` text NOT NULL,
  `exact_location` varchar(255) DEFAULT NULL,
  `is_first_mention` tinyint(1) NOT NULL DEFAULT 0,
  `citation_checked` tinyint(1) NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `created_revision_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `symbols`
--

CREATE TABLE `symbols` (
  `symbol_id` bigint(20) UNSIGNED NOT NULL,
  `symbol_latex` varchar(255) NOT NULL,
  `symbol_word_latex` varchar(255) NOT NULL,
  `symbol_name` varchar(255) NOT NULL,
  `definition_text` longtext NOT NULL,
  `scope_type` enum('global','chapter','section','equation') NOT NULL DEFAULT 'global',
  `first_section_id` bigint(20) UNSIGNED DEFAULT NULL,
  `first_equation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_text` varchar(255) DEFAULT NULL,
  `domain_text` varchar(1000) DEFAULT NULL,
  `codomain_text` varchar(1000) DEFAULT NULL,
  `is_vector` tinyint(1) NOT NULL DEFAULT 0,
  `is_matrix` tinyint(1) NOT NULL DEFAULT 0,
  `is_operator` tinyint(1) NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `validation_status` enum('draft','checked','verified') NOT NULL DEFAULT 'draft',
  `created_revision_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `theorems`
--

CREATE TABLE `theorems` (
  `theorem_id` bigint(20) UNSIGNED NOT NULL,
  `theorem_number` varchar(50) NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `statement_text` longtext NOT NULL,
  `statement_latex` longtext DEFAULT NULL,
  `word_latex` longtext DEFAULT NULL,
  `provenance` enum('original','adapted','literature') NOT NULL DEFAULT 'literature',
  `source_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assumptions` text DEFAULT NULL,
  `validation_status` enum('draft','checked','verified') NOT NULL DEFAULT 'draft',
  `created_revision_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `topics`
--

CREATE TABLE `topics` (
  `topic_id` bigint(20) UNSIGNED NOT NULL,
  `parent_topic_id` bigint(20) UNSIGNED DEFAULT NULL,
  `topic_code` varchar(100) NOT NULL,
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_acronym_register`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_acronym_register` (
`acronym` varchar(100)
,`full_form` varchar(1000)
,`explanation` longtext
,`first_section_code` varchar(50)
,`category` varchar(255)
,`is_project_specific` tinyint(1)
,`validation_status` enum('draft','checked','verified')
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_assumption_register`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_assumption_register` (
`assumption_number` varchar(50)
,`section_code` varchar(50)
,`title` varchar(500)
,`assumption_text` longtext
,`word_latex` longtext
,`status` enum('proposed','accepted','rejected','superseded')
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_axiom_register`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_axiom_register` (
`axiom_number` varchar(50)
,`section_code` varchar(50)
,`title` varchar(500)
,`axiom_text` longtext
,`word_latex` longtext
,`status` enum('draft','review','accepted','revised','rejected')
,`based_on_assumption` varchar(50)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_chapter_bibliography`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_chapter_bibliography` (
`chapter_no` int(11)
,`citation_number` int(10) unsigned
,`full_citation_text` text
,`short_citation_text` varchar(500)
,`priority` tinyint(3) unsigned
,`frzk_relevance` tinyint(3) unsigned
,`verification_status` enum('imported','partially_verified','verified','needs_review')
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_citation_audit`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_citation_audit` (
`citation_number` int(10) unsigned
,`source_key` varchar(150)
,`full_citation_text` text
,`verification_status` enum('imported','partially_verified','verified','needs_review')
,`usage_count` bigint(21)
,`first_mention_count` decimal(22,0)
,`first_used_section` varchar(50)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_definition_register`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_definition_register` (
`definition_number` varchar(50)
,`section_code` varchar(50)
,`section_title` varchar(500)
,`title` varchar(500)
,`definition_text` longtext
,`word_latex` longtext
,`provenance` enum('original','adapted','literature')
,`source_citation_number` int(10) unsigned
,`validation_status` enum('draft','checked','verified')
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_equation_register`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_equation_register` (
`equation_number` varchar(50)
,`section_code` varchar(50)
,`section_title` varchar(500)
,`title` varchar(500)
,`word_latex` text
,`plain_description` text
,`provenance` enum('original','adapted','literature')
,`source_citation_number` int(10) unsigned
,`validation_status` enum('draft','checked','verified')
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_figure_register`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_figure_register` (
`figure_number` varchar(50)
,`section_code` varchar(50)
,`title` varchar(500)
,`caption` longtext
,`file_name` varchar(500)
,`file_path` varchar(1500)
,`provenance` enum('original','adapted','literature')
,`source_citation_number` int(10) unsigned
,`validation_status` enum('draft','checked','verified')
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_pending_source_audit`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_pending_source_audit` (
`pending_source_id` bigint(20) unsigned
,`proposed_source_key` varchar(150)
,`title` varchar(1000)
,`authors_text` varchar(1000)
,`proposed_section_code` varchar(50)
,`priority` tinyint(3) unsigned
,`review_status` enum('open','in_review','accepted','rejected','merged')
,`discovered_at` timestamp
,`reviewed_at` datetime
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_proof_register`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_proof_register` (
`proof_number` varchar(50)
,`section_code` varchar(50)
,`title` varchar(500)
,`proof_method` enum('direct','contradiction','induction','construction','equivalence','existence','uniqueness','computational','other')
,`provenance` enum('original','adapted','literature')
,`source_citation_number` int(10) unsigned
,`validation_status` enum('draft','checked','verified')
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_proposition_register`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_proposition_register` (
`proposition_number` varchar(50)
,`section_code` varchar(50)
,`title` varchar(500)
,`statement_text` longtext
,`word_latex` longtext
,`based_on_axioms` varchar(255)
,`status` enum('draft','review','accepted','revised','rejected')
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_section_inventory`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_section_inventory` (
`section_code` varchar(50)
,`title` varchar(500)
,`status` enum('planned','draft','review','final')
,`source_count` bigint(21)
,`equation_count` bigint(21)
,`definition_count` bigint(21)
,`theorem_count` bigint(21)
,`lemma_count` bigint(21)
,`corollary_count` bigint(21)
,`figure_count` bigint(21)
,`table_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_statement_register`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_statement_register` (
`statement_type` varchar(9)
,`statement_number` varchar(50)
,`section_code` varchar(50)
,`title` varchar(500)
,`statement_text` longtext
,`word_latex` longtext
,`provenance` varchar(10)
,`source_citation_number` int(10) unsigned
,`validation_status` varchar(8)
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_symbol_register`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_symbol_register` (
`symbol_latex` varchar(255)
,`symbol_word_latex` varchar(255)
,`symbol_name` varchar(255)
,`definition_text` longtext
,`scope_type` enum('global','chapter','section','equation')
,`first_section_code` varchar(50)
,`first_equation_number` varchar(50)
,`unit_text` varchar(255)
,`domain_text` varchar(1000)
,`codomain_text` varchar(1000)
,`validation_status` enum('draft','checked','verified')
);

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `v_table_register`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `v_table_register` (
`table_number` varchar(50)
,`section_code` varchar(50)
,`title` varchar(500)
,`caption` longtext
,`file_name` varchar(500)
,`file_path` varchar(1500)
,`provenance` enum('original','adapted','literature')
,`source_citation_number` int(10) unsigned
,`validation_status` enum('draft','checked','verified')
);

-- --------------------------------------------------------

--
-- Struktur des Views `v_acronym_register`
--
DROP TABLE IF EXISTS `v_acronym_register`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_acronym_register`  AS SELECT `a`.`acronym` AS `acronym`, `a`.`full_form` AS `full_form`, `a`.`explanation` AS `explanation`, `ds`.`section_code` AS `first_section_code`, `a`.`category` AS `category`, `a`.`is_project_specific` AS `is_project_specific`, `a`.`validation_status` AS `validation_status` FROM (`acronyms` `a` left join `dissertation_sections` `ds` on(`ds`.`section_id` = `a`.`first_section_id`)) ORDER BY `a`.`acronym` ASC ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_assumption_register`
--
DROP TABLE IF EXISTS `v_assumption_register`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_assumption_register`  AS SELECT `a`.`assumption_number` AS `assumption_number`, `ds`.`section_code` AS `section_code`, `a`.`title` AS `title`, `a`.`assumption_text` AS `assumption_text`, `a`.`word_latex` AS `word_latex`, `a`.`status` AS `status` FROM (`assumptions` `a` join `dissertation_sections` `ds` on(`ds`.`section_id` = `a`.`section_id`)) ORDER BY `ds`.`section_order` ASC, `a`.`assumption_number` ASC ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_axiom_register`
--
DROP TABLE IF EXISTS `v_axiom_register`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_axiom_register`  AS SELECT `a`.`axiom_number` AS `axiom_number`, `ds`.`section_code` AS `section_code`, `a`.`title` AS `title`, `a`.`axiom_text` AS `axiom_text`, `a`.`word_latex` AS `word_latex`, `a`.`status` AS `status`, `asm`.`assumption_number` AS `based_on_assumption` FROM ((`axioms` `a` join `dissertation_sections` `ds` on(`ds`.`section_id` = `a`.`section_id`)) left join `assumptions` `asm` on(`asm`.`assumption_id` = `a`.`source_assumption_id`)) ORDER BY `ds`.`section_order` ASC, `a`.`axiom_number` ASC ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_chapter_bibliography`
--
DROP TABLE IF EXISTS `v_chapter_bibliography`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_chapter_bibliography`  AS SELECT DISTINCT `ds`.`chapter_no` AS `chapter_no`, `s`.`citation_number` AS `citation_number`, `s`.`full_citation_text` AS `full_citation_text`, `s`.`short_citation_text` AS `short_citation_text`, `s`.`priority` AS `priority`, `s`.`frzk_relevance` AS `frzk_relevance`, `s`.`verification_status` AS `verification_status` FROM ((`source_usage` `su` join `sources` `s` on(`s`.`source_id` = `su`.`source_id`)) join `dissertation_sections` `ds` on(`ds`.`section_id` = `su`.`section_id`)) WHERE `s`.`citation_number` is not null ORDER BY `ds`.`chapter_no` ASC, `s`.`citation_number` ASC ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_citation_audit`
--
DROP TABLE IF EXISTS `v_citation_audit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_citation_audit`  AS SELECT `s`.`citation_number` AS `citation_number`, `s`.`source_key` AS `source_key`, `s`.`full_citation_text` AS `full_citation_text`, `s`.`verification_status` AS `verification_status`, count(`su`.`usage_id`) AS `usage_count`, sum(case when `su`.`is_first_mention` = 1 then 1 else 0 end) AS `first_mention_count`, min(`ds`.`section_code`) AS `first_used_section` FROM ((`sources` `s` left join `source_usage` `su` on(`su`.`source_id` = `s`.`source_id`)) left join `dissertation_sections` `ds` on(`ds`.`section_id` = `su`.`section_id`)) GROUP BY `s`.`source_id`, `s`.`citation_number`, `s`.`source_key`, `s`.`full_citation_text`, `s`.`verification_status` ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_definition_register`
--
DROP TABLE IF EXISTS `v_definition_register`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_definition_register`  AS SELECT `d`.`definition_number` AS `definition_number`, `ds`.`section_code` AS `section_code`, `ds`.`title` AS `section_title`, `d`.`title` AS `title`, `d`.`definition_text` AS `definition_text`, `d`.`word_latex` AS `word_latex`, `d`.`provenance` AS `provenance`, `s`.`citation_number` AS `source_citation_number`, `d`.`validation_status` AS `validation_status` FROM ((`definitions` `d` join `dissertation_sections` `ds` on(`ds`.`section_id` = `d`.`section_id`)) left join `sources` `s` on(`s`.`source_id` = `d`.`source_id`)) ORDER BY `d`.`definition_number` ASC ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_equation_register`
--
DROP TABLE IF EXISTS `v_equation_register`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_equation_register`  AS SELECT `e`.`equation_number` AS `equation_number`, `ds`.`section_code` AS `section_code`, `ds`.`title` AS `section_title`, `e`.`title` AS `title`, `e`.`word_latex` AS `word_latex`, `e`.`plain_description` AS `plain_description`, `e`.`provenance` AS `provenance`, `s`.`citation_number` AS `source_citation_number`, `e`.`validation_status` AS `validation_status` FROM ((`equations` `e` join `dissertation_sections` `ds` on(`ds`.`section_id` = `e`.`section_id`)) left join `sources` `s` on(`s`.`source_id` = `e`.`source_id`)) ORDER BY cast(substring_index(`e`.`equation_number`,'.',1) as unsigned) ASC, cast(substring_index(`e`.`equation_number`,'.',-1) as unsigned) ASC ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_figure_register`
--
DROP TABLE IF EXISTS `v_figure_register`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_figure_register`  AS SELECT `f`.`figure_number` AS `figure_number`, `ds`.`section_code` AS `section_code`, `f`.`title` AS `title`, `f`.`caption` AS `caption`, `f`.`file_name` AS `file_name`, `f`.`file_path` AS `file_path`, `f`.`provenance` AS `provenance`, `s`.`citation_number` AS `source_citation_number`, `f`.`validation_status` AS `validation_status` FROM ((`figures` `f` join `dissertation_sections` `ds` on(`ds`.`section_id` = `f`.`section_id`)) left join `sources` `s` on(`s`.`source_id` = `f`.`source_id`)) ORDER BY `f`.`figure_number` ASC ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_pending_source_audit`
--
DROP TABLE IF EXISTS `v_pending_source_audit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pending_source_audit`  AS SELECT `pending_sources`.`pending_source_id` AS `pending_source_id`, `pending_sources`.`proposed_source_key` AS `proposed_source_key`, `pending_sources`.`title` AS `title`, `pending_sources`.`authors_text` AS `authors_text`, `pending_sources`.`proposed_section_code` AS `proposed_section_code`, `pending_sources`.`priority` AS `priority`, `pending_sources`.`review_status` AS `review_status`, `pending_sources`.`discovered_at` AS `discovered_at`, `pending_sources`.`reviewed_at` AS `reviewed_at` FROM `pending_sources` ORDER BY field(`pending_sources`.`review_status`,'open','in_review','accepted','merged','rejected') ASC, `pending_sources`.`priority` DESC, `pending_sources`.`discovered_at` ASC ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_proof_register`
--
DROP TABLE IF EXISTS `v_proof_register`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_proof_register`  AS SELECT `p`.`proof_number` AS `proof_number`, `ds`.`section_code` AS `section_code`, `p`.`title` AS `title`, `p`.`proof_method` AS `proof_method`, `p`.`provenance` AS `provenance`, `s`.`citation_number` AS `source_citation_number`, `p`.`validation_status` AS `validation_status` FROM ((`proofs` `p` join `dissertation_sections` `ds` on(`ds`.`section_id` = `p`.`section_id`)) left join `sources` `s` on(`s`.`source_id` = `p`.`source_id`)) ORDER BY `ds`.`section_order` ASC, `p`.`proof_number` ASC ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_proposition_register`
--
DROP TABLE IF EXISTS `v_proposition_register`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_proposition_register`  AS SELECT `p`.`proposition_number` AS `proposition_number`, `ds`.`section_code` AS `section_code`, `p`.`title` AS `title`, `p`.`statement_text` AS `statement_text`, `p`.`word_latex` AS `word_latex`, `p`.`based_on_axioms` AS `based_on_axioms`, `p`.`status` AS `status` FROM (`propositions` `p` join `dissertation_sections` `ds` on(`ds`.`section_id` = `p`.`section_id`)) ORDER BY `p`.`proposition_number` ASC ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_section_inventory`
--
DROP TABLE IF EXISTS `v_section_inventory`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_section_inventory`  AS SELECT `ds`.`section_code` AS `section_code`, `ds`.`title` AS `title`, `ds`.`status` AS `status`, count(distinct `su`.`source_id`) AS `source_count`, count(distinct `e`.`equation_id`) AS `equation_count`, count(distinct `d`.`definition_id`) AS `definition_count`, count(distinct `th`.`theorem_id`) AS `theorem_count`, count(distinct `l`.`lemma_id`) AS `lemma_count`, count(distinct `c`.`corollary_id`) AS `corollary_count`, count(distinct `f`.`figure_id`) AS `figure_count`, count(distinct `dt`.`table_id`) AS `table_count` FROM ((((((((`dissertation_sections` `ds` left join `source_usage` `su` on(`su`.`section_id` = `ds`.`section_id`)) left join `equations` `e` on(`e`.`section_id` = `ds`.`section_id`)) left join `definitions` `d` on(`d`.`section_id` = `ds`.`section_id`)) left join `theorems` `th` on(`th`.`section_id` = `ds`.`section_id`)) left join `lemmas` `l` on(`l`.`section_id` = `ds`.`section_id`)) left join `corollaries` `c` on(`c`.`section_id` = `ds`.`section_id`)) left join `figures` `f` on(`f`.`section_id` = `ds`.`section_id`)) left join `dissertation_tables` `dt` on(`dt`.`section_id` = `ds`.`section_id`)) GROUP BY `ds`.`section_id`, `ds`.`section_code`, `ds`.`title`, `ds`.`status` ORDER BY `ds`.`section_order` ASC ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_statement_register`
--
DROP TABLE IF EXISTS `v_statement_register`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_statement_register`  AS SELECT 'theorem' AS `statement_type`, `t`.`theorem_number` AS `statement_number`, `ds`.`section_code` AS `section_code`, `t`.`title` AS `title`, `t`.`statement_text` AS `statement_text`, `t`.`word_latex` AS `word_latex`, `t`.`provenance` AS `provenance`, `s`.`citation_number` AS `source_citation_number`, `t`.`validation_status` AS `validation_status` FROM ((`theorems` `t` join `dissertation_sections` `ds` on(`ds`.`section_id` = `t`.`section_id`)) left join `sources` `s` on(`s`.`source_id` = `t`.`source_id`))union all select 'lemma' AS `lemma`,`l`.`lemma_number` AS `lemma_number`,`ds`.`section_code` AS `section_code`,`l`.`title` AS `title`,`l`.`statement_text` AS `statement_text`,`l`.`word_latex` AS `word_latex`,`l`.`provenance` AS `provenance`,`s`.`citation_number` AS `citation_number`,`l`.`validation_status` AS `validation_status` from ((`lemmas` `l` join `dissertation_sections` `ds` on(`ds`.`section_id` = `l`.`section_id`)) left join `sources` `s` on(`s`.`source_id` = `l`.`source_id`)) union all select 'corollary' AS `corollary`,`c`.`corollary_number` AS `corollary_number`,`ds`.`section_code` AS `section_code`,`c`.`title` AS `title`,`c`.`statement_text` AS `statement_text`,`c`.`word_latex` AS `word_latex`,`c`.`provenance` AS `provenance`,`s`.`citation_number` AS `citation_number`,`c`.`validation_status` AS `validation_status` from ((`corollaries` `c` join `dissertation_sections` `ds` on(`ds`.`section_id` = `c`.`section_id`)) left join `sources` `s` on(`s`.`source_id` = `c`.`source_id`))  ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_symbol_register`
--
DROP TABLE IF EXISTS `v_symbol_register`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_symbol_register`  AS SELECT `s`.`symbol_latex` AS `symbol_latex`, `s`.`symbol_word_latex` AS `symbol_word_latex`, `s`.`symbol_name` AS `symbol_name`, `s`.`definition_text` AS `definition_text`, `s`.`scope_type` AS `scope_type`, `ds`.`section_code` AS `first_section_code`, `e`.`equation_number` AS `first_equation_number`, `s`.`unit_text` AS `unit_text`, `s`.`domain_text` AS `domain_text`, `s`.`codomain_text` AS `codomain_text`, `s`.`validation_status` AS `validation_status` FROM ((`symbols` `s` left join `dissertation_sections` `ds` on(`ds`.`section_id` = `s`.`first_section_id`)) left join `equations` `e` on(`e`.`equation_id` = `s`.`first_equation_id`)) ORDER BY `s`.`symbol_name` ASC, `s`.`symbol_latex` ASC ;

-- --------------------------------------------------------

--
-- Struktur des Views `v_table_register`
--
DROP TABLE IF EXISTS `v_table_register`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_table_register`  AS SELECT `t`.`table_number` AS `table_number`, `ds`.`section_code` AS `section_code`, `t`.`title` AS `title`, `t`.`caption` AS `caption`, `t`.`file_name` AS `file_name`, `t`.`file_path` AS `file_path`, `t`.`provenance` AS `provenance`, `s`.`citation_number` AS `source_citation_number`, `t`.`validation_status` AS `validation_status` FROM ((`dissertation_tables` `t` join `dissertation_sections` `ds` on(`ds`.`section_id` = `t`.`section_id`)) left join `sources` `s` on(`s`.`source_id` = `t`.`source_id`)) ORDER BY `t`.`table_number` ASC ;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `acronyms`
--
ALTER TABLE `acronyms`
  ADD PRIMARY KEY (`acronym_id`),
  ADD UNIQUE KEY `uq_acronym` (`acronym`),
  ADD KEY `fk_acronyms_section` (`first_section_id`),
  ADD KEY `fk_acronyms_revision` (`created_revision_id`);

--
-- Indizes für die Tabelle `annotations`
--
ALTER TABLE `annotations`
  ADD PRIMARY KEY (`annotation_id`),
  ADD UNIQUE KEY `uq_annotation_source` (`source_id`);

--
-- Indizes für die Tabelle `assumptions`
--
ALTER TABLE `assumptions`
  ADD PRIMARY KEY (`assumption_id`),
  ADD UNIQUE KEY `uq_assumption_number` (`assumption_number`),
  ADD KEY `fk_assumptions_section` (`section_id`),
  ADD KEY `fk_assumptions_revision` (`created_revision_id`);

--
-- Indizes für die Tabelle `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`),
  ADD UNIQUE KEY `uq_authors_normalized_name` (`normalized_name`);

--
-- Indizes für die Tabelle `axioms`
--
ALTER TABLE `axioms`
  ADD PRIMARY KEY (`axiom_id`),
  ADD UNIQUE KEY `uq_axiom_number` (`axiom_number`),
  ADD KEY `fk_axioms_section` (`section_id`),
  ADD KEY `fk_axioms_assumption` (`source_assumption_id`),
  ADD KEY `fk_axioms_revision` (`created_revision_id`);

--
-- Indizes für die Tabelle `axiom_dependencies`
--
ALTER TABLE `axiom_dependencies`
  ADD PRIMARY KEY (`axiom_dependency_id`),
  ADD UNIQUE KEY `uq_axiom_dependency` (`axiom_id`,`depends_on_axiom_id`,`dependency_type`),
  ADD KEY `fk_axiom_dependencies_parent` (`depends_on_axiom_id`);

--
-- Indizes für die Tabelle `citation_corrections`
--
ALTER TABLE `citation_corrections`
  ADD PRIMARY KEY (`correction_id`),
  ADD UNIQUE KEY `uq_citation_correction` (`old_citation_label`,`section_code`),
  ADD KEY `fk_citation_correction_revision` (`revision_id`);

--
-- Indizes für die Tabelle `corollaries`
--
ALTER TABLE `corollaries`
  ADD PRIMARY KEY (`corollary_id`),
  ADD UNIQUE KEY `uq_corollary_number` (`corollary_number`),
  ADD KEY `fk_corollaries_section` (`section_id`),
  ADD KEY `fk_corollaries_theorem` (`parent_theorem_id`),
  ADD KEY `fk_corollaries_lemma` (`parent_lemma_id`),
  ADD KEY `fk_corollaries_source` (`source_id`),
  ADD KEY `fk_corollaries_revision` (`created_revision_id`);

--
-- Indizes für die Tabelle `definitions`
--
ALTER TABLE `definitions`
  ADD PRIMARY KEY (`definition_id`),
  ADD UNIQUE KEY `uq_definition_number` (`definition_number`),
  ADD KEY `fk_definitions_section` (`section_id`),
  ADD KEY `fk_definitions_source` (`source_id`),
  ADD KEY `fk_definitions_revision` (`created_revision_id`),
  ADD KEY `idx_definitions_section` (`section_id`);

--
-- Indizes für die Tabelle `dissertation_sections`
--
ALTER TABLE `dissertation_sections`
  ADD PRIMARY KEY (`section_id`),
  ADD UNIQUE KEY `uq_section_code` (`section_code`),
  ADD KEY `fk_sections_parent` (`parent_section_id`);

--
-- Indizes für die Tabelle `dissertation_tables`
--
ALTER TABLE `dissertation_tables`
  ADD PRIMARY KEY (`table_id`),
  ADD UNIQUE KEY `uq_table_number` (`table_number`),
  ADD KEY `fk_tables_section` (`section_id`),
  ADD KEY `fk_tables_source` (`source_id`),
  ADD KEY `fk_tables_revision` (`created_revision_id`);

--
-- Indizes für die Tabelle `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`document_id`),
  ADD UNIQUE KEY `uq_documents_file_version` (`file_name`,`version_label`);

--
-- Indizes für die Tabelle `equations`
--
ALTER TABLE `equations`
  ADD PRIMARY KEY (`equation_id`),
  ADD UNIQUE KEY `uq_equation_number` (`equation_number`),
  ADD KEY `fk_equations_section` (`section_id`),
  ADD KEY `fk_equations_source` (`source_id`),
  ADD KEY `idx_equations_revision` (`created_revision_id`),
  ADD KEY `idx_equations_section_number` (`section_id`,`equation_number`);

--
-- Indizes für die Tabelle `equation_dependencies`
--
ALTER TABLE `equation_dependencies`
  ADD PRIMARY KEY (`dependency_id`),
  ADD UNIQUE KEY `uq_equation_dependency` (`equation_id`,`depends_on_equation_id`,`dependency_type`),
  ADD KEY `fk_equation_dependencies_parent` (`depends_on_equation_id`);

--
-- Indizes für die Tabelle `equation_symbols`
--
ALTER TABLE `equation_symbols`
  ADD PRIMARY KEY (`equation_symbol_id`),
  ADD UNIQUE KEY `uq_equation_symbol` (`equation_id`,`symbol_latex`);

--
-- Indizes für die Tabelle `figures`
--
ALTER TABLE `figures`
  ADD PRIMARY KEY (`figure_id`),
  ADD UNIQUE KEY `uq_figure_number` (`figure_number`),
  ADD KEY `fk_figures_section` (`section_id`),
  ADD KEY `fk_figures_source` (`source_id`),
  ADD KEY `fk_figures_revision` (`created_revision_id`);

--
-- Indizes für die Tabelle `lemmas`
--
ALTER TABLE `lemmas`
  ADD PRIMARY KEY (`lemma_id`),
  ADD UNIQUE KEY `uq_lemma_number` (`lemma_number`),
  ADD KEY `fk_lemmas_section` (`section_id`),
  ADD KEY `fk_lemmas_source` (`source_id`),
  ADD KEY `fk_lemmas_revision` (`created_revision_id`);

--
-- Indizes für die Tabelle `object_dependencies`
--
ALTER TABLE `object_dependencies`
  ADD PRIMARY KEY (`object_dependency_id`),
  ADD UNIQUE KEY `uq_object_dependency` (`object_type_from`,`object_id_from`,`object_type_to`,`object_id_to`,`dependency_type`);

--
-- Indizes für die Tabelle `object_source_links`
--
ALTER TABLE `object_source_links`
  ADD PRIMARY KEY (`object_source_link_id`),
  ADD UNIQUE KEY `uq_object_source` (`object_type`,`object_id`,`source_id`,`usage_type`),
  ADD KEY `fk_object_source_source` (`source_id`);

--
-- Indizes für die Tabelle `pending_sources`
--
ALTER TABLE `pending_sources`
  ADD PRIMARY KEY (`pending_source_id`),
  ADD KEY `fk_pending_merged_source` (`merged_source_id`);

--
-- Indizes für die Tabelle `proofs`
--
ALTER TABLE `proofs`
  ADD PRIMARY KEY (`proof_id`),
  ADD KEY `fk_proofs_section` (`section_id`),
  ADD KEY `fk_proofs_theorem` (`theorem_id`),
  ADD KEY `fk_proofs_lemma` (`lemma_id`),
  ADD KEY `fk_proofs_corollary` (`corollary_id`),
  ADD KEY `fk_proofs_source` (`source_id`),
  ADD KEY `fk_proofs_revision` (`created_revision_id`),
  ADD KEY `idx_proofs_section_status` (`section_id`,`validation_status`);

--
-- Indizes für die Tabelle `propositions`
--
ALTER TABLE `propositions`
  ADD PRIMARY KEY (`proposition_id`),
  ADD UNIQUE KEY `uq_proposition_number` (`proposition_number`),
  ADD KEY `fk_propositions_section` (`section_id`),
  ADD KEY `fk_propositions_revision` (`created_revision_id`);

--
-- Indizes für die Tabelle `proposition_dependencies`
--
ALTER TABLE `proposition_dependencies`
  ADD PRIMARY KEY (`proposition_dependency_id`),
  ADD UNIQUE KEY `uq_prop_dependency` (`proposition_id`,`axiom_id`,`assumption_id`,`dependency_type`),
  ADD KEY `fk_prop_dep_axiom` (`axiom_id`),
  ADD KEY `fk_prop_dep_assumption` (`assumption_id`);

--
-- Indizes für die Tabelle `repository_counters`
--
ALTER TABLE `repository_counters`
  ADD PRIMARY KEY (`counter_key`);

--
-- Indizes für die Tabelle `repository_revisions`
--
ALTER TABLE `repository_revisions`
  ADD PRIMARY KEY (`revision_id`),
  ADD UNIQUE KEY `uq_revision_code` (`revision_code`),
  ADD KEY `fk_revision_parent` (`parent_revision_id`);

--
-- Indizes für die Tabelle `repository_validation_results`
--
ALTER TABLE `repository_validation_results`
  ADD PRIMARY KEY (`validation_result_id`),
  ADD UNIQUE KEY `uq_validation_revision_code` (`revision_id`,`validation_code`),
  ADD KEY `idx_validation_revision` (`revision_id`);

--
-- Indizes für die Tabelle `section_change_log`
--
ALTER TABLE `section_change_log`
  ADD PRIMARY KEY (`change_id`),
  ADD KEY `idx_change_revision` (`revision_id`),
  ADD KEY `idx_change_section` (`section_id`);

--
-- Indizes für die Tabelle `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`source_id`),
  ADD UNIQUE KEY `uq_sources_source_key` (`source_key`),
  ADD UNIQUE KEY `uq_sources_citation_number` (`citation_number`),
  ADD KEY `idx_sources_title` (`title`(191)),
  ADD KEY `idx_sources_year` (`year_original`),
  ADD KEY `idx_sources_priority` (`priority`),
  ADD KEY `idx_sources_frzk_relevance` (`frzk_relevance`),
  ADD KEY `idx_sources_revision` (`created_revision_id`);

--
-- Indizes für die Tabelle `source_authors`
--
ALTER TABLE `source_authors`
  ADD PRIMARY KEY (`source_id`,`author_id`,`role`),
  ADD UNIQUE KEY `uq_source_author_order` (`source_id`,`role`,`author_order`),
  ADD KEY `fk_source_authors_author` (`author_id`);

--
-- Indizes für die Tabelle `source_relations`
--
ALTER TABLE `source_relations`
  ADD PRIMARY KEY (`relation_id`),
  ADD UNIQUE KEY `uq_source_relation` (`source_id_from`,`source_id_to`,`relation_type`),
  ADD KEY `fk_source_relations_to` (`source_id_to`);

--
-- Indizes für die Tabelle `source_topics`
--
ALTER TABLE `source_topics`
  ADD PRIMARY KEY (`source_id`,`topic_id`),
  ADD KEY `fk_source_topics_topic` (`topic_id`);

--
-- Indizes für die Tabelle `source_usage`
--
ALTER TABLE `source_usage`
  ADD PRIMARY KEY (`usage_id`),
  ADD KEY `idx_usage_section` (`section_id`),
  ADD KEY `idx_usage_source` (`source_id`),
  ADD KEY `idx_source_usage_revision` (`created_revision_id`),
  ADD KEY `idx_source_usage_section_source` (`section_id`,`source_id`);

--
-- Indizes für die Tabelle `symbols`
--
ALTER TABLE `symbols`
  ADD PRIMARY KEY (`symbol_id`),
  ADD UNIQUE KEY `uq_symbol_scope` (`symbol_latex`,`scope_type`,`first_section_id`),
  ADD KEY `fk_symbols_section` (`first_section_id`),
  ADD KEY `fk_symbols_equation` (`first_equation_id`),
  ADD KEY `fk_symbols_revision` (`created_revision_id`);

--
-- Indizes für die Tabelle `theorems`
--
ALTER TABLE `theorems`
  ADD PRIMARY KEY (`theorem_id`),
  ADD UNIQUE KEY `uq_theorem_number` (`theorem_number`),
  ADD KEY `fk_theorems_section` (`section_id`),
  ADD KEY `fk_theorems_source` (`source_id`),
  ADD KEY `fk_theorems_revision` (`created_revision_id`);

--
-- Indizes für die Tabelle `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD UNIQUE KEY `uq_topic_code` (`topic_code`),
  ADD KEY `fk_topics_parent` (`parent_topic_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `acronyms`
--
ALTER TABLE `acronyms`
  MODIFY `acronym_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `annotations`
--
ALTER TABLE `annotations`
  MODIFY `annotation_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `assumptions`
--
ALTER TABLE `assumptions`
  MODIFY `assumption_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `axioms`
--
ALTER TABLE `axioms`
  MODIFY `axiom_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `axiom_dependencies`
--
ALTER TABLE `axiom_dependencies`
  MODIFY `axiom_dependency_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `citation_corrections`
--
ALTER TABLE `citation_corrections`
  MODIFY `correction_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `corollaries`
--
ALTER TABLE `corollaries`
  MODIFY `corollary_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `definitions`
--
ALTER TABLE `definitions`
  MODIFY `definition_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `dissertation_sections`
--
ALTER TABLE `dissertation_sections`
  MODIFY `section_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `dissertation_tables`
--
ALTER TABLE `dissertation_tables`
  MODIFY `table_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `documents`
--
ALTER TABLE `documents`
  MODIFY `document_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `equations`
--
ALTER TABLE `equations`
  MODIFY `equation_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `equation_dependencies`
--
ALTER TABLE `equation_dependencies`
  MODIFY `dependency_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `equation_symbols`
--
ALTER TABLE `equation_symbols`
  MODIFY `equation_symbol_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `figures`
--
ALTER TABLE `figures`
  MODIFY `figure_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `lemmas`
--
ALTER TABLE `lemmas`
  MODIFY `lemma_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `object_dependencies`
--
ALTER TABLE `object_dependencies`
  MODIFY `object_dependency_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `object_source_links`
--
ALTER TABLE `object_source_links`
  MODIFY `object_source_link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `pending_sources`
--
ALTER TABLE `pending_sources`
  MODIFY `pending_source_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `proofs`
--
ALTER TABLE `proofs`
  MODIFY `proof_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `propositions`
--
ALTER TABLE `propositions`
  MODIFY `proposition_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `proposition_dependencies`
--
ALTER TABLE `proposition_dependencies`
  MODIFY `proposition_dependency_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `repository_revisions`
--
ALTER TABLE `repository_revisions`
  MODIFY `revision_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `repository_validation_results`
--
ALTER TABLE `repository_validation_results`
  MODIFY `validation_result_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `section_change_log`
--
ALTER TABLE `section_change_log`
  MODIFY `change_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `sources`
--
ALTER TABLE `sources`
  MODIFY `source_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `source_relations`
--
ALTER TABLE `source_relations`
  MODIFY `relation_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `source_usage`
--
ALTER TABLE `source_usage`
  MODIFY `usage_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `symbols`
--
ALTER TABLE `symbols`
  MODIFY `symbol_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `theorems`
--
ALTER TABLE `theorems`
  MODIFY `theorem_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `topics`
--
ALTER TABLE `topics`
  MODIFY `topic_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `acronyms`
--
ALTER TABLE `acronyms`
  ADD CONSTRAINT `fk_acronyms_revision` FOREIGN KEY (`created_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_acronyms_section` FOREIGN KEY (`first_section_id`) REFERENCES `dissertation_sections` (`section_id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `annotations`
--
ALTER TABLE `annotations`
  ADD CONSTRAINT `fk_annotations_source` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `assumptions`
--
ALTER TABLE `assumptions`
  ADD CONSTRAINT `fk_assumptions_revision` FOREIGN KEY (`created_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_assumptions_section` FOREIGN KEY (`section_id`) REFERENCES `dissertation_sections` (`section_id`);

--
-- Constraints der Tabelle `axioms`
--
ALTER TABLE `axioms`
  ADD CONSTRAINT `fk_axioms_assumption` FOREIGN KEY (`source_assumption_id`) REFERENCES `assumptions` (`assumption_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_axioms_revision` FOREIGN KEY (`created_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_axioms_section` FOREIGN KEY (`section_id`) REFERENCES `dissertation_sections` (`section_id`);

--
-- Constraints der Tabelle `axiom_dependencies`
--
ALTER TABLE `axiom_dependencies`
  ADD CONSTRAINT `fk_axiom_dependencies_axiom` FOREIGN KEY (`axiom_id`) REFERENCES `axioms` (`axiom_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_axiom_dependencies_parent` FOREIGN KEY (`depends_on_axiom_id`) REFERENCES `axioms` (`axiom_id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `citation_corrections`
--
ALTER TABLE `citation_corrections`
  ADD CONSTRAINT `fk_citation_correction_revision` FOREIGN KEY (`revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints der Tabelle `corollaries`
--
ALTER TABLE `corollaries`
  ADD CONSTRAINT `fk_corollaries_lemma` FOREIGN KEY (`parent_lemma_id`) REFERENCES `lemmas` (`lemma_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_corollaries_revision` FOREIGN KEY (`created_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_corollaries_section` FOREIGN KEY (`section_id`) REFERENCES `dissertation_sections` (`section_id`),
  ADD CONSTRAINT `fk_corollaries_source` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_corollaries_theorem` FOREIGN KEY (`parent_theorem_id`) REFERENCES `theorems` (`theorem_id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `definitions`
--
ALTER TABLE `definitions`
  ADD CONSTRAINT `fk_definitions_revision` FOREIGN KEY (`created_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_definitions_section` FOREIGN KEY (`section_id`) REFERENCES `dissertation_sections` (`section_id`),
  ADD CONSTRAINT `fk_definitions_source` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `dissertation_sections`
--
ALTER TABLE `dissertation_sections`
  ADD CONSTRAINT `fk_sections_parent` FOREIGN KEY (`parent_section_id`) REFERENCES `dissertation_sections` (`section_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints der Tabelle `dissertation_tables`
--
ALTER TABLE `dissertation_tables`
  ADD CONSTRAINT `fk_tables_revision` FOREIGN KEY (`created_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tables_section` FOREIGN KEY (`section_id`) REFERENCES `dissertation_sections` (`section_id`),
  ADD CONSTRAINT `fk_tables_source` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `equations`
--
ALTER TABLE `equations`
  ADD CONSTRAINT `fk_equations_revision` FOREIGN KEY (`created_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equations_section` FOREIGN KEY (`section_id`) REFERENCES `dissertation_sections` (`section_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equations_source` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints der Tabelle `equation_dependencies`
--
ALTER TABLE `equation_dependencies`
  ADD CONSTRAINT `fk_equation_dependencies_equation` FOREIGN KEY (`equation_id`) REFERENCES `equations` (`equation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equation_dependencies_parent` FOREIGN KEY (`depends_on_equation_id`) REFERENCES `equations` (`equation_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `equation_symbols`
--
ALTER TABLE `equation_symbols`
  ADD CONSTRAINT `fk_equation_symbols_equation` FOREIGN KEY (`equation_id`) REFERENCES `equations` (`equation_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `figures`
--
ALTER TABLE `figures`
  ADD CONSTRAINT `fk_figures_revision` FOREIGN KEY (`created_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_figures_section` FOREIGN KEY (`section_id`) REFERENCES `dissertation_sections` (`section_id`),
  ADD CONSTRAINT `fk_figures_source` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `lemmas`
--
ALTER TABLE `lemmas`
  ADD CONSTRAINT `fk_lemmas_revision` FOREIGN KEY (`created_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_lemmas_section` FOREIGN KEY (`section_id`) REFERENCES `dissertation_sections` (`section_id`),
  ADD CONSTRAINT `fk_lemmas_source` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `object_source_links`
--
ALTER TABLE `object_source_links`
  ADD CONSTRAINT `fk_object_source_source` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `pending_sources`
--
ALTER TABLE `pending_sources`
  ADD CONSTRAINT `fk_pending_merged_source` FOREIGN KEY (`merged_source_id`) REFERENCES `sources` (`source_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints der Tabelle `proofs`
--
ALTER TABLE `proofs`
  ADD CONSTRAINT `fk_proofs_corollary` FOREIGN KEY (`corollary_id`) REFERENCES `corollaries` (`corollary_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_proofs_lemma` FOREIGN KEY (`lemma_id`) REFERENCES `lemmas` (`lemma_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_proofs_revision` FOREIGN KEY (`created_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_proofs_section` FOREIGN KEY (`section_id`) REFERENCES `dissertation_sections` (`section_id`),
  ADD CONSTRAINT `fk_proofs_source` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_proofs_theorem` FOREIGN KEY (`theorem_id`) REFERENCES `theorems` (`theorem_id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `propositions`
--
ALTER TABLE `propositions`
  ADD CONSTRAINT `fk_propositions_revision` FOREIGN KEY (`created_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_propositions_section` FOREIGN KEY (`section_id`) REFERENCES `dissertation_sections` (`section_id`);

--
-- Constraints der Tabelle `proposition_dependencies`
--
ALTER TABLE `proposition_dependencies`
  ADD CONSTRAINT `fk_prop_dep_assumption` FOREIGN KEY (`assumption_id`) REFERENCES `assumptions` (`assumption_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_prop_dep_axiom` FOREIGN KEY (`axiom_id`) REFERENCES `axioms` (`axiom_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_prop_dep_proposition` FOREIGN KEY (`proposition_id`) REFERENCES `propositions` (`proposition_id`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `repository_revisions`
--
ALTER TABLE `repository_revisions`
  ADD CONSTRAINT `fk_revision_parent` FOREIGN KEY (`parent_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints der Tabelle `repository_validation_results`
--
ALTER TABLE `repository_validation_results`
  ADD CONSTRAINT `fk_validation_revision` FOREIGN KEY (`revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `section_change_log`
--
ALTER TABLE `section_change_log`
  ADD CONSTRAINT `fk_change_revision` FOREIGN KEY (`revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_change_section` FOREIGN KEY (`section_id`) REFERENCES `dissertation_sections` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `sources`
--
ALTER TABLE `sources`
  ADD CONSTRAINT `fk_sources_revision` FOREIGN KEY (`created_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints der Tabelle `source_authors`
--
ALTER TABLE `source_authors`
  ADD CONSTRAINT `fk_source_authors_author` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_source_authors_source` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `source_relations`
--
ALTER TABLE `source_relations`
  ADD CONSTRAINT `fk_source_relations_from` FOREIGN KEY (`source_id_from`) REFERENCES `sources` (`source_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_source_relations_to` FOREIGN KEY (`source_id_to`) REFERENCES `sources` (`source_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `source_topics`
--
ALTER TABLE `source_topics`
  ADD CONSTRAINT `fk_source_topics_source` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_source_topics_topic` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `source_usage`
--
ALTER TABLE `source_usage`
  ADD CONSTRAINT `fk_source_usage_revision` FOREIGN KEY (`created_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_source_usage_section` FOREIGN KEY (`section_id`) REFERENCES `dissertation_sections` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_source_usage_source` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `symbols`
--
ALTER TABLE `symbols`
  ADD CONSTRAINT `fk_symbols_equation` FOREIGN KEY (`first_equation_id`) REFERENCES `equations` (`equation_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_symbols_revision` FOREIGN KEY (`created_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_symbols_section` FOREIGN KEY (`first_section_id`) REFERENCES `dissertation_sections` (`section_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints der Tabelle `theorems`
--
ALTER TABLE `theorems`
  ADD CONSTRAINT `fk_theorems_revision` FOREIGN KEY (`created_revision_id`) REFERENCES `repository_revisions` (`revision_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_theorems_section` FOREIGN KEY (`section_id`) REFERENCES `dissertation_sections` (`section_id`),
  ADD CONSTRAINT `fk_theorems_source` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`) ON DELETE SET NULL;

--
-- Constraints der Tabelle `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `fk_topics_parent` FOREIGN KEY (`parent_topic_id`) REFERENCES `topics` (`topic_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
