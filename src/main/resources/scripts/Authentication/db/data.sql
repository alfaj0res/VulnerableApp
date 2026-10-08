-- Level 1: SQL Injection
-- Real password: 'not_needed_for_sqli'
INSERT INTO auth_users VALUES (1, 'admin_sqli', 'not_needed_for_sqli', NULL, 'PLAIN', 1, 'admin_sqli@example.com', 'ADMIN');

-- Level 2: Sensitive Data Logging (fixed: the logged password was rotated to a random 24-character one, stored as BCrypt like Level 9)
INSERT INTO auth_users VALUES (2, 'admin_logs', '$2a$10$4e8TyNHMoArQ/swF48Gf/u13r6KixelE3FtkZgJwIFu3fGGs4M5vK', NULL, 'BCRYPT', 2, 'admin_logs@example.com', 'ADMIN');

-- Level 3: Plaintext Storage (fixed: stored as a salted BCrypt hash)
INSERT INTO auth_users VALUES (3, 'admin_plain', '$2a$10$ruCEMrNO2VN4ZNZb50aChuU81LUxqW/uBTFpo5QpzX8KXYzDwiT8u', NULL, 'BCRYPT', 3, 'admin_plain@example.com', 'ADMIN');

-- Level 4: MD5 Hashing (fixed: stored as a salted BCrypt hash)
INSERT INTO auth_users VALUES (4, 'admin_md5', '$2a$10$NlpU7/k5ddna1DeAtLuiMOklTne9MNb2Pg5lpXIarH4.16J6jzvRm', NULL, 'BCRYPT', 4, 'admin_md5@example.com', 'ADMIN');

-- Level 5: SHA1 Hashing (fixed: stored as a salted BCrypt hash)
INSERT INTO auth_users VALUES (5, 'admin_sha1', '$2a$10$kVrRgsuPaIVTxgQnXwm1Aup/5nakoSb9BNVuEQDsrAGdbAX4E1V5e', NULL, 'BCRYPT', 5, 'admin_sha1@example.com', 'ADMIN');

-- Level 6: SHA-256 (No Salt) (fixed: stored as a salted BCrypt hash)
INSERT INTO auth_users VALUES (6, 'admin_sha256', '$2a$10$5JEXZ8neXfL9h.tnHGIUrOV05VSWtjWZJeBSfX22Rn2UqIory4Uyq', NULL, 'BCRYPT', 6, 'admin_sha256@example.com', 'ADMIN');

-- Level 7: Salted SHA-256 (q1W%6nTp^8vM with Salt s9A#2zLk)
INSERT INTO auth_users VALUES (7, 'admin_enum', '71ad23cc508b5658f0bc21d8323f55521be98ca951e83a4a4d15641a3ca2b8a4', 's9A#2zLk', 'SHA256', 7, 'admin_enum@example.com', 'ADMIN');

-- Level 8: Weak Password + Bcrypt (fixed: the weak password was rotated to a random 24-character one)
INSERT INTO auth_users VALUES (8, 'admin_weak', '$2a$10$Hk.G8quhXkpRGAT6GEXM1u33QGgdQbXLN.DSNbWDgwAT2k53eNF3m', NULL, 'BCRYPT', 8, 'admin_weak@example.com', 'ADMIN');

-- Level 9: Secure (Bcrypt + Generic Error) (9fG#2hJk*LmN!8qR)
-- Bcrypt hash for '9fG#2hJk*LmN!8qR'
INSERT INTO auth_users VALUES (9, 'admin_secure', '$2a$10$1WiFUNqUY/vHTzR2QtuMQuzCLK3aZEdjEUpqS4msXOevaCz7Wobe.', NULL, 'BCRYPT', 9, 'admin_secure@example.com', 'ADMIN');

-- Level 10: Low-iteration BCrypt (fixed: the common password was rotated to a random 24-character one, BCrypt cost 10 like Level 9)
INSERT INTO auth_users VALUES (10, 'admin_lowcost', '$2a$10$HgfDL7zwCNn/og6RCnd9xukueUMAB28CCO6YaBoXr8nMeNFY3YMHe', NULL, 'BCRYPT', 10, 'admin_lowcost@example.com', 'ADMIN');
