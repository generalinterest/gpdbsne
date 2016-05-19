su gpadmin -l -c "echo 'source /usr/local/greenplum-db/greenplum_path.sh' >> .bash_profile"
su gpadmin -l -c "echo 'export MASTER_DATA_DIRECTORY=/data/master/gpseg-1' >> .bash_profile"

su gpadmin -l -c "gpssh-exkeys -f /home/gpadmin/gpconfigs/hostfile_gpinitsystem"

su gpadmin -l -c "gpinitsystem -a -c /home/gpadmin/gpconfigs/gpinitsystem_config --shared_buffers=12800kB"

su gpadmin -l -c "gpconfig -c gp_vmem_protect_limit -v 1024" 

su gpadmin -l -c "gpstop -M fast -r -a"


