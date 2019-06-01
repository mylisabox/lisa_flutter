#!/usr/bin/env bash

export JAVA_OPTS="${JAVA_OPTS} -XX:MaxPermSize=256M -Xmx1024M -DloggerPath=conf/log4j.properties"

WORKDIR=.

rm -R ${WORKDIR}/lib/api
rm -R ${WORKDIR}/lib/model
rm -R ${WORKDIR}/lib/auth

executable="./openapi-generator-cli.jar"
# Generate client
ags="$@ generate -i api.yml -g dart-jaguar --skip-validate-spec -o ${WORKDIR} -DpubName=lisa_server_sdk -DhideGenerationTimestamp=true -DnullableFields=false"
java ${JAVA_OPTS} -jar ${executable} ${ags}

#cd ${WORKDIR}
pub get
pub run build_runner build --delete-conflicting-outputs
