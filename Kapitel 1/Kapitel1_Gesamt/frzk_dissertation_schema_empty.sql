-- ============================================================================
-- FRZK Dissertation – leeres, normalisiertes Datenbankschema
-- Zielsystem: MySQL 8.x / MariaDB 10.6+
-- Zeichensatz: utf8mb4
-- Stand: 2026-10-24
--
-- Enthaltene Bereiche:
--   * Dissertation / Kapitel / Abschnitte / Absätze
--   * Revisionen
--   * Forschungsobjekt-Register
--   * Gleichungen + Gleichungsbestandteile
--   * formale Aussagen: Definition, Axiom, Annahme, Lemma, Proposition,
--     Satz, Korollar, Interpretation, Vermutung, offenes Problem
--   * Beweise + Beweisschritte
--   * Beweis-/Objektabhängigkeiten
--   * Claims / wissenschaftliche Behauptungen
--   * Beispiele, Gegenbeispiele, Modellkonstruktionen
--   * Abbildungen + Assets + Abbildungsbeschreibungen + Provenienz/Rechte
--   * Tabellen
--   * Literaturquellen + Autoren + Zitierverwendungen + Originalstellenprüfung
--   * Symbole / Notation / Operatoren
--   * Gültigkeitsbedingungen / Annahmen
--   * Prüfungen / Freigaben / offene Punkte
--   * Tags
--
-- WICHTIG: Dieses Skript legt ausschließlich Struktur an. Es enthält KEINE
-- Dissertationstexte und KEINE INSERT-Datensätze.
-- ============================================================================

CREATE DATABASE IF NOT EXISTS `frzk_dissertation`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE `frzk_dissertation`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ---------------------------------------------------------------------------
-- 1. Projekt- und Dokumentstruktur
-- ---------------------------------------------------------------------------

CREATE TABLE `dissertations` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `project_code` VARCHAR(64) NULL,
    `title` VARCHAR(512) NOT NULL,
    `subtitle` VARCHAR(512) NULL,
    `author_name` VARCHAR(255) NULL,
    `institution` VARCHAR(255) NULL,
    `language_code` VARCHAR(16) NOT NULL DEFAULT 'de',
    `status` ENUM('DRAFT','REVIEW','FINAL','ARCHIVED') NOT NULL DEFAULT 'DRAFT',
    `notes` LONGTEXT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_dissertations_project_code` (`project_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `revisions` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `dissertation_id` BIGINT UNSIGNED NOT NULL,
    `revision_code` VARCHAR(128) NOT NULL,
    `title` VARCHAR(512) NULL,
    `revision_type` ENUM('IMPORT','DRAFT','EDIT','REVIEW','RELEASE','FINAL','OTHER') NOT NULL DEFAULT 'DRAFT',
    `parent_revision_id` BIGINT UNSIGNED NULL,
    `source_filename` VARCHAR(1024) NULL,
    `content_sha256` CHAR(64) NULL,
    `status` ENUM('OPEN','PASS','FAIL','SUPERSEDED','FINAL') NOT NULL DEFAULT 'OPEN',
    `notes` LONGTEXT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_revisions_code` (`dissertation_id`,`revision_code`),
    KEY `idx_revisions_parent` (`parent_revision_id`),
    CONSTRAINT `fk_revisions_dissertation`
        FOREIGN KEY (`dissertation_id`) REFERENCES `dissertations` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_revisions_parent`
        FOREIGN KEY (`parent_revision_id`) REFERENCES `revisions` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `chapters` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `dissertation_id` BIGINT UNSIGNED NOT NULL,
    `chapter_number` VARCHAR(32) NOT NULL,
    `title` VARCHAR(512) NOT NULL,
    `sort_order` INT NOT NULL DEFAULT 0,
    `status` ENUM('PLANNED','DRAFT','REVIEW','PASS','FINAL','RELEASED') NOT NULL DEFAULT 'DRAFT',
    `current_revision_id` BIGINT UNSIGNED NULL,
    `body_text` LONGTEXT NULL,
    `notes` LONGTEXT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_chapters_number` (`dissertation_id`,`chapter_number`),
    KEY `idx_chapters_revision` (`current_revision_id`),
    CONSTRAINT `fk_chapters_dissertation`
        FOREIGN KEY (`dissertation_id`) REFERENCES `dissertations` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_chapters_revision`
        FOREIGN KEY (`current_revision_id`) REFERENCES `revisions` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sections` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `chapter_id` BIGINT UNSIGNED NOT NULL,
    `parent_section_id` BIGINT UNSIGNED NULL,
    `section_number` VARCHAR(64) NOT NULL,
    `title` VARCHAR(512) NOT NULL,
    `level_no` TINYINT UNSIGNED NOT NULL DEFAULT 1,
    `sort_order` INT NOT NULL DEFAULT 0,
    `body_text` LONGTEXT NULL,
    `scientific_status` VARCHAR(255) NULL,
    `status` ENUM('PLANNED','DRAFT','REVIEW','PASS','FINAL','RELEASED') NOT NULL DEFAULT 'DRAFT',
    `current_revision_id` BIGINT UNSIGNED NULL,
    `content_sha256` CHAR(64) NULL,
    `notes` LONGTEXT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_sections_number` (`chapter_id`,`section_number`),
    KEY `idx_sections_parent` (`parent_section_id`),
    KEY `idx_sections_revision` (`current_revision_id`),
    CONSTRAINT `fk_sections_chapter`
        FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_sections_parent`
        FOREIGN KEY (`parent_section_id`) REFERENCES `sections` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_sections_revision`
        FOREIGN KEY (`current_revision_id`) REFERENCES `revisions` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `paragraphs` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `section_id` BIGINT UNSIGNED NOT NULL,
    `paragraph_index` INT NOT NULL,
    `paragraph_label` VARCHAR(128) NULL,
    `paragraph_text` LONGTEXT NOT NULL,
    `content_sha256` CHAR(64) NULL,
    `created_revision_id` BIGINT UNSIGNED NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_paragraphs_order` (`section_id`,`paragraph_index`),
    KEY `idx_paragraphs_revision` (`created_revision_id`),
    CONSTRAINT `fk_paragraphs_section`
        FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_paragraphs_revision`
        FOREIGN KEY (`created_revision_id`) REFERENCES `revisions` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 2. Einheitliches Forschungsobjekt-Register
--    Alle fachlichen Einzelobjekte erhalten eine stabile Objekt-ID.
-- ---------------------------------------------------------------------------

CREATE TABLE `research_objects` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `dissertation_id` BIGINT UNSIGNED NOT NULL,
    `chapter_id` BIGINT UNSIGNED NULL,
    `section_id` BIGINT UNSIGNED NULL,
    `paragraph_id` BIGINT UNSIGNED NULL,
    `object_type` ENUM(
        'EQUATION','FORMAL_STATEMENT','PROOF','CLAIM','EXAMPLE','FIGURE','TABLE',
        'SYMBOL','OPERATOR','CONDITION','NOTE','OTHER'
    ) NOT NULL,
    `object_code` VARCHAR(128) NOT NULL,
    `title` VARCHAR(512) NULL,
    `sort_order` INT NOT NULL DEFAULT 0,
    `status` ENUM('DRAFT','REVIEW','PASS','FAIL','FINAL','RELEASED','SUPERSEDED','OPEN') NOT NULL DEFAULT 'DRAFT',
    `created_revision_id` BIGINT UNSIGNED NULL,
    `superseded_by_object_id` BIGINT UNSIGNED NULL,
    `notes` LONGTEXT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_research_objects_code` (`dissertation_id`,`object_code`),
    KEY `idx_research_objects_chapter` (`chapter_id`),
    KEY `idx_research_objects_section` (`section_id`),
    KEY `idx_research_objects_paragraph` (`paragraph_id`),
    KEY `idx_research_objects_revision` (`created_revision_id`),
    KEY `idx_research_objects_superseded` (`superseded_by_object_id`),
    CONSTRAINT `fk_ro_dissertation`
        FOREIGN KEY (`dissertation_id`) REFERENCES `dissertations` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_ro_chapter`
        FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_ro_section`
        FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_ro_paragraph`
        FOREIGN KEY (`paragraph_id`) REFERENCES `paragraphs` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_ro_revision`
        FOREIGN KEY (`created_revision_id`) REFERENCES `revisions` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_ro_superseded`
        FOREIGN KEY (`superseded_by_object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 3. Gleichungen / Formeln
-- ---------------------------------------------------------------------------

CREATE TABLE `equations` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `object_id` BIGINT UNSIGNED NOT NULL,
    `equation_number` VARCHAR(64) NOT NULL,
    `title` VARCHAR(512) NULL,
    `equation_latex` LONGTEXT NULL,
    `word_latex` LONGTEXT NULL,
    `unicode_math` LONGTEXT NULL,
    `plain_description` LONGTEXT NULL,
    `equation_type` ENUM(
        'DEFINITION','IDENTITY','CONDITION','PROJECTION','OPERATOR','LIMIT','IMPLICATION',
        'COMPATIBILITY','SCHEMA','EXAMPLE','COUNTEREXAMPLE','PROOF_STEP','RESULT','OTHER'
    ) NOT NULL DEFAULT 'OTHER',
    `provenance` ENUM('AUTHOR','CLASSICAL','DERIVED','LITERATURE','MIXED','UNKNOWN') NOT NULL DEFAULT 'AUTHOR',
    `assumptions_text` LONGTEXT NULL,
    `validity_domain_text` LONGTEXT NULL,
    `validation_status` ENUM('OPEN','CHECKED','PASS','FAIL','NA') NOT NULL DEFAULT 'OPEN',
    `notes` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_equations_object` (`object_id`),
    UNIQUE KEY `uq_equations_number` (`equation_number`),
    CONSTRAINT `fk_equations_object`
        FOREIGN KEY (`object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `equation_components` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `equation_id` BIGINT UNSIGNED NOT NULL,
    `component_order` INT NOT NULL DEFAULT 0,
    `component_symbol` VARCHAR(255) NOT NULL,
    `component_name` VARCHAR(255) NULL,
    `component_description` LONGTEXT NULL,
    `component_type` VARCHAR(128) NULL,
    `unit_text` VARCHAR(128) NULL,
    `domain_text` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_equation_component_order` (`equation_id`,`component_order`),
    CONSTRAINT `fk_equation_components_equation`
        FOREIGN KEY (`equation_id`) REFERENCES `equations` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 4. Formale Aussagen: Definitionen, Axiome, Lemmata, Sätze usw.
-- ---------------------------------------------------------------------------

CREATE TABLE `formal_statements` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `object_id` BIGINT UNSIGNED NOT NULL,
    `statement_number` VARCHAR(64) NOT NULL,
    `statement_type` ENUM(
        'DEFINITION','AXIOM','ASSUMPTION','LEMMA','PROPOSITION','THEOREM','COROLLARY',
        'INTERPRETATION','CONJECTURE','OPEN_PROBLEM','PRINCIPLE','RULE','OTHER'
    ) NOT NULL,
    `title` VARCHAR(512) NOT NULL,
    `statement_text` LONGTEXT NOT NULL,
    `premises_text` LONGTEXT NULL,
    `conclusion_text` LONGTEXT NULL,
    `scope_text` LONGTEXT NULL,
    `provenance` ENUM('FRZK_AUTHOR','CLASSICAL','DERIVED','LITERATURE','MIXED','UNKNOWN') NOT NULL DEFAULT 'FRZK_AUTHOR',
    `proof_required` TINYINT(1) NOT NULL DEFAULT 0,
    `proof_status` ENUM('NOT_REQUIRED','MISSING','SKETCH','PARTIAL','PROVED','REFUTED','OPEN') NOT NULL DEFAULT 'OPEN',
    `validation_status` ENUM('OPEN','CHECKED','PASS','FAIL','NA') NOT NULL DEFAULT 'OPEN',
    `notes` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_formal_statement_object` (`object_id`),
    UNIQUE KEY `uq_formal_statement_number` (`statement_number`),
    KEY `idx_formal_statement_type` (`statement_type`),
    CONSTRAINT `fk_formal_statement_object`
        FOREIGN KEY (`object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `proofs` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `object_id` BIGINT UNSIGNED NOT NULL,
    `statement_id` BIGINT UNSIGNED NOT NULL,
    `proof_type` ENUM(
        'DIRECT','CONTRADICTION','CONTRAPOSITION','INDUCTION','CONSTRUCTION','COMPUTATION',
        'COUNTEREXAMPLE','MODEL','SKETCH','OTHER'
    ) NOT NULL DEFAULT 'DIRECT',
    `proof_text` LONGTEXT NOT NULL,
    `proof_status` ENUM('DRAFT','INCOMPLETE','CHECKED','VALID','INVALID','SUPERSEDED') NOT NULL DEFAULT 'DRAFT',
    `checker_notes` LONGTEXT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_proofs_object` (`object_id`),
    KEY `idx_proofs_statement` (`statement_id`),
    CONSTRAINT `fk_proofs_object`
        FOREIGN KEY (`object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_proofs_statement`
        FOREIGN KEY (`statement_id`) REFERENCES `formal_statements` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `proof_steps` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `proof_id` BIGINT UNSIGNED NOT NULL,
    `step_number` INT NOT NULL,
    `step_text` LONGTEXT NOT NULL,
    `justification_text` LONGTEXT NULL,
    `equation_id` BIGINT UNSIGNED NULL,
    `validation_status` ENUM('OPEN','PASS','FAIL','NA') NOT NULL DEFAULT 'OPEN',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_proof_steps_order` (`proof_id`,`step_number`),
    KEY `idx_proof_steps_equation` (`equation_id`),
    CONSTRAINT `fk_proof_steps_proof`
        FOREIGN KEY (`proof_id`) REFERENCES `proofs` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_proof_steps_equation`
        FOREIGN KEY (`equation_id`) REFERENCES `equations` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 5. Wissenschaftliche Claims außerhalb formaler Sätze
-- ---------------------------------------------------------------------------

CREATE TABLE `claims` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `object_id` BIGINT UNSIGNED NOT NULL,
    `claim_code` VARCHAR(128) NOT NULL,
    `claim_type` ENUM(
        'MATHEMATICAL','METHODOLOGICAL','DIDACTIC','EMPIRICAL','PHYSICAL','LITERATURE',
        'LIMITATION','INTERPRETIVE','PROVENANCE','OTHER'
    ) NOT NULL,
    `claim_text` LONGTEXT NOT NULL,
    `requires_citation` TINYINT(1) NOT NULL DEFAULT 1,
    `support_status` ENUM('UNSUPPORTED','PARTIAL','SUPPORTED','AUTHOR_DEFINITION','NOT_REQUIRED','OPEN') NOT NULL DEFAULT 'OPEN',
    `verification_status` ENUM('OPEN','CHECKED','PASS','FAIL','NA') NOT NULL DEFAULT 'OPEN',
    `notes` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_claims_object` (`object_id`),
    UNIQUE KEY `uq_claims_code` (`claim_code`),
    CONSTRAINT `fk_claims_object`
        FOREIGN KEY (`object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 6. Beispiele / Gegenbeispiele / Modelle
-- ---------------------------------------------------------------------------

CREATE TABLE `examples` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `object_id` BIGINT UNSIGNED NOT NULL,
    `example_number` VARCHAR(64) NULL,
    `example_type` ENUM('EXAMPLE','COUNTEREXAMPLE','MODEL','MODEL_ANALOGY','TEST_CASE','APPLICATION','OTHER') NOT NULL,
    `title` VARCHAR(512) NULL,
    `problem_text` LONGTEXT NULL,
    `construction_text` LONGTEXT NULL,
    `result_text` LONGTEXT NULL,
    `interpretation_text` LONGTEXT NULL,
    `scope_text` LONGTEXT NULL,
    `validation_status` ENUM('OPEN','CHECKED','PASS','FAIL','NA') NOT NULL DEFAULT 'OPEN',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_examples_object` (`object_id`),
    CONSTRAINT `fk_examples_object`
        FOREIGN KEY (`object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 7. Abbildungen / Medien / Beschreibungen / Provenienz
-- ---------------------------------------------------------------------------

CREATE TABLE `figures` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `object_id` BIGINT UNSIGNED NOT NULL,
    `figure_number` VARCHAR(64) NOT NULL,
    `title` VARCHAR(512) NULL,
    `figure_type` ENUM('SCHEMA','DIAGRAM','PLOT','GRAPH','GEOMETRY','FLOWCHART','SCREENSHOT','PHOTO','OTHER') NOT NULL DEFAULT 'SCHEMA',
    `caption` LONGTEXT NULL,
    `description` LONGTEXT NULL,
    `alt_text` LONGTEXT NULL,
    `interpretation_text` LONGTEXT NULL,
    `provenance_type` ENUM('OWN','ADAPTED','THIRD_PARTY','GENERATED','MIXED','UNKNOWN') NOT NULL DEFAULT 'OWN',
    `provenance_notes` LONGTEXT NULL,
    `rights_status` ENUM('OWN_WORK','LICENSED','PERMISSION_GRANTED','PUBLIC_DOMAIN','CITATION_ONLY','UNCLEAR','NA') NOT NULL DEFAULT 'OWN_WORK',
    `validation_status` ENUM('OPEN','CHECKED','PASS','FAIL','NA') NOT NULL DEFAULT 'OPEN',
    `notes` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_figures_object` (`object_id`),
    UNIQUE KEY `uq_figures_number` (`figure_number`),
    CONSTRAINT `fk_figures_object`
        FOREIGN KEY (`object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `figure_assets` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `figure_id` BIGINT UNSIGNED NOT NULL,
    `asset_role` ENUM('PRIMARY','SOURCE','THUMBNAIL','VECTOR','RASTER','DATA','OTHER') NOT NULL DEFAULT 'PRIMARY',
    `filename` VARCHAR(1024) NULL,
    `relative_path` VARCHAR(2048) NULL,
    `mime_type` VARCHAR(255) NULL,
    `width_px` INT UNSIGNED NULL,
    `height_px` INT UNSIGNED NULL,
    `file_size_bytes` BIGINT UNSIGNED NULL,
    `sha256` CHAR(64) NULL,
    `embedded_media_ref` VARCHAR(1024) NULL,
    `created_with` VARCHAR(255) NULL,
    `notes` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_figure_assets_figure` (`figure_id`),
    CONSTRAINT `fk_figure_assets_figure`
        FOREIGN KEY (`figure_id`) REFERENCES `figures` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `figure_descriptions` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `figure_id` BIGINT UNSIGNED NOT NULL,
    `text_type` ENUM('CAPTION','DESCRIPTION','ALT_TEXT','SOURCE_NOTE','PROVENANCE','RIGHTS_NOTE','INTERPRETATION','CREATION_NOTE','OTHER') NOT NULL,
    `language_code` VARCHAR(16) NOT NULL DEFAULT 'de',
    `text_value` LONGTEXT NOT NULL,
    `sort_order` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `idx_figure_descriptions_figure` (`figure_id`),
    CONSTRAINT `fk_figure_descriptions_figure`
        FOREIGN KEY (`figure_id`) REFERENCES `figures` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 8. Tabellen im Manuskript
-- ---------------------------------------------------------------------------

CREATE TABLE `manuscript_tables` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `object_id` BIGINT UNSIGNED NOT NULL,
    `table_number` VARCHAR(64) NOT NULL,
    `title` VARCHAR(512) NULL,
    `caption` LONGTEXT NULL,
    `description` LONGTEXT NULL,
    `table_data_json` JSON NULL,
    `source_note` LONGTEXT NULL,
    `validation_status` ENUM('OPEN','CHECKED','PASS','FAIL','NA') NOT NULL DEFAULT 'OPEN',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_manuscript_tables_object` (`object_id`),
    UNIQUE KEY `uq_manuscript_tables_number` (`table_number`),
    CONSTRAINT `fk_manuscript_tables_object`
        FOREIGN KEY (`object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 9. Literatur / Quellen / Autoren
-- ---------------------------------------------------------------------------

CREATE TABLE `sources` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `literature_number` INT UNSIGNED NULL,
    `source_type` ENUM('BOOK','JOURNAL_ARTICLE','BOOK_CHAPTER','CONFERENCE','STANDARD','WEBSITE','THESIS','REPORT','PREPRINT','DATASET','OTHER') NOT NULL DEFAULT 'OTHER',
    `title` VARCHAR(1024) NOT NULL,
    `container_title` VARCHAR(1024) NULL,
    `publisher` VARCHAR(512) NULL,
    `edition` VARCHAR(128) NULL,
    `volume` VARCHAR(128) NULL,
    `issue` VARCHAR(128) NULL,
    `pages` VARCHAR(128) NULL,
    `publication_year` SMALLINT UNSIGNED NULL,
    `publication_date` DATE NULL,
    `doi` VARCHAR(255) NULL,
    `isbn` VARCHAR(64) NULL,
    `issn` VARCHAR(64) NULL,
    `url` VARCHAR(2048) NULL,
    `accessed_date` DATE NULL,
    `full_citation` LONGTEXT NULL,
    `bibtex_key` VARCHAR(255) NULL,
    `original_source_available` TINYINT(1) NOT NULL DEFAULT 0,
    `verification_status` ENUM('OPEN','METADATA_CHECKED','ORIGINAL_CHECKED','PASS','FAIL') NOT NULL DEFAULT 'OPEN',
    `notes` LONGTEXT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_sources_literature_number` (`literature_number`),
    UNIQUE KEY `uq_sources_doi` (`doi`),
    KEY `idx_sources_title` (`title`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `authors` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_name` VARCHAR(255) NOT NULL,
    `given_name` VARCHAR(255) NULL,
    `orcid` VARCHAR(64) NULL,
    `notes` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_authors_orcid` (`orcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `source_authors` (
    `source_id` BIGINT UNSIGNED NOT NULL,
    `author_id` BIGINT UNSIGNED NOT NULL,
    `author_order` INT NOT NULL DEFAULT 1,
    `role` ENUM('AUTHOR','EDITOR','TRANSLATOR','OTHER') NOT NULL DEFAULT 'AUTHOR',
    PRIMARY KEY (`source_id`,`author_id`,`role`),
    KEY `idx_source_authors_order` (`source_id`,`author_order`),
    CONSTRAINT `fk_source_authors_source`
        FOREIGN KEY (`source_id`) REFERENCES `sources` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_source_authors_author`
        FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `citations` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `source_id` BIGINT UNSIGNED NOT NULL,
    `section_id` BIGINT UNSIGNED NULL,
    `paragraph_id` BIGINT UNSIGNED NULL,
    `target_object_id` BIGINT UNSIGNED NULL,
    `citation_order` INT NULL,
    `citation_role` ENUM('SUPPORT','BACKGROUND','COMPARISON','DEFINITION_SOURCE','METHOD','COUNTERPOINT','PROVENANCE','OTHER') NOT NULL DEFAULT 'SUPPORT',
    `citation_text_exact` LONGTEXT NULL,
    `locator_text` VARCHAR(1024) NULL,
    `page_from` VARCHAR(64) NULL,
    `page_to` VARCHAR(64) NULL,
    `section_locator` VARCHAR(512) NULL,
    `quoted_text` LONGTEXT NULL,
    `paraphrase_text` LONGTEXT NULL,
    `supported_claim_text` LONGTEXT NULL,
    `is_first_use` TINYINT(1) NOT NULL DEFAULT 0,
    `original_location_checked` TINYINT(1) NOT NULL DEFAULT 0,
    `verification_status` ENUM('OPEN','METADATA_ONLY','LOCATOR_CHECKED','CLAIM_CHECKED','PASS','FAIL') NOT NULL DEFAULT 'OPEN',
    `notes` LONGTEXT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_citations_source` (`source_id`),
    KEY `idx_citations_section` (`section_id`),
    KEY `idx_citations_paragraph` (`paragraph_id`),
    KEY `idx_citations_target` (`target_object_id`),
    CONSTRAINT `fk_citations_source`
        FOREIGN KEY (`source_id`) REFERENCES `sources` (`id`)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_citations_section`
        FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_citations_paragraph`
        FOREIGN KEY (`paragraph_id`) REFERENCES `paragraphs` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_citations_target`
        FOREIGN KEY (`target_object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 10. Symbole, Notation und Operatoren
-- ---------------------------------------------------------------------------

CREATE TABLE `symbols` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `object_id` BIGINT UNSIGNED NOT NULL,
    `symbol_code` VARCHAR(128) NOT NULL,
    `display_symbol` VARCHAR(255) NOT NULL,
    `latex_symbol` LONGTEXT NULL,
    `word_latex` LONGTEXT NULL,
    `name` VARCHAR(512) NOT NULL,
    `symbol_type` ENUM('SCALAR','VECTOR','SET','FUNCTION','STATE','PARAMETER','INDEX','RELATION','CONSTANT','OTHER') NOT NULL DEFAULT 'OTHER',
    `definition_text` LONGTEXT NULL,
    `domain_text` LONGTEXT NULL,
    `codomain_text` LONGTEXT NULL,
    `unit_text` VARCHAR(128) NULL,
    `scope_text` LONGTEXT NULL,
    `notes` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_symbols_object` (`object_id`),
    UNIQUE KEY `uq_symbols_code` (`symbol_code`),
    CONSTRAINT `fk_symbols_object`
        FOREIGN KEY (`object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `operators` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `object_id` BIGINT UNSIGNED NOT NULL,
    `operator_code` VARCHAR(128) NOT NULL,
    `display_symbol` VARCHAR(255) NULL,
    `name` VARCHAR(512) NOT NULL,
    `arity` TINYINT UNSIGNED NULL,
    `input_type_text` LONGTEXT NULL,
    `output_type_text` LONGTEXT NULL,
    `domain_text` LONGTEXT NULL,
    `definition_text` LONGTEXT NULL,
    `is_partial` TINYINT(1) NOT NULL DEFAULT 1,
    `validation_status` ENUM('OPEN','CHECKED','PASS','FAIL','NA') NOT NULL DEFAULT 'OPEN',
    `notes` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_operators_object` (`object_id`),
    UNIQUE KEY `uq_operators_code` (`operator_code`),
    CONSTRAINT `fk_operators_object`
        FOREIGN KEY (`object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `object_symbols` (
    `object_id` BIGINT UNSIGNED NOT NULL,
    `symbol_id` BIGINT UNSIGNED NOT NULL,
    `usage_role` ENUM('DEFINES','USES','INPUT','OUTPUT','ASSUMPTION','RESULT','ILLUSTRATES','OTHER') NOT NULL DEFAULT 'USES',
    PRIMARY KEY (`object_id`,`symbol_id`,`usage_role`),
    CONSTRAINT `fk_object_symbols_object`
        FOREIGN KEY (`object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_object_symbols_symbol`
        FOREIGN KEY (`symbol_id`) REFERENCES `symbols` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 11. Bedingungen, Annahmen und Gültigkeitsbereiche
-- ---------------------------------------------------------------------------

CREATE TABLE `conditions` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `object_id` BIGINT UNSIGNED NOT NULL,
    `condition_code` VARCHAR(128) NOT NULL,
    `condition_type` ENUM('ASSUMPTION','DOMAIN','PRECONDITION','POSTCONDITION','TYPE_CONSTRAINT','BOUNDARY','VALIDITY','EXCLUSION','OTHER') NOT NULL,
    `condition_text` LONGTEXT NOT NULL,
    `formal_expression` LONGTEXT NULL,
    `word_latex` LONGTEXT NULL,
    `status` ENUM('OPEN','ACTIVE','PROVED','REFUTED','SUPERSEDED') NOT NULL DEFAULT 'OPEN',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_conditions_object` (`object_id`),
    UNIQUE KEY `uq_conditions_code` (`condition_code`),
    CONSTRAINT `fk_conditions_object`
        FOREIGN KEY (`object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 12. Abhängigkeiten und semantische Beziehungen zwischen Objekten
-- ---------------------------------------------------------------------------

CREATE TABLE `object_relations` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `from_object_id` BIGINT UNSIGNED NOT NULL,
    `to_object_id` BIGINT UNSIGNED NOT NULL,
    `relation_type` ENUM(
        'DEPENDS_ON','USES','DEFINES','PROVES','SUPPORTED_BY','ILLUSTRATES','EXAMPLE_OF',
        'COUNTEREXAMPLE_TO','REFUTES','DERIVED_FROM','EQUIVALENT_TO','WEAKER_THAN','STRONGER_THAN',
        'PROJECTS_TO','COMPOSES_WITH','IMPLEMENTS','REFERENCES','SUPERSEDES','OTHER'
    ) NOT NULL,
    `is_required` TINYINT(1) NOT NULL DEFAULT 1,
    `relation_text` LONGTEXT NULL,
    `validation_status` ENUM('OPEN','CHECKED','PASS','FAIL','NA') NOT NULL DEFAULT 'OPEN',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_object_relations` (`from_object_id`,`to_object_id`,`relation_type`),
    KEY `idx_object_relations_to` (`to_object_id`),
    CONSTRAINT `fk_object_relations_from`
        FOREIGN KEY (`from_object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_object_relations_to`
        FOREIGN KEY (`to_object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 13. Prüfungen, Freigaben und offene Punkte
-- ---------------------------------------------------------------------------

CREATE TABLE `validation_checks` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `dissertation_id` BIGINT UNSIGNED NOT NULL,
    `chapter_id` BIGINT UNSIGNED NULL,
    `section_id` BIGINT UNSIGNED NULL,
    `object_id` BIGINT UNSIGNED NULL,
    `revision_id` BIGINT UNSIGNED NULL,
    `check_code` VARCHAR(128) NOT NULL,
    `check_type` ENUM(
        'MATHEMATICAL','LOGICAL','TYPE_SAFETY','CONSISTENCY','LITERATURE','CLAIM_SOURCE',
        'PROVENANCE','RIGHTS','FORMATTING','NUMBERING','CROSS_REFERENCE','AUTHOR_DECLARATION',
        'FINAL_GATE','OTHER'
    ) NOT NULL,
    `status` ENUM('OPEN','PASS','FAIL','WARNING','NA') NOT NULL DEFAULT 'OPEN',
    `result_text` LONGTEXT NULL,
    `checked_by` VARCHAR(255) NULL,
    `checked_at` DATETIME NULL,
    `evidence_sha256` CHAR(64) NULL,
    `notes` LONGTEXT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_validation_dissertation` (`dissertation_id`),
    KEY `idx_validation_chapter` (`chapter_id`),
    KEY `idx_validation_section` (`section_id`),
    KEY `idx_validation_object` (`object_id`),
    KEY `idx_validation_revision` (`revision_id`),
    CONSTRAINT `fk_validation_dissertation`
        FOREIGN KEY (`dissertation_id`) REFERENCES `dissertations` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_validation_chapter`
        FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_validation_section`
        FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_validation_object`
        FOREIGN KEY (`object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_validation_revision`
        FOREIGN KEY (`revision_id`) REFERENCES `revisions` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `issues` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `dissertation_id` BIGINT UNSIGNED NOT NULL,
    `chapter_id` BIGINT UNSIGNED NULL,
    `section_id` BIGINT UNSIGNED NULL,
    `object_id` BIGINT UNSIGNED NULL,
    `issue_code` VARCHAR(128) NULL,
    `issue_type` ENUM('MATH','LOGIC','SOURCE','CITATION','NUMBERING','FORMATTING','PROVENANCE','RIGHTS','CONTENT','OTHER') NOT NULL DEFAULT 'OTHER',
    `severity` ENUM('INFO','LOW','MEDIUM','HIGH','CRITICAL') NOT NULL DEFAULT 'MEDIUM',
    `status` ENUM('OPEN','IN_PROGRESS','RESOLVED','WONT_FIX') NOT NULL DEFAULT 'OPEN',
    `description` LONGTEXT NOT NULL,
    `resolution_text` LONGTEXT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `resolved_at` DATETIME NULL,
    PRIMARY KEY (`id`),
    KEY `idx_issues_object` (`object_id`),
    CONSTRAINT `fk_issues_dissertation`
        FOREIGN KEY (`dissertation_id`) REFERENCES `dissertations` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_issues_chapter`
        FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_issues_section`
        FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_issues_object`
        FOREIGN KEY (`object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 14. Tags / freie Klassifikation
-- ---------------------------------------------------------------------------

CREATE TABLE `tags` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `tag_name` VARCHAR(255) NOT NULL,
    `description` LONGTEXT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_tags_name` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `object_tags` (
    `object_id` BIGINT UNSIGNED NOT NULL,
    `tag_id` BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (`object_id`,`tag_id`),
    CONSTRAINT `fk_object_tags_object`
        FOREIGN KEY (`object_id`) REFERENCES `research_objects` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_object_tags_tag`
        FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 15. Komfort-Views für Register
-- ---------------------------------------------------------------------------

CREATE OR REPLACE VIEW `v_definitions` AS
SELECT fs.*, ro.object_code, ro.section_id, ro.chapter_id
FROM formal_statements fs
JOIN research_objects ro ON ro.id = fs.object_id
WHERE fs.statement_type = 'DEFINITION';

CREATE OR REPLACE VIEW `v_lemmas` AS
SELECT fs.*, ro.object_code, ro.section_id, ro.chapter_id
FROM formal_statements fs
JOIN research_objects ro ON ro.id = fs.object_id
WHERE fs.statement_type = 'LEMMA';

CREATE OR REPLACE VIEW `v_propositions` AS
SELECT fs.*, ro.object_code, ro.section_id, ro.chapter_id
FROM formal_statements fs
JOIN research_objects ro ON ro.id = fs.object_id
WHERE fs.statement_type = 'PROPOSITION';

CREATE OR REPLACE VIEW `v_theorems` AS
SELECT fs.*, ro.object_code, ro.section_id, ro.chapter_id
FROM formal_statements fs
JOIN research_objects ro ON ro.id = fs.object_id
WHERE fs.statement_type = 'THEOREM';

CREATE OR REPLACE VIEW `v_corollaries` AS
SELECT fs.*, ro.object_code, ro.section_id, ro.chapter_id
FROM formal_statements fs
JOIN research_objects ro ON ro.id = fs.object_id
WHERE fs.statement_type = 'COROLLARY';

CREATE OR REPLACE VIEW `v_axioms` AS
SELECT fs.*, ro.object_code, ro.section_id, ro.chapter_id
FROM formal_statements fs
JOIN research_objects ro ON ro.id = fs.object_id
WHERE fs.statement_type = 'AXIOM';

CREATE OR REPLACE VIEW `v_equation_register` AS
SELECT
    e.id AS equation_id,
    ro.object_code,
    c.chapter_number,
    s.section_number,
    e.equation_number,
    e.title,
    e.equation_type,
    e.provenance,
    e.validation_status,
    ro.status AS object_status
FROM equations e
JOIN research_objects ro ON ro.id = e.object_id
LEFT JOIN chapters c ON c.id = ro.chapter_id
LEFT JOIN sections s ON s.id = ro.section_id;

CREATE OR REPLACE VIEW `v_formal_statement_register` AS
SELECT
    fs.id AS statement_id,
    ro.object_code,
    c.chapter_number,
    s.section_number,
    fs.statement_number,
    fs.statement_type,
    fs.title,
    fs.proof_required,
    fs.proof_status,
    fs.validation_status,
    ro.status AS object_status
FROM formal_statements fs
JOIN research_objects ro ON ro.id = fs.object_id
LEFT JOIN chapters c ON c.id = ro.chapter_id
LEFT JOIN sections s ON s.id = ro.section_id;

CREATE OR REPLACE VIEW `v_figure_register` AS
SELECT
    f.id AS figure_id,
    ro.object_code,
    c.chapter_number,
    s.section_number,
    f.figure_number,
    f.title,
    f.figure_type,
    f.provenance_type,
    f.rights_status,
    f.validation_status,
    ro.status AS object_status
FROM figures f
JOIN research_objects ro ON ro.id = f.object_id
LEFT JOIN chapters c ON c.id = ro.chapter_id
LEFT JOIN sections s ON s.id = ro.section_id;

CREATE OR REPLACE VIEW `v_citation_register` AS
SELECT
    ci.id AS citation_id,
    so.literature_number,
    so.title AS source_title,
    ch.chapter_number,
    se.section_number,
    ro.object_code AS target_object_code,
    ci.citation_role,
    ci.locator_text,
    ci.original_location_checked,
    ci.verification_status
FROM citations ci
JOIN sources so ON so.id = ci.source_id
LEFT JOIN sections se ON se.id = ci.section_id
LEFT JOIN chapters ch ON ch.id = se.chapter_id
LEFT JOIN research_objects ro ON ro.id = ci.target_object_id;

CREATE OR REPLACE VIEW `v_open_checks` AS
SELECT
    vc.id,
    vc.check_code,
    vc.check_type,
    vc.status,
    c.chapter_number,
    s.section_number,
    ro.object_code,
    vc.result_text,
    vc.notes
FROM validation_checks vc
LEFT JOIN chapters c ON c.id = vc.chapter_id
LEFT JOIN sections s ON s.id = vc.section_id
LEFT JOIN research_objects ro ON ro.id = vc.object_id
WHERE vc.status IN ('OPEN','FAIL','WARNING');

SET FOREIGN_KEY_CHECKS = 1;

-- Ende des leeren Schemas.
