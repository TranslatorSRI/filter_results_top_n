# leverage the renci python base image
FROM renciorg/renci-python-image:v0.0.1

# set up working directory
RUN mkdir /home/nru
WORKDIR /home/nru

# make sure all is writeable for the nru USER later on
RUN chmod -R 777 .

# set up requirements
ADD ./requirements.txt ./requirements.txt
RUN pip install -r ./requirements.txt

USER nru

# set up source
ADD ./app ./app
ADD ./main.sh ./main.sh

EXPOSE 8080

# set up entrypoint
ENTRYPOINT ["bash", "main.sh"]
