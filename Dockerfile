FROM ubuntu:23.10
RUN apt update
RUN apt install gpg wget sudo libjson-glib-1.0-0 -y

RUN wget -qO - https://deb.tableplus.com/apt.tableplus.com.gpg.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/tableplus-archive.gpg > /dev/null
RUN echo "deb [arch=amd64] https://deb.tableplus.com/debian/22 tableplus main" | sudo tee /etc/apt/sources.list.d/tableplus.list

RUN sudo apt update
RUN sudo apt install tableplus -y

