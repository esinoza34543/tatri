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
gunicorn app:app & python3 bot.py
