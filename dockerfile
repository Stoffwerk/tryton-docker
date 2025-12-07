FROM tryton/tryton:7.6-office
ENV DB_HOSTNAME=
ENV DB_USER=
ENV DB_PASSWORD=
ENV DATABASE_NAME=
ENV TRYTOND_CONFIG=/etc/trytond.conf
ENV TRYTOND_DATABASE_URI=postgresql://DB_USER:DB_PASSWORD@DB_HOSTNAME:5432/?dbname=DATABASE_NAME
ENV TRYTOND_ATTACHMENT_FILESTORE=True
ENV TRYTOND_DATABASE_LANGUAGE=DE
ENV TRYTOND_WEB_HOSTNAME=
# USER root
# RUN trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -m --update-modules-list
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -m --update-modules-list; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u company --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u country --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u account --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u party_relationship --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u bank --activate-dependencies; fi
# Product
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u product --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u product_image_attribute --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u product_cost_warehouse --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u product_cost_fifo --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u product_cost_history --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u product_measurements --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u product_kit --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u product_price_list --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u product_price_list_dates --activate-dependencies; fi
# Purchase
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u purchase --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u purchase_amendment --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u purchase_history --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u purchase_request --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u purchase_secondary_unit --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u purchase_shipment_cost --activate-dependencies; fi
# Sale
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u sale --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u sale_amendment --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u sale_complaint --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u sale_discount --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u sale_gift_card --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u sale_history --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u sale_payment --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u sale_price_list --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u sale_promotion --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u sale_promotion_coupon --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u sale_gift_card --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u sale_secondary_unit --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u sale_shipment_cost --activate-dependencies; fi
# Stock
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u stock_inventory_location --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u stock_package_shipping --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u stock_secondary_unit --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u stock_shipment_cost_weight --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u stock_supply --activate-dependencies; fi
# Carrier
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u carrier --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u carrier_weight --activate-dependencies; fi
# Customs
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u customs --activate-dependencies; fi
# Shopify
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u web_shop_shopify --activate-dependencies; fi
# Account
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u account_tax_cash --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u account_deposit --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u account_export --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u account_invoice_correction --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u account_invoice_history --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u account_invoice_secondary_unit --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u account_invoice_stock --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u account_payment --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u account_product --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u account_rule --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u account_statement --activate-dependencies; fi
#RUN pip3 install --break-system-packages --no-cache-dir gf-account-de-skr04
RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -m --update-modules-list; fi
#RUN if [ -n "$DATABASE_NAME" ]; then trytond-admin -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} -u gf-account-de-skr04 --activate-dependencies; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond_import_currencies -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME}; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond_import_countries -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME}; fi
RUN if [ -n "$DATABASE_NAME" ]; then trytond_import_postal_codes -c ${TRYTOND_CONFIG} -d ${DATABASE_NAME} DE; fi
WORKDIR /var/lib/trytond
USER trytond