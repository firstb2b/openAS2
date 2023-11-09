#!/bin/sh

PARTNERSHIPS_FILE="/opt/openas2/config/partnerships.xml"
if [ ! -e /opt/openas2/config/config.xml ]
    then
        echo "The config folder is empty, it will be populated by the template..."
        cp -a config_template/* config/
        echo "Done!"
fi

# Perform XML substitution
sed "s/\${RECEIVING_PARTNERSHIP_NAME}/$RECEIVING_PARTNERSHIP_NAME/g" "$PARTNERSHIPS_FILE" > /tmp/tmpfile && cp -p /tmp/tmpfile "$PARTNERSHIPS_FILE"
sed "s/\${SENDING_PARTNERSHIP_NAME}/$SENDING_PARTNERSHIP_NAME/g" "$PARTNERSHIPS_FILE" > /tmp/tmpfile && cp -p /tmp/tmpfile "$PARTNERSHIPS_FILE"
sed "s/\${PARTNER_NAME}/$PARTNER_NAME/g" "$PARTNERSHIPS_FILE" > /tmp/tmpfile && cp -p /tmp/tmpfile "$PARTNERSHIPS_FILE"
sed "s/\${PARTNER_AS2_ID}/$PARTNER_AS2_ID/g" "$PARTNERSHIPS_FILE" > /tmp/tmpfile && cp -p /tmp/tmpfile "$PARTNERSHIPS_FILE"

$(dirname $0)/start-openas2.sh
