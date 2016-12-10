CERT_EXPIRES="$(echo | openssl s_client -connect ${FQDN_NAME}:443 2> /dev/null | openssl x509 -enddate -noout | awk --field-separator = '{print $2}')"
DAYS_LEFT=$(($(( $(date --date "${CERT_EXPIRES}" +%s) - $(date +%s) ))/86400))

echo $DAYS_LEFT