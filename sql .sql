-- 1. الحصول على جميع المقالات في تصنيف التكنولوجيا

SELECT p.*
FROM posts p
JOIN post_category pc ON p.post_id = pc.post_id
JOIN categories c ON pc.category_id = c.category_id
WHERE c.name = 'Technology';

-- 2. إضافة تعليق جديد

INSERT INTO comments (content, user_id, post_id)
VALUES ('Your article is very informative, thank you!', 4, 2);

-- 3. تحديث عنوان مقال

UPDATE posts
SET title = 'Getting Started with Python Programming'
WHERE post_id = 1;

--4. حذف تعليق

DELETE FROM comments
WHERE comment_id = 5;

-- 5. (Grouping) عدد التعليقات لكل مقالة

SELECT p.title, COUNT(c.comment_id) AS comment_count
FROM posts p
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_id, p.title;

-- 6. جميع المقالات مع معلومات المستخدم والتصنيفات

SELECT 
    p.post_id,
    p.title,
    u.username,
    u.email,
    GROUP_CONCAT(c.name SEPARATOR ', ') AS categories
FROM posts p
JOIN users u ON p.user_id = u.user_id
LEFT JOIN post_category pc ON p.post_id = pc.post_id
LEFT JOIN categories c ON pc.category_id = c.category_id
GROUP BY p.post_id, p.title, u.username, u.email;




