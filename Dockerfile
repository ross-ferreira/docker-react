# 1.Build Phase
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
# We dont need a working directory so a copy of the code is fine for Production
COPY . .
RUN npm run build

# 2.Run Phase
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
