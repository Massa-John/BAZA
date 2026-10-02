CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    status VARCHAR(50) DEFAULT 'offline',
    avatar VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS messages (
    id SERIAL PRIMARY KEY,
    sender_id INTEGER NOT NULL,
    receiver_id INTEGER NOT NULL,
    text TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email, status, avatar)
VALUES
    ('Алина', 'alina@example.com', 'online', 'A'),
    ('Марк', 'mark@example.com', 'away', 'M'),
    ('Соня', 'sonya@example.com', 'online', 'S'),
    ('Павел', 'pavel@example.com', 'offline', 'P'),
    ('Ева', 'eva@example.com', 'online', 'E'),
    ('Илья', 'ilya@example.com', 'busy', 'I')
ON CONFLICT DO NOTHING;

INSERT INTO messages (sender_id, receiver_id, text, sent_at)
VALUES
    (1, 2, 'Привет! Как твои планы на сегодня?', NOW()),
    (2, 1, 'Отлично. Я уже сделал первые наброски интерфейса.', NOW()),
    (1, 2, 'Круто! Давай посмотрим на цветовую палитру и общую структуру.', NOW())
ON CONFLICT DO NOTHING;
