<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>잡집사</title>
    <link rel="icon" href="/images/favicon.ico" />
    <!--  
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    -->
    <style>
       body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .search-container {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }
        .search-input {
            padding: 10px;
            width: 400px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .search-button {
            padding: 10px 15px;
            background-color: #e63946;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
        }
        .filters {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }
        .filter-dropdown {
            position: relative;
            margin-right: 20px;
        }
        .filter-dropdown button {
            padding: 10px 20px;
            border: 1px solid #ddd;
            background-color: #fff;
            border-radius: 4px;
            cursor: pointer;
        }
        .filter-dropdown-content {
            display: none;
            position: absolute;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            z-index: 1;
            padding: 10px;
            margin-top: 5px;
        }
        .filter-dropdown-content.show {
            display: block;
        }
        .sub-filter {
            display: flex;
            flex-direction: row; /* 가로로 배치 */
            margin-top: 10px; /* 위쪽 여백 */
        }
        .sub-filter label {
            margin-right: 10px; /* 오른쪽 여백 */
        }
        .job-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
            padding: 20px;
        }
        .job-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .job-image {
            background-color: #e1e1e1;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 10px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin: 20px 0;
        }
        .pagination a {
            padding: 10px 15px;
            border: 1px solid #ddd;
            background-color: white;
            border-radius: 4px;
            text-decoration: none;
            color: #333;
        }
        .pagination a.active {
            background-color: #e62e2e;
            color: white;
        }
    </style>
    <script>
        function toggleDropdown(dropdownId) {
            const dropdowns = document.querySelectorAll('.filter-dropdown-content');
            dropdowns.forEach(dropdown => {
                dropdown.classList.remove('show');
            });
            const dropdown = document.getElementById(dropdownId);
            dropdown.classList.toggle('show');
        }

        function toggleSkills(category) {
            const skills = {
                '프론트엔드': ['HTML', 'CSS', 'JavaScript', 'jQuery'],
                '백엔드': ['Java', 'Spring', 'Node.js', 'Python'],
                '데이터베이스': ['MySQL', 'PostgreSQL', 'MongoDB'],
                '협업툴': ['JIRA', 'Trello', 'Slack']
            };

            const content = document.getElementById('skills-content');
            content.innerHTML = ''; // Clear previous skills
            content.style.display = 'flex'; // 가로로 표시
            content.classList.remove('show'); // Hide skills initially

            if (skills[category]) {
                skills[category].forEach(skill => {
                    const label = document.createElement('label');
                    label.innerHTML = `<input type="checkbox"> ${skill}`;
                    content.appendChild(label);
                });
                content.classList.add('show'); // Show skills
            }
        }
    </script>
</head>
<body>

<main class="home">
<%@include file="/WEB-INF/includes/headerMain.jsp" %>
    <div class="search-container">
        <input type="text" placeholder="검색어를 입력하세요." class="search-input">
        <button class="search-button">검색</button>
    </div>

    <div class="filters">
        <div class="filter-dropdown">
            <button onclick="toggleDropdown('skills-dropdown')">기술스택</button>
            <div class="filter-dropdown-content" id="skills-dropdown">
                <button onclick="toggleSkills('프론트엔드')">프론트엔드</button>
                <button onclick="toggleSkills('백엔드')">백엔드</button>
                <button onclick="toggleSkills('데이터베이스')">데이터베이스</button>
                <button onclick="toggleSkills('협업툴')">협업툴</button>
                <div class="sub-filter" id="skills-content" style="display: none;"></div>
            </div>
        </div>
        <div class="filter-dropdown">
            <button onclick="toggleDropdown('location-dropdown')">지역</button>
            <div class="filter-dropdown-content" id="location-dropdown">
                <label><input type="checkbox"> 서울</label><br>
                <label><input type="checkbox"> 부산</label><br>
                <label><input type="checkbox"> 대구</label><br>
                <label><input type="checkbox"> 인천</label><br>
            </div>
        </div>
    </div>
    
    
    
    
    <div class="job-list">
        <!-- Job Cards -->
        <div class="job-card">
            <div class="job-image">기업 로고 / 직무 이미지</div>
            <h2>채용 공고 제목 1</h2>
            <p>기업명 1</p>
            <p>위치, 직무</p>
        </div>
        <div class="job-card">
            <div class="job-image">기업 로고 / 직무 이미지</div>
            <h2>채용 공고 제목 2</h2>
            <p>기업명 2</p>
            <p>위치, 직무</p>
        </div>
        <div class="job-card">
            <div class="job-image">기업 로고 / 직무 이미지</div>
            <h2>채용 공고 제목 3</h2>
            <p>기업명 3</p>
            <p>위치, 직무</p>
        </div>
        <div class="job-card">
            <div class="job-image">기업 로고 / 직무 이미지</div>
            <h2>채용 공고 제목 4</h2>
            <p>기업명 4</p>
            <p>위치, 직무</p>
        </div>
        <div class="job-card">
            <div class="job-image">기업 로고 / 직무 이미지</div>
            <h2>채용 공고 제목 5</h2>
            <p>기업명 5</p>
            <p>위치, 직무</p>
        </div>
        <div class="job-card">
            <div class="job-image">기업 로고 / 직무 이미지</div>
            <h2>채용 공고 제목 6</h2>
            <p>기업명 6</p>
            <p>위치, 직무</p>
        </div>
        <div class="job-card">
            <div class="job-image">기업 로고 / 직무 이미지</div>
            <h2>채용 공고 제목 7</h2>
            <p>기업명 7</p>
            <p>위치, 직무</p>
        </div>
        <div class="job-card">
            <div class="job-image">기업 로고 / 직무 이미지</div>
            <h2>채용 공고 제목 8</h2>
            <p>기업명 8</p>
            <p>위치, 직무</p>
        </div>
    </div>

    <div class="pagination">
        <a href="#" class="active">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">&gt;</a>
    </div>
</main>

<%@include file="/WEB-INF/includes/footer.jsp" %>

</body>
</html>
