DROP TABLE IF EXISTS member_profile;
CREATE TABLE member_profile (
                                id                   INTEGER AUTO_INCREMENT                 NOT NULL PRIMARY KEY,
                                avatar_url           CHARACTER VARYING(255),
                                bio                  VARCHAR(10000),
                                latitude             FLOAT,
                                longitude            FLOAT,
                                github_id            BIGINT,
                                github_username      CHARACTER VARYING(255),
                                gravatar_email       CHARACTER VARYING(255),
                                hidden               BOOLEAN,
                                lanyrd_username      CHARACTER VARYING(255),
                                location             CHARACTER VARYING(255),
                                name                 CHARACTER VARYING(255),
                                speakerdeck_username CHARACTER VARYING(255),
                                twitter_username     CHARACTER VARYING(255),
                                username             CHARACTER VARYING(255) NOT NULL,
                                video_embeds         VARCHAR(10000),
                                job_title            CHARACTER VARYING(255)
);

DROP TABLE IF EXISTS post;
CREATE TABLE post (
                      id               SERIAL                 NOT NULL PRIMARY KEY,
                      broadcast        BOOLEAN                NOT NULL,
                      category         CHARACTER VARYING(255) NOT NULL,
                      created_at       TIMESTAMP              NOT NULL,
                      draft            BOOLEAN                NOT NULL,
                      format           CHARACTER VARYING(255),
                      public_slug      CHARACTER VARYING(255) UNIQUE,
                      publish_at       TIMESTAMP              DEFAULT CURRENT_TIMESTAMP,
                      raw_content      VARCHAR(10000)         NOT NULL,
                      rendered_content VARCHAR(10000)         NOT NULL,
                      rendered_summary VARCHAR(10000)         NOT NULL,
                      title            CHARACTER VARYING(255) NOT NULL,
                      author_id        INTEGER                NOT NULL REFERENCES member_profile (id)
);

DROP TABLE IF EXISTS post_public_slug_aliases;
CREATE TABLE post_public_slug_aliases (
                                          post_id             INT                    NOT NULL,
                                          public_slug_aliases CHARACTER VARYING(255) NOT NULL UNIQUE,
                                          PRIMARY KEY (post_id, public_slug_aliases)
);

CREATE INDEX idx_category
    ON post (category);
CREATE INDEX idx_draft
    ON post (draft);
CREATE INDEX idx_publish_at
    ON post (publish_at);

DROP TABLE IF EXISTS project;
CREATE TABLE project (
                         id                  CHARACTER VARYING(255) NOT NULL PRIMARY KEY,
                         name                CHARACTER VARYING(255),
                         repo_url            CHARACTER VARYING(255),
                         category            CHARACTER VARYING(255),
                         site_url            CHARACTER VARYING(255),
                         is_aggregator       BOOLEAN,
                         stack_overflow_tags CHARACTER VARYING(255)
);

DROP TABLE IF EXISTS project_release_list;
CREATE TABLE project_release_list (
                                      project_id     CHARACTER VARYING(255) NOT NULL,
                                      repository_id  CHARACTER VARYING(255),
                                      api_doc_url    CHARACTER VARYING(255),
                                      artifact_id    CHARACTER VARYING(255),
                                      group_id       CHARACTER VARYING(255),
                                      is_current     BOOLEAN,
                                      ref_doc_url    CHARACTER VARYING(255),
                                      release_status INT,
                                      version_name   CHARACTER VARYING(255),
                                      PRIMARY KEY (project_id, version_name)
);

DROP TABLE IF EXISTS project_repository;
CREATE TABLE project_repository (
                                    id                CHARACTER VARYING(255) NOT NULL PRIMARY KEY,
                                    name              CHARACTER VARYING(255),
                                    url               CHARACTER VARYING(255),
                                    snapshots_enabled BOOLEAN
);
