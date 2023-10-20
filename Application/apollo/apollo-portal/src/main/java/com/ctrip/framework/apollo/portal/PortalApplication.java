/*
 * Copyright 2022 Apollo Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
package com.ctrip.framework.apollo.portal;

import com.ctrip.framework.apollo.common.ApolloCommonConfig;
import com.ctrip.framework.apollo.openapi.PortalOpenApiConfig;
import webridge.storedprocedure.invocation.prefetch.FixedCachedRowSetImpl;
import org.apache.commons.lang3.math.NumberUtils;
import org.reflections.Reflections;
import org.reflections.scanners.SubTypesScanner;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.ldap.LdapAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Set;
import java.util.stream.Collectors;

@EnableAspectJAutoProxy
@Configuration
@EnableAutoConfiguration(exclude = {LdapAutoConfiguration.class})
@EnableTransactionManagement
@ComponentScan(basePackageClasses = {ApolloCommonConfig.class,
    PortalApplication.class, PortalOpenApiConfig.class})
@ComponentScan({"webridge", "webridge.common.spring"})
public class PortalApplication implements CommandLineRunner {
  public Set<Class> findAllClassesUsingReflectionsLibrary(String packageName) {
    Reflections reflections = new Reflections(packageName, new SubTypesScanner(false));
    return reflections.getSubTypesOf(Object.class)
            .stream()
            .collect(Collectors.toSet());
  }
  public static void main(String[] args) throws Exception {
    SpringApplication.run(PortalApplication.class, args);
  }

  @Override
  public void run(String... args) throws Exception {
    // To prevent an unknown issue of ClassDefNotFound,
    // We need to load these classes before the offline compiler is triggered for class loading

    findAllClassesUsingReflectionsLibrary("webridge.common.offline");
    findAllClassesUsingReflectionsLibrary("webridge");
    NumberUtils.class.getName();
    FixedCachedRowSetImpl.class.getName();
  }
}
