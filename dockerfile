FROM tryton/tryton:7.6-office
ENV DB_HOSTNAME=
ENV DB_USER=
ENV DB_PASSWORD=
ENV DATABASE_NAME=
ENV TRYTOND_DATABASE_URI=postgresql://DB_USER:DB_PASSWORD@DB_HOSTNAME:5432/
ENV TRYTOND_ATTACHMENT_FILESTORE=True
ENV TRYTOND_DATABASE_LANGUAGE=DE
ENV TRYTOND_WEB_HOSTNAME=
RUN pip3 install --break-system-packages --no-cache-dir trytond-party
RUN pip3 install --break-system-packages --no-cache-dir trytond-company
RUN pip3 install --break-system-packages --no-cache-dir trytond-country
WORKDIR /etc
RUN if [ -n "$DATABASE_NAME" ]; then trytond_import_currencies -c trytond.conf -d ${DATABASE_NAME}; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond_import_countries -c trytond.conf -d ${DATABASE_NAME}; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond_import_postal_codes -c trytond.conf -d ${DATABASE_NAME} DE; fi
WORKDIR /