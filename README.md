# Ubuntu Server setup
A repo for an ubuntu $HOME

## config environment
update ~/.bash_aliases


## update package manager
```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove
```


## install main languages
```bash
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs npm build-essential
sudo ln -s /usr/bin/nodejs /usr/bin/node
```


## prepare node server
```bash
sudo npm install -g pm2
```


## install git & setup github
`sudo apt-get install git-core`
update ~/.ssh/config

generate key and upload to github:
`ssh-keygen -t rsa -C "<email>"`


## install databases
`sudo apt-get install -y postgresql redis-server`

config postgres:
`sudo -u postgres psql`

```psql
create database <database>;
create user <username> with password '<password>';
alter database <database> owner to <username>;
```


## database backups
`crontab -e`
update with crontab template file

`mkdir ~/<project>_backup`

config AWS:
- create s3 bucket
- create IAM user
```policy
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject"
            ],
            "Resource": "arn:aws:s3:::<project>.backup/*"
        }
    ]
}
```

config s3-backup:
`npm install`
update ~/s3-backup/config.json


## install nginx
```bash
sudo apt-get install -y nginx
vi /etc/nginx/sites-available/<project>
```
update with nginx_project template file

```
rm /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/<project> /etc/nginx/sites-enabled/<project>
sudo service nginx restart
```

## upstart
/etc/init/<project>
