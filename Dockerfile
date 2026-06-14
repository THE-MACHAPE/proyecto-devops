# 1. Usar una imagen oficial de Node.js como base (versión 22)
FROM node:22-alpine

# 2. Crear y definir el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# 3. Copiar los archivos de configuración de dependencias
COPY package*.json ./

# 4. Instalar solo las dependencias de producción (evita instalar Jest dentro del contenedor)
RUN npm ci --only=production

# 5. Copiar el resto del código de la aplicación
COPY . .

# 6. Exponer el puerto en el que corre tu API (ajústalo si tu server.js usa otro, ej: 3000 o 8080)
EXPOSE 3000

# 7. Comando para arrancar la aplicación
CMD [ "node", "server.js" ]
