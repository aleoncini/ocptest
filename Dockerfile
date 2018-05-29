FROM sige-runtime-image
ENV DB_HOST=10.10.20.20 \
    DB_NAME=SIGE \
    JAVA_OPTS='-server -Xms1024m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=512m -Duser.language=en -Duser.country=uk -Dsun.rmi.dgc.client.gcInterval=3600000 -Dsun.rmi.dgc.server.gcInterval=3600000 -Djavax.net.ssl.keyStore=conf/keystore.jks -Djavax.net.ssl.keyStorePassword=changeit -Djavax.net.ssl.trustStore=conf/cacerts.jks -Djavax.net.ssl.trustStorePassword=changeit'
ADD ./deploy/oracle-ds.xml /tmp/oracle-ds.xml
RUN sed -e "s/\${DB_HOST}/$DB_HOST/" \
        -e "s/\${DB_NAME}/$DB_NAME/" \
        /tmp/oracle-ds.xml > /opt/redhat/jboss-4.2.2.GA/server/default/deploy/oracle-ds.xml
ADD ./deploy/denaro_printer.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/denaro_printer.war
ADD ./deploy/img_pop.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/img_pop.war
ADD ./deploy/sige.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/sige.war
ADD ./deploy/sigePortal.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/sigePortal.war
ADD ./deploy/sigeAuditSimple.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/sigeAuditSimple.war
ADD ./deploy/wsFlussiSoa.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/wsFlussiSoa.war
ADD ./deploy/wsTraspClient.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/wsTraspClient.war
ADD ./deploy/amministratore.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/amministratore.war
ADD ./deploy/cl_dae.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/cl_dae.war
ADD ./deploy/controlloAccessi.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/controlloAccessi.war
ADD ./deploy/impiego.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/impiego.war
ADD ./deploy/denaro.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/denaro.war
ADD ./deploy/jmilcard.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/jmilcard.war
ADD ./deploy/mantenimento.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/mantenimento.war
ADD ./deploy/materiali.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/materiali.war
ADD ./deploy/matricola.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/matricola.war
ADD ./deploy/munizioni.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/munizioni.war
ADD ./deploy/parchi.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/parchi.war
ADD ./deploy/stipendi.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/stipendi.war
ADD ./deploy/trasporti.war /opt/redhat/jboss-4.2.2.GA/server/default/deploy/trasporti.war
