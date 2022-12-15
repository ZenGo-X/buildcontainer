FROM aosatinsky/pp-ser

ARG ARTIFACTORY_TOKEN
ENV ARTIFACTORY_TOKEN=$ARTIFACTORY_TOKEN

ADD pingpong-wallet /home/root/pingpong-wallet
RUN cp /home/root/pingpong-wallet/.npmrc.ci /home/root/pingpong-wallet/.npmrc

#RUN printenv

RUN chown -R root:root /home/root/pingpong-wallet

#RUN ls -latr /home/root/pingpong-wallet
RUN cd /home/root/pingpong-wallet && yarn install

#RUN ls -latr /home/root/pingpong-wallet
RUN cd /home/root/pingpong-wallet/pingpong-react && sh ../upgrade-dependency.sh pingpong-common-server && sh ../upgrade-dependency.sh pingpong-types && yarn install && yarn build

RUN rm -rf /home/root/pingpong-wallet
#RUN rm -rf /home/root/.npmrc