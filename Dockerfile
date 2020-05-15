FROM tensorflow/serving:latest

RUN apt update && \
  apt-get install -qq git && \
  git clone https://github.com/tensorflow/serving && \
  mkdir -p /models && \
  mv /serving/tensorflow_serving/servables/tensorflow/testdata/saved_model_half_plus_two_cpu /models/half_plus_two && \
  rm -rf /serving

WORKDIR .

EXPOSE 8501

ENV PORT 8501

ENV MODEL_NAME half_plus_two
