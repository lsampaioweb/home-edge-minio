# Home Edge MinIO
Repository with the settings used on my MinIO on the Home environment.

Set a alias to the MinIO instance
  mc alias set local http://127.0.0.1:9000
  mc admin info local

Restart MinIO.
  mc admin service restart local

List all policies.
  mc admin policy list local

Get the permissions of a policy.
  mc admin policy info local consoleAdmin
  mc admin policy info local consoleAdmin --policy-file newpolicy.json
  mc admin policy info local restic-backup

Create a policy.
  mc admin policy create local policyName policyfile.json

List all groups.
  mc admin group list local

Get the details about a group.
  mc admin group info local cn=minio-admins,ou=groups,dc=homelab
  mc admin group info local cn=minio-manager,ou=groups,dc=homelab
  mc admin group info local cn=minio-team,ou=groups,dc=homelab

List all users.
  mc admin user list local

Get the details about an user.
  mc admin user info local cn=restic,ou=people,dc=homelab

Create a Bucket
  mc mb local/MyBucket

Copy a file to the Bucket
  touch test.txt
  mc cp test.txt local/MyBucket

List the contents of a Bucket
  mc ls local/MyBucket

Expire objects after a specified number of calendar days
  mc ilm rule add --expire-days

Transition objects to that tier after a specified number of calendar days
  mc ilm rule add --transition-days

Resynchronize the remote target
  mc replicate resync

