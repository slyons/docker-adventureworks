FROM mcr.microsoft.com/mssql/server:2022-latest
ARG BAK_FILE
ARG SA_PASSWORD
ENV SA_PASSWORD=${SA_PASSWORD}
ENV ACCEPT_EULA=Y
EXPOSE 1433
WORKDIR /
COPY $BAK_FILE ./adventureworks.bak
COPY ./install.sh .
COPY ./ready.sh .
COPY ./startup.sh .
CMD /bin/bash ./startup.sh