FROM ubuntu:latest
FROM golang:latest

WORKDIR /code/
ADD . /code/
COPY recon.sh /code/
RUN chmod +x /code/recon.sh

RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
RUN go install -v github.com/tomnomnom/anew@latest
RUN go install -v github.com/owasp-amass/amass/v4/...@master
RUN go install -v github.com/tomnomnom/assetfinder@latest
RUN go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
RUN go install -v github.com/tomnomnom/waybackurls@latest
RUN go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest


CMD ["/code/recon.sh"]
