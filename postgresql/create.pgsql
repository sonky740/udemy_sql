/* ★ 데이터 유형
 * https://www.postgresql.org/docs/current/datatype.html
 */
--
/* ★ 기본키 및 외래키
 * 기본키: PK: Primary Key, 외래키: FK: Foreign key
 */
--
/* ★ 제약 조건
 * 특정 조건에 연결된 하나의 열에 있는 데이터만 제약하는 세로단 제약 조건,
 * 전체 표에 적용되는 표 대상 제약 조건
 * NOT NULL: null이 입력될 수 없음.
 * UNIQUE: 열에 있는 모든 값이 달라야함.
 * PRIMARY Key: 자료나 각 행을 고유하게 식별.
 * FOREIGN Key: 세로단이나 다른 표의 데이터에 제약 조건을 검.
 * CHECK: 행의 모든 값이 특정한 조건을 만족.
 * EXCLUSION: 특정 오퍼레이터를 사용한 특정 열이나 식에서 어떤 두 열이 비교될 때, 모든 비교 값이 참으로 판명되지 않아야 함.
 * 제약 조건을 위반하면 삽입을 막음.
 */
--  
/* ★ CREATE
 * CREATE TABLE ~ (~)
 */
-- CREATE TABLE
--   account (
--     user_id SERIAL PRIMARY KEY,
--     username VARCHAR(50) UNIQUE NOT NULL,
--     password VARCHAR(50) NOT NULL,
--     email VARCHAR(250) UNIQUE NOT NULL,
--     created_on TIMESTAMP NOT NULL,
--     last_login TIMESTAMP
--   )
-- CREATE TABLE
--   job (
--     job_id SERIAL PRIMARY KEY,
--     job_name VARCHAR(200) UNIQUE NOT NULL
--   )
-- CREATE TABLE
--   account_job (
--     user_id INTEGER REFERENCES account (user_id),
--     job_id INTEGER REFERENCES job (job_id),
--     hire_date TIMESTAMP
--   )
-- 
/* ★ INSERT
 * INSERT INTO (~) VALUES (~)
 */
-- INSERT INTO account (username, password, email, created_on) VALUES ('Jose', 'password', 'jose@mail.com', CURRENT_TIMESTAMP);
-- INSERT INTO job(job_name) VALUES ('Astronaut');
-- INSERT INTO account_job(user_id, job_id, hire_date) VALUES (1, 1, CURRENT_TIMESTAMP);
-- 
/* ★ UPDATE
 * UPDATE ~ SET ~ WHERE ~
 * RETURNING: 실행 결과 리턴
 */
-- UPDATE account SET last_login = CURRENT_TIMESTAMP;
-- UPDATE account SET last_login = created_on
-- UPDATE account_job SET hire_date = account.created_on FROM account WHERE account_job.user_id = account.user_id;
-- UPDATE account SET last_login = CURRENT_TIMESTAMP RETURNING email, created_on, last_login;
-- 
/* ★ DELETE
 * DELETE FROM ~ WHERE ~
 * USING: 다른 테이블에 존재하는지
 */
-- DELETE FROM job WHERE job_name = 'Cowboy'
-- 
/* ★ ALTER
 * ALTER TABLE ~ 
 * ADD COLUMN ~, DROP COLUMN ~, ALTER COLUMN ~ SET ~
 * ADD CONSTRAINT ~: 제약 조건을 더함.
 * CASCADE: 연관 관계 삭제
 * IF EXISTS: 해당 데이터가 있을때만 삭제
 */
-- ALTER TABLE information RENAME TO new_info;
-- ALTER TABLE new_info RENAME COLUMN person TO people;
-- ALTER TABLE new_info ALTER COLUMN people DROP NOT NULL;
-- 
/* ★ DROP
 * DROP TABLE ~ 
 */
--
/* ★ CHECK
 * 조건 부여
 */
-- CREATE TABLE
--   employees (
--     emp_id SERIAL PRIMARY KEY,
--     first_name VARCHAR(50) NOT NULL,
--     last_name VARCHAR(50) NOT NULL,
--     birthdate DATE CHECK (birthdate > '1900-01-01'),
--     hire_date DATE CHECK (hire_date > birthdate),
--     salary INTEGER CHECK (salary > 0)
--   )
-- INSERT INTO employees(first_name, last_name, birthdate, hire_date, salary) VALUES ('Sammy', 'Smith', '1899-11-03', '2010-01-01', 100)
/* excercise */
/* “School”이라는 새 데이터베이스를 생성합니다. 이 데이터베이스에는 두 테이블, teachers (교사)와 students (학생)가 있어야 합니다.

students 테이블에는 student_id, first_name (이름), last_name (성), homeroom_number (교실 번호), phone (전화번호), email (이메일), graduation year (졸업 연도) 열이 있어야 합니다.

teachers 테이블에는 teacher_id, first_name (이름), last_name (성), homeroom_number (교실 번호), department (부서), email (이메일), phone (전화번호) 열이 있습니다.

제약 조건은 대부분 여러분 마음대로 하면 되지만, 테이블 제약 조건으로는 다음을 고려해야 합니다:

1. 비상시 학생에게 연락할 수 있는 전화번호가 있어야 합니다.
2. 테이블의 기본키로 id가 있어야 합니다.
3. 전화번호와 이메일은 개인별로 모두 달라야 합니다.

표를 만들었으면, 전화번호가 777-555-1234이고 이메일이 없는 Mark Watney (student_id=1)라는 학생을 삽입하세요. 그는 2035년에 졸업하고 교실 번호는 5번입니다.

그다음 생물학 부서에 있고 교실 번호가 5인 Jonas Salk (teacher_id = 1)라는 교사를 삽입합니다. 연락처 정보는 jsalk@school.org이고 전화번호는 777-555-4321입니다. */
-- CREATE TABLE
--   students (
--     student_id SERIAL PRIMARY KEY,
--     first_name VARCHAR(45) NOT NULL,
--     last_name VARCHAR(45) NOT NULL,
--     homeroom_number integer,
--     phone VARCHAR(20) UNIQUE NOT NULL,
--     email VARCHAR(115) UNIQUE,
--     grad_year integer
--   );
-- CREATE TABLE
--   teachers (
--     teacher_id SERIAL PRIMARY KEY,
--     first_name VARCHAR(45) NOT NULL,
--     last_name VARCHAR(45) NOT NULL,
--     homeroom_number integer,
--     department VARCHAR(45),
--     email VARCHAR(115) UNIQUE,
--     phone VARCHAR(20) UNIQUE NOT NULL
--   );
-- INSERT INTO students (first_name, last_name, homeroom_number, phone, grad_year) VALUES ('Mark', 'Watney', 5, '777-555-1234', 2035)
-- INSERT INTO teachers (first_name, last_name, homeroom_number, department, email, phone) VALUES ('Jonas', 'Salk', 5, 'Biology', 'jsalk@school.org', '777-555-4321');