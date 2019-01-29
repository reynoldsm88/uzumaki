import os
import argparse

hdfs_config_dir = os.environ[ "HADOOP_PREFIX" ] + "/etc/hadoop"

def write_core_site( hostname ):
	core_site_template = read_file_as_string( "/tmp/core-site-template.xml" )
	core_site_config = core_site_template.replace("${hostname}", hostname )
	write_file( hdfs_config_dir + "/core-site.xml", core_site_config )

def write_hdfs_site( hostname ):
    core_site_template = read_file_as_string( "/tmp/hdfs-site-template.xml" )
    core_site_config = core_site_template.replace( "${hostname}", hostname )
    write_file( hdfs_config_dir + "/hdfs-site.xml", core_site_config )

def read_file_as_string( filename ):
	file = open( filename )
	return file.read()

def write_file( path, content ):
    file = open( path, "w" )
    file.write( content )
    file.close()

def configure_hdfs():
    parser = argparse.ArgumentParser()
    parser.add_argument( "-hostname" )
    args = parser.parse_args()
    hostname = args.hostname 
    write_core_site( hostname )
    write_hdfs_site( hostname )

if __name__ == "__main__":
    configure_hdfs()
