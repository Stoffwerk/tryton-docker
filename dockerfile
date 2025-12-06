FROM tryton/tryton:7.6-office
ARG DB_HOSTNAME
ARG DB_USER
ARG DB_PASSWORD
ARG DATABASE_NAME
ARG TRYTOND_DATABASE_URI=postgresql://DB_USER:DB_PASSWORD@DB_HOSTNAME:5432/
ARG TRYTOND_ATTACHMENT_FILESTORE=True
ARG TRYTOND_DATABASE_LANGUAGE=DE
ARG TRYTOND_WEB_HOSTNAME
RUN pip3 install --break-system-packages --no-cache-dir trytond-party
RUN pip3 install --break-system-packages --no-cache-dir trytond-company
RUN pip3 install --break-system-packages --no-cache-dir trytond-country
WORKDIR /etc
RUN if [ -n "$DATABASE_NAME" ]; then trytond_import_currencies -c trytond.conf -d ${DATABASE_NAME}; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond_import_countries -c trytond.conf -d ${DATABASE_NAME}; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond_import_postal_codes -c trytond.conf -d ${DATABASE_NAME} DE; fi
WORKDIR /