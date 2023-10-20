DROP TABLE IF EXISTS spring_tools_platform;
CREATE TABLE spring_tools_platform
(
    id   CHARACTER VARYING(255) NOT NULL PRIMARY KEY
);

DROP TABLE IF EXISTS spring_tools_platform_downloads;
CREATE TABLE spring_tools_platform_downloads
(
    spring_tools_platform_id CHARACTER VARYING(255) NOT NULL,
    download_url             CHARACTER VARYING(255) NOT NULL,
    variant                  CHARACTER VARYING(255) NOT NULL,
    label                    CHARACTER VARYING(255) NOT NULL,
    PRIMARY KEY (spring_tools_platform_id, variant)
);