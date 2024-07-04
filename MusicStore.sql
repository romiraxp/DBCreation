-- создаем таблицу Жанров музыки, где будет id в качестве уникального идентификатора- ключа и название жанра
create  table if not exists kindofmusic (
	kindofmusic_id SERIAL PRIMARY key,
	kindofmusic varchar(30) not null
);

-- создаем таблицу авторов музыки
create table if not exists author (
	author_id SERIAL PRIMARY key, --id автора в качестве уникального идентификатора- ключа
	author_name varchar(30) not null -- имя автора
);

--промежуточная таблица для связи жанра музыки и автора
create table if not exists kindofmusicauthor (
	kindofmusic_id INTEGER REFERENCES kindofmusic(kindofmusic_id),
	author_id INTEGER REFERENCES author(author_id),
	CONSTRAINT kofmus_author PRIMARY KEY (kindofmusic_id, author_id)
);

-- создаем таблицу альбомов
create table if not exists albums (
	album_id SERIAL PRIMARY key, --id альбома
	album_name varchar(30) not null, --название альбома
	album_year date not null check(album_year > 2000 and album_year < 2024)--год выпуска альбома
);

--промежуточная таблица для связи автора и альбомов
create table if not exists albumauthor (
	album_id INTEGER references albums(album_id),
	author_id INTEGER REFERENCES author(author_id),
	CONSTRAINT alb_author PRIMARY KEY (album_id, author_id)
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
	collection_id SERIAL PRIMARY key, --id коллекции
	collection_name varchar(30) not null, -- название сборника
	collection_year date not null check(collection_year > 2000 and collection_year < 2024) --дата выхода сборника
);

--промежуточная таблица для связи сборника, трека и альбомов
create table if not exists albumtrackauthor (
	album_id INTEGER references albums(album_id),
	track_id INTEGER REFERENCES tracks(track_id),
	collection_id INTEGER REFERENCES collection(collection_id),	
	CONSTRAINT col_track_albu PRIMARY KEY (collection_id,track_id,album_id)
);