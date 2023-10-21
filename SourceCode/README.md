# Overview
This directory contains the main source code of WeBridge, including three modules:
- [openjdk8-webridge](./openjdk8-webridge/) The concolic execution engine we implemented based on OpenJDK8.
- [webench](./webench/) The benchmarking tool that used in our evaluation. It can automatically populate the database for different workloads, and run the benchmarks.
- [webridge-common](./webridge-common/) The runtime library and basic components of the WeBridge.

# Prerequisites
We have tested the code in the following environment:

Operating system: Ubuntu 16.04

GCC/G++: 6.5.0

# How to build WeBridge
Refer to README-WEBRIDGE.md in each modules

## Compile the JDK

Use linux-x86_64-normal-server-release to run online apps

Use linux-x86_64-normal-server-release to run offline compiler

## Compile webrige-common

Refer to its WEBRIDGE-README.md


## Compile webrige-common-prepstmt

This version is for testing prepared statements

Refer to its WEBRIDGE-README.md

## Compiling webench

Refer to its WEBRIDGE-README.md

# How to run WeBridge
First start the offline compiler, then run the application.

## Run the offline

We recommend to use the scripts in webridge-common directory to start offline compiler

Then start another instance of online one

Finally, use webench to send requests to online for generating stored procedures

## Run the online

We recommond to use the scripts in `webench/scripts`.

Take apollo as an example

Use `webench/scripts/apollo/webench_thpt.sh` to run throughput test.

Use `webench/scripts/apollo/webench_latency.sh` to run throughput test.
