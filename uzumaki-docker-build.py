import os
import subprocess
import wget

hadoop_distro_file="hdfs/distro/hadoop-2.9.2.tar.gz"

def download_hadoop_tar():
	hadoop_distro_url = subprocess.check_output( "cat hdfs/distro/hadoop-download.txt", shell = True ).decode( "utf-8" ).strip()
	print( "Downloading a Hadoop binary distribution from " + hadoop_distro_url )
	print( "This file will not be versioned in the repository" )
	wget.download( hadoop_distro_url, hadoop_distro_file )

def distro_tar_exists():
	return os.path.exists( hadoop_distro_file ) == True

def partial_distro_tmp_file_exists():
	ls_distro = os.listdir( "hdfs/distro" )
	has_tmp_file = False

	for dir in ls_distro:
		if( dir.endswith( ".tmp" ) ):
			return  "hdfs/distro/" + dir

	return has_tmp_file

def build():
	partial_download = partial_distro_tmp_file_exists()

	if( partial_download != False ):
		print( "Looks like a partial download was attempted. Deleting this now.")
		os.remove( partial_download )

	if( distro_tar_exists() == False ):
		download_hadoop_tar()

	os.system( "docker build -f ./hdfs/docker/parent.dockerfile -t reynoldsm88/uzumaki-parent hdfs" )
	os.system( "docker build -f ./hdfs/docker/namenode.dockerfile -t reynoldsm88/uzumaki-namenode hdfs" )
	os.system( "docker build -f ./hdfs/docker/datanode.dockerfile -t reynoldsm88/uzumaki-datanode hdfs" )

if __name__ == "__main__":
    build()