FROM continuumio/miniconda3:latest

RUN conda create -n images python=3.12.1 -y
RUN echo "source activate images" > ~/.bashrc
ENV PATH /opt/conda/envs/images/bin:$PATH

COPY . .

RUN pip install -r requirements.txt

SHELL ["conda", "run", "--name", "images", "/bin/bash", "-c"]

ENTRYPOINT [ "conda", "run", "--name", "images", "python", "model/train.py" ]

EXPOSE 8090