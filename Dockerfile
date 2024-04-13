FROM python:3.13.0a6-bookworm
RUN apt-get update &&\
    /usr/local/bin/python3 -m pip install --upgrade pip &&\
    /usr/local/bin/python3 -m pip install --upgrade setuptools &&\
    adduser tirth
ENV PATH="/home/tirth/.local/bin:${PATH}"
ENV QR_CODE_IMAGE_DIRECTORY="images"
ENV QR_CODE_DEFAULT_URL="https://hub.docker.com/r/tirthxpatel/qrprog"
ENV QR_CODEDEFAULT_FILE_NAME="qrprog.png"
WORKDIR /home/tirth
COPY --chown=tirth:tirth . .
RUN pip3 install -r requirements.txt
# runs the python program as tirth
ENTRYPOINT ["runuser", "-u", "tirth", "--", "python3"]
CMD ["main.py"]