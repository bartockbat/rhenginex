# Red Hat Ent 7 nginx
An nginx docker config using Red Hat Enterprise 7.x

Please refer to the comments in the Dockerfile and config files for instructions

to build:

1. git clone https://github.com/bartockbat/rhenginex.git
2. cd rhenginex
3. sudo docker build -t rhel7_nginx .
4. to run simply sudo docker run -d nginx_rhel7
5. if you forget to modify the nginx.conf params, simply attach to the running contianer and modify
