INSERT INTO singer(id, singer_name)
VALUES
    (1, 'Michail Krug'),
    (2, 'Mozart'),
    (3, 'Tchaikovsky'),
    (4, 'Eminem');

INSERT INTO genre(id, genre_name)
VALUES
    (1, 'chanson'),
    (2, 'classical music'),
    (3, 'Hip hop');

INSERT INTO singers_genres_list(id, singer_id, genre_id)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 2),
    (4, 4, 3);

INSERT INTO album(id, album_name, album_year)
VALUES
    (1, 'Roza', 1997),
    (2, 'The Nutcracker', 1892),
    (3, 'Relapse', 2019);

INSERT INTO singers_albums_list(id, singer_id, album_id)
VALUES
    (1, 1, 1),
    (2, 3, 2),
    (3, 4, 3);

INSERT INTO track(id, track_name, track_duration, album_id)
VALUES
    (1, 'Have a good trip', 138, 1),
    (2, 'Roza', 286, 1),
    (3, 'March', 149, 2),
    (4, 'The Battle', 198, 2),
    (5, 'Hello', 247, 3),
    (6, 'My Name Is', 268, 3);

INSERT INTO compilation(id, compilation_name, compilation_year)
VALUES
    (1, 'Tchaikovsky: The best classical music', 2019),
    (2, 'Mikhail Krug - 50 best songs', 2011),
    (3, '50 BEST SONGS Collection 2 (Mikhail Krug)', 2011),
    (4, 'EMINEM Best Songs', 2020);

INSERT INTO tracks_compilations_list(id, track_id, compilation_id)
VALUES
    (1, 1, 2),
    (2, 2, 3),
    (3, 3, 1),
    (4, 4, 1),
    (5, 5, 4),
    (6, 6, 4);