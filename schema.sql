CREATE TABLE IF NOT EXISTS site_content (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  updated_at TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS analytics (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  event TEXT NOT NULL,
  created_at TEXT NOT NULL
);
INSERT OR IGNORE INTO site_content (key, value, updated_at)
VALUES ('main', '{"theme":{"bg":"#0c0c10","panel":"#17171e","accent":"#d8b779","text":"#f8f5ef","muted":"#b4b0ba"},"hero":{"eyebrow":"A curated visual experience","title":"Discover Something Extraordinary.","text":"Explore a handpicked collection of inspiring visuals and discover more through our featured partner.","image":"https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?auto=format&fit=crop&w=1100&q=85","buttonText":"Explore Collection →","buttonUrl":"#gallery"},"gallery":{"title":"Explore the Gallery","intro":"Select an image to learn more.","items":[]},"partner":{"eyebrow":"Featured partner","title":"Ready to Discover More?","text":"Visit our partner website to explore its services.","buttonText":"Visit Featured Partner →","url":"https://example.com/"},"popup":{"title":"Continue to Our Partner","text":"You are about to visit an external partner website.","buttonText":"Continue to Partner Website →","url":"https://example.com/","disclosure":"External destination."},"seo":{"title":"Vellora — Discover More","description":"Discover our curated collection"},"footer":{"text":"© 2026 Vellora. All rights reserved."},"pages":[]}', datetime('now'));
