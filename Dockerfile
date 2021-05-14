FROM python:3.9.1-buster

# set up requirements
ADD ./requirements-lock.txt ./requirements-lock.txt
RUN pip install -r ./requirements-lock.txt

# set up source
ADD ./app ./app
ADD ./main.sh ./main.sh

# set up entrypoint
ENTRYPOINT ["./main.sh"]