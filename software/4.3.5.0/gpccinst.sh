su gpadmin -l -c "echo 'source /usr/local/greenplum-cc-web/gpcc_path.sh' >> .bash_profile"

su gpadmin -l -c "gpssh-exkeys -f /home/gpadmin/gpconfigs/hostfile_gpinitsystem"

su gpadmin -l -c "gpperfmon_install --enable --password changeme --port 5432"

su gpadmin -l -c "gpstop -M fast -r -a"

source /usr/local/greenplum-db/greenplum_path.sh
source /usr/local/greenplum-cc-web/gpcc_path.sh
gpssh-exkeys -f /home/gpadmin/gpconfigs/hostfile_gpinitsystem
gpccinstall -f /home/gpadmin/gpconfigs/hostfile_gpinitsystem
chown -R gpadmin:gpadmin /usr/local/greenplum-cc-web*

exit
su gpadmin -l -c "echo -e 'prod3\nn\nprod3\n\n\nN\nN\nN\nN\n'|gpcmdr --setup"
# su gpadmin -l -c "gpcmdr --setup gpdbsne --config_file /software/gpcc_config.cfg"


