## Project Wiki

https://github.com/spring-attic/sagan/wiki

## How to run

We need to start both site and render service

    cd sagan
    # Run site service
    SPRING_PROFILES_ACTIVE=standalone ./gradlew :sagan-site:bootRun
    # Run render service
    ./gradlew :sagan-renderer:bootRun

Access the website through localhost:8080

## How to debug

    # Using Remote JVM Debug
    # Default port 5005
    SPRING_PROFILES_ACTIVE=standalone ./gradlew :sagan-site:bootRun --debug-jvm