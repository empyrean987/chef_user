# chef_user cookbook

This repository is used to manage users on instances.

This cookbook leverages the following cookbook from the community supermarket.

https://github.com/chef-cookbooks/users

# Deployment

To deploy and use this cookbook you will first need to install the following using terraform cloud init shown here or do it manually as shown below.

git clone https://github.com/empyrean987/chef_user.git /home/ubuntu/chef_user

curl -o /home/ubuntu/chef_13.6.4-1_amd64.deb https://packages.chef.io/files/stable/chef/13.6.4/ubuntu/16.04/chef_13.6.4-1_amd64.deb

curl -o /home/ubuntu/chefdk_2.4.17-1_amd64.deb https://packages.chef.io/files/stable/chefdk/2.4.17/ubuntu/16.04/chefdk_2.4.17-1_amd64.deb"

dpkg -i /home/ubuntu/chef_13.6.4-1_amd64.deb

dpkg -i /home/ubuntu/chefdk_2.4.17-1_amd64.deb

chef-solo -c /home/ubuntu/chef_user/chef-solo/solo.rb

# ADD

To ADD a user you will need to add a json file in the following directory and run chef.

ubuntu@ip-192-168-0-133:~$ cd /home/ubuntu/chef_user/chef-solo/data_bags/users/

ubuntu@ip-192-168-0-133:~/chef_user/chef-solo/data_bags/users$ cat john_doe.json

{

  "id": "john_doe",

  "username": "john.doe",

  "ssh_keys": ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3HzImmoJp12PhSwAtqeXL5t4cfy9uHzKXYYWbXB8tD2dPCqTKJHO0h2v5g7ZKHwCvyziCk8C3zJUJaJqXnQuV6PmVR6Ww+dVgjcrjIv+D8MPLN8nAGzt2RPoFFHslXSsjwoYhWU0tD14oj7NmXZ0iOdNJdc9kJZTMADJMprjtKxAYLVdhpWM5ELfgjy6ubK4P+V6Fx7G5tegjim7/JEtVYhmnM48U6BCkmGgAX10fWNmxv2cMpdlEuC/UdwdeOPYMKsC9tLgMsH+EccELNkptHu2PZoi2mX4ACL/HnTuSQmphs1dcYgDZeVQG1r5jNArfLJhIrzt0aR8XtGUDe5R3hNPzUjtwDyKWeAhjH8FdlHtOA4mBbrP4CmZLmXcWEAdGXSNbAiTI2xdTnpDmWxHzT4asNsdhxXHhJR5go6DWvC3Eg81NefA5kgIqOOX+QNpBUO0JlTgmA/frNj4p1scGVf9gjMqWzDq9WFzgepJDJT+JlxNIHFA/F9CDbWjJiOLzlBM5Tqmftgs6KHvL+10nWNlGoN1F4AQ4BBi/TTYBXqTm3H3A/DBs0pC9mx497SiI6TEbRCHdzsfpclpS8a4OuZllb/EgArfWMQM+uS/oRpSVd8dxoUDlK2JCZVDEVVUmwZnL1ET6OIPXx1+9XjdZJtrdA95zUFGjy6nIATBCoQ=="],

  "groups": ["chefusers"],

  "shell": "\/bin\/bash",

  "comment": "John Doe",

  "action": "create",

  "home": "/home/john.doe",

  "manage_home": true

}

ubuntu@ip-192-168-0-133:~/chef_user/chef-solo/data_bags/users$

root@ip-192-168-0-133:~/chef_user/chef-solo/data_bags/users# chef-solo -c /home/ubuntu/chef_user/chef-solo/solo.rb

Starting Chef Client, version 13.6.4

resolving cookbooks for run list: ["chef_user"]

Synchronizing Cookbooks:

  - chef_user (0.1.0)

  - users (5.4.0)

Installing Cookbook Gems:

Compiling Cookbooks...

[2018-10-28T00:04:11+00:00] WARN: The default users recipe does nothing. See the readme for information on using the users resources

[2018-10-28T00:04:11+00:00] WARN: The default users recipe does nothing. See the readme for information on using the users resources

Converging 3 resources

Recipe: chef_user::default

  * users_manage[chefusers] action remove (up to date)

  * users_manage[chefusers] action create

    * group[john.doe] action create (skipped due to only_if)

    * linux_user[john.doe] action create

      - create user john.doe

    * directory[/home/john.doe/.ssh] action create

      - create new directory /home/john.doe/.ssh

      - change mode from '' to '0700'

      - change owner from '' to 'john.doe'

    * template[/home/john.doe/.ssh/authorized_keys] action create

      - create new file /home/john.doe/.ssh/authorized_keys

      - update content in file /home/john.doe/.ssh/authorized_keys from none to 737cbf

      - suppressed sensitive resource

      - change mode from '' to '0600'

      - change owner from '' to 'john.doe'

    * group[chefusers] action create

      - alter group chefusers

      - replace group members with new list of members

  * directory[/home/ubuntu/py_user] action create (up to date)

  * git[/home/ubuntu/py_user] action sync (up to date)

Running handlers:

Running handlers complete

Chef Client finished, 5/9 resources updated in 01 seconds

root@ip-192-168-0-133:~/chef_user/chef-solo/data_bags/users#

# Delete

To DELETE a user you will need to modify the users json file in the following directory and run chef.

root@ip-192-168-0-133:~/chef_user/chef-solo/data_bags/users# more john_doe.json

{

  "id": "john_doe",

  "username": "john.doe",

  "ssh_keys": ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3HzImmoJp12PhSwAtqeXL5t4cfy9uHzKXYYWbXB8tD2dPCqTKJHO0h2v5g7ZKHwCvyziCk8C3zJUJaJqXnQuV6PmVR6Ww+dVgjcrjIv+D8MPLN8nAGzt2RPoFFHslXSsjwoYhWU0tD14oj7NmXZ0iOdNJdc9kJZTMADJMprjtKxAYLVdhpWM5ELfgjy6ubK4P+V6Fx7G5tegjim7
/JEtVYhmnM48U6BCkmGgAX10fWNmxv2cMpdlEuC/UdwdeOPYMKsC9tLgMsH+EccELNkptHu2PZoi2mX4ACL/HnTuSQmphs1dcYgDZeVQG1r5jNArfLJhIrzt0aR8XtGUDe5R3hNPzUjtwDyKWeAhjH8FdlHtOA4mBbrP4CmZLmXcWEAdGXSNbAiTI2xdTnpDmWxHzT4asNsdhxXHhJR5go6DWvC3Eg81NefA5kgIqOOX+QNpBUO0JlTgmA/frNj4p1scGVf
9gjMqWzDq9WFzgepJDJT+JlxNIHFA/F9CDbWjJiOLzlBM5Tqmftgs6KHvL+10nWNlGoN1F4AQ4BBi/TTYBXqTm3H3A/DBs0pC9mx497SiI6TEbRCHdzsfpclpS8a4OuZllb/EgArfWMQM+uS/oRpSVd8dxoUDlK2JCZVDEVVUmwZnL1ET6OIPXx1+9XjdZJtrdA95zUFGjy6nIATBCoQ=="],

  "groups": ["chefusers"],

  "shell": "\/bin\/bash",

  "comment": "John Doe",

  "action": "remove",

  "home": "/home/john.doe",

  "manage_home": true
}

root@ip-192-168-0-133:~/chef_user/chef-solo/data_bags/users#

root@ip-192-168-0-133:~/chef_user/chef-solo/data_bags/users# chef-solo -c /home/ubuntu/chef_user/chef-solo/solo.rb

Starting Chef Client, version 13.6.4

resolving cookbooks for run list: ["chef_user"]

Synchronizing Cookbooks:

  - users (5.4.0)

  - chef_user (0.1.0)

Installing Cookbook Gems:

Compiling Cookbooks...

[2018-10-28T00:13:15+00:00] WARN: The default users recipe does nothing. See the readme for information on using the users resources

[2018-10-28T00:13:15+00:00] WARN: The default users recipe does nothing. See the readme for information on using the users resources

Converging 3 resources

Recipe: chef_user::default

  * users_manage[chefusers] action remove

    * linux_user[john.doe] action remove

      - remove user john.doe

  * users_manage[chefusers] action create

    * group[chefusers] action create (up to date)

     (up to date)

  * directory[/home/ubuntu/py_user] action create (up to date)

  * git[/home/ubuntu/py_user] action sync (up to date)

Running handlers:

Running handlers complete

Chef Client finished, 2/6 resources updated in 01 seconds

root@ip-192-168-0-133:~/chef_user/chef-solo/data_bags/users#