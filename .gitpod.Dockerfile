FROM gitpod/workspace-full

RUN brew install scala sbt scalaenv

RUN scalaenv install scala-2.12.5 && scalaenv global scala-2.12.5

ENV PATH $PATH:/workspace/taocp-sat-gitpod/knuth/bin
