/*
 * 🚀 Advanced SQL Test File for Chahuadev Emoji Cleaner Tool
 * 📝 Comprehensive SQL patterns with extensive emoji usage for testing
 * 🎯 Features: Complex queries, stored procedures, functions, and emoji integration
 * 🧪 Perfect for testing emoji removal from SQL source files
 * 
 * @author Chahuadev Development Team 👨‍💻
 * @version 2.0.0 🎯
 * @created 2025-01-20 📅
 * @purpose Advanced SQL emoji cleaning validation 🧹
 */

-- 🎪 Database creation and configuration
-- 📊 Comprehensive database setup with emoji-rich comments and data

-- 🗄️ Create main database for emoji testing
CREATE DATABASE IF NOT EXISTS EmojiCleanerTestDB
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci
    COMMENT '🧪 Database for testing emoji cleaner functionality with comprehensive SQL patterns';

USE EmojiCleanerTestDB;

-- 🔧 Set session variables for optimal emoji handling
SET @old_sql_mode = @@sql_mode;
SET sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_ZERO_IN_DATE,ERROR_FOR_DIVISION_BY_ZERO';
SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 📝 Enable detailed logging for emoji processing analysis
SET @emoji_test_start_time = NOW(); -- ⏰ Track test execution time
SET @total_emoji_count = 0; -- 📊 Global emoji counter

-- 🏷️ Create user-defined variables with emoji indicators
SET @status_active = '✅ Active';
SET @status_inactive = '❌ Inactive';
SET @status_pending = '⏳ Pending';
SET @priority_high = '🔥 High';
SET @priority_medium = '🟡 Medium';
SET @priority_low = '🟢 Low';

/*
 * 👥 User management tables with emoji-rich content
 * 📊 Demonstrates comprehensive table design with emoji integration
 */

-- 🏗️ Users table with emoji profile support
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '🔑 Unique user identifier',
    username VARCHAR(50) NOT NULL UNIQUE COMMENT '👤 User login name',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT '📧 User email address',
    display_name VARCHAR(100) COMMENT '🏷️ User display name with emoji support',
    bio TEXT COMMENT '📝 User biography with emoji expressions',
    emoji_preferences JSON COMMENT '🎨 User emoji preferences and settings',
    status ENUM('✅ Active', '❌ Inactive', '⏳ Pending') DEFAULT '⏳ Pending' COMMENT '📊 User account status',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '⏰ Account creation time',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '🔄 Last update time',
    last_login DATETIME COMMENT '🕐 Last login timestamp',
    avatar_emoji VARCHAR(10) DEFAULT '👤' COMMENT '🎭 User avatar emoji',
    mood_emoji VARCHAR(10) DEFAULT '😊' COMMENT '😊 Current mood indicator',
    INDEX idx_username (username) COMMENT '🔍 Username search index',
    INDEX idx_email (email) COMMENT '📧 Email lookup index',
    INDEX idx_status (status) COMMENT '📊 Status filtering index'
) ENGINE=InnoDB 
  CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci 
  COMMENT='👥 User accounts with comprehensive emoji support and metadata';

-- 📝 Posts table for emoji-rich content management
DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
    post_id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '🔑 Unique post identifier',
    user_id INT NOT NULL COMMENT '👤 Post author reference',
    title VARCHAR(255) NOT NULL COMMENT '📰 Post title with emoji support',
    content LONGTEXT COMMENT '📝 Post content with extensive emoji usage',
    emoji_summary VARCHAR(100) COMMENT '🎯 Quick emoji summary of post mood',
    category ENUM('🧪 Technology', '🎨 Art', '🍕 Food', '🎵 Music', '🏈 Sports', '📚 Education') 
        DEFAULT '🧪 Technology' COMMENT '🏷️ Post category classification',
    tags JSON COMMENT '🏷️ Post tags with emoji indicators',
    emoji_count INT DEFAULT 0 COMMENT '📊 Number of emojis in post content',
    reaction_stats JSON COMMENT '😊 Emoji reaction statistics',
    status ENUM('📝 Draft', '✅ Published', '🔒 Private', '🗑️ Deleted') 
        DEFAULT '📝 Draft' COMMENT '📊 Post publication status',
    views_count BIGINT DEFAULT 0 COMMENT '👀 Number of post views',
    likes_count INT DEFAULT 0 COMMENT '❤️ Number of likes received',
    shares_count INT DEFAULT 0 COMMENT '🔄 Number of shares',
    published_at DATETIME COMMENT '📅 Publication timestamp',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '⏰ Creation timestamp',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '🔄 Last modification time',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE COMMENT '👤 User relationship',
    INDEX idx_user_posts (user_id) COMMENT '👤 User posts lookup',
    INDEX idx_category (category) COMMENT '🏷️ Category filtering',
    INDEX idx_status (status) COMMENT '📊 Status filtering',
    INDEX idx_published (published_at) COMMENT '📅 Publication date sorting',
    INDEX idx_emoji_count (emoji_count) COMMENT '📊 Emoji count analysis',
    FULLTEXT idx_content_search (title, content) COMMENT '🔍 Full-text search support'
) ENGINE=InnoDB 
  CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci 
  COMMENT='📝 Posts table with comprehensive emoji content support and analytics';

-- 💬 Comments table for emoji-rich discussions
DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
    comment_id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '🔑 Unique comment identifier',
    post_id BIGINT NOT NULL COMMENT '📝 Parent post reference',
    user_id INT NOT NULL COMMENT '👤 Comment author reference',
    parent_comment_id BIGINT NULL COMMENT '💬 Parent comment for threading',
    content TEXT NOT NULL COMMENT '💬 Comment content with emoji expressions',
    emoji_tone ENUM('😊 Positive', '😐 Neutral', '😞 Negative', '🤔 Mixed') 
        DEFAULT '😐 Neutral' COMMENT '😊 Comment emotional tone',
    reaction_emojis JSON COMMENT '😍 Emoji reactions from other users',
    is_pinned BOOLEAN DEFAULT FALSE COMMENT '📌 Pinned comment indicator',
    is_featured BOOLEAN DEFAULT FALSE COMMENT '⭐ Featured comment status',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '⏰ Comment creation time',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '🔄 Last edit time',
    FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE COMMENT '📝 Post relationship',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE COMMENT '👤 User relationship',
    FOREIGN KEY (parent_comment_id) REFERENCES comments(comment_id) ON DELETE CASCADE COMMENT '💬 Parent comment relationship',
    INDEX idx_post_comments (post_id) COMMENT '📝 Post comments lookup',
    INDEX idx_user_comments (user_id) COMMENT '👤 User comments lookup',
    INDEX idx_comment_thread (parent_comment_id) COMMENT '💬 Comment threading',
    INDEX idx_emoji_tone (emoji_tone) COMMENT '😊 Emotional tone filtering'
) ENGINE=InnoDB 
  CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci 
  COMMENT='💬 Comments with emoji-based sentiment analysis and threading support';

-- 📊 Analytics table for emoji usage tracking
DROP TABLE IF EXISTS emoji_analytics;
CREATE TABLE emoji_analytics (
    analytics_id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '🔑 Unique analytics record',
    user_id INT COMMENT '👤 User reference (NULL for global stats)',
    emoji_char VARCHAR(10) NOT NULL COMMENT '😊 Specific emoji character',
    emoji_name VARCHAR(100) COMMENT '🏷️ Emoji name/description',
    emoji_category ENUM('😀 Faces', '❤️ Hearts', '🚀 Objects', '🌸 Nature', '🎯 Symbols', '🍕 Food', '🏈 Activities') 
        COMMENT '🏷️ Emoji category classification',
    usage_count BIGINT DEFAULT 1 COMMENT '📊 Number of times used',
    context_type ENUM('📝 Post', '💬 Comment', '👤 Profile', '🔍 Search', '📊 Reaction') 
        COMMENT '🎯 Usage context classification',
    first_used_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '⏰ First usage timestamp',
    last_used_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '🔄 Most recent usage',
    popularity_score DECIMAL(5,2) DEFAULT 0.00 COMMENT '🌟 Calculated popularity score',
    trending_factor DECIMAL(3,2) DEFAULT 1.00 COMMENT '📈 Trending multiplier',
    date_recorded DATE DEFAULT (CURRENT_DATE) COMMENT '📅 Analytics date',
    INDEX idx_user_emoji (user_id, emoji_char) COMMENT '👤 User emoji usage',
    INDEX idx_emoji_popularity (emoji_char, popularity_score DESC) COMMENT '🌟 Emoji popularity ranking',
    INDEX idx_category_stats (emoji_category, usage_count DESC) COMMENT '🏷️ Category usage statistics',
    INDEX idx_trending (trending_factor DESC, last_used_at DESC) COMMENT '📈 Trending emoji analysis',
    INDEX idx_date_analytics (date_recorded) COMMENT '📅 Time-based analytics'
) ENGINE=InnoDB 
  CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci 
  COMMENT='📊 Comprehensive emoji usage analytics and trending analysis';

-- 🎨 Emoji categories reference table
DROP TABLE IF EXISTS emoji_categories;
CREATE TABLE emoji_categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '🔑 Category identifier',
    category_name VARCHAR(50) NOT NULL UNIQUE COMMENT '🏷️ Category name with emoji',
    category_icon VARCHAR(10) NOT NULL COMMENT '🎨 Representative emoji icon',
    description TEXT COMMENT '📝 Category description',
    emoji_range_start VARCHAR(10) COMMENT '🔤 Unicode range start',
    emoji_range_end VARCHAR(10) COMMENT '🔤 Unicode range end',
    popularity_rank INT DEFAULT 999 COMMENT '🏆 Category popularity ranking',
    is_active BOOLEAN DEFAULT TRUE COMMENT '✅ Category active status',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '⏰ Category creation time',
    INDEX idx_popularity (popularity_rank) COMMENT '🏆 Popularity ranking',
    INDEX idx_active (is_active) COMMENT '✅ Active categories filter'
) ENGINE=InnoDB 
  CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci 
  COMMENT='🎨 Emoji category definitions and metadata for classification';

/*
 * 📊 Sample data insertion with extensive emoji usage
 * 🎯 Comprehensive test data for emoji cleaning validation
 */

-- 🎨 Insert emoji categories with detailed information
INSERT INTO emoji_categories (category_name, category_icon, description, emoji_range_start, emoji_range_end, popularity_rank) VALUES
('😀 Faces & Emotions', '😊', '😀 Facial expressions, emotions, and human feelings with various moods and reactions', '😀', '😿', 1),
('❤️ Hearts & Love', '💕', '❤️ Hearts, love symbols, and romantic expressions for relationships and affection', '❤️', '💔', 2),
('🚀 Objects & Tools', '🔧', '🚀 Everyday objects, tools, technology, and equipment for various activities', '⚒️', '🛠️', 3),
('🌸 Nature & Weather', '🌿', '🌸 Plants, animals, weather phenomena, and natural elements from environment', '🌱', '🌪️', 4),
('🎯 Symbols & Signs', '⭐', '🎯 Various symbols, signs, arrows, and abstract representations for communication', '⭐', '🔯', 5),
('🍕 Food & Drinks', '🍽️', '🍕 Food items, beverages, cooking, and dining experiences from around world', '🍎', '🥤', 6),
('🏈 Sports & Activities', '🎮', '🏈 Sports, games, hobbies, and recreational activities for entertainment', '⚽', '🎲', 7),
('🏠 Places & Travel', '✈️', '🏠 Buildings, locations, transportation, and travel-related items for exploration', '🏠', '🛫', 8);

-- 👥 Insert sample users with emoji-rich profiles
INSERT INTO users (username, email, display_name, bio, emoji_preferences, status, avatar_emoji, mood_emoji) VALUES
('john_dev', 'john@example.com', '👨‍💻 John Developer', 
 '🚀 Passionate software developer who loves coding! 💻 Currently working on amazing projects with cutting-edge technology. Always learning new things! 📚✨',
 JSON_OBJECT('favorites', JSON_ARRAY('💻', '🚀', '⚡', '🎯'), 'theme', '🌙 Dark', 'frequency', '🔥 High'),
 '✅ Active', '👨‍💻', '😊'),

('sarah_designer', 'sarah@example.com', '🎨 Sarah Creative', 
 '🎨 UI/UX Designer creating beautiful interfaces! ✨ Love working with colors, typography, and user experiences. Always inspired by art! 🖼️🌈',
 JSON_OBJECT('favorites', JSON_ARRAY('🎨', '✨', '🌈', '💡'), 'theme', '🌸 Pink', 'frequency', '🎯 Medium'),
 '✅ Active', '🎨', '😍'),

('mike_gamer', 'mike@example.com', '🎮 Mike Player', 
 '🎮 Professional gamer and streamer! 🏆 Love competitive gaming and sharing gameplay with community. Always up for new challenges! ⚡🔥',
 JSON_OBJECT('favorites', JSON_ARRAY('🎮', '🏆', '⚡', '🔥'), 'theme', '🌟 Gold', 'frequency', '🚀 Very High'),
 '✅ Active', '🎮', '🤩'),

('anna_chef', 'anna@example.com', '👩‍🍳 Anna Culinary', 
 '👩‍🍳 Professional chef and food blogger! 🍕 Creating delicious recipes and sharing cooking tips. Food is my passion! 🥘❤️',
 JSON_OBJECT('favorites', JSON_ARRAY('🍕', '👩‍🍳', '🥘', '❤️'), 'theme', '🍅 Red', 'frequency', '🍯 Sweet'),
 '✅ Active', '👩‍🍳', '😋'),

('david_travel', 'david@example.com', '✈️ David Explorer', 
 '✈️ Travel enthusiast exploring the world! 🌍 Sharing amazing experiences and beautiful destinations. Adventure awaits! 🏔️🌊',
 JSON_OBJECT('favorites', JSON_ARRAY('✈️', '🌍', '🏔️', '📸'), 'theme', '🌊 Blue', 'frequency', '🗺️ Explorer'),
 '✅ Active', '✈️', '🤗');

-- 📝 Insert sample posts with extensive emoji content
INSERT INTO posts (user_id, title, content, emoji_summary, category, tags, emoji_count, reaction_stats, status, views_count, likes_count, shares_count, published_at) VALUES
(1, '🚀 Building Amazing Web Applications with Modern JavaScript!', 
 '🎯 Today I want to share my experience building cutting-edge web applications! 💻 
 
 Key technologies I''ve been using:
 • ⚡ React for dynamic user interfaces
 • 🔥 Node.js for powerful backend services  
 • 📊 MongoDB for flexible data storage
 • 🎨 CSS Grid for beautiful layouts
 • 🧪 Jest for comprehensive testing
 
 The development process has been incredibly exciting! 🚀 Every day brings new challenges and opportunities to learn. The community support is amazing too! 👥✨
 
 Tips for fellow developers:
 1. 📚 Never stop learning new technologies
 2. 🤝 Collaborate with other developers
 3. 🧹 Keep your code clean and documented
 4. 🎯 Focus on user experience first
 5. ⚡ Optimize for performance always
 
 What technologies are you excited about? Drop a comment! 💬👇',
 '💻🚀⚡🎯✨', '🧪 Technology', 
 JSON_ARRAY('javascript', 'react', 'nodejs', 'webdev', 'coding'),
 27, JSON_OBJECT('😍', 45, '🚀', 32, '👏', 28, '🔥', 19), 
 '✅ Published', 1250, 89, 23, '2025-01-15 10:30:00'),

(2, '🎨 Creating Stunning UI Designs: My Creative Process!',
 '✨ Hello design community! Today I''m sharing my creative process for UI design! 🎨
 
 My design workflow:
 1. 💡 Research and inspiration gathering
 2. ✏️ Sketching initial concepts on paper
 3. 🖼️ Creating mood boards with colors
 4. 🎯 Wireframing user flows and layouts
 5. 🌈 Adding colors, typography, and styling
 6. ⚡ Prototyping interactions and animations
 7. 🧪 Testing with real users for feedback
 
 Tools I absolutely love:
 • 🎨 Figma for collaborative design
 • ✨ Adobe Creative Suite for graphics
 • 🌈 Coolors.co for color palettes
 • 📱 Marvel for quick prototyping
 • 👀 Principle for micro-interactions
 
 Remember: Great design is not just about aesthetics! 🎯 It''s about solving problems and creating delightful user experiences. Every pixel matters! 💫
 
 What''s your favorite design tool? Share below! 👇💬',
 '🎨✨🌈💡🎯', '🎨 Art',
 JSON_ARRAY('ui', 'ux', 'design', 'figma', 'creative'),
 24, JSON_OBJECT('😍', 67, '🎨', 41, '✨', 35, '💖', 22),
 '✅ Published', 890, 112, 31, '2025-01-16 14:45:00'),

(3, '🎮 Epic Gaming Session: Breaking Records and Having Fun!',
 '🏆 What an incredible gaming night! Just achieved my personal best in competitive mode! 🎮
 
 Tonight''s highlights:
 • 🔥 20-game winning streak in ranked matches
 • ⚡ New personal record for fastest completion
 • 🎯 Perfect accuracy in final boss battle
 • 👥 Great teamwork with squad members
 • 🏅 Unlocked exclusive achievement badges
 
 The competition was intense! 💪 Every match required full concentration and strategic thinking. The community support has been amazing - shoutout to all my followers! 📺✨
 
 Gaming tips for improvement:
 1. 🧠 Study your gameplay replays carefully
 2. ⏰ Practice consistently every day
 3. 🤝 Learn from experienced players
 4. 🎯 Focus on one skill at a time
 5. 😌 Stay calm under pressure
 6. 🔄 Adapt strategies based on opponents
 
 Next stream will be tomorrow at 8 PM! 📺 Come join the fun and let''s break more records together! 🚀🎉
 
 What games are you playing lately? 🎮👇',
 '🎮🏆🔥⚡🎯', '🏈 Sports',
 JSON_ARRAY('gaming', 'esports', 'streaming', 'competitive'),
 25, JSON_OBJECT('🔥', 78, '🎮', 56, '🏆', 43, '⚡', 31),
 '✅ Published', 2340, 156, 67, '2025-01-17 21:15:00');

-- 💬 Insert sample comments with emoji expressions
INSERT INTO comments (post_id, user_id, content, emoji_tone, reaction_emojis) VALUES
(1, 2, '🚀 Amazing post! Your JavaScript skills are incredible! I''m definitely trying React for my next project. Thanks for the inspiration! ✨💻', 
 '😊 Positive', JSON_OBJECT('👏', 15, '🚀', 8, '💯', 6)),

(1, 3, '💯 This is exactly what I needed to read today! Been struggling with Node.js but your tips are super helpful. Keep sharing! 🙏✨', 
 '😊 Positive', JSON_OBJECT('🙏', 12, '💯', 9, '✨', 7)),

(2, 1, '🎨 Your design process is so thorough and professional! Love how you break down each step. Figma is indeed amazing for collaboration! 👥💡', 
 '😊 Positive', JSON_OBJECT('🎨', 18, '💡', 11, '👏', 9)),

(2, 4, '✨ Beautiful work as always! Your attention to detail in UI design is inspiring. Can''t wait to see your next project! 🌟👀', 
 '😊 Positive', JSON_OBJECT('✨', 14, '🌟', 10, '👀', 6)),

(3, 1, '🎮 That winning streak is insane! Your gaming skills are legendary. Really enjoyed watching the stream last night! 🔥🏆', 
 '😊 Positive', JSON_OBJECT('🔥', 22, '🏆', 16, '🎮', 13)),

(3, 2, '🏆 Congratulations on the achievement! Your dedication to gaming is really admirable. Looking forward to tomorrow''s stream! 📺⚡', 
 '😊 Positive', JSON_OBJECT('🏆', 19, '📺', 8, '⚡', 11));

/*
 * 🔧 Advanced stored procedures with emoji processing
 * ⚡ Complex database operations with emoji-aware functionality
 */

-- 📊 Stored procedure for emoji analytics calculation
DELIMITER //

DROP PROCEDURE IF EXISTS CalculateEmojiStatistics//
CREATE PROCEDURE CalculateEmojiStatistics(
    IN p_user_id INT,
    IN p_date_from DATE,
    IN p_date_to DATE,
    OUT p_total_emojis INT,
    OUT p_unique_emojis INT,
    OUT p_most_popular_emoji VARCHAR(10)
)
COMMENT '📊 Calculate comprehensive emoji usage statistics for user or global'
BEGIN
    DECLARE v_error_message VARCHAR(255) DEFAULT '';
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_error_message = MESSAGE_TEXT;
        
        -- 📝 Log error with emoji indicator
        INSERT INTO error_log (error_message, error_context, created_at) 
        VALUES (CONCAT('❌ Emoji analytics error: ', v_error_message), 
                CONCAT('🔧 Procedure: CalculateEmojiStatistics, User: ', IFNULL(p_user_id, 'Global')), 
                NOW());
        
        -- 🔄 Reset output parameters on error
        SET p_total_emojis = 0;
        SET p_unique_emojis = 0;
        SET p_most_popular_emoji = '❌';
        
        RESIGNAL;
    END;
    
    -- 📝 Temporary table for emoji counting
    CREATE TEMPORARY TABLE temp_emoji_stats (
        emoji_char VARCHAR(10),
        usage_count BIGINT,
        INDEX idx_emoji (emoji_char)
    ) ENGINE=MEMORY COMMENT='📊 Temporary emoji statistics calculation';
    
    -- 🔍 Count emojis from posts content
    INSERT INTO temp_emoji_stats (emoji_char, usage_count)
    SELECT 
        SUBSTRING_INDEX(SUBSTRING_INDEX(emoji_data.emoji_list, ',', numbers.n), ',', -1) AS emoji_char,
        COUNT(*) AS usage_count
    FROM (
        SELECT GROUP_CONCAT(
            REGEXP_REPLACE(content, '[^😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]', ',')
        ) AS emoji_list
        FROM posts p
        WHERE (p_user_id IS NULL OR p.user_id = p_user_id)
        AND DATE(p.created_at) BETWEEN IFNULL(p_date_from, '1900-01-01') AND IFNULL(p_date_to, CURDATE())
        AND p.status = '✅ Published'
    ) emoji_data
    CROSS JOIN (
        SELECT 1 n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
        UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10
    ) numbers
    WHERE CHAR_LENGTH(emoji_data.emoji_list) - CHAR_LENGTH(REPLACE(emoji_data.emoji_list, ',', '')) >= numbers.n - 1
    AND TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(emoji_data.emoji_list, ',', numbers.n), ',', -1)) != ''
    GROUP BY emoji_char
    HAVING emoji_char REGEXP '[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]';
    
    -- 📊 Calculate statistics
    SELECT 
        IFNULL(SUM(usage_count), 0),
        COUNT(DISTINCT emoji_char),
        IFNULL((SELECT emoji_char FROM temp_emoji_stats ORDER BY usage_count DESC LIMIT 1), '😐')
    INTO p_total_emojis, p_unique_emojis, p_most_popular_emoji;
    
    -- 🧹 Cleanup
    DROP TEMPORARY TABLE temp_emoji_stats;
    
    -- 📝 Log successful execution
    INSERT INTO process_log (process_name, parameters, result_summary, created_at)
    VALUES ('📊 CalculateEmojiStatistics', 
            JSON_OBJECT('user_id', p_user_id, 'date_from', p_date_from, 'date_to', p_date_to),
            CONCAT('✅ Success: ', p_total_emojis, ' total, ', p_unique_emojis, ' unique, top: ', p_most_popular_emoji),
            NOW());
            
END//

-- 🧹 Stored procedure for emoji cleaning and analysis
DROP PROCEDURE IF EXISTS CleanEmojiContent//
CREATE PROCEDURE CleanEmojiContent(
    IN p_table_name VARCHAR(64),
    IN p_column_name VARCHAR(64),
    IN p_preview_mode BOOLEAN DEFAULT TRUE,
    OUT p_affected_rows INT,
    OUT p_emojis_removed INT
)
COMMENT '🧹 Clean emoji content from specified table column with preview option'
BEGIN
    DECLARE v_sql TEXT DEFAULT '';
    DECLARE v_total_emojis INT DEFAULT 0;
    DECLARE v_processed_rows INT DEFAULT 0;
    DECLARE v_error_message VARCHAR(255) DEFAULT '';
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_error_message = MESSAGE_TEXT;
        
        -- 📝 Log error with emoji context
        INSERT INTO error_log (error_message, error_context, created_at)
        VALUES (CONCAT('❌ Emoji cleaning error: ', v_error_message),
                CONCAT('🧹 Table: ', p_table_name, ', Column: ', p_column_name, ', Preview: ', p_preview_mode),
                NOW());
        
        SET p_affected_rows = 0;
        SET p_emojis_removed = 0;
        RESIGNAL;
    END;
    
    -- ✅ Validate input parameters
    IF p_table_name IS NULL OR p_column_name IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '🚫 Table name and column name are required';
    END IF;
    
    -- 🔍 Check if table and column exist
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = DATABASE() 
        AND table_name = p_table_name 
        AND column_name = p_column_name
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '🚫 Specified table or column does not exist';
    END IF;
    
    -- 📊 Count emojis before cleaning (for statistics)
    SET @count_sql = CONCAT(
        'SELECT COUNT(*) INTO @emoji_count FROM ', p_table_name, 
        ' WHERE ', p_column_name, ' REGEXP ''[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]'''
    );
    
    PREPARE stmt FROM @count_sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
    SET v_total_emojis = @emoji_count;
    
    IF p_preview_mode THEN
        -- 👀 Preview mode: show what would be changed
        SET v_sql = CONCAT(
            'SELECT COUNT(*) as ''🔍 Rows with Emojis'', ',
            '''', v_total_emojis, ''' as ''📊 Total Emoji Instances'', ',
            '''Preview Mode - No Changes Made 👀'' as ''Status'''
        );
        
        SET @preview_sql = v_sql;
        PREPARE stmt FROM @preview_sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
        
        SET p_affected_rows = v_total_emojis;
        SET p_emojis_removed = 0;
    ELSE
        -- 🧹 Actual cleaning mode
        SET v_sql = CONCAT(
            'UPDATE ', p_table_name, ' SET ',
            p_column_name, ' = REGEXP_REPLACE(', p_column_name, ', ''[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]'', '''') ',
            'WHERE ', p_column_name, ' REGEXP ''[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]'''
        );
        
        SET @clean_sql = v_sql;
        PREPARE stmt FROM @clean_sql;
        EXECUTE stmt;
        SET v_processed_rows = ROW_COUNT();
        DEALLOCATE PREPARE stmt;
        
        SET p_affected_rows = v_processed_rows;
        SET p_emojis_removed = v_total_emojis;
        
        -- 📝 Log cleaning operation
        INSERT INTO process_log (process_name, parameters, result_summary, created_at)
        VALUES ('🧹 CleanEmojiContent',
                JSON_OBJECT('table', p_table_name, 'column', p_column_name, 'preview', p_preview_mode),
                CONCAT('✅ Cleaned: ', v_processed_rows, ' rows, ', v_total_emojis, ' emojis removed'),
                NOW());
    END IF;
END//

-- 📈 Function for emoji popularity scoring
DROP FUNCTION IF EXISTS CalculateEmojiPopularity//
CREATE FUNCTION CalculateEmojiPopularity(
    p_emoji_char VARCHAR(10),
    p_days_back INT DEFAULT 30
) 
RETURNS DECIMAL(5,2)
READS SQL DATA
DETERMINISTIC
COMMENT '📈 Calculate emoji popularity score based on usage patterns and trends'
BEGIN
    DECLARE v_recent_usage BIGINT DEFAULT 0;
    DECLARE v_total_usage BIGINT DEFAULT 0;
    DECLARE v_user_count INT DEFAULT 0;
    DECLARE v_popularity_score DECIMAL(5,2) DEFAULT 0.00;
    DECLARE v_trend_factor DECIMAL(3,2) DEFAULT 1.00;
    
    -- 📊 Get recent usage statistics
    SELECT IFNULL(SUM(usage_count), 0) INTO v_recent_usage
    FROM emoji_analytics 
    WHERE emoji_char = p_emoji_char 
    AND date_recorded >= DATE_SUB(CURDATE(), INTERVAL p_days_back DAY);
    
    -- 📊 Get total usage statistics
    SELECT IFNULL(SUM(usage_count), 0) INTO v_total_usage
    FROM emoji_analytics 
    WHERE emoji_char = p_emoji_char;
    
    -- 👥 Count unique users using this emoji
    SELECT COUNT(DISTINCT user_id) INTO v_user_count
    FROM emoji_analytics 
    WHERE emoji_char = p_emoji_char 
    AND user_id IS NOT NULL;
    
    -- 📈 Calculate trend factor (recent vs historical usage)
    IF v_total_usage > 0 THEN
        SET v_trend_factor = LEAST(3.00, (v_recent_usage * 365.0) / (v_total_usage * p_days_back));
    END IF;
    
    -- 🎯 Calculate popularity score
    SET v_popularity_score = LEAST(100.00, 
        (v_recent_usage * 0.6) +           -- 📊 Recent usage weight
        (v_user_count * 0.3) +             -- 👥 User diversity weight  
        (v_trend_factor * 10.0)            -- 📈 Trending bonus
    );
    
    RETURN v_popularity_score;
END//

DELIMITER ;

/*
 * 📊 Create logging tables for emoji processing
 * 🔍 Comprehensive tracking and debugging support
 */

-- 📝 Process logging table
CREATE TABLE IF NOT EXISTS process_log (
    log_id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '🔑 Unique log entry identifier',
    process_name VARCHAR(100) NOT NULL COMMENT '🔧 Name of executed process',
    parameters JSON COMMENT '⚙️ Process input parameters',
    result_summary TEXT COMMENT '📊 Process execution summary',
    execution_time_ms INT COMMENT '⏱️ Process execution time in milliseconds',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '⏰ Log entry creation time',
    INDEX idx_process_name (process_name) COMMENT '🔧 Process name lookup',
    INDEX idx_created_at (created_at) COMMENT '⏰ Chronological sorting'
) ENGINE=InnoDB 
  CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci 
  COMMENT='📝 Process execution logging for emoji processing operations';

-- ❌ Error logging table
CREATE TABLE IF NOT EXISTS error_log (
    error_id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '🔑 Unique error identifier',
    error_message TEXT NOT NULL COMMENT '❌ Error message description',
    error_context TEXT COMMENT '🔍 Error context and parameters',
    error_code VARCHAR(20) COMMENT '🏷️ Error code classification',
    severity ENUM('🟢 Low', '🟡 Medium', '🔴 High', '🚨 Critical') DEFAULT '🟡 Medium' COMMENT '📊 Error severity level',
    resolved BOOLEAN DEFAULT FALSE COMMENT '✅ Error resolution status',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '⏰ Error occurrence time',
    resolved_at TIMESTAMP NULL COMMENT '✅ Error resolution time',
    INDEX idx_severity (severity) COMMENT '📊 Severity filtering',
    INDEX idx_resolved (resolved) COMMENT '✅ Resolution status',
    INDEX idx_created_at (created_at) COMMENT '⏰ Error timeline'
) ENGINE=InnoDB 
  CHARACTER SET utf8mb4 
  COLLATE utf8mb4_unicode_ci 
  COMMENT='❌ Error logging and tracking for system debugging and monitoring';

/*
 * 🔍 Complex views for emoji analytics and reporting
 * 📊 Advanced data analysis with emoji-aware queries
 */

-- 📊 Comprehensive emoji usage summary view
CREATE OR REPLACE VIEW v_emoji_usage_summary AS
SELECT 
    ea.emoji_char AS '😊 Emoji',
    ea.emoji_name AS '🏷️ Name',
    ea.emoji_category AS '📂 Category',
    SUM(ea.usage_count) AS '📊 Total Usage',
    COUNT(DISTINCT ea.user_id) AS '👥 Unique Users',
    AVG(ea.popularity_score) AS '🌟 Avg Popularity',
    MAX(ea.last_used_at) AS '⏰ Last Used',
    CASE 
        WHEN AVG(ea.trending_factor) > 2.0 THEN '🔥 Hot'
        WHEN AVG(ea.trending_factor) > 1.5 THEN '📈 Trending'
        WHEN AVG(ea.trending_factor) > 1.0 THEN '📊 Stable'
        ELSE '📉 Declining'
    END AS '📈 Trend Status'
FROM emoji_analytics ea
WHERE ea.date_recorded >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY ea.emoji_char, ea.emoji_name, ea.emoji_category
ORDER BY SUM(ea.usage_count) DESC, AVG(ea.popularity_score) DESC;

-- 👥 User emoji preferences and behavior view
CREATE OR REPLACE VIEW v_user_emoji_behavior AS
SELECT 
    u.user_id AS '👤 User ID',
    u.username AS '🏷️ Username',
    u.display_name AS '📛 Display Name',
    u.avatar_emoji AS '🎭 Avatar',
    u.mood_emoji AS '😊 Current Mood',
    COUNT(DISTINCT ea.emoji_char) AS '🎨 Unique Emojis Used',
    SUM(ea.usage_count) AS '📊 Total Emoji Usage',
    ea_top.emoji_char AS '⭐ Favorite Emoji',
    ROUND(AVG(ea.popularity_score), 2) AS '🌟 Avg Emoji Popularity',
    CASE
        WHEN SUM(ea.usage_count) > 1000 THEN '🔥 Heavy User'
        WHEN SUM(ea.usage_count) > 500 THEN '📈 Active User'
        WHEN SUM(ea.usage_count) > 100 THEN '📊 Regular User'
        ELSE '🌱 Light User'
    END AS '👤 User Type'
FROM users u
LEFT JOIN emoji_analytics ea ON u.user_id = ea.user_id
LEFT JOIN (
    SELECT user_id, emoji_char, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY usage_count DESC) as rn
    FROM emoji_analytics
) ea_top ON u.user_id = ea_top.user_id AND ea_top.rn = 1
WHERE u.status = '✅ Active'
GROUP BY u.user_id, u.username, u.display_name, u.avatar_emoji, u.mood_emoji, ea_top.emoji_char
ORDER BY SUM(ea.usage_count) DESC;

-- 📈 Trending emoji analysis view
CREATE OR REPLACE VIEW v_trending_emojis AS
SELECT 
    ea.emoji_char AS '😊 Emoji',
    ea.emoji_name AS '🏷️ Name',
    ea.emoji_category AS '📂 Category',
    SUM(ea.usage_count) AS '📊 Recent Usage',
    AVG(ea.trending_factor) AS '📈 Trend Factor',
    COUNT(DISTINCT ea.user_id) AS '👥 Active Users',
    ROUND(AVG(ea.popularity_score), 2) AS '🌟 Popularity Score',
    CASE
        WHEN AVG(ea.trending_factor) >= 2.5 THEN '🚀 Viral'
        WHEN AVG(ea.trending_factor) >= 2.0 THEN '🔥 Hot'
        WHEN AVG(ea.trending_factor) >= 1.5 THEN '📈 Rising'
        ELSE '📊 Normal'
    END AS '🎯 Trend Level',
    DATE(ea.last_used_at) AS '📅 Last Active Date'
FROM emoji_analytics ea
WHERE ea.date_recorded >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
GROUP BY ea.emoji_char, ea.emoji_name, ea.emoji_category, DATE(ea.last_used_at)
HAVING SUM(ea.usage_count) > 5
ORDER BY AVG(ea.trending_factor) DESC, SUM(ea.usage_count) DESC
LIMIT 50;

/*
 * 🧪 Advanced emoji testing and validation queries
 * 🎯 Comprehensive test scenarios for emoji cleaner validation
 */

-- 🔍 Query to find all content with emojis for testing
SELECT 
    'posts' as '📋 Table Name',
    'content' as '📝 Column Name',
    post_id as '🔑 Record ID',
    SUBSTRING(content, 1, 100) as '📄 Content Preview',
    CHAR_LENGTH(content) - CHAR_LENGTH(REGEXP_REPLACE(content, '[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]', '')) as '📊 Emoji Count',
    '🧪 Test Ready' as '✅ Status'
FROM posts 
WHERE content REGEXP '[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]'

UNION ALL

SELECT 
    'comments' as '📋 Table Name',
    'content' as '📝 Column Name', 
    comment_id as '🔑 Record ID',
    SUBSTRING(content, 1, 100) as '📄 Content Preview',
    CHAR_LENGTH(content) - CHAR_LENGTH(REGEXP_REPLACE(content, '[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]', '')) as '📊 Emoji Count',
    '🧪 Test Ready' as '✅ Status'
FROM comments 
WHERE content REGEXP '[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]'

UNION ALL

SELECT 
    'users' as '📋 Table Name',
    'bio' as '📝 Column Name',
    user_id as '🔑 Record ID', 
    SUBSTRING(bio, 1, 100) as '📄 Content Preview',
    CHAR_LENGTH(bio) - CHAR_LENGTH(REGEXP_REPLACE(bio, '[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]', '')) as '📊 Emoji Count',
    '🧪 Test Ready' as '✅ Status'
FROM users 
WHERE bio REGEXP '[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]'

ORDER BY 6 DESC, 5 DESC;

-- 📊 Comprehensive emoji statistics for testing validation
SELECT 
    '📊 EMOJI STATISTICS SUMMARY' as '🎯 Report Section',
    '' as '📋 Metric',
    '' as '📈 Value',
    '' as '📝 Description'

UNION ALL

SELECT 
    '🔢 Counts',
    'Total Posts with Emojis',
    CAST(COUNT(*) as CHAR),
    'Posts containing at least one emoji character'
FROM posts 
WHERE content REGEXP '[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]'

UNION ALL

SELECT 
    '🔢 Counts',
    'Total Comments with Emojis', 
    CAST(COUNT(*) as CHAR),
    'Comments containing emoji expressions'
FROM comments 
WHERE content REGEXP '[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]'

UNION ALL

SELECT 
    '🔢 Counts',
    'Active Users with Emoji Profiles',
    CAST(COUNT(*) as CHAR),
    'Users with emojis in bio or display name'
FROM users 
WHERE (bio REGEXP '[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]' 
       OR display_name REGEXP '[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]')
AND status = '✅ Active'

UNION ALL

SELECT 
    '📈 Analytics',
    'Average Emojis per Post',
    CAST(ROUND(AVG(CHAR_LENGTH(content) - CHAR_LENGTH(REGEXP_REPLACE(content, '[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]', ''))), 2) as CHAR),
    'Average number of emojis found in post content'
FROM posts 
WHERE status = '✅ Published'

UNION ALL

SELECT 
    '📈 Analytics',
    'Emoji Density Percentage',
    CONCAT(CAST(ROUND(
        (SUM(CHAR_LENGTH(content) - CHAR_LENGTH(REGEXP_REPLACE(content, '[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]', ''))) 
         / SUM(CHAR_LENGTH(content))) * 100, 3
    ) as CHAR), '%'),
    'Percentage of characters that are emojis across all content'
FROM posts 
WHERE status = '✅ Published' AND CHAR_LENGTH(content) > 0

ORDER BY 1, 2;

-- 🧪 Test data generation for emoji cleaner validation
INSERT INTO posts (user_id, title, content, emoji_summary, category, tags, emoji_count, status, published_at) VALUES
(1, '🧪 Comprehensive Emoji Test Content for Validation', 
 '🎯 This is a comprehensive test post designed specifically for emoji cleaner validation! 🧪

🔍 EMOJI CATEGORIES TEST:
😀 Faces: 😀 😃 😄 😁 😆 😅 🤣 😂 🙂 🙃 😉 😊 😇 🥰 😍 🤩 😘 😗 😚 😙 😋
❤️ Hearts: ❤️ 🧡 💛 💚 💙 💜 🤎 🖤 🤍 💔 ❣️ 💕 💖 💗 💘 💝 💞 💟 💋 💌
🚀 Objects: 🚀 ⚡ 🔥 💧 🌟 ✨ 💫 ⭐ 🌙 ☀️ ⛅ 🌈 🔔 💎 🔑 🗝️ 🔨 ⚙️ 🔧 🪛
🌸 Nature: 🌸 🌺 🌻 🌹 🌷 🌱 🌿 🍀 🌾 🌳 🌲 🌴 🌵 🌊 🌋 🏔️ 🌤️ 🌦️ 🌧️ ⛈️
🎯 Symbols: 🎯 🎪 🎨 🎭 🎪 🎨 🎬 🎤 🎧 🎼 🎵 🎶 🎹 🥁 🎺 🎸 🎻 🎲 🎮 🕹️

⚡ SPECIAL SEQUENCES TEST:
👨‍💻 Professional developer working on complex projects
👩‍🚀 Space explorer discovering new frontiers  
🏳️‍🌈 Rainbow flag representing diversity and inclusion
👨‍👩‍👧‍👦 Happy family enjoying quality time together

🌍 INTERNATIONAL EMOJIS:
🇺🇸 🇹🇭 🇯🇵 🇰🇷 🇨🇳 🇫🇷 🇩🇪 🇬🇧 🇮🇹 🇪🇸 🇧🇷 🇲🇽 🇨🇦 🇦🇺 🇮🇳

🎨 SKIN TONE VARIATIONS:
👋🏻 👋🏼 👋🏽 👋🏾 👋🏿 (greeting with diversity)
👍🏻 👍🏼 👍🏽 👍🏾 👍🏿 (approval across backgrounds)

📊 NUMERIC AND MEASURING:
1️⃣ 2️⃣ 3️⃣ 4️⃣ 5️⃣ 6️⃣ 7️⃣ 8️⃣ 9️⃣ 🔟 #️⃣ *️⃣ ⏰ 📅 📊 📈 📉 💯

🧪 This content contains 150+ emojis across all major categories for comprehensive testing! ✨',
 '🧪🎯🔍⚡✨', '🧪 Technology',
 JSON_ARRAY('testing', 'emoji', 'validation', 'comprehensive'),
 150, '✅ Published', '2025-01-20 09:00:00'),

(2, '🎨 Edge Case Emoji Testing: Complex Unicode Scenarios',
 '🔬 Advanced emoji testing with edge cases and complex scenarios! 🧪

🤔 COMPLEX EMOJI SEQUENCES:
🧑‍🎓👨‍🏫👩‍💼🧑‍⚕️👨‍🌾👩‍🍳🧑‍🔧👨‍🏭👩‍💻🧑‍🎨👨‍✈️👩‍🚀🧑‍🚒👨‍👮👩‍⚖️

🎭 PROFESSION COMBINATIONS:
👨🏻‍💻👨🏼‍💻👨🏽‍💻👨🏾‍💻👨🏿‍💻 (diverse developers)
👩🏻‍🎨👩🏼‍🎨👩🏽‍🎨👩🏾‍🎨👩🏿‍🎨 (creative artists)

🏳️ FLAG SEQUENCES:
🏳️‍🌈🏳️‍⚧️🏴‍☠️ (special flag combinations)

🔢 KEYCAP SEQUENCES:
0️⃣1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣8️⃣9️⃣🔟 (numbered keycaps)

🎪 MIXED CONTENT TESTING:
Regular text 📝 with emojis 😊 scattered throughout the content.
Some words have emojis😎attached directly without spaces.
Multiple🎯consecutive🚀emojis🔥together!

📊 STATISTICAL ANALYSIS EMOJIS:
📈📉📊📋📌📍📎📏📐📑📒📓📔📕📖📗📘📙📚📰📄📃📜

🎨 This post tests various edge cases and complex emoji scenarios! ✨',
 '🔬🧪🎭🔢🎪', '🧪 Technology',
 JSON_ARRAY('edge-cases', 'unicode', 'testing', 'complex'),
 75, '✅ Published', '2025-01-20 10:30:00');

/*
 * 🎉 Final test execution and validation
 * ✅ Verify emoji detection and cleaning capabilities
 */

-- 📊 Execute comprehensive emoji statistics calculation
CALL CalculateEmojiStatistics(NULL, '2025-01-01', CURDATE(), @total, @unique, @popular);
SELECT 
    '📊 EMOJI CLEANER TEST VALIDATION RESULTS' as '🎯 Test Report',
    @total as '📊 Total Emojis Detected',
    @unique as '🎯 Unique Emoji Types', 
    @popular as '⭐ Most Popular Emoji',
    'Ready for cleaning validation! 🧹✨' as '✅ Status';

-- 🧹 Test emoji cleaning in preview mode (safe testing)
CALL CleanEmojiContent('posts', 'content', TRUE, @affected, @removed);
SELECT 
    '🧹 EMOJI CLEANING PREVIEW TEST' as '🎯 Test Type',
    @affected as '📊 Rows with Emojis',
    @removed as '🔍 Emojis Detected',
    'Preview completed successfully! 👀✅' as '📋 Result';

-- 📝 Display final test summary
SELECT 
    '🎉 CHAHUADEV EMOJI CLEANER TEST SUITE COMPLETED!' as '🎯 Final Status',
    CONCAT(
        '✅ Database created with ', 
        (SELECT COUNT(*) FROM posts WHERE content REGEXP '[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]'), 
        ' emoji-rich posts, ',
        (SELECT COUNT(*) FROM comments WHERE content REGEXP '[😀-🙏🚀-🛿🇀-🇿⚡☀-⛿✀-➿🤀-🧿]'),
        ' emoji comments, and comprehensive test data'
    ) as '📊 Test Data Summary',
    'All SQL patterns ready for emoji cleaning validation! 🧪🚀' as '🧹 Cleaner Status';

-- 🔄 Reset session variables
SET sql_mode = @old_sql_mode;
SET @emoji_test_end_time = NOW();

-- 📝 Log test completion
SELECT 
    '⏰ Test Execution Time:' as '📋 Metric',
    CONCAT(
        TIMESTAMPDIFF(SECOND, @emoji_test_start_time, @emoji_test_end_time), 
        ' seconds'
    ) as '📊 Value',
    '🎉 SQL emoji test suite completed successfully!' as '✅ Final Message';

/*
 * 🎪 End of Advanced SQL Emoji Cleaner Test File
 * 
 * 📊 File Statistics:
 * - Lines of SQL: 800+ lines
 * - Emoji count: 400+ emojis
 * - SQL features: Advanced queries, stored procedures, functions, views
 * - Complexity: Enterprise-grade database patterns with emoji integration
 * 
 * 🧪 Test Coverage:
 * ✅ Complex table schemas with emoji support
 * ✅ Advanced stored procedures for emoji processing
 * ✅ User-defined functions for emoji analytics
 * ✅ Comprehensive views for emoji reporting  
 * ✅ Error handling and logging systems
 * ✅ Performance optimization techniques
 * ✅ Unicode and international emoji support
 * ✅ Edge case testing scenarios
 * ✅ Statistical analysis and validation
 * ✅ Preview mode for safe testing
 * 
 * 🎯 Perfect for testing emoji removal from SQL source files!
 * 🚀 Demonstrates advanced database patterns with extensive emoji usage
 * 💻 Ready for comprehensive emoji cleaner validation across all SQL constructs
 */