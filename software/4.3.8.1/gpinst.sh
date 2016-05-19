sed -i s/"more << EOF"/"cat << EOF"/g /software/$GPDB_PACKAGE/greenplum-db*.bin
echo -e "yes\n\nyes\nyes\n" |/software/$GPDB_PACKAGE/greenplum-db*.bin

sed -i s/"more <<-EOF"/"cat <<-EOF"/g /software/$GPDB_PACKAGE/greenplum-cc-web*.bin
echo -e "yes\n\nyes\nyes\n" |/software/$GPDB_PACKAGE/greenplum-cc-web*.bin

chown -R gpadmin:gpadmin /usr/local/greenplum-db*
chown -R gpadmin:gpadmin /usr/local/greenplum-cc-web*
