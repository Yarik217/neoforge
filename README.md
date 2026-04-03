Запускает в Docker Minecraft NeoForge версии latest. Для запуска необходимо:<br>
1) Клонировать репозиторий<br>
```git clone https://github.com/Yarik217/neoforge```<br>
2) Построить образ. Работоспособность проверена на версии graalvm 25 и NeoForge 21.10.64 (latest для 4 декабря 2025 года), но должно работать на любых других версиях<br>
```docker build -t neoforge:latest .```<br>
3) Запустить контейнер. Для персистентности не забыть прокинуть<br>
/app/banned-ips.json<br>
/app/banned-players.json<br>
/app/config<br>
/app/logs<br>
/app/mods<br>
/app/ops.json<br>
/app/server.properties<br>
/app/user_jvm_args.txt<br>
/app/usercache.json<br>
/app/usernamecache.json<br>
/app/whitelist.json<br>
/app/world<br>
директории в хост<br>
```docker run -d neoforge:latest```
