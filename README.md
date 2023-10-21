# Extra Materials for SIGMOD'24 Submission #347
This repository contains the extra materials for SIGMOD'24 Submission #347 (WeBridge: Synthesizing Stored Procedures for Large-Scale Real-World Web Applications).

The main contents are: 

- A [pdf document](WeBridge_Proofs.pdf) that formally proof the correctness of WeBridge.
- The [source code](SourceCode) of WeBridge.
- The [source code](Application) of the six applications we evaluated in the paper.

# How to build WeBridge
Refer to README-WEBRIDGE.md in each modules

# How to run WeBridge

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

## Run the offline

We recommend to use the scripts in webridge-common directory to start offline compiler

Then start another instance of online one

Finally, use webench to send requests to online for generating stored procedures

## Run the online

We recommond to use the scripts in `webench/scripts`.

Take apollo as an example

Use `webench/scripts/apollo/webench_thpt.sh` to run throughput test.

Use `webench/scripts/apollo/webench_latency.sh` to run throughput test.
