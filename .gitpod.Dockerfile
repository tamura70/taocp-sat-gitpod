FROM gitpod/workspace-full

RUN brew sbt scalaenv

RUN scalaenv install scala-2.12.5 && scalaenv global scala-2.12.5

ENV PATH $PATH:/home/gitpod/.scalaenv/shims
ENV PATH $PATH:/workspace/taocp-sat-gitpod/knuth/bin
