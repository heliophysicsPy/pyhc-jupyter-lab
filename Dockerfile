FROM --platform=linux/arm64 public.ecr.aws/q3h7b4o8/heliocloud/helio-notebook:2024.05.15

WORKDIR /notebook
COPY . /notebook

RUN pip install --default-timeout=100 -r requirements.txt

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
