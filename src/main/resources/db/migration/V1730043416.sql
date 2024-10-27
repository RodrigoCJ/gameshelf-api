CREATE TABLE users (
    user_id bigint primary key,
    name varchar(100) not null,
    email varchar(100) not null,
    birth_date date,
    password varchar(500),
    enabled boolean,
    created timestamp,
    updated timestamp
);

CREATE TABLE platforms (
    platform_id bigint primary key,
    name varchar(100) not null,
    type varchar(100),
    platform_api_id varchar(100),
    enabled boolean,
    created timestamp,
    updated timestamp
);

CREATE TABLE platforms_users (
    platform_users_id bigint primary key,
    platform_id bigint,
    user_id bigint,
    nick varchar(200) not null,
    enabled boolean,
    created timestamp,
    updated timestamp,
    CONSTRAINT fk_platform_user_platform FOREIGN KEY (platform_id) REFERENCES platforms (platform_id),
    CONSTRAINT fk_platform_user_user FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE games_users (
    games_users_id bigint primary key,
    platform_id bigint,
    user_id bigint,
    game_api_id bigint,
    rating decimal(3, 1),
    status varchar(100),
    review varchar(1000),
    created timestamp,
    updated timestamp,
    CONSTRAINT fk_game_user_platform FOREIGN KEY (platform_id) REFERENCES platforms (platform_id),
    CONSTRAINT fk_game_user_user FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE wishes (
    wish_id bigint primary key,
    platform_id bigint,
    user_id bigint,
    game_api_id bigint,
    created timestamp,
    CONSTRAINT fk_wish_platform FOREIGN KEY (platform_id) REFERENCES platforms (platform_id),
    CONSTRAINT fk_wish_user FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE preferences (
    preference_id bigint primary key,
    user_id bigint,
    idiom varchar(20),
    created timestamp,
    updated timestamp,
    CONSTRAINT fk_preference_user FOREIGN KEY (user_id) REFERENCES users (user_id)
);