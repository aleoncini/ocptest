FROM sige-runtime-image
ENV DB_HOST=10.11.12.13 \
    DB_NAME=stoca \
    JAVA_OPTS='-server -Xms1024m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=512m -Duser.language=en -Duser.country=uk -Dsun.rmi.dgc.client.gcInterval=3600000 -Dsun.rmi.dgc.server.gcInterval=3600000 -Djavax.net.ssl.keyStore=conf/keystore.jks -Djavax.net.ssl.keyStorePassword=changeit -Djavax.net.ssl.trustStore=conf/cacerts.jks -Djavax.net.ssl.trustStorePassword=changeit'
ADD ./deploy/oracle-ds.xml /tmp/oracle-ds.xml
RUN sed -e "s/\${DB_HOST}/$DB_HOST/" \
        -e "s/\${DB_NAME}/$DB_NAME/" \
        /tmp/oracle-ds.xml > /opt/redhat/jboss-4.2.2.GA/server/default/deploy/oracle-ds.xml
