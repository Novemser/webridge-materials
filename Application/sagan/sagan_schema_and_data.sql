-- V1 Starting here
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
                      public_slug      CHARACTER VARYING(255),
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
                                          public_slug_aliases CHARACTER VARYING(255) NOT NULL,
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
                         stack_overflow_tags CHARACTER VARYING(255),
                         raw_boot_config VARCHAR(10000),
                         rendered_boot_config VARCHAR(10000),
                         raw_overview VARCHAR(10000) DEFAULT '',
                         rendered_overview VARCHAR(10000) DEFAULT '',
                         parent_project_id CHARACTER VARYING(255) DEFAULT NULL,
                         display_order INT NOT NULL DEFAULT 255,
                         tag_line CHARACTER VARYING(255) DEFAULT '',
                         featured BOOLEAN,
                         image_path CHARACTER VARYING(255) DEFAULT ''
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

-- V2 Starting here
-- ALTER TABLE project ADD raw_boot_config VARCHAR(10000);
-- ALTER TABLE project ADD rendered_boot_config VARCHAR(10000);

-- ALTER TABLE project ADD raw_overview VARCHAR(10000) DEFAULT '';
-- ALTER TABLE project ADD rendered_overview VARCHAR(10000) DEFAULT '';

-- ALTER TABLE project DROP COLUMN is_aggregator;
-- ALTER TABLE project ADD parent_project_id CHARACTER VARYING(255) DEFAULT NULL;

-- ALTER TABLE project ADD display_order INT NOT NULL DEFAULT 255;

DROP TABLE IF EXISTS project_sample_list;
CREATE TABLE project_sample_list (
                                     title          VARCHAR(10000),
                                     description    VARCHAR(10000),
                                     url            VARCHAR(10000),
                                     display_order  INT NOT NULL,
                                     project_id     CHARACTER VARYING(255) NOT NULL,
                                     PRIMARY KEY (project_id, display_order)
);

-- V3 Starting here
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

-- V4 Starting here
-- ALTER TABLE project ADD tag_line CHARACTER VARYING(255) DEFAULT '';
-- ALTER TABLE project ADD featured BOOLEAN;
-- ALTER TABLE project ADD image_path CHARACTER VARYING(255) DEFAULT '';

UPDATE project SET featured = FALSE WHERE featured IS NULL;

-- create a new groups reference table
DROP TABLE IF EXISTS project_groups;
CREATE TABLE project_groups
(
    id   SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    label VARCHAR(255)
);

-- relation table between project and project_groups tables
DROP TABLE IF EXISTS project_groups_rel;
create table project_groups_rel
(
    project_id VARCHAR(255) REFERENCES project (id),
    group_id   INT REFERENCES project_groups (id),
    CONSTRAINT id PRIMARY KEY (project_id, group_id)
);

-- V99 Starting here
-- Member Profiles

INSERT INTO member_profile
(avatar_url, bio, latitude, longitude, github_id,  github_username, gravatar_email, hidden, lanyrd_username,
 location, name, speakerdeck_username, twitter_username,  username, video_embeds, job_title)
VALUES ('/images/icon-spring-boot.svg', 'Spring Boot team member and fixture user for the application.',
        37.781929, -122.4041, 123456, 'spring', 'spring@spring.io', FALSE, NULL, 'San Francisco, CA',
        'Emily Spring', NULL, 'springcentral', 'springcentral', NULL, 'Spring Team Member');

-- Blog Posts

INSERT INTO post (broadcast, category, created_at, draft, format, public_slug, publish_at, raw_content,
                  rendered_content, rendered_summary, title, author_id)
VALUES (FALSE,'RELEASES','2020-01-22 08:55:32.503',FALSE,'MARKDOWN','2020/01/22/spring-boot-2-3-0','2020-01-22 08:56:05.769',
        'Dear Spring Community,

        We are happy to announce the 2.3.0 release of Spring Boot.
        Highlights from this release include:

        * A great feature
        * Another great feature
        * Many bug fixes',
        '<p>Dear Spring Community,</p>
        <p>We are happy to announce the 2.3.0 release of Spring Boot.</p>
        <p>Highlights from this release include:</p>
        <ul>
        <li>A great feature</li><li>Another great feature</li><li>Many bug fixes</li>
        </ul>', '<p>Dear Spring Community,</p><p>We are happy to announce the 2.3.0 release of Spring Boot.</p>'
           ,'Spring Boot 2.3.0 released',1),

       (FALSE,'NEWS_AND_EVENTS','2020-01-18 08:55:32.503',FALSE,'MARKDOWN','2020/01/18/this-week-in-spring-2020-01-18','2020-01-18 08:56:05.769',
        'Hi, Spring fans!
        There is a lot to cover this week, so let s get to it.

        Links this week:

        * [Spring Blog](https://spring.io/blog)
        * [Spring Initializr](https://start.spring.io)
        ',
        '<p>Hi, Spring fans!</p>
        <p>There is a lot to cover this week, so let s get to it.</p>
        <p>Links this week:</p><ul>
        <li><a href="https://spring.io/blog">Spring Blog</a></li>
        <li><a href="https://start.spring.io/">Spring Initializr</a></li></ul>
        ',
        '<p>Hi Spring fans!</p><p>There is a lot to cover this week, so let s get to it.</p>',
        'This Week in Spring - 2020-01-18',1);

-- Project Repositories

INSERT INTO project_repository
(id, name, url, snapshots_enabled)
VALUES ('spring-libs-milestone', 'Spring Milestones', 'https://repo.spring.io/libs-milestone', false),
       ('spring-libs-release', 'Spring Releases', 'https://repo.spring.io/libs-release', false),
       ('spring-libs-snapshot', 'Spring Snapshots', 'https://repo.spring.io/libs-snapshot', true),
       ('spring-milestones', 'Spring Milestones', 'https://repo.spring.io/libs-milestone', false),
       ('spring-snapshots', 'Spring Snapshots', 'https://repo.spring.io/libs-snapshot', true);

-- Projects

INSERT INTO project
(id, name, parent_project_id, repo_url, category, site_url, stack_overflow_tags,
 tag_line, raw_boot_config, rendered_boot_config, raw_overview, rendered_overview,
 featured, display_order, image_path)
VALUES ('spring-framework', 'Spring Framework', NULL, 'http://github.com/spring-projects/spring-framework', 'active',
        '/projects/spring-framework',
        'spring,spring-mvc,spring-jms,spring-test,spring-webflux',
        'Provides core support for dependency injection, transaction management, web apps, data access, messaging and more.',
        '', '', '## Sample description\nThis is a sample description.',
        '<h2>Sample description</h2><p>This is a sample description.</p>', FALSE, 2, '/images/projects/spring-framework.svg'),
       ('spring-boot', 'Spring Boot', NULL, 'http://github.com/spring-projects/spring-boot', 'active',
        '/projects/spring-boot',
        'spring-boot',
        'Takes an opinionated view of building Spring applications and gets you up and running as quickly as possible.',
        '', '', '## Sample description\nThis is a sample description.',
        '<h2>Sample description</h2><p>This is a sample description.</p>', FALSE, 1, '/images/projects/spring-boot.svg'),
       ('spring-data', 'Spring Data', NULL, 'http://github.com/spring-projects/spring-data', 'active',
        '/projects/spring-data',
        'spring-data,spring-data-jpa,spring-data-mongodb,spring-data-rest,spring-data-elasticsearch,spring-data-redis',
        'Spring Data’s mission is to provide a familiar and consistent, Spring-based programming model for data access while still retaining the special traits of the underlying data store.',
        '', '', '## Sample description\nThis is a sample description.',
        '<h2>Sample description</h2><p>This is a sample description.</p>', FALSE, 3, '/images/projects/spring-data.svg'),
       ('spring-data-jpa', 'Spring Data JPA', 'spring-data', 'http://github.com/spring-projects/spring-data-jpa',
        'active', '/projects/spring-data-jpa',
        'spring-data',
        'Provides a familiar and consistent, Spring-based programming model for relational database access.',
        'Add `spring-boot-starter-data-jpa` as a dependency.',
        'Add <pre><code>spring-boot-starter-data-jpa</code></pre> as a dependency.',
        '## Sample description\nThis is a sample description.',
        '<h2>Sample description</h2><p>This is a sample description.</p>', FALSE, 255, '/images/projects/spring-data.svg'),
       ('spring-data-elasticsearch', 'Spring Data Elasticsearch', 'spring-data',
        'http://github.com/spring-projects/spring-data-elasticsearch', 'active', '/projects/spring-data-elasticsearch',
        'spring-data-elasticsearch',
        'Provides a familiar and consistent, Spring-based programming model for Elasticsearch index access.',
        'Add `spring-boot-starter-data-elasticsearch` as a dependency.',
        'Add <pre><code>spring-boot-starter-data-elasticsearch</code></pre> as a dependency.',
        '## Sample description\nThis is a sample description.',
        '<h2>Sample description</h2><p>This is a sample description.</p>', FALSE, 255, '/images/projects/spring-data.svg'),
       ('platform', 'Spring IO Platform', NULL, 'http://github.com/spring-io/platform', 'attic',
        'http://platform.spring.io/platform/', 'spring-io',
        'Spring IO is a cohesive, versioned platform for building modern applications.', '', '',
        'It is a modular, enterprise-grade distribution that delivers a curated set of dependencies while keeping developers in full control of deploying only the parts they need. Spring IO is 100% open source, lean, and modular.',
        '<p>It is a modular, enterprise-grade distribution that delivers a curated set of dependencies while keeping developers in full control of deploying only the parts they need. Spring IO is 100% open source, lean, and modular.</p>',
        FALSE, 255, ''),
       ('spring-scala', 'Spring Scala', NULL, 'http://hub.darcs.net/psnively/spring-scala', 'community',
        'http://hub.darcs.net/psnively/spring-scala', 'spring-scala',
        'Brings the power and expressiveness of Scala together with the productivity and deep ecosystem of Spring.', '',
        '',
        '## Sample description\nThis is a sample description.',
        '<h2>Sample description</h2><p>This is a sample description.</p>', FALSE, 255, ''),
       ('spring-restdocs', 'Spring REST Docs', NULL, 'http://github.com/spring-projects/spring-restdocs', 'active',
        '/projects/spring-restdocs', 'spring-restdocs',
        'Document RESTful services by combining hand-written documentation with auto-generated snippets produced with Spring MVC Test or REST Assured.',
        '', '',
        'Spring REST Docs helps you to document RESTful services.',
        '<p>Spring REST Docs helps you to document RESTful services.</p>',
        TRUE, 255, '/images/projects/spring-restdocs.png');

-- Project releases

INSERT INTO project_release_list
(project_id, repository_id, api_doc_url, artifact_id, group_id, is_current, ref_doc_url, release_status, version_name)
VALUES ('spring-boot', NULL, 'https://docs.spring.io/spring-boot/docs/2.1.12.RELEASE/api/', 'spring-boot',
        'org.springframework.boot', false, 'https://docs.spring.io/spring-boot/docs/2.1.12.RELEASE/reference/html/',
        2, '2.1.12.RELEASE'),
       ('spring-boot', 'spring-snapshots', 'https://docs.spring.io/spring-boot/docs/2.3.0.SNAPSHOT/api/', 'spring-boot',
        'org.springframework.boot', false, 'https://docs.spring.io/spring-boot/docs/2.3.0.SNAPSHOT/reference/html/',
        0, '2.3.0.SNAPSHOT'),
       ('spring-boot', NULL, 'https://docs.spring.io/spring-boot/docs/2.2.4.RELEASE/api/', 'spring-boot',
        'org.springframework.boot', true, 'https://docs.spring.io/spring-boot/docs/2.2.4.RELEASE/reference/html/',
        2, '2.2.4.RELEASE'),
       ('spring-boot', 'spring-milestones', 'https://docs.spring.io/spring-boot/docs/2.3.0.M1/api/', 'spring-boot',
        'org.springframework.boot', false, 'https://docs.spring.io/spring-boot/docs/2.3.0.M1/reference/html/',
        1, '2.3.0.M1'),
       ('platform', NULL, 'https://spring.io/projects/platform', 'platform', 'io.spring.platform', true,
        'https://docs.spring.io/platform/docs/Cairo-SR7/reference/htmlsingle/', 2, 'Cairo-SR7');


-- Project samples

INSERT INTO project_sample_list (title, description, url, display_order, project_id)
VALUES ('Simple', 'Simple command line application',
        'https://github.com/spring-projects/spring-boot/tree/master/spring-boot-samples/spring-boot-sample-simple', 0,
        'spring-boot'),
       ('Embedded Tomcat', 'It is a mountain kitty.',
        'https://github.com/spring-projects/spring-boot/tree/master/spring-boot-samples/spring-boot-sample-tomcat', 1,
        'spring-boot'),
       ('batch', 'Define and run a batch job in a few lines of code',
        'https://github.com/spring-projects/spring-boot/tree/master/spring-boot-samples/spring-boot-sample-batch', 2,
        'spring-boot'),
       ('Data JPA', 'Stores data using Spring Data JPA with Hibernate',
        'https://github.com/spring-projects/spring-boot/tree/master/spring-boot-samples/spring-boot-sample-data-jpa', 3,
        'spring-boot'),
       ('Integration', 'Integration application built using Spring Integration and its Java DSL',
        'https://github.com/spring-projects/spring-boot/tree/master/spring-boot-samples/spring-boot-sample-integration',
        4, 'spring-boot'),
       ('more...', 'Collection of Spring Boot sample applications.',
        'https://github.com/spring-projects/spring-boot/tree/master/spring-boot-samples', 5, 'spring-boot');

-- Spring Tools

INSERT INTO spring_tools_platform (id)
VALUES ('vscode'),
       ('eclipse'),
       ('theia');

INSERT INTO spring_tools_platform_downloads (spring_tools_platform_id, variant, label, download_url)
VALUES ('eclipse', 'windows', 'Windows 64-bit',
        'http://download.springsource.com/release/STS4/4.1.1.RELEASE/dist/e4.10/spring-tool-suite-4-4.1.1.RELEASE-e4.10.0-win32.win32.x86_64.zip'),
       ('eclipse', 'macos', 'macOS 64-bit',
        'http://download.springsource.com/release/STS4/4.1.1.RELEASE/dist/e4.10/spring-tool-suite-4-4.1.1.RELEASE-e4.10.0-macosx.cocoa.x86_64.dmg'),
       ('eclipse', 'linux', 'Linux 64-bit',
        'http://download.springsource.com/release/STS4/4.1.1.RELEASE/dist/e4.10/spring-tool-suite-4-4.1.1.RELEASE-e4.10.0-linux.gtk.x86_64.tar.gz'),
       ('vscode', 'marketplace', 'VSCode Marketplace',
        'https://marketplace.visualstudio.com/items?itemName=Pivotal.vscode-boot-dev-pack'),
       ('theia', 'package', 'Package for Theia',
        'https://registry.npmjs.org/@pivotal-tools/theia-spring-boot/-/theia-spring-boot-1.8.0.tgz');

-- Project groups
INSERT INTO project_groups (name, label)
VALUES ('microservices', 'Microservices'),
       ('event-driven', 'Event Driven'),
       ('cloud', 'Cloud'),
       ('reactive', 'Reactive'),
       ('web', 'Web Apps'),
       ('serverless', 'Serverless'),
       ('streams', 'Streams'),
       ('batch', 'Batch');

INSERT INTO project_groups_rel
SELECT 'spring-boot', id FROM project_groups WHERE name in ('microservices', 'event-driven', 'batch');
INSERT INTO project_groups_rel
SELECT 'spring-framework', id FROM project_groups WHERE name in ('microservices', 'batch');
INSERT INTO project_groups_rel
SELECT 'spring-data', id FROM project_groups WHERE name in ('microservices', 'batch');
INSERT INTO project_groups_rel
SELECT 'spring-data-jpa', id FROM project_groups WHERE name in ('microservices', 'batch');
INSERT INTO project_groups_rel
SELECT 'spring-data-elasticsearch', id FROM project_groups WHERE name in ('microservices', 'batch');
INSERT INTO project_groups_rel
SELECT 'platform', id FROM project_groups WHERE name in ('microservices', 'batch');
INSERT INTO project_groups_rel
SELECT 'spring-restdocs', id FROM project_groups WHERE name in ('microservices');