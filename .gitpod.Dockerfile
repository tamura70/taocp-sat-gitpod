FROM gitpod/workspace-full

RUN brew install sbt scalaenv

RUN scalaenv install scala-2.12.5 && scalaenv global scala-2.12.5

RUN echo "unset JAVA_TOOL_OPTIONS" >>/home/gitpod/.bashrc

ENV PATH $PATH:/home/gitpod/.scalaenv/shims
ENV PATH $PATH:/workspace/taocp-sat-gitpod/knuth/bin

