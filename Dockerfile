FROM ubuntu
LABEL dirane (diranetafen@yahoo.com)
RUN apt-get update
#RUN apt-get install -y nginx
#DEBIAN_FRONTEND=noninteractive pour eviter à git de ne pas poser de question lors de l'installation
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git

# aprés avoir clone dans repertoire locale static-website-example 
# nous allons faire une copie dans l'image
#ADD static-website-example/ /var/www/html/

# nous allons git clone directement sans faire la copie comme le cas précedant
# supprime le contenu du repertoire static-website-example
RUN rm -Rf /var/www/html/*
#clone
RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]