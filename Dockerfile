FROM woahbase/alpine-libreoffice:x86_64

EXPOSE 2002

RUN \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py 

RUN \
    python3 -m venv --system-site-packages /home/alpine/venv && \
    source /home/alpine/venv/bin/activate && \
    python3 -m pip install unoserver

#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["venv/bin/unoserver", "--interface", "0.0.0.0", "--port", "2002"]
