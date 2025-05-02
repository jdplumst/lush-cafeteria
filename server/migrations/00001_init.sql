-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS user (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL, 
    email TEXT NOT NULL, 
    password TEXT NOT NULL
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS food (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL, 
    img TEXT NOT NULL, 
    description TEXT NOT NULL, 
    price INTEGER NOT NULL
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS drink (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL, 
    img TEXT NOT NULL, 
    description TEXT NOT NULL, 
    price INTEGER NOT NULL
);
-- +goose StatementEnd

-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS meal (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL, 
    img TEXT NOT NULL, 
    description TEXT NOT NULL, 
    price INTEGER NOT NULL
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE user
-- +goose StatementEnd

-- +goose StatementBegin
DROP TABLE food
-- +goose StatementEnd

-- +goose StatementBegin
DROP TABLE drink
-- +goose StatementEnd

-- +goose StatementBegin
DROP TABLE meal
-- +goose StatementEnd  
