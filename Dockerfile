FROM --platform=linux/arm64 public.ecr.aws/q3h7b4o8/heliocloud/helio-notebook:2024.05.15

# ADD https://apllinuxdepot.jhuapl.edu/linux/APL-root-cert/JHUAPL-MS-Root-CA-05-21-2038-B64-text.cer \
#     /usr/local/share/ca-certificates/JHUAPL-MS-Root-CA-05-21-2038-B64-text.crt
# ADD https://apllinuxdepot.jhuapl.edu/linux/certs/JHUAPL-MS-DOM1-CA-05-21-2028.pem \
#     /usr/local/share/ca-certificates/JHUAPL-MS-DOM1-CA-05-21-2028.crt
# RUN update-ca-certificates

# ENV PIP_CERT=/etc/ssl/certs/ca-certificates.crt
# ENV REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
# ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

WORKDIR /notebook
COPY . /notebook

RUN pip install --default-timeout=100 -r requirements.txt

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
