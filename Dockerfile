FROM jupyter/scipy-notebook:6b49f3337709

USER root

RUN sudo apt update -y && \
    sudo apt upgrade -y && \
    sudo apt install -y build-essential libpq-dev

# RUN sudo apt-get update && \
#     sudo apt-get install libpq-dev 

USER $NB_UID

# RUN pip install xgboost psycopg2-binary
RUN pip install psycopg2-binary --no-binary psycopg2-binary xgboost