FROM python:3.8-slim-buster

RUN apt update && apt upgrade -y
RUN apt install git -y
COPY requirements.txt /requirements.txt

RUN cd /
RUN pip3 install -U pip && pip3 install -U -r requirements.txt
RUN mkdir /revive_autoheaven
WORKDIR /revive_autoheaven
COPY start.sh /start.sh
if [ -z $UPSTREAM_REPO ]
then
  echo "Cloning main Repository"
  git clone https://github.com/Alucardx2/revive_autoheaven.git /revive_autoheaven
else
  echo "Cloning Custom Repo from $UPSTREAM_REPO "
  git clone https://github.com/Alucardx2/revive_autoheaven.git /revive_autoheaven
fi
cd /revive_autoheaven
pip3 install -U -r requirements.txt
echo "Starting TargetX...."
CMD gunicorn app:app & python3 bot.py
