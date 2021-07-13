FROM gitpod/workspace-full

# Docker build does not rebuild an image when a base image is changed, increase this counter to trigger it.
# ENV TRIGGER_REBUILD 2

RUN brew install scala sbt

ENV TZ=Asia/Tokyo

# scala
# RUN brew install scalaenv
# RUN scalaenv install scala-2.12.5 && scalaenv global scala-2.12.5

# sbt
# RUN curl -LO https://github.com/sbt/sbt/releases/download/v1.4.3/sbt-1.4.3.zip \
#     && unzip sbt-1.4.3.zip

# RUN echo "unset JAVA_TOOL_OPTIONS" >>/home/gitpod/.bashrc

# ENV PATH $PATH:/home/gitpod/.scalaenv/shims
# ENV PATH $PATH:/home/gitpod/sbt/bin
ENV PATH $PATH:/workspace/taocp-sat-gitpod/knuth/bin
