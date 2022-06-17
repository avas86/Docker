создание контейнера
`https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html`
docker run -p 8888:8888 jupyter/scipy-notebook:6b49f3337709 

зайти в контейнер
`https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html`
docker exec -it dfafb69f0559 bash 

скопировать дата в контейнер
`https://stackoverflow.com/questions/22907231/how-to-copy-files-from-host-to-docker-container`
docker cp wine.data dfafb69f0559:/home/jovyan/wine.data 


используем volume чтобы файлы сохранялись локально
`https://docs.docker.com/engine/reference/commandline/run/#mount-volume--v---read-only`
docker run -v /Users/avas/Desktop/docker:/home/jovyan -p 8888:8888 jupyter/scipy-notebook:6b49f3337709 

для того чтобы устанавливать библиотеки и они сохрянялись при закрытии контейнера создадим dockerfile
перед запуском необходимо сделать build в текущей директории

docker build .

после необходимо заменить внешний билд на только что созданный 
docker run -v /Users/avas/Desktop/docker:/home/jovyan -p 8888:8888 715a5163dbbb7961637a876d7f74815d4a28f9c59a03ad08b9957342a9f45be9

чтобы не писать огромные хэши нового билда можно указать свое имя 
docker build -t my_notebook .

docker run -v /Users/avas/Desktop/docker:/home/jovyan -p 8888:8888 my_notebook

docker-compose
нужен для того чтобы запускать несколько сервисов одновременно, например jupyter + postgres
`https://docs.docker.com/compose/compose-file/compose-file-v3/`

docker-compose up
docker-compose down

postgres
добавляем параметры в yml
`https://hub.docker.com/_/postgres/`

пересобрать настройки контейнера
docker-compose build --pull

узнать ip адрес в контейнере
docker inspect c24a1e7cf82e
