FROM aosatinsky/pp-ser

ADD pingpong-wallet /home/root/pingpong-wallet
ADD .npmrc /home/root/.npmrc

RUN chown -R root:root /home/root/pingpong-wallet

RUN ls -latr /home/root/pingpong-wallet
RUN cd /home/root/pingpong-wallet && yarn install

RUN ls -latr /home/root/pingpong-wallet
RUN cd /home/root/pingpong-react && sh ../upgrade-dependency.sh pingpong-common-server && sh ../upgrade-dependency.sh pingpong-types && yarn install && yarn build

RUN rm -rf /home/root/pingpong-wallet
RUN rm -rf /home/root/.npmrc