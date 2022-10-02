FROM node:16.17.1-alpine3.15 as development

WORKDIR /usr/src
COPY . /usr/src/

RUN npm install

FROM development as builder

RUN npm run build

FROM builder as production

COPY --from=builder /usr/src/.svelte-kit/build /usr/src/
COPY --from=builder /usr/src/package.json /usr/src/package-lock.json /usr/src/
