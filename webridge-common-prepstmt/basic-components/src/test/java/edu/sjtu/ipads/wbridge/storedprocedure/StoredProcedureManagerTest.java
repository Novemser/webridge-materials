package edu.sjtu.ipads.wbridge.storedprocedure;

import webridge.storedprocedure.SPConfig;
import webridge.storedprocedure.StoredProcedureManager;
import webridge.symbc.Constants;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.Objects;

class StoredProcedureManagerTest {


    void setUp() throws Exception {
        String schemaFile = Objects.requireNonNull(
                getClass().getResource("/shopizer_schema.sql")).getFile();
        String confFilePath = Objects.requireNonNull(
                this.getClass().getResource("/view-product.conf")).getFile();
        SPConfig.addConfig(new File(confFilePath));
        SPConfig.addConfig(Constants.SCHEMA_DEF_FILE_KEY, new File(schemaFile).getAbsolutePath());

        final String path = SPConfig.getConfig().getString(Constants.SQL_GRAPH_PATH_KEY);
        File file = new File(path);
        if (file.exists()) {
            FileUtils.deleteDirectory(file);
        }
    }

    @Test
    void testGenerateStoredProcedure() throws Exception {
        setUp();
        String sqlDepGraphPath = Objects.requireNonNull(
                getClass().getResource("/ViewProduct_prune_setlistmap.json")).getFile();
        String confFilePath = Objects.requireNonNull(
                this.getClass().getResource("/view-product.conf")).getFile();

        StoredProcedureManager.run(
                sqlDepGraphPath,
                confFilePath
        );
    }

    @Test
    void testCustomInput() throws Exception {
        String depGraphPath;
        depGraphPath = "/tmp/GetBlog.json";
        depGraphPath = "/tmp/GetIndex.json";
        String configPath;
        configPath = "/tmp/trace-GetBlog--491821096-config.conf";
        configPath = "/tmp/trace-GetIndex--1193704264-config.conf";
        StoredProcedureManager.run(depGraphPath, configPath);
    }
}