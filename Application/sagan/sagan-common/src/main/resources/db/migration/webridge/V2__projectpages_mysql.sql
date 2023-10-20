ALTER TABLE project ADD raw_boot_config VARCHAR(10000);
ALTER TABLE project ADD rendered_boot_config VARCHAR(10000);

ALTER TABLE project ADD raw_overview VARCHAR(10000) DEFAULT '';
ALTER TABLE project ADD rendered_overview VARCHAR(10000) DEFAULT '';

ALTER TABLE project DROP COLUMN is_aggregator;
ALTER TABLE project ADD parent_project_id CHARACTER VARYING(255) DEFAULT NULL;

ALTER TABLE project ADD display_order INT NOT NULL DEFAULT 255;

DROP TABLE IF EXISTS project_sample_list;
CREATE TABLE project_sample_list (
                                     title          VARCHAR(10000),
                                     description    VARCHAR(10000),
                                     url            VARCHAR(10000),
                                     display_order  INT NOT NULL,
                                     project_id     CHARACTER VARYING(255) NOT NULL,
                                     PRIMARY KEY (project_id, display_order)
);