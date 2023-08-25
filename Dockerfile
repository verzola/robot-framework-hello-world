FROM mcr.microsoft.com/playwright:v1.34.0-jammy
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
USER root
RUN apt-get update
RUN apt-get install -y python3-pip gcc
USER pwuser
COPY Pipfile Pipfile.lock .
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install pipenv
RUN python3 -m pipenv install --dev --system --deploy
RUN ~/.local/bin/rfbrowser init
ENV NODE_PATH=/usr/lib/node_modules
ENV PATH="/home/pwuser/.local/bin:${PATH}"
WORKDIR /app
