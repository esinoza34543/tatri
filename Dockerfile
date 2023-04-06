FROM python:3.10

WORKDIR /revive_autoheaven

COPY requirements.txt ./

RUN pip install -r requirements.txt

copy . .

CMD ["python3", "bot.py"]
