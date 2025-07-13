CREATE TABLE IF NOT EXISTS weather_data (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  weatherDate TEXT,
  temperature TEXT,
  condition TEXT,
  location TEXT
);