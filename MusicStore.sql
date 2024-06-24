-- создаем таблицу Жанров музыки, где будет id в качестве уникального идентификатора- ключа и название жанра
create  table if not exists kindofmusic (
	music_id SERIAL PRIMARY key,
	kindofmusic varchar(30) not null
);
-- создаем таблицу авторов музыки
create table if not exists authors (
	author_id SERIAL PRIMARY key, --id автора в качестве уникального идентификатора- ключа
	music_id integer not null references kindofmusic(music_id), --связь с таблицей жанров 
	author_name varchar(30) not null -- имя автора
);

-- создаем таблицу альбомов
create table if not exists albums (
	album_id SERIAL PRIMARY key, --id альбома
	author_id integer not null references authors(author_id), --id авторов альбома
	album_name varchar(30) not null, --название альбома
	album_year date not null --год выпуска альбома
);

-- создаем таблицу треков
create table if not exists tracks (
	track_id SERIAL PRIMARY key, --id трека
	album_id integer not null references albums(album_id), --id альбома
	track_name varchar(30) not null, -- название трека
	track_time varchar(5) not null --продолжительность трека
);

-- создаем таблицу сборник
create table if not exists collection (
	collect_id SERIAL PRIMARY key, --id коллекции
	track_id integer not null references tracks(track_id), --id трека
	album_id integer not null references albums(album_id), --id альбома
	collect_name varchar(30) not null, -- название сборника
	release_date date not null --дата выхода сборника
);