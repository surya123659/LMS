CREATE TABLE lms_test.users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
SELECT * FROM  lms_test.users;

alter table LMS_TEST.users   rename column id  to user_id;
-- COURSES TABLE
CREATE TABLE lms_test.courses (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    thumbnail VARCHAR(255),
    price_1month DECIMAL(10,2),
    price_3months DECIMAL(10,2),
    price_6months DECIMAL(10,2),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
SELECT * FROM lms_test.courses;

alter table lms_test.courses   rename column id  to course_id;

-- MODULES TABLE
CREATE TABLE lms_test.modules (
    module_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    course_id BIGINT,
    title VARCHAR(255),
    order_id INT ,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

SHOW TABLES;

SELECT * FROM lms_test.modules;

alter table LMS_TEST.modules   rename column id  to module_id;

alter table LMS_TEST.modules   rename column courseId  to course_id;

alter table LMS_TEST.modules  add constraint unique key (order_id);


-- LESSONS TABLE
CREATE TABLE lms_test.lessons (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    moduleId BIGINT,
    title VARCHAR(255),
    videoUrl VARCHAR(255),
    pdfUrl VARCHAR(255),
    order_id INT,
    duration INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (moduleId) REFERENCES modules(module_id)ON DELETE CASCADE
);

SELECT * FROM lms_test.lessons;

alter table LMS_TEST.lessons   rename column id  to lessons_id;

-- SUBSCRIPTIONS TABLE
CREATE TABLE lms_test.subscriptions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    userId BIGINT,
    courseId BIGINT,
    plan VARCHAR(50),
    startDate TIMESTAMP,
    endDate TIMESTAMP,
    status VARCHAR(50),
    amount DECIMAL(10,2),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (courseId) REFERENCES courses(course_id) ON DELETE CASCADE
);

SELECT * FROM lms_test.subscriptions;

alter table lms_test.subscriptions   rename column id  to subscription_id;

alter table lms_test.subscriptions   rename column courseId  to course_id;


USE lms_test;

DROP TABLE IF EXISTS LMS_TEST.modules;