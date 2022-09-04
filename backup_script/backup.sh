# !/bin/bash
backup_files="/home/ec2-user/ansible2/system_files"
dest="/home/ec2-user/ansible2"

#command to name the file as time stamp
current_time=$(date "+%Y%m%d%H%M%S").tgz

# tar command used to create a  backup the files
tar -cvzf $dest/$current_time /home/ec2-user/ansible2/system_files/file*

# the backedup  file pushed to s3 bucket
aws s3 cp /home/ec2-user/ansible2/$current_time  s3://faizanunbalteen




# if the backup is pushed to S3 delete system backup file
if [ $? -eq 0 ]
then
  rm -rf $dest/$current_time
fi






